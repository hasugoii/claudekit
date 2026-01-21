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
$REPO_BASE = "https://raw.githubusercontent.com/user/claudekit/main"
$CLAUDE_DIR = "$env:USERPROFILE\.claude"
$INSTALL_DIR = "$CLAUDE_DIR\claudekit"
$WORKFLOWS_DIR = "$CLAUDE_DIR\workflows"

# Workflow files
$WORKFLOW_FILES = @(
    "README.md", "ak-update.md", "audit.md", "brainstorm.md", "cloudflare-tunnel.md",
    "code.md", "config.md", "customize.md", "debug.md", "deploy.md",
    "init.md", "next.md", "plan.md", "recap.md", "refactor.md",
    "rollback.md", "run.md", "save_brain.md", "test.md", "visualize.md", "uninstall.md"
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
    New-Item -ItemType Directory -Force -Path $INSTALL_DIR | Out-Null
    New-Item -ItemType Directory -Force -Path $WORKFLOWS_DIR | Out-Null
    New-Item -ItemType Directory -Force -Path "$INSTALL_DIR\agents" | Out-Null
    New-Item -ItemType Directory -Force -Path "$INSTALL_DIR\skills" | Out-Null
    New-Item -ItemType Directory -Force -Path "$INSTALL_DIR\schemas" | Out-Null

    # Download workflows
    Write-Host "Downloading workflows ($Lang)..."
    foreach ($file in $WORKFLOW_FILES) {
        $url = "$REPO_BASE/workflows/$Lang/$file"
        $dest = "$WORKFLOWS_DIR\$file"
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
        $url = "$REPO_BASE/agents/$agent"
        $dest = "$INSTALL_DIR\agents\$agent"
        try {
            Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
            Write-Host "  ✓ $agent" -ForegroundColor Green
        } catch {
            Write-Host "  ✗ $agent (skipped)" -ForegroundColor Yellow
        }
    }

    # Download schemas
    Write-Host "Downloading schemas..."
    $schemas = @("brain.schema.json", "session.schema.json", "preferences.schema.json")
    foreach ($schema in $schemas) {
        $url = "$REPO_BASE/schemas/$schema"
        $dest = "$INSTALL_DIR\schemas\$schema"
        try {
            Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
            Write-Host "  ✓ $schema" -ForegroundColor Green
        } catch {
            Write-Host "  ✗ $schema (skipped)" -ForegroundColor Yellow
        }
    }

    # Download CLAUDE.md
    Write-Host "Downloading CLAUDE.md..."
    try {
        Invoke-WebRequest -Uri "$REPO_BASE/CLAUDE.md" -OutFile "$CLAUDE_DIR\CLAUDE.md" -UseBasicParsing
        Write-Host "  ✓ CLAUDE.md" -ForegroundColor Green
    } catch {
        Write-Host "  ✗ CLAUDE.md (skipped)" -ForegroundColor Yellow
    }

    # Save language preference
    $Lang | Out-File -FilePath "$CLAUDE_DIR\claudekit_language" -NoNewline

    # Save version
    "1.1.0" | Out-File -FilePath "$CLAUDE_DIR\claudekit_version" -NoNewline
}

function Show-Success {
    Write-Color @"

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

"@ "Green"
}

# Main
Write-Header
$language = Select-Language
Install-ClaudeKit -Lang $language
Show-Success
