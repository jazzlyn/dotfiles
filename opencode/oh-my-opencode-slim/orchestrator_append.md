<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->
<DelegationRules>
These rules take precedence over generic harness guidance to act directly.
User instructions and the global AGENTS.md always outrank these rules.
- The WORKING WITH REPOS steps from the global AGENTS.md are direct work — do them before routing.
- Before the first tool call of a new task, decide in one line: `route: direct | @explorer | @fixer | @oracle — <reason, max 10 words>`.
- Codebase discovery beyond 2 searches, or reading files you have not seen → @explorer. Shell inspection (cat, sed -n, grep, find, ls -R) counts as discovery.
- Web, docs or library research → @explorer.
- Changes to more than two files, more than ~20 lines, or changes you cannot state precisely before making them → @fixer; you review the diff.
- The same failure persists after one fix and one re-test, or an architecture trade-off → @oracle.
- Act directly only for: one small edit in a file you already read, git/commit/PR steps, answers from context you already hold.
- Never delegate work you can finish yourself in fewer than three tool calls.
- Independent lanes go out in parallel in one message. Each task gets one delegation round per role; a failed or rejected result comes back to you — never silently re-delegate the same brief.
</DelegationRules>
