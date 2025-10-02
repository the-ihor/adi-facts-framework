# ADI Facts Framework

> **Note:** This project is part of the [ADI (Artificial Developer Intelligence)](https://github.com/the-ihor/artifical-developer-intelegence) ecosystem.

Facts framework for managing user-defined facts to prevent AI hallucinations and enforce project-specific rules. Facts are **USER-managed**, not AI-generated, ensuring the AI adheres to your actual project constraints rather than making assumptions.

## What are Facts?

Facts are user-defined rules, constraints, and architectural principles that guide AI behavior:
- File organization conventions
- Code quality standards
- Architecture principles
- Complexity constraints
- Business rules specific to your project

The framework verifies codebase compliance, detects violations, and helps fix them systematically.

## Installation

### Option 1: ADI Ecosystem (Recommended)

If you're using ADI, the facts framework is integrated into the core system:

```bash
adi claude add-commands --user
```

This automatically installs all facts commands to your Claude Code configuration.

### Option 2: Installation Scripts

Run the platform-specific script to install commands to your user directory:

```bash
# Linux/macOS
./install.sh

# Windows
install.bat
```

### Option 3: Manual Installation

Copy all `.md` files from `claude-code-commands/` directory to your Claude Code commands directory:

- **macOS/Linux**: `~/.claude/commands/`
- **Windows**: `%USERPROFILE%\.claude\commands\`

## Available Commands

- `/adi:facts:add` - Add new user-defined fact
- `/adi:facts:read` - Display all facts
- `/adi:facts:verify` - Verify compliance and generate problems report
- `/adi:facts:fix` - Fix violations with intelligent categorization
- `/adi:facts:remove` - Remove a fact
- `/adi:facts:detect-conflict` - Detect conflicting facts

## Quick Start

1. Run `/adi:facts:add` to define your facts
2. Run `/adi:facts:verify` to check compliance
3. Run `/adi:facts:fix` to resolve violations

## License

MIT
