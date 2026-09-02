---
description: Create a git commit message for the staged changes
agent: plan
---

# Git Commit Message Generator (The 7 Rules)

Generate high-quality, professional Git commit messages based on staged changes, strictly adhering to the **7 Rules of a Great Git Commit Message** ([cbea.ms/git-commit](https://cbea.ms/git-commit/)). Do NOT use Conventional Commits (no `feat:`, `fix:`, etc. prefixes).

---

## Phase 1: Context Gathering

1. **Check working tree and staged status:**
   - Run `git status --short`
   - Run `git diff --cached --stat`

2. **Handle empty staging area:**
   - If no changes are staged and unstaged changes exist:
     Respond with: _"No staged changes found. Please stage changes with `git add` before generating a commit message."_
   - If the working tree is completely clean:
     Respond with: _"No changes detected in the repository."_
   - Stop execution if nothing is staged.

3. **Inspect the staged diff:**
   - Run `git diff --cached`
   - If the diff contains massive generated files (e.g., lockfiles, bundles), focus primarily on application source files and the stat summary.

---

## Phase 2: The 7 Rules

All commit messages MUST strictly adhere to these seven rules:

1. **Separate subject from body with a blank line**
   - The first line is the subject. If a body is present, insert exactly one blank line after the subject.
2. **Limit the subject line to 50 characters**
   - Hard limit: ≤ 50 characters total (including spaces). Be concise and specific.
3. **Capitalize the subject line**
   - Begin the subject line with a capital letter (e.g., `Add feature`, not `add feature`).
4. **Do not end the subject line with a period**
   - Trailing punctuation is forbidden in the subject line.
5. **Use the imperative mood in the subject line**
   - Structure the subject line as a command completing the sentence: _"If applied, this commit will `<subject>`"_.
   - ✅ _Good:_ `Refactor subsystem X for readability`
   - ✅ _Good:_ `Fix crash when payload is empty`
   - ❌ _Bad:_ `Refactored subsystem X` / `Fixing crash` / `More fixes`
6. **Wrap the body at 72 characters**
   - Hard limit: each line of the body MUST NOT exceed 72 characters. Wrap lines manually.
7. **Use the body to explain what and why vs. how**
   - Explain the motivation behind the change, context, and side effects. The code already shows _how_.

---

## Phase 3: Reference Template & Examples

### Canonical Format Example

```
Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely); various tools like `log`, `shortlog`
and `rebase` can get confused if you run the two together.

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

If you use an issue tracker, put references to them at the bottom,
like this:

Resolves: #123
See also: #456, #789
```

### Simple Change (Subject-Only)

```
Fix memory leak in background worker
```

### Complex Change (Subject + Body + References)

```
Add exponential backoff to webhook retries

When webhooks fail due to downstream rate limiting, immediately
retrying overwhelms the receiver. This introduces an exponential
backoff strategy with jitter to smooth out retry bursts.

Resolves: #342
```

---

## Phase 4: Pre-Output Verification Checklist

Before outputting, verify all points:

- [ ] Rule 1: Blank line separating subject and body (if body exists).
- [ ] Rule 2: Subject line length ≤ 50 characters.
- [ ] Rule 3: First letter of subject is capitalized.
- [ ] Rule 4: Subject has NO trailing period (`.`).
- [ ] Rule 5: Subject is in imperative mood (e.g., "Add", "Fix", "Update", "Remove").
- [ ] Rule 6: Every line in body is ≤ 72 characters.
- [ ] Rule 7: Body explains what and why, avoiding implementation details.
- [ ] Explicitly ensure no Conventional Commits prefixes (no `feat:`, `fix:`, `chore:`, etc.).

---

## Phase 5: Output

Output the commit message inside a clean text code block, followed by the ready-to-run git commit command:

```text
<subject>

<optional body>
```

```bash
git commit -m "<subject>"
```

_(If a body is present, format with multiple `-m` flags or instruct the user accordingly)._
