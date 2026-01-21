#!/bin/bash

#
# ClaudeKit Installer for macOS/Linux
# Enhancement Kit for Claude Code
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/user/claudekit/main/install.sh | bash
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
REPO_BASE="https://raw.githubusercontent.com/user/claudekit/main"
CLAUDE_DIR="$HOME/.claude"
INSTALL_DIR="$CLAUDE_DIR/claudekit"
WORKFLOWS_DIR="$CLAUDE_DIR/workflows"
VERSION="1.1.0"

# Workflow files
WORKFLOW_FILES=(
    "README.md" "ak-update.md" "audit.md" "brainstorm.md" "cloudflare-tunnel.md"
    "code.md" "config.md" "customize.md" "debug.md" "deploy.md"
    "init.md" "next.md" "plan.md" "recap.md" "refactor.md"
    "rollback.md" "run.md" "save_brain.md" "test.md" "visualize.md" "uninstall.md"
)

# Agent files
AGENT_FILES=(
    "architect.md" "backend.md" "database.md" "debugger.md"
    "devops.md" "doc-writer.md" "explorer.md" "frontend.md"
    "game.md" "mobile.md" "orchestrator.md" "pentester.md"
    "performance.md" "security.md" "seo.md" "tester.md"
)

# Schema files
SCHEMA_FILES=(
    "brain.schema.json" "session.schema.json" "preferences.schema.json"
)

print_header() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"

   _____ _                 _      _  ___ _
  / ____| |               | |    | |/ (_) |
 | |    | | __ _ _   _  __| | ___| ' / _| |_
 | |    | |/ _` | | | |/ _` |/ _ \  < | | __|
 | |____| | (_| | |_| | (_| |  __/ . \| | |_
  \_____|_|\__,_|\__,_|\__,_|\___|_|\_\_|\__|

  Enhancement Kit for Claude Code
  Version 1.1.0

EOF
    echo -e "${NC}"
}

select_language() {
    echo -e "${YELLOW}🌐 Select your language / Chọn ngôn ngữ:${NC}"
    echo ""
    echo "  1) English"
    echo "  2) Tiếng Việt"
    echo "  3) 中文 (Chinese)"
    echo "  4) 日本語 (Japanese)"
    echo ""
    read -p "Enter choice (1-4): " choice

    case $choice in
        1) LANG="en" ;;
        2) LANG="vi" ;;
        3) LANG="zh" ;;
        4) LANG="ja" ;;
        *)
            echo -e "${YELLOW}Invalid choice. Defaulting to English.${NC}"
            LANG="en"
            ;;
    esac
}

download_file() {
    local url=$1
    local dest=$2

    if curl -fsSL "$url" -o "$dest" 2>/dev/null; then
        echo -e "  ${GREEN}✓${NC} $(basename "$dest")"
        return 0
    else
        echo -e "  ${YELLOW}✗${NC} $(basename "$dest") (skipped)"
        return 1
    fi
}

install_claudekit() {
    echo -e "\n${GREEN}📦 Installing ClaudeKit...${NC}\n"

    # Create directories
    echo "Creating directories..."
    mkdir -p "$CLAUDE_DIR"
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$WORKFLOWS_DIR"
    mkdir -p "$INSTALL_DIR/agents"
    mkdir -p "$INSTALL_DIR/skills"
    mkdir -p "$INSTALL_DIR/schemas"

    # Download workflows
    echo -e "\nDownloading workflows ($LANG)..."
    for file in "${WORKFLOW_FILES[@]}"; do
        download_file "$REPO_BASE/workflows/$LANG/$file" "$WORKFLOWS_DIR/$file"
    done

    # Download agents
    echo -e "\nDownloading agents..."
    for agent in "${AGENT_FILES[@]}"; do
        download_file "$REPO_BASE/agents/$agent" "$INSTALL_DIR/agents/$agent"
    done

    # Download schemas
    echo -e "\nDownloading schemas..."
    for schema in "${SCHEMA_FILES[@]}"; do
        download_file "$REPO_BASE/schemas/$schema" "$INSTALL_DIR/schemas/$schema"
    done

    # Download CLAUDE.md
    echo -e "\nDownloading CLAUDE.md..."
    download_file "$REPO_BASE/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

    # Save language preference
    echo -n "$LANG" > "$CLAUDE_DIR/claudekit_language"

    # Save version
    echo -n "$VERSION" > "$CLAUDE_DIR/claudekit_version"
}

show_success() {
    echo -e "${GREEN}"
    cat << EOF

✅ ClaudeKit installed successfully!

📁 Installation directory: $CLAUDE_DIR
📋 Workflows directory: $WORKFLOWS_DIR

🚀 Quick Start:
   1. Open Claude Code in VSCode
   2. Type /recap to get started
   3. Use /help to see all commands

📚 Available commands:
   /init      - Initialize new project
   /plan      - Plan a feature
   /code      - Write code
   /debug     - Debug issues
   /test      - Run tests
   /deploy    - Deploy application
   /save-brain - Save context

⚠️  IMPORTANT: Restart Claude Code to load the new workflows!

EOF
    echo -e "${NC}"
}

# Main
print_header
select_language
install_claudekit
show_success
