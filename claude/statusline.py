#!/usr/bin/env python3
"""Claude Code statusline: multi-line, colored plain text.

Reads the statusline JSON payload from stdin (see Claude Code statusline docs).
"""

import json
import re
import subprocess
import sys
import time
from pathlib import Path

SEPARATOR = "#585858"  # dim gray

MODEL_NAME = "#64B5F6"  # blue
EFFORT_LEVEL = "#FFB74D"  # orange
TOGGLE_ON = "#81C784"  # green
TOGGLE_OFF = "#FF0000"  # red

USAGE_LABEL = "#BA68C8"  # purple
USAGE_LOW = "#81C784"  # green, <50% used
USAGE_MEDIUM = "#FFF176"  # yellow, 50-80% used
USAGE_HIGH = "#FF0000"  # red, >=80% used

# "Context rot" sets in around a fixed ~100k-token mark regardless of the window's
# advertised size, so this is colored by absolute token count, not percentage used.
# See https://www.trychroma.com/research/context-rot
CONTEXT_TOKENS_LOW = USAGE_LOW  # green, <70k tokens
CONTEXT_TOKENS_MEDIUM = USAGE_MEDIUM  # yellow, 70k-100k tokens
CONTEXT_TOKENS_HIGH = USAGE_HIGH  # red, >=100k tokens ("dumb zone")

WORKSPACE_DIR = "#00FFFF"  # cyan
GIT_BRANCH = "#81C784"  # green
GIT_DIRTY_SYMBOLS = "#FF0000"  # red

PR_APPROVED = "#81C784"  # green
PR_CHANGES_REQUESTED = "#FF0000"  # red
PR_DRAFT = "#E0E0E0"  # gray
PR_PENDING = "#FFF176"  # yellow

# starship's default git_status symbols
GIT_SYMBOLS = {"ahead": "⇡", "behind": "⇣", "staged": "+", "modified": "!", "untracked": "?"}

HOME = str(Path.home())


def color(hex_color: str, text: str) -> str:
    r, g, b = (int(hex_color[i : i + 2], 16) for i in (1, 3, 5))
    return f"\033[38;2;{r};{g};{b}m{text}\033[0m"


SEP = f" {color(SEPARATOR, '·')} "


def shorten(path: str) -> str:
    return path.replace(HOME, "~", 1) if path.startswith(HOME) else path


def usage_color(pct: float) -> str:
    if pct >= 80:
        return USAGE_HIGH
    if pct >= 50:
        return USAGE_MEDIUM
    return USAGE_LOW


def context_tokens_color(tokens: int) -> str:
    if tokens >= 100_000:
        return CONTEXT_TOKENS_HIGH
    if tokens >= 70_000:
        return CONTEXT_TOKENS_MEDIUM
    return CONTEXT_TOKENS_LOW


def fmt_tokens(n: int) -> str:
    return f"{n / 1000:.0f}k" if n >= 1000 else str(n)


def context_line(data: dict) -> str:
    ctx = data.get("context_window") or {}
    tokens = ctx.get("total_input_tokens")
    if tokens is None:
        return ""
    size = ctx.get("context_window_size")
    label = fmt_tokens(tokens) + (f"/{fmt_tokens(size)}" if size else "")
    return color(context_tokens_color(tokens), f"Context: {label} tokens")


def fmt_reset(epoch: float | None) -> str:
    if epoch is None:
        return ""
    diff = max(0, int(epoch - time.time()))
    days, rem = divmod(diff, 86400)
    hours, rem = divmod(rem, 3600)
    minutes = rem // 60
    if days:
        return f"{days}d{hours}h"
    if hours:
        return f"{hours}h{minutes:02d}"
    return f"{minutes}m"


def join_line(*parts: str) -> str:
    return SEP.join(p for p in parts if p)


def toggle(label: str, enabled: bool) -> str:
    return color(TOGGLE_ON if enabled else TOGGLE_OFF, label)


