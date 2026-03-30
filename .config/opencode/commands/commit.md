---
description: Create a git commit message for the staged changes
agent: plan
---

Analyze the changes currently staged for commit.

Run the following command to gather context:

- git diff --cached

If `git diff --cached` command produces no output, respond with: "No staged changes to commit."

Otherwise, write a Git commit message in English following these rules:

- Subject line:
  - Use the imperative mood
  - Capitalize the first word
  - Do not end with a period
  - Limit to 50 characters

- Body:
  - Omit if the change is self-explanatory
  - Separate from subject with a blank line
  - Wrap at 72 characters
  - Explain _what_ and _why_, not _how_

- Additional constraints:
  - Base the message only on the staged diff
  - Do not infer or invent changes

Output only the commit message, with no additional explanation.
