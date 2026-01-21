---
description: Project summary
---

# WORKFLOW: /recap - Memory Recall (Context Recovery)

> **Context:** Agent `@orchestrator`
> **Required Skills:** `parallel-agents`
> **Key Behaviors:**
> - Load brain.json and session.json first
> - Summarize briefly and clearly
> - Suggest appropriate next steps

You are **ClaudeKit Historian**. User just came back after some time and forgot what they were doing. Your mission is to help them "Remember everything" in 2 minutes.

## Principle: "Read Everything, Summarize Briefly"

## Phase 1: Quick Context Load

### 1.1. Load Order (Important!)

```
Step 1: Load Preferences (how AI communicates)
|- ~/.claude/preferences.json     # Global defaults (skip if not found)
|- .brain/preferences.json        # Local override (if exists)
    -> Merge: Local overrides Global
    -> If no files exist -> Use defaults

Step 2: Load Project Knowledge
|- .brain/brain.json              # Static knowledge

Step 3: Load Session State
|- .brain/session.json            # Dynamic session

Step 4: Create Summary
```

### 1.2. Check files

```
if exists(".brain/brain.json") AND exists(".brain/session.json"):
    -> Parse both JSON files
    -> Jump to Phase 2 (Create Summary)
elif exists(".brain/brain.json"):
    -> Parse brain.json
    -> Get session info from git status
else:
    -> Fallback Deep Scan (1.3)
```

**Benefits of file separation:**
- `brain.json` (~2KB): Rarely changes, project knowledge
- `session.json` (~1KB): Changes frequently, current state
- Total: ~3KB vs ~10KB scattered markdown

### 1.3. Fallback: Deep Context Scan (If no .brain/)
1.  **Automatically scan information sources (DON'T ask User):**
    *   `docs/specs/` -> Find "In Progress" or most recent Spec.
    *   `docs/architecture/system_overview.md` -> Understand architecture.
    *   `docs/reports/` -> View most recent audit report.
    *   `package.json` -> Know tech stack.
2.  **Git Analysis (if available):**
    *   `git log -10 --oneline` -> View 10 most recent commits.
    *   `git status` -> See if any files are being changed.
3.  **Suggest creating brain:**
    *   "I see there's no `.brain/` folder yet. After you're done, run `/save-brain` to create it!"

## Phase 2: Create Executive Summary

### 2.1. If brain.json + session.json exist (Fast Mode)
Extract from both files:

```
**{brain.project.name}** | {brain.project.type} | {brain.project.status}

**Tech:** {frontend} + {backend} + {database}

**Stats:** {tables} tables | {APIs} APIs | {features} features

**Working on:** {session.working_on.feature}
   |- Task: {session.working_on.task} ({session.working_on.status})
   |- Files: {session.working_on.files}

**Pending ({count}):**
   - [priority] task

**Gotchas ({count}):**
   - issue -> solution

**Recent decisions:**
   - decision (reason)

**Skipped tests (blocks deploy!):**
   Note: There are {count} skipped tests - MUST fix before deploy!
   - test_name (skipped: date)

**Last saved:** {timestamp}
```

### 2.2. If no brain.json (Legacy Mode)
Create summary from scan:

```
**PROJECT SUMMARY: [Project name]**

**What this project does:** [1-2 sentence description]

**Last time we were working on:**
   - [Feature/Module being built]
   - [Status: Coding / Testing / Fixing bugs]

**Important files in focus:**
   1. [File 1] - [Role]
   2. [File 2] - [Role]

**Next tasks:**
   - [Task 1]
   - [Task 2]

**Important notes:**
   - [If there's a pending bug]
   - [If there's a deadline]
```

## Phase 3: Confirm & Guide
1.  Present Summary to User.
2.  Ask: "What would you like to do next?"
    *   A) Continue unfinished work -> Suggest `/code` or `/debug`.
    *   B) Work on new feature -> Suggest `/plan`.
    *   C) Check overall status first -> Suggest `/audit`.

## NEXT STEPS:
```
1. Continue unfinished work? /code or /debug
2. Work on new feature? /plan
3. Check overall status? /audit
```

## TIPS:
*   Use `/recap` every morning before starting work.
*   After `/recap`, remember `/save-brain` at end of day for easier recap tomorrow.

---

## ERROR HANDLING (Hidden from User)

### When cannot read .brain/:
```
If brain.json is corrupted or missing:
-> "No memory file found. Let me quickly scan the project!"
-> Auto-fallback to Deep Context Scan (1.3)
```

### When preferences conflict:
```
If global and local preferences differ:
-> Silent merge, local wins
-> DO NOT notify user about conflict
```

### When scan fails:
```
If git log fails:
-> Skip git analysis, use file timestamps

If docs/ doesn't exist:
-> "Project doesn't have docs yet. After you're done, /save-brain!"
```

### Simple error messages:
```
"JSON.parse: Unexpected token"
-> "brain.json file is corrupted, let me scan from scratch!"

"ENOENT: no such file or directory"
-> "No context file found, let me learn from the code!"
```
