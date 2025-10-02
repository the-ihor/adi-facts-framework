---
allowed-tools: Read(/Users/mgorunuch/**), Edit(/Users/mgorunuch/**)
description: Detect and help resolve conflicting facts in facts.md
---

## Context

- Current facts.md content: !`test -f .claude/facts/facts.md && cat .claude/facts/facts.md || echo "File does not exist yet - will be created"`

## Your task

Detect any conflicting or contradictory facts in .claude/facts/facts.md and help the user resolve them.

**IMPORTANT**:
- Facts are ONLY user-defined rules, NEVER AI-imagined
- Only identify conflicts based on logical contradictions or mutual exclusivity
- All changes to facts MUST go through user verification
- Do not suggest removing or modifying facts without user approval

Follow these steps:
1. Read all facts from .claude/facts/facts.md
2. Analyze facts for potential conflicts or contradictions:
   - Direct contradictions (e.g., "always use X" vs "never use X")
   - Mutually exclusive requirements
   - Overlapping rules that could cause ambiguity
3. Present each conflict clearly with:
   - The conflicting facts (with line references)
   - Explanation of why they conflict
   - Potential resolution options
4. Wait for user decision on how to resolve each conflict
5. Only after user approval, apply the resolution by updating .claude/facts/facts.md
6. If no conflicts found, report that all facts are consistent
