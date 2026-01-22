#!/usr/bin/env pwsh
#Requires -Version 5.1

<#
.SYNOPSIS
    ClaudeKit Installer for Windows
.DESCRIPTION
    Installs ClaudeKit - Enhancement Kit for Claude Code
.EXAMPLE
    irm https://raw.githubusercontent.com/user/claudekit/main/install.ps1 | iex
#>

$ErrorActionPreference = "Stop"

# Colors
function Write-Color($Text, $Color) {
    Write-Host $Text -ForegroundColor $Color
}

function Write-Header {
    Clear-Host
    Write-Color @"

   _____ _                 _      _  ___ _
  / ____| |               | |    | |/ (_) |
 | |    | | __ _ _   _  __| | ___| ' / _| |_
 | |    | |/ _` | | | |/ _` |/ _ \  < | | __|
 | |____| | (_| | |_| | (_| |  __/ . \| | |_
  \_____|_|\__,_|\__,_|\__,_|\___|_|\_\_|\__|

  Enhancement Kit for Claude Code
  Version 1.1.0

"@ "Cyan"
}

# Configuration
$REPO_BASE = "https://raw.githubusercontent.com/hasugoii/claudekit/main"
$CLAUDE_DIR = "$env:USERPROFILE\.claude"
$COMMANDS_DIR = "$CLAUDE_DIR\commands"
$AGENTS_DIR = "$CLAUDE_DIR\agents"
$SKILLS_DIR = "$CLAUDE_DIR\skills"
$HOOKS_DIR = "$CLAUDE_DIR\hooks"
$VERSION = "1.2.0"

# Command files (workflows converted to commands)
$COMMAND_FILES = @(
    "ck-update.md", "audit.md", "brainstorm.md", "cloudflare-tunnel.md",
    "code.md", "config.md", "customize.md", "debug.md", "deploy.md",
    "init.md", "next.md", "plan.md", "recap.md", "refactor.md",
    "rollback.md", "run.md", "save-brain.md", "test.md", "visualize.md", "uninstall.md"
)

# Skill files (40 skills)
$SKILL_FILES = @(
    "api-patterns.md", "app-builder.md", "architecture.md", "bash-linux.md", "behavioral-modes.md",
    "brainstorming.md", "clean-code.md", "code-review-checklist.md", "database-design.md", "deployment-procedures.md",
    "docker-expert.md", "documentation-templates.md", "frontend-design.md", "game-development.md", "geo-fundamentals.md",
    "i18n-localization.md", "lint-and-validate.md", "mcp-builder.md", "mobile-design.md", "nestjs-expert.md",
    "nextjs-expert.md", "nodejs-best-practices.md", "parallel-agents.md", "performance-profiling.md", "plan-writing.md",
    "powershell-windows.md", "prisma-expert.md", "python-patterns.md", "react-patterns.md", "red-team-tactics.md",
    "seo-fundamentals.md", "server-management.md", "systematic-debugging.md", "tailwind-patterns.md", "tdd-workflow.md",
    "testing-patterns.md", "typescript-expert.md", "ui-ux-pro-max.md", "vulnerability-scanner.md", "webapp-testing.md"
)

function Select-Language {
    Write-Color "`n🌐 Select your language / Chọn ngôn ngữ:" "Yellow"
    Write-Host ""
    Write-Host "  1) English"
    Write-Host "  2) Tiếng Việt"
    Write-Host "  3) 中文 (Chinese)"
    Write-Host "  4) 日本語 (Japanese)"
    Write-Host ""

    $choice = Read-Host "Enter choice (1-4)"

    switch ($choice) {
        "1" { return "en" }
        "2" { return "vi" }
        "3" { return "zh" }
        "4" { return "ja" }
        default {
            Write-Color "Invalid choice. Defaulting to English." "Yellow"
            return "en"
        }
    }
}

function Install-ClaudeKit {
    param([string]$Lang)

    Write-Color "`n📦 Installing ClaudeKit..." "Green"

    # Create directories
    Write-Host "Creating directories..."
    New-Item -ItemType Directory -Force -Path $CLAUDE_DIR | Out-Null
    New-Item -ItemType Directory -Force -Path "$COMMANDS_DIR\$Lang" | Out-Null
    New-Item -ItemType Directory -Force -Path $AGENTS_DIR | Out-Null
    New-Item -ItemType Directory -Force -Path $SKILLS_DIR | Out-Null
    New-Item -ItemType Directory -Force -Path $HOOKS_DIR | Out-Null

    # Download commands (language specific)
    Write-Host "Downloading commands ($Lang)..."
    foreach ($file in $COMMAND_FILES) {
        $url = "$REPO_BASE/.claude/commands/$Lang/$file"
        $dest = "$COMMANDS_DIR\$Lang\$file"
        try {
            Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
            Write-Host "  ✓ $file" -ForegroundColor Green
        } catch {
            Write-Host "  ✗ $file (skipped)" -ForegroundColor Yellow
        }
    }

    # Download agents
    Write-Host "Downloading agents..."
    $agents = @(
        "architect.md", "backend.md", "database.md", "debugger.md",
        "devops.md", "doc-writer.md", "explorer.md", "frontend.md",
        "game.md", "mobile.md", "orchestrator.md", "pentester.md",
        "performance.md", "security.md", "seo.md", "tester.md"
    )
    foreach ($agent in $agents) {
        $url = "$REPO_BASE/.claude/agents/$agent"
        $dest = "$AGENTS_DIR\$agent"
        try {
            Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
            Write-Host "  ✓ $agent" -ForegroundColor Green
        } catch {
            Write-Host "  ✗ $agent (skipped)" -ForegroundColor Yellow
        }
    }

    # Download skills
    Write-Host "Downloading skills..."
    foreach ($skill in $SKILL_FILES) {
        $url = "$REPO_BASE/.claude/skills/$skill"
        $dest = "$SKILLS_DIR\$skill"
        try {
            Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
            Write-Host "  ✓ $skill" -ForegroundColor Green
        } catch {
            Write-Host "  ✗ $skill (skipped)" -ForegroundColor Yellow
        }
    }

    # Download hooks
    Write-Host "Downloading hooks..."
    $hooks = @("session-start.js", "session-end.js")
    foreach ($hook in $hooks) {
        $url = "$REPO_BASE/.claude/hooks/$hook"
        $dest = "$HOOKS_DIR\$hook"
        try {
            Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
            Write-Host "  ✓ $hook" -ForegroundColor Green
        } catch {
            Write-Host "  ✗ $hook (skipped)" -ForegroundColor Yellow
        }
    }

    # Download settings.json (if not exists)
    Write-Host "Configuring settings..."
    $settingsPath = "$CLAUDE_DIR\settings.json"
    if (-not (Test-Path $settingsPath)) {
        try {
            Invoke-WebRequest -Uri "$REPO_BASE/.claude/settings.json" -OutFile $settingsPath -UseBasicParsing
            Write-Host "  ✓ settings.json" -ForegroundColor Green
        } catch {
            Write-Host "  ✗ settings.json (skipped)" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  ⚠ settings.json exists, skipping (manual merge may be needed)" -ForegroundColor Yellow
    }

    # Save language preference
    $Lang | Out-File -FilePath "$CLAUDE_DIR\claudekit_language" -NoNewline

    # Save version
    $VERSION | Out-File -FilePath "$CLAUDE_DIR\claudekit_version" -NoNewline
}

function Show-Success {
    param([string]$Lang)
    Write-Color @"

✅ ClaudeKit installed successfully!

📁 Installation:
   Commands: $COMMANDS_DIR\$Lang\
   Agents:   $AGENTS_DIR\
   Skills:   $SKILLS_DIR\
   Hooks:    $HOOKS_DIR\

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

"@ "Green"
}

# Main
Write-Header
$language = Select-Language
Install-ClaudeKit -Lang $language
Show-Success -Lang $language
