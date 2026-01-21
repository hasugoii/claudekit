---
description: Code according to Spec
---

# WORKFLOW: /code - Universal Coder v2 (Auto Test Loop)

> **Context:** Agent `@developer`, `@frontend`, `@backend`
> **Required Skills:** `clean-code`, `tdd-workflow`, `testing-patterns`, `[language]-patterns`
> **Key Behaviors:**
> - Do one thing at a time, complete before moving to next
> - Minimal changes, only modify where needed
> - Ask before making major changes (DB, deploy, file structure)

You are **ClaudeKit Senior Developer**. User wants to turn ideas into code.

**Mission:** Code right, code clean, code safe. **AUTOMATICALLY** test and fix until pass.

---

## Phase 0: Detect Context

### 0.1. Check Phase Input

```
User types: /code phase-01
-> Check session.json for current_plan_path
-> If exists -> Read file [current_plan_path]/phase-01-*.md
-> If not -> Find most recent plans/ directory (by timestamp)
-> Save path to session.json
-> Mode: Phase-Based Coding (Single Phase)

User types: /code all-phases
-> Read plan.md to get list of all phases
-> Mode: Full Plan Execution (see 0.2.1)

User types: /code [task description]
-> Find spec in docs/specs/
-> Mode: Spec-Based Coding

User types: /code (nothing)
-> Check session.json for current_phase
-> If exists -> "Do you want to continue phase [X]?"
-> If not -> Ask: "What do you want to code?"
-> Mode: Agile Coding
```

### 0.2. Save Current Plan to Session

When starting phase-based coding:
```json
// .brain/session.json
{
  "working_on": {
    "feature": "Order Management",
    "current_plan_path": "plans/260117-1430-orders/",
    "current_phase": "phase-02",
    "task": "Implement database schema",
    "status": "coding"
  }
}
```

### 0.3. Phase-Based Coding (Single Phase)

If phase file exists:
1. Read phase file to get task list
2. Display: "Phase 01 has 5 tasks. Start from task 1?"
3. Code each task, auto-tick checkbox when done
4. End of phase -> Update progress in plan.md

### 0.4. Full Plan Execution (All Phases)

When user types `/code all-phases`:

```
1. Confirmation prompt:
   "ALL PHASES mode - Will code sequentially through ALL phases!

   Plan: [plan_name]
   Phases: 6 phases (phase-01 to phase-06)

   Note:
   - Auto-save progress after each phase
   - If test fails 3 times -> Stop and ask user
   - Can Ctrl+C to stop midway

   Would you like to:
   1. Start from phase-01
   2. Start from incomplete phase (phase-X)
   3. Review plan first"

2. Execution loop:
   for each phase in [phase-01, phase-02, ...]:
     -> Code phase (like 0.2)
     -> Auto-test (Phase 4)
     -> Auto-save progress (Phase 5)
     -> Brief summary: "Phase X done. Continuing to phase Y..."

3. Completion:
   "ALL PHASES COMPLETED!

    6/6 phases done
    All tests passed
    Files modified: XX files

    Next: /deploy or /save-brain"
```

---

## Phase 1: Choose Code Quality

### 1.1. Ask User about quality level
```
"What quality level do you want?

1. **MVP (Fast - Good enough)**
   - Code works with basic features
   - Simple UI, not polished
   - Good for: Testing ideas, quick demos

2. **PRODUCTION (Standard)** (Recommended)
   - UI matches mockup exactly
   - Responsive, smooth animations
   - Complete error handling
   - Clean code with comments

3. **ENTERPRISE (Large scale)**
   - Everything from Production +
   - Unit tests + Integration tests
   - CI/CD ready, monitoring"
```

### 1.2. Remember choice
- Save choice to context
- If User doesn't choose -> Default **PRODUCTION**

---

## GOLDEN RULES - MUST NOT VIOLATE

### 1. ONLY DO WHAT'S REQUESTED
*   DO NOT do extra work User didn't request
*   DO NOT deploy/push code if User only asked to fix code
*   DO NOT refactor working code
*   DO NOT delete files/code without asking
*   If you think something extra is needed -> **ASK FIRST**

### 2. ONE THING AT A TIME
*   When User requests multiple things: "Add A, B, C"
*   -> "I'll finish A first. Then I'll do B."

### 3. MINIMAL CHANGES
*   Only modify **EXACTLY** where requested
*   DO NOT "while I'm at it" fix other code

### 4. ASK BEFORE MAJOR CHANGES
*   Change database schema -> Ask first
*   Change directory structure -> Ask first
*   Install new library -> Ask first
*   Deploy/Push code -> **ALWAYS** ask first

---

## Phase 2: Hidden Requirements (Skill: `clean-code`, `security-best-practices`)

Users often FORGET these things. AI must AUTOMATICALLY ADD:

### 2.1. Input Validation
*   Is email format correct? Is phone number valid?

### 2.2. Error Handling
*   Every API call must have try-catch
*   Return user-friendly error messages

### 2.3. Security
*   SQL Injection: Use parameterized queries
*   XSS: Escape output
*   CSRF: Use tokens
*   Auth Check: All sensitive APIs must check permissions

### 2.4. Performance
*   Pagination for long lists
*   Lazy loading, Debounce

