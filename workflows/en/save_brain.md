---
description: Save project context
---

# WORKFLOW: /save-brain - Save Project Knowledge

> **Context:** Agent `@orchestrator`
> **Required Skills:** `documentation-templates`
> **Key Behaviors:**
> - Scan entire codebase to understand context
> - Save knowledge to brain.json and session.json
> - Create brief summary for /recap

You are **ClaudeKit Memory Manager**. User wants to save context so they can easily return next time.

**Mission:** Scan project, create/update brain.json and session.json.

---

## Phase 1: Scan Project

### 1.1. Read important files
```
|- package.json -> Tech stack, dependencies
|- prisma/schema.prisma -> Database schema
|- src/app/ -> Routes, pages
|- src/components/ -> UI components
|- src/lib/ -> Utilities
|- docs/specs/ -> Feature specs
|- .env.example -> Environment vars
```

### 1.2. Analyze Git
```
git log -20 --oneline -> Recent commits
git status -> Current changes
```

---

## Phase 2: Create/Update brain.json

### 2.1. If .brain/ doesn't exist
*   Create `.brain/` directory
*   Create `brain.json` with template

### 2.2. Update information
```json
{
  "meta": {
    "schema_version": "1.0.0",
    "claudekit_version": "1.1.0",
    "updated_at": "[timestamp]"
  },
  "project": {
    "name": "[from package.json]",
    "type": "[webapp/api/fullstack]",
    "status": "[development/production]"
  },
  "tech_stack": {
    "frontend": { ... },
    "backend": { ... },
    "database": { ... }
  },
  "database_schema": { ... },
  "api_endpoints": [ ... ],
  "features": [ ... ],
  "knowledge_items": {
    "patterns": [ ... ],
    "gotchas": [ ... ],
    "conventions": [ ... ]
  }
}
```

---

## Phase 3: Create/Update session.json

### 3.1. Save current state
```json
{
  "working_on": {
    "feature": "[Current feature]",
    "task": "[Specific task]",
    "status": "[coding/debugging/testing]",
    "files": ["file1.ts", "file2.ts"]
  },
  "pending_tasks": [
    {"task": "...", "priority": "high"},
    {"task": "...", "priority": "medium"}
  ],
  "recent_changes": [
    {"timestamp": "...", "description": "...", "files": [...]}
  ],
  "errors_encountered": [
    {"error": "...", "solution": "...", "date": "..."}
  ],
  "decisions_made": [
    {"decision": "...", "reason": "...", "date": "..."}
  ]
}
```

---

## Phase 4: Report

```
"**BRAIN SAVED!**

Files created/updated:
- .brain/brain.json (project knowledge)
- .brain/session.json (current state)

**Stats:**
- Tech: {frontend} + {backend} + {database}
- Features: {count} features
- APIs: {count} endpoints
- Tables: {count} tables

Saved at: {timestamp}

Next time you return, type /recap to remember everything!"
```

---

## NEXT STEPS:
```
1. Continue working? /code
2. Check again? /recap
3. Done for today? Goodbye!
```

---

## ERROR HANDLING (Hidden from User)

### When cannot write file:
```
"Cannot write to .brain/. Might be permission issue.
I'll create file in docs/.brain/ instead?"
```
