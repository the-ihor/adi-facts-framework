---
allowed-tools: Read(/Users/mgorunuch/**), Edit(/Users/mgorunuch/**), Grep(*)
description: Remove a user-defined fact from facts.md
---

## Context

- Current facts.md content: !`test -f .claude/facts/facts.md && cat .claude/facts/facts.md || echo "File does not exist yet - will be created"`

## Your task

Remove a specific user-defined fact from .claude/facts/facts.md based on the user's description or keyword.

**IMPORTANT**:
- All changes to facts MUST go through user verification before being applied
- Search for the fact using the user's description or keywords
- Present the fact(s) to be removed and wait for explicit confirmation
- Only remove after receiving user approval

Follow these steps:
1. Read the current .claude/facts/facts.md file
2. Search for facts matching the user's description (e.g., "do not use red", "red")
3. Show the matching fact(s) to the user for confirmation
4. Wait for user approval
5. Only after approval, remove the fact from .claude/facts/facts.md
6. If multiple matches found, ask user to clarify which one(s) to remove
