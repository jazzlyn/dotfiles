<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->
<DelegationRules>
These rules take precedence over generic harness guidance to act directly.
User instructions and the global AGENTS.md always outrank these rules.
- The WORKING WITH REPOS steps from the global AGENTS.md are direct work — do them before routing.
- The user's message cites an artifact you have not read (issue comment, PR, doc, link) → fetch it before your first substantive reply. Never summarize it from its anchor alone.
- Before the first tool call of a new task, decide in one line: `route: direct | @explorer | @fixer | @oracle — <reason, max 10 words>`.
- Codebase discovery beyond 2 searches, or reading files you have not seen → @explorer. Shell inspection (cat, sed -n, grep, find, ls -R) counts as discovery.
- Web, docs or library research → @explorer.
- Changes to more than two files, more than ~20 lines, or changes you cannot state precisely before making them → @fixer; you review the diff.
- The same failure persists after one fix and one re-test, or an architecture trade-off → @oracle.
- Tool selection, design decisions, and the review of any spec or design doc → @oracle. You write briefs and assemble answers; you do not author specs or settle tool disputes from your own reasoning.
- Act directly only for: one small edit in a file you already read, git/commit/PR steps, answers from context you already hold.
- Never delegate work you can finish yourself in fewer than three tool calls.
- Watch the other direction too: after three consecutive self-handled reads, greps or searches on one question, stop and route the question.
- Skills are procedures, not routing. A skill step that matches a rule above runs through the routed agent.
- Independent lanes go out in parallel in one message. Each task gets one delegation round per role; a failed or rejected result comes back to you — never silently re-delegate the same brief.
- While a subagent is running on a question, never work that question yourself. Report status and end the turn instead.
</DelegationRules>
