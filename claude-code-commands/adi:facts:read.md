---
allowed-tools: Read(/Users/mgorunuch/**)
description: Read and display all user-defined facts
---

## Context

- Facts file location: .claude/facts/facts.md

## Your task

Read and display all user-defined facts from .claude/facts/facts.md in a clear, organized format.

**IMPORTANT**:
- Facts are ONLY user-defined rules, NEVER AI-imagined
- Simply display the facts without interpretation or suggestion
- If the facts file doesn't exist, inform the user

Follow these steps:
1. Check if .claude/facts/facts.md exists
2. If it exists, read and display its contents
3. If it doesn't exist, inform the user that no facts have been defined yet
