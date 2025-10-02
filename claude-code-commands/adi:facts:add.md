---
allowed-tools: Read(/Users/mgorunuch/**), Edit(/Users/mgorunuch/**), Write(/Users/mgorunuch/**), Bash(mkdir:*)
description: Add a new user-defined fact to facts.md
---

## Context

- Current facts.md content: !`cat .claude/facts/facts.md`

## Your task

Add a new user-defined fact to .claude/facts/facts.md based on the user's input.

**IMPORTANT**:
- Facts are ONLY user-defined rules, NEVER AI-imagined or AI-suggested
- All changes to facts MUST go through user verification before being applied
- Present the proposed addition to the user and wait for explicit approval
- Only add the fact after receiving confirmation

Follow these steps:
1. Ensure .claude/facts/ directory exists
2. Read the current .claude/facts/facts.md file (create if it doesn't exist)
3. Draft the new fact entry in the appropriate section or create a new section if needed
4. Show the proposed change to the user
5. Wait for user approval
6. Only after approval, update .claude/facts/facts.md with the new fact
7. After adding the fact, automatically run conflict detection to check for any conflicts with existing facts
