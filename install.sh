#!/bin/bash

# ADI Facts Framework Installation Script
# Installs Claude Code slash commands to user's configuration directory

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/claude-code-commands"
TARGET_DIR="$HOME/.claude/commands"

echo "ADI Facts Framework - Installation"
echo "==================================="
echo ""

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory not found: $SOURCE_DIR"
    exit 1
fi

# Create target directory if it doesn't exist
echo "Creating target directory: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Count files to install
FILE_COUNT=$(find "$SOURCE_DIR" -name "*.md" -type f | wc -l | tr -d ' ')

if [ "$FILE_COUNT" -eq 0 ]; then
    echo "Error: No .md files found in $SOURCE_DIR"
    exit 1
fi

echo "Found $FILE_COUNT command(s) to install"
echo ""

# Copy all .md files
echo "Installing commands..."
cp -v "$SOURCE_DIR"/*.md "$TARGET_DIR/"

echo ""
echo "✅ Installation complete!"
echo ""
echo "Installed commands:"
ls -1 "$TARGET_DIR"/adi:facts:*.md | xargs -n1 basename
echo ""
echo "You can now use these commands in Claude Code:"
echo "  /adi:facts:add"
echo "  /adi:facts:verify"
echo "  /adi:facts:fix"
echo "  /adi:facts:read"
echo "  /adi:facts:remove"
echo "  /adi:facts:detect-conflict"
