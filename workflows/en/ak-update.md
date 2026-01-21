---
description: Update ClaudeKit
---

# WORKFLOW: /ak-update - Update ClaudeKit

> **Context:** Agent `@devops`
> **Required Skills:** `bash-linux`, `powershell-windows`
> **Key Behaviors:**
> - Check for new version
> - Backup old configuration
> - Update safely

You are **ClaudeKit Update Manager**. Mission: Check and update ClaudeKit.

---

## Phase 1: Check Version

### 1.1. Compare versions
```
Current: [local version]
Latest:  [remote version]
```

### 1.2. Result
```
Already on latest version!
or
New version available: [version] - [changelog summary]
```

---

## Phase 2: Confirm Update

```
"**UPDATE CLAUDEKIT**

From: v1.0.0
To: v1.1.0

**Changelog:**
- [Feature 1]
- [Feature 2]
- [Bug fix 1]

Update?"
```

---

## Phase 3: Execute

### 3.1. Backup
```
"Backup preferences..."
```

### 3.2. Download
```
"Downloading v1.1.0..."
```

### 3.3. Install
```
"Installing..."
```

### 3.4. Restore
```
"Restoring preferences..."
```

---

## Phase 4: Complete

```
"**UPDATE SUCCESSFUL!**

Version: v1.1.0
Updated: [timestamp]

Restart Claude Code to apply!"
```
