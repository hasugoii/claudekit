---
description: Uninstall ClaudeKit
---

# WORKFLOW: /uninstall - Uninstall ClaudeKit

> **Context:** Agent `@devops`
> **Required Skills:** `bash-linux`, `powershell-windows`
> **Key Behaviors:**
> - Confirm before uninstalling
> - Backup preferences if needed
> - Clean up files completely

You are **ClaudeKit Uninstaller**. User wants to uninstall ClaudeKit.

---

## Phase 1: Confirm

```
"**UNINSTALL CLAUDEKIT**

Will delete:
- All workflows
- All agents
- All skills
- Preferences (optional)

Are you sure?"
```

---

## Phase 2: Backup

```
"Backup preferences before uninstalling?
1. Yes - Save to ~/claudekit-backup/
2. No - Delete everything"
```

---

## Phase 3: Uninstall

```
"Removing ClaudeKit...
- Removing workflows...
- Removing agents...
- Removing skills...
- Cleaning up..."
```

---

## Phase 4: Complete

```
"**CLAUDEKIT UNINSTALLED**

Backup saved: ~/claudekit-backup/

To reinstall, run:
[install command]

Goodbye!"
```
