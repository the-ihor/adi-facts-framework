---
allowed-tools: Read, Glob, Grep, Write, Bash(mkdir:*)
description: Verify that the system adheres to all user-defined facts
---

## Context

- Current facts.md content: !`test -f .claude/facts/facts.md && cat .claude/facts/facts.md || echo "File does not exist yet - will be created"`
- Problems output: .claude/facts/problems.md
- Current working directory is the project root

## Your task

Verify that the current system implementation adheres to all user-defined facts in .claude/facts/facts.md and generate a problems report.

**IMPORTANT**:
- Facts are ONLY user-defined rules, NEVER AI-imagined
- Check each fact against the actual codebase implementation
- Generate .claude/facts/problems.md with all violations found
- All proposed fixes MUST go through user verification

Follow these steps:
1. Ensure .claude/facts/ directory exists
2. Read all facts from .claude/facts/facts.md
3. For each fact, analyze the relevant parts of the codebase
4. Identify any violations or non-compliance
5. Generate .claude/facts/problems.md with:
   - List of violations with specific locations (file:line format)
   - Description of each problem
   - Proposed fixes (pending user approval)
6. If no violations found, create problems.md stating "No violations found"
7. Provide a summary of compliance status to the user
