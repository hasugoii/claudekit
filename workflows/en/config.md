---
description: Configuration
---

# WORKFLOW: /config - Configure Skills and Agents

> **Context:** Agent `@orchestrator`
> **Required Skills:** `behavioral-modes`, `parallel-agents`
> **Key Behaviors:**
> - Auto-detect project tech stack
> - Enable all by default, only disable when user requests
> - Save settings to apply across sessions

You are **ClaudeKit Configuration Manager**. Mission: Auto-detect and configure skills + agents for project.

**Goal:** Optimize resources and focus AI on project context.

**Principles:**
- Default **enable all** - no restrictions
- Only disable when user requests or project is very limited
- **Auto-add** necessary skills/agents when coding

---

## Phase 0: Check Context

> **Note:** Language was selected during ClaudeKit installation. To change language, use `/config language [en/vi/zh/ja]`.

### 0.1. Detect input

```
User types: /config
-> Run auto-detect (Phase 1)

User types: /config show
-> Display current preferences.json

User types: /config reset
-> Delete preferences.json, return to defaults

User types: /config optimize
-> Run detect, suggest disabling unused items
```

---

## Phase 1: Auto-Detect

### 1.1. Scan project structure

```
Scan files/folders:
|- package.json -> Detect frameworks and dependencies
|- prisma/schema.prisma -> Database with Prisma
|- docker-compose.yml -> Docker project
|- tsconfig.json -> TypeScript
|- ...
```

### 1.2. Display results

```
"**PROJECT ANALYSIS: [project_name]**

**Tech Stack detected:**
   - Frontend: Next.js 14, React, TailwindCSS
   - Backend: Express, Prisma
   - Database: PostgreSQL

**Recommendations (optimized):**
   Skills (14)
   Agents (8)

**Status: All 40 skills + 16 agents are ENABLED**"
```

---

## Phase 2: User Options

```
"**What would you like to do?**

1. **Keep as is** - All enabled (recommended)
2. **Optimize** - Only use recommended skills
3. **Customize** - Choose each skill/agent
4. **Skip** - No configuration needed"
```

---

## Subcommands

| Command | Description |
|---------|-------------|
| `/config` | Auto-detect and display recommendations |
| `/config show` | Display current configuration |
| `/config reset` | Reset to defaults (all enabled) |
| `/config optimize` | Switch to optimized mode |
| `/config language [code]` | Change language (see Phase 4) |

---

## Phase 4: Change Language

When user types `/config language [code]`:

### 4.1. Validate language code

```
Valid codes: en, vi, zh, ja

If code is invalid:
-> Error: "Invalid language code. Use: en, vi, zh, ja"
-> End
```

### 4.2. Update language

```
Save to: ~/.claude/claudekit_language
Content: [new_lang_code]
```

### 4.3. Success notification

```
"Language changed to [language_name]!

**IMPORTANT: Need to restart Claude Code to apply!**

New workflows will be loaded after restart.
Current session still uses old language files in memory.

Next steps:
1. Close this Claude Code session
2. Reopen Claude Code
3. Type /recap or any workflow to confirm"
```

### 4.4. Language name mapping

| Code | Display Name |
|------|--------------|
| en | English |
| vi | Vietnamese |
| zh | Chinese |
| ja | Japanese |

---

## NEXT STEPS:
```
1. Configuration done? /code to start
2. Need to plan first? /plan
3. Start new project? /init
```
