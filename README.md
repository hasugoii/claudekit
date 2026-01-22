<p align="center">
  <img src="https://img.shields.io/badge/ClaudeKit-v1.2.0-blue?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/Workflows-20+-green?style=for-the-badge" alt="Workflows" />
  <img src="https://img.shields.io/badge/Agents-16-purple?style=for-the-badge" alt="Agents" />
  <img src="https://img.shields.io/badge/Skills-40-orange?style=for-the-badge" alt="Skills" />
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License" />
</p>

<h1 align="center">ClaudeKit</h1>

<p align="center">
  <strong>Vibe Coding Framework for Claude Code</strong><br/>
  <em>Transform AI chaos into production-ready code</em>
</p>

<p align="center">
  <a href="README.md">English</a> |
  <a href="README.vi.md">Tiếng Việt</a> |
  <a href="README.zh.md">中文</a> |
  <a href="README.ja.md">日本語</a>
</p>

---

## The Problem

Ever felt like this with AI coding assistants?

| Without ClaudeKit | With ClaudeKit |
|-------------------|----------------|
| "After 30 messages, the AI forgets your database schema" | `/recap` restores full project context instantly |
| "Code works in chat but crashes in production" | `/code` follows TDD with built-in testing |
| "Fixing one bug creates three more" | `/debug` uses systematic root-cause analysis |
| "What should I do next?" | `/next` suggests optimal next steps |
| "Security issues discovered too late" | `/audit` catches vulnerabilities early |
| "Lost all progress when session ends" | `/save-brain` persists knowledge across sessions |

---

## What is ClaudeKit?

ClaudeKit is an **Enhancement Kit for Claude Code** (VSCode Extension) that transforms your AI coding experience with:

- **20 Slash Commands** - Structured workflows like `/plan`, `/code`, `/debug`, `/deploy`
- **16 AI Agents** - Specialists like `@frontend`, `@backend`, `@security`, `@devops`
- **40+ Skills** - Deep expertise in React, TypeScript, Docker, Security, and more
- **Auto-Agent Loading** - Agents automatically activate based on your project type
- **Context Persistence** - Your AI remembers everything via `brain.json`
- **Safety Rules** - Protection against dangerous operations

---

## Quick Start

### Installation

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/hasugoii/claudekit/main/install.ps1 | iex
```

**macOS / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/hasugoii/claudekit/main/install.sh | bash
```

### First Steps

1. Open **Claude Code** in VSCode
2. Type `/recap` to see available commands
3. Use `/init` to start a new project
4. Let ClaudeKit guide your development flow!

---

## Commands (Slash Commands)

### Phase 1: Planning

| Command | Description |
|---------|-------------|
| `/init` | Initialize new project with brain.json |
| `/recap` | Restore project context (start of day) |
| `/brainstorm` | Generate and evaluate ideas |
| `/plan` | Design feature with specifications |
| `/next` | Get AI suggestions for next steps |

### Phase 2: Building

| Command | Description |
|---------|-------------|
| `/visualize` | Design UI/UX with mockups |
| `/code` | Write production-ready code (TDD) |
| `/run` | Execute and test application |

### Phase 3: Operating

| Command | Description |
|---------|-------------|
| `/debug` | Systematic debugging with root-cause analysis |
| `/test` | Run comprehensive test suites |
| `/refactor` | Improve code quality and structure |
| `/rollback` | Revert to previous versions safely |
| `/deploy` | Deploy to production environments |

### Phase 4: Managing

| Command | Description |
|---------|-------------|
| `/save-brain` | Persist project knowledge |
| `/config` | Configure ClaudeKit settings |
| `/audit` | Security and quality audit |
| `/ck-update` | Update ClaudeKit to latest version |
| `/customize` | Customize AI persona and behavior |

---

## Agents

Invoke specialized AI agents with `@agent`:

```
@frontend Help me create a responsive navbar
@backend Design REST API for user authentication
@security Review this code for vulnerabilities
@devops Set up Docker configuration
```

### Available Agents

| Agent | Expertise |
|-------|-----------|
| `@architect` | System design, architecture patterns |
| `@frontend` | React, Next.js, Vue, TailwindCSS |
| `@backend` | Node.js, Express, NestJS, APIs |
| `@database` | Prisma, TypeORM, SQL, Schema design |
| `@debugger` | Bug hunting, root-cause analysis |
| `@devops` | Docker, CI/CD, Kubernetes, Deploy |
| `@tester` | Unit tests, E2E, Jest, Playwright |
| `@security` | OWASP, authentication, encryption |
| `@pentester` | Penetration testing, vulnerabilities |
| `@performance` | Optimization, profiling, caching |
| `@mobile` | React Native, Flutter, Expo |
| `@game` | Game development, physics, graphics |
| `@seo` | SEO optimization, meta tags |
| `@doc-writer` | Documentation, technical writing |
| `@explorer` | Codebase exploration, understanding |
| `@orchestrator` | Multi-agent coordination |

### Auto-Agent Loading

ClaudeKit automatically loads relevant agents based on your project:

- **React/Next.js project** → `@frontend` auto-loaded
- **Express/NestJS project** → `@backend` auto-loaded
- **Prisma/TypeORM project** → `@database` auto-loaded
- **Dockerfile present** → `@devops` auto-loaded
- **Auth folder exists** → `@security` auto-loaded

Configure in `.claudekit/agents.json`.

---

## Context Persistence

ClaudeKit uses `.brain/` to remember your project:

```
.brain/
├── brain.json      # Project knowledge (tech stack, schemas, APIs)
└── session.json    # Current state (active task, pending items)
```

**Daily Workflow:**
1. Start of day: `/recap` to restore context
2. Work normally with Claude Code
3. End of day: `/save-brain` to persist knowledge

---

## Safety & Rules

ClaudeKit includes safety features:

- **Protected Files** - Prevents reading/modifying `.env`, credentials
- **Dangerous Commands** - Warns before `rm -rf`, `DROP DATABASE`, etc.
- **Project Rules** - Custom rules in `.claudekit/rules.md`

Configure in `.claudekit/safety.json`.

---

## Multi-Language Support

ClaudeKit supports 4 languages:
- English (en)
- Tiếng Việt (vi)
- 中文 Chinese (zh)
- 日本語 Japanese (ja)

Switch language during installation or use:
```
/config language vi
```

---

## Directory Structure

```
~/.claude/
├── commands/           # Slash commands
│   ├── en/            # English commands
│   ├── vi/            # Vietnamese commands
│   ├── zh/            # Chinese commands
│   └── ja/            # Japanese commands
├── agents/            # 16 AI agent definitions
├── skills/            # 40+ skill modules
└── hooks/             # Session hooks (auto-load context)

.claudekit/            # Project-level config
├── rules.md           # Project rules (like .cursorrules)
├── safety.json        # Safety configuration
└── agents.json        # Agent auto-loading config
```

---

## Credits

Adapted from [AntiKit](https://github.com/hasugoii/antikit) - Enhancement Kit for Google Antigravity (Gemini CLI).

---

## License

MIT License - Free to use, modify, and distribute.

---

<p align="center">
  <sub>
    <em>claude code kit, vibe coding, claude code enhancement, ai coding assistant, agentic development, autonomous ai agents, ai pair programming, claude code vscode, vibe code with claude</em>
  </sub>
</p>
