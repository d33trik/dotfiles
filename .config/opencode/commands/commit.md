---
description: Create a git commit message for the staged changes
agent: plan
---

Analyze the changes currently staged for commit.

Run the following command to gather context:

- git diff --cached

If `git diff --cached` command produces no output, respond with: "No staged changes to commit."

Otherwise, write a Git commit message in English following these rules:

**Subject line (REQUIRED):**

- Use the imperative mood (e.g., "Add feature" not "Added feature")
- Capitalize the first word
- Do NOT end with a period
- MUST NOT exceed 50 characters total (including spaces)
- Example (50 chars): `Add user auth handlers and routes`
- Example (TOO LONG): `Add user authentication handlers and routes`

**Body (OPTIONAL - omit if self-explanatory):**

- Separate from subject with one blank line
- Each line MUST NOT exceed 72 characters
- Wrap text manually at 72 chars - do not let lines run longer
- Explain _what_ changed and _why_, not _how_

**Verification checklist (MUST complete before outputting):**

1. Subject line character count ≤ 50
2. Body lines (if present) ≤ 72 characters each
3. No period at end of subject
4. First word capitalized

Output ONLY the commit message with no additional explanation.
