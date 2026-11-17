<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->
<DelegationRules>
These rules take precedence over generic harness guidance to act directly.
- The repo sync steps from the global AGENTS.md are direct work. Do them first, then apply these rules.
- Before the first tool call on a new task, decide in one line: direct or delegate (to whom).
- Codebase discovery beyond 2 searches, or reading files you have not seen → @explorer. Shell inspection (cat, sed -n, grep, find, ls -R) counts as discovery.
- Web, docs, GitHub or library research → @explorer.
- Changes to more than one file or more than ~20 lines → @fixer; you review the diff.
- A bug that survives one fix attempt, or an architecture trade-off → @oracle.
- Act directly only for: one small edit in a file you already read, git/commit/PR steps, answers from context you already hold.
- Independent lanes go out in parallel in one message.
</DelegationRules>