def rate_limit_line(data: dict) -> str:
    limits = data.get("rate_limits", {})
    labels = {"five_hour": "Usage", "seven_day": "Weekly", "spend_limit": "Spend"}
    parts = []
    for key, label in labels.items():
        limit = limits.get(key)
        if not limit or limit.get("used_percentage") is None:
            continue
        used = limit["used_percentage"]
        reset = fmt_reset(limit.get("resets_at"))
        value = color(usage_color(used), f"{used:.0f}% used")
        parts.append(f"{color(USAGE_LABEL, f'{label}:')} {value}, resets in {reset}")
    return join_line(*parts)


def git_status(cwd: str) -> tuple[str, str]:
    """Return (branch, dirty_symbols) for the repo at cwd, or ("", "") if not a git repo."""
    try:
        out = subprocess.run(
            ["git", "-C", cwd, "status", "--porcelain=v1", "--branch"],
            capture_output=True, text=True, timeout=2,
        ).stdout
    except (OSError, subprocess.TimeoutExpired):
        return "", ""
    if not out:
        return "", ""

    lines = out.splitlines()
    branch_line = lines[0]
    branch = branch_line.removeprefix("## ").split("...")[0].removesuffix(" (no branch)")

    symbols = [GIT_SYMBOLS[kind] for kind in ("ahead", "behind") if re.search(rf"{kind} \d+", branch_line)]

    staged = modified = untracked = False
    for line in lines[1:]:
        xy = line[:2]
        if xy == "??":
            untracked = True
        else:
            staged = staged or xy[0] != " "
            modified = modified or xy[1] not in (" ", "?")

    if staged:
        symbols.append(GIT_SYMBOLS["staged"])
    if modified:
        symbols.append(GIT_SYMBOLS["modified"])
    if untracked:
        symbols.append(GIT_SYMBOLS["untracked"])

    return branch, "".join(symbols)


def workspace_line(data: dict) -> str:
    ws = data.get("workspace", {})
    project_dir = ws.get("project_dir", "")
    current_dir = ws.get("current_dir") or data.get("cwd", "")

    p1 = f"Project: {color(WORKSPACE_DIR, shorten(project_dir))}" if project_dir else ""
    p2 = f"Dir: {color(WORKSPACE_DIR, shorten(current_dir))}" if current_dir and current_dir != project_dir else ""

    p3 = ""
    if current_dir:
        branch, symbols = git_status(current_dir)
        if branch:
            p3 = color(GIT_BRANCH, branch)
            if symbols:
                p3 += " " + color(GIT_DIRTY_SYMBOLS, symbols)

    p4 = ""
    pr = data.get("pr") or {}
    if pr.get("number"):
        state = pr.get("review_state", "")
        fg = {"approved": PR_APPROVED, "changes_requested": PR_CHANGES_REQUESTED, "draft": PR_DRAFT}.get(state, PR_PENDING)
        label = f"PR #{pr['number']}"
        if state:
            label += f" {state.replace('_', ' ')}"
        p4 = color(fg, label)

    return join_line(p1, p2, p3, p4)


def main() -> None:
    data = json.load(sys.stdin)

    model_name = data.get("model", {}).get("display_name", "unknown")
    effort_level = data.get("effort", {}).get("level", "")
    fast_mode = data.get("fast_mode", False)
    thinking_enabled = data.get("thinking", {}).get("enabled", False)

    p1 = color(MODEL_NAME, model_name)
    p2 = color(EFFORT_LEVEL, f"{effort_level} effort") if effort_level else ""
    p3 = toggle("fast", fast_mode)
    p4 = toggle("thinking", thinking_enabled)
    p5 = context_line(data)
    lines = [join_line(p1, p2, p3, p4, p5), rate_limit_line(data), workspace_line(data)]

    added_dirs = data.get("workspace", {}).get("added_dirs") or []
    if added_dirs:
        dirs = " ".join(color(WORKSPACE_DIR, shorten(d)) for d in added_dirs)
        lines.append(f"Added dirs: {dirs}")

    print("\n".join(line for line in lines if line))


if __name__ == "__main__":
    main()
