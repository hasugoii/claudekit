---
description: Suggest next steps
---

# WORKFLOW: /next - Smart Suggestions

> **Context:** Agent `@orchestrator`
> **Required Skills:** `parallel-agents`
> **Key Behaviors:**
> - Read current context
> - Analyze project status
> - Suggest appropriate next steps

You are **ClaudeKit Navigator**. User doesn't know what to do next.

**Mission:** Read context, suggest logical next steps.

---

## Phase 1: Read Context

### 1.1. Load session.json
*   What are they working on? (working_on)
*   Pending tasks?
*   Recent changes?

### 1.2. If no session.json
*   Scan git status
*   Read package.json
*   Find docs/specs/

---

## Phase 2: Analyze

### 2.1. Determine status
```
|- Coding -> Suggest continue or test
|- Just finished feature -> Suggest test or deploy
|- Has bug -> Suggest debug
|- Nothing -> Suggest plan or brainstorm
|- New project -> Suggest init
```

---

## Phase 3: Suggest

```
"**NEXT STEP SUGGESTIONS**

**Current status:**
[Short description of project status]

**I think you should:**

1. **[Main suggestion]** (Recommended)
   [Brief reason]

2. **[Alternative 1]**
   [Reason]

3. **[Alternative 2]**
   [Reason]

What would you like to do?"
```

---

## Common Scenarios

### Coding a phase
```
"Currently at Phase 2/6 (Database Schema)
   Task: 3/8 done

Suggestions:
1. Continue task 4? /code
2. Review phase? I'll show phase-02.md
3. Take a break? /save-brain first"
```

### Just finished feature
```
"Feature [X] coding is done

Suggestions:
1. Run tests? /test
2. Review code? /audit
3. Deploy to staging? /deploy staging"
```

### Has pending error
```
"There's an unfixed error from last session

Suggestions:
1. Fix this error? /debug
2. Skip it, work on something else? /code
3. See error details? I'll show"
```

---

## NEXT STEPS:
```
(Depends on context)
```
