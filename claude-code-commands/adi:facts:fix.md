---
allowed-tools: Read, Glob, Grep, Write, Edit, Bash(git mv:*), Bash(bunx tsc:*), TodoWrite
description: Analyze problems report and fix facts violations intelligently
argument-hint: [category] [--auto] [--plan-only]
---

## Context

- Problems report: .claude/facts/problems.md
- Facts definition: .claude/facts/facts.md
- Current working directory is the project root

## Your task

Fix violations found in .claude/facts/problems.md following an intelligent categorization approach.

**Arguments:**
- `$ARGUMENTS` - Optional category filter (e.g., "file-organization", "type-safety", "complexity", "architecture")
- `--auto` - Automatically fix low-impact violations without approval
- `--plan-only` - Only show the plan without executing fixes

## Fix Classification

### LOW IMPACT (Auto-fix without approval unless --plan-only):
These fixes do NOT change business logic or flow:
- **File Organization**: Renaming files to dot-notation, moving from subdirectories
- **Type Safety - `any` to `unknown`**: Replacing `any` with `unknown` or proper types
- **Type Safety - Explicit types**: Adding type annotations where inferred
- **Fallback Patterns**: Adding logging/warnings to silent fallbacks
- **Import Path Updates**: Updating import statements after file renames

### HIGH IMPACT (ALWAYS require plan approval):
These fixes CHANGE business logic or control flow:
- **Function Refactoring**: Breaking down complex functions (changes call signatures)
- **Architecture Changes**: Adding anti-corruption layers, dependency injection
- **Parameter Objects**: Changing function signatures from multiple params to objects
- **Interface Segregation**: Splitting interfaces (affects all consumers)
- **CQS Violations**: Splitting methods that mutate and return
- **Deep Nesting Reduction**: Refactoring control flow structure

## Execution Strategy

1. **Read problems report** from .claude/facts/problems.md
2. **Categorize violations** by impact (LOW vs HIGH)
3. **Select scope**:
   - If $ARGUMENTS specified: Filter by category
   - If `--auto` flag: Only process LOW impact fixes
   - Otherwise: Show both categories and recommend ONE HIGH impact task per session
4. **Plan Generation**:
   - For LOW impact: List all fixes to be applied automatically
   - For HIGH impact: Present detailed plan for ONE task with:
     - Files affected
     - Changes to be made
     - Potential side effects
     - Test verification needed
5. **Get Approval** (if HIGH impact or no `--auto` flag):
   - Present plan to user
   - Wait for explicit approval before proceeding
6. **Execute Fixes** using TodoWrite to track progress:
   - Apply fixes incrementally
   - Run `bunx tsc --noEmit` after each significant change
   - Update .claude/facts/problems.md to mark fixed violations
7. **Verify & Report**:
   - Confirm all fixes applied successfully
   - Update problems report with remaining violations
   - Suggest next fix category if violations remain

## Fix Mapping Examples

### LOW IMPACT Examples:

**File Organization:**
```
src/schema/chat.ts → src/schema.chat.ts
- Update all import statements
- No logic changes
```

**Type Safety:**
```typescript
// Before
function foo(data: any) { ... }

// After
function foo(data: unknown) { ... }
// Add proper type guards inside function
```

**Fallback Patterns:**
```typescript
// Before
default: return null;

// After
default:
  console.warn(`Unhandled case: ${value}`);
  return null;
```

### HIGH IMPACT Examples:

**Function Complexity (Requires Approval):**
```typescript
// Before: 24 decision points in one function
function parseComments() { /* 100+ lines */ }

// After: Split into multiple focused functions
function parseComments() {
  const tokens = tokenize();
  return tokens.map(processToken);
}
function processToken(token) { /* focused logic */ }
function tokenize() { /* focused logic */ }
```

**Architecture - Dependency Injection (Requires Approval):**
```typescript
// Before: Global singleton access
function embedd(text: string) {
  const config = await config.instance; // Global
}

// After: Injected dependency
function embedd(text: string, config: Configuration) {
  // Use injected config
}
// Requires updating ALL call sites!
```

## Session Management

**IMPORTANT**: Recommend taking ONLY ONE HIGH impact task per session to maintain focus and ensure quality.

After completing a fix session:
1. Run `/adi:facts:verify` to regenerate problems report
2. Suggest which violation category to tackle next based on priority

## Safety Checks

Before applying any fixes:
- ✅ Verify TypeScript compilation succeeds: `bunx tsc --noEmit`
- ✅ Check that file operations preserve git history when possible
- ✅ Update import paths systematically using search & replace
- ✅ For HIGH impact changes: Document breaking changes in problems report

## Output Format

Always use TodoWrite tool to track fix progress. Present summary in this format:

```
## Facts Fix Session Summary

**Scope**: [Category] [AUTO/PLANNED]
**Impact Level**: [LOW/HIGH]

### Fixes Applied:
1. ✅ [Violation] - [File:Line] - [Description]
2. ✅ [Violation] - [File:Line] - [Description]
...

### Type Check: [✅ PASS / ❌ FAIL]

### Remaining Violations: [Count]

### Next Recommended Action:
[Suggestion for next category to fix]
```

## Important Notes

- **Always verify** that you're fixing ACTUAL violations from the problems report, not imagined ones
- **Preserve business logic** - LOW impact means type/structure changes only, not behavior
- **One big task** per session for HIGH impact changes
- **Update problems.md** after each fix session to track progress
- **Run type checker** after significant changes to catch regressions
