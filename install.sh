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
REPO_BASE="https://raw.githubusercontent.com/hasugoii/claudekit/main"
CLAUDE_DIR="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_DIR/commands"
AGENTS_DIR="$CLAUDE_DIR/agents"
SKILLS_DIR="$CLAUDE_DIR/skills"
HOOKS_DIR="$CLAUDE_DIR/hooks"
VERSION="1.2.0"

# Command files (workflows converted to commands)
COMMAND_FILES=(
    "ck-update.md" "audit.md" "brainstorm.md" "cloudflare-tunnel.md"
    "code.md" "config.md" "customize.md" "debug.md" "deploy.md"
    "init.md" "next.md" "plan.md" "recap.md" "refactor.md"
    "rollback.md" "run.md" "save-brain.md" "test.md" "visualize.md" "uninstall.md"
)

# Agent files
AGENT_FILES=(
    "architect.md" "backend.md" "database.md" "debugger.md"
    "devops.md" "doc-writer.md" "explorer.md" "frontend.md"
    "game.md" "mobile.md" "orchestrator.md" "pentester.md"
    "performance.md" "security.md" "seo.md" "tester.md"
)

# Skill files (40 skills)
SKILL_FILES=(
    "api-patterns.md" "app-builder.md" "architecture.md" "bash-linux.md" "behavioral-modes.md"
    "brainstorming.md" "clean-code.md" "code-review-checklist.md" "database-design.md" "deployment-procedures.md"
    "docker-expert.md" "documentation-templates.md" "frontend-design.md" "game-development.md" "geo-fundamentals.md"
    "i18n-localization.md" "lint-and-validate.md" "mcp-builder.md" "mobile-design.md" "nestjs-expert.md"
    "nextjs-expert.md" "nodejs-best-practices.md" "parallel-agents.md" "performance-profiling.md" "plan-writing.md"
    "powershell-windows.md" "prisma-expert.md" "python-patterns.md" "react-patterns.md" "red-team-tactics.md"
    "seo-fundamentals.md" "server-management.md" "systematic-debugging.md" "tailwind-patterns.md" "tdd-workflow.md"
    "testing-patterns.md" "typescript-expert.md" "ui-ux-pro-max.md" "vulnerability-scanner.md" "webapp-testing.md"
)

# Hook files
HOOK_FILES=(
    "session-start.js" "session-end.js"
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
    mkdir -p "$COMMANDS_DIR/$LANG"
    mkdir -p "$AGENTS_DIR"
    mkdir -p "$SKILLS_DIR"
    mkdir -p "$HOOKS_DIR"

    # Download commands (language specific)
    echo -e "\nDownloading commands ($LANG)..."
    for file in "${COMMAND_FILES[@]}"; do
        download_file "$REPO_BASE/.claude/commands/$LANG/$file" "$COMMANDS_DIR/$LANG/$file"
    done

    # Download agents
    echo -e "\nDownloading agents..."
    for agent in "${AGENT_FILES[@]}"; do
        download_file "$REPO_BASE/.claude/agents/$agent" "$AGENTS_DIR/$agent"
    done

    # Download skills
    echo -e "\nDownloading skills..."
    for skill in "${SKILL_FILES[@]}"; do
        download_file "$REPO_BASE/.claude/skills/$skill" "$SKILLS_DIR/$skill"
    done

    # Download hooks
    echo -e "\nDownloading hooks..."
    for hook in "${HOOK_FILES[@]}"; do
        download_file "$REPO_BASE/.claude/hooks/$hook" "$HOOKS_DIR/$hook"
    done
    chmod +x "$HOOKS_DIR"/*.js 2>/dev/null

    # Download settings.json (merge with existing if present)
    echo -e "\nConfiguring settings..."
    if [ ! -f "$CLAUDE_DIR/settings.json" ]; then
        download_file "$REPO_BASE/.claude/settings.json" "$CLAUDE_DIR/settings.json"
    else
        echo -e "  ${YELLOW}⚠${NC} settings.json exists, skipping (manual merge may be needed)"
    fi

    # Save language preference
    echo -n "$LANG" > "$CLAUDE_DIR/claudekit_language"

    # Save version
    echo -n "$VERSION" > "$CLAUDE_DIR/claudekit_version"
}

show_success() {
    echo -e "${GREEN}"
    cat << EOF

✅ ClaudeKit installed successfully!

📁 Installation:
   Commands: $COMMANDS_DIR/$LANG/
   Agents:   $AGENTS_DIR/
   Skills:   $SKILLS_DIR/
   Hooks:    $HOOKS_DIR/

🚀 Quick Start:
   1. Open Claude Code in VSCode
   2. Type /recap to get started
   3. Use /init to start a new project

📚 Available commands (slash commands):
   /init      - Initialize new project
   /plan      - Plan a feature
   /code      - Write code
   /debug     - Debug issues
   /test      - Run tests
   /deploy    - Deploy application
   /save-brain - Save context

🤖 Available agents (use @agent):
   @frontend  - React/Next.js expert
   @backend   - Node.js/API expert
   @architect - System design
   @security  - Security expert
   @devops    - Docker/CI-CD

⚠️  IMPORTANT: Restart Claude Code to load ClaudeKit!

EOF
    echo -e "${NC}"
}

# Main
print_header
select_language
install_claudekit
show_success