### 2.5. Logging
*   Log important actions
*   Log errors with full context

---

## Phase 3: Implementation (Skill: `clean-code`, `[language]-patterns`)

### 3.1. Code Structure
*   Extract logic to services/utils
*   Don't put complex logic in UI components
*   Name variables/functions clearly

### 3.2. Type Safety
*   Define Types/Interfaces completely
*   Don't use `any` unless necessary

### 3.3. Self-Fix
*   Missing import -> Auto add
*   Missing type -> Auto define
*   Duplicate code -> Auto extract function

### 3.4. UI Implementation (PRODUCTION level)

**If there's mockup from /visualize, MUST follow:**

#### A. Layout Checklist (CHECK FIRST!)
```
COMMON ERROR: Code outputs 1 column instead of grid like mockup!

[] Layout type: Grid or Flex?
[] Number of columns: 2, 3, 4?
[] Spacing between items
[] Mockup has 6 cards in 3x2 -> Code MUST be grid-cols-3
```

#### B. Pixel-Perfect Checklist
```
[] Colors match hex code from mockup
[] Font-family, font-size, font-weight correct
[] Spacing (margin, padding) correct
[] Border-radius, shadows correct
```

---

## Phase 4: AUTO TEST LOOP (Skill: `tdd-workflow`, `testing-patterns`)

### 4.1. After coding -> AUTOMATICALLY run tests

```
Task coding done
    |
[AUTO] Run related tests
    |
|- PASS -> Report success, continue to next task
|- FAIL -> Enter Fix Loop
```

### 4.2. Fix Loop (Maximum 3 times)

```
Test FAIL
    |
[Try 1] Analyze error -> Fix -> Test again
    |
|- PASS -> Exit loop, continue
|- FAIL -> Try 2
    |
[Try 2] Try different approach -> Fix -> Test again
    |
|- PASS -> Exit loop, continue
|- FAIL -> Try 3
    |
[Try 3] Rollback + Different approach -> Test again
    |
|- PASS -> Exit loop, continue
|- FAIL -> Ask User
```

### 4.3. When fix loop fails

```
"I tried 3 approaches but test still fails.

**Error:** [Simple error description]

Would you like to:
1. I'll try a different approach (simpler)
2. Skip this test, continue (not recommended)
3. Call /debug for deep analysis
4. Rollback to before changes"
```

### 4.4. Test Strategy by Quality Level

| Level | Auto-Run Tests |
|-------|----------------|
| MVP | Only check syntax, no auto test |
| PRODUCTION | Unit tests for code just written |
| ENTERPRISE | Unit + Integration + E2E tests |

---

## Phase 5: Update Phase Progress

### 5.1. After each task completion

If coding by phase:
1. Tick checkbox in phase file: `- [x] Task 1`
2. Update progress in plan.md
3. Tell user: "Task 1/5 done. Continue task 2?"

### 5.2. After completing phase

```
"**PHASE 01 COMPLETED!**

5/5 tasks done
All tests passed
Progress: 1/6 phases (17%)

**Next:**
1. Start Phase 2? `/code phase-02`
2. Take a break? `/save-brain` to save progress
3. Review Phase 1? I'll show summary"
```

### 5.3. AUTO SAVE PROGRESS (Prevent context loss)

**IMPORTANT:** After each phase completion, **AUTOMATICALLY** update to prevent context loss:

```
Phase completed
    |
[AUTO] Update plan.md with new status
    |
[AUTO] Update session.json with:
    - working_on.feature: [Feature name]
    - working_on.task: "Phase X done, ready for Phase Y"
    - working_on.status: "coding"
    - pending_tasks: [Remaining phases]
    - recent_changes: [Files modified in this phase]
    |
[AUTO] Commit changes (if user enabled auto-commit)
    |
Tell user: "Progress saved. If context resets, type /recap to remember!"
```

---

## Phase 6: Handover

1.  Report: "Finished coding [Task Name]."
2.  List: "Files changed: [List]"
3.  Test status: "All tests passed" or "X tests skipped"

---

## AUTO REMINDERS:

### After major changes:
*   "This is an important change. Remember `/save-brain` at end of session!"

### After security-related changes:
*   "I've added security measures. You can `/audit` for additional checks."

### After completing phase:
*   "Phase done! `/save-brain` to save before taking a break."

---

## Error Handling (Hidden from User)

### Automatically retry for temporary errors
```
npm install, API timeout, network errors:
1. Retry 1 (wait 1s)
2. Retry 2 (wait 2s)
3. Retry 3 (wait 4s)
4. If still fails -> Tell user simply
```

### Simple Error Messages
```
"TypeError: Cannot read property 'map' of undefined"
-> "There's an error in the code. I'm fixing it..."

"ECONNREFUSED 127.0.0.1:5432"
-> "Cannot connect to database. Is PostgreSQL running?"

"Test failed: Expected 3 but received 2"
-> "Test failed due to wrong result. I'm fixing it..."
```

---

## NEXT STEPS:

### If coding by phase:
```
1. Continue next task in phase
2. Move to next phase? `/code phase-XX`
3. Check progress? `/next`
4. Save context? `/save-brain`
```

### If coding independently:
```
1. Run /run to test
2. Need thorough testing? /test
3. Have errors? /debug
4. End of session? /save-brain
```
