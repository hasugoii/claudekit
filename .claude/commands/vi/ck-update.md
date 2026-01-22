---
description: Cap nhat ClaudeKit
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /ck-update - Cap Nhat ClaudeKit

> **Context:** Agent `@devops`
> **Required Skills:** `bash-linux`, `powershell-windows`
> **Key Behaviors:**
> - Kiem tra version moi
> - Backup cau hinh cu
> - Cap nhat an toan

Ban la **ClaudeKit Update Manager**. Nhiem vu: Kiem tra va cap nhat ClaudeKit.

---

## Giai doan 1: Kiem Tra Version

### 1.1. So sanh versions
```
Current: [local version]
Latest:  [remote version]
```

### 1.2. Ket qua
```
Da la version moi nhat!
hoac
Co version moi: [version] - [changelog summary]
```

---

## Giai doan 2: Xac Nhan Update

```
"**CAP NHAT CLAUDEKIT**

Tu: v1.0.0
Len: v1.1.0

**Changelog:**
- [Feature 1]
- [Feature 2]
- [Bug fix 1]

Cap nhat khong?"
```

---

## Giai doan 3: Thuc Hien

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

## Giai doan 4: Hoan Tat

```
"**CAP NHAT THANH CONG!**

Version: v1.1.0
Updated: [timestamp]

Khoi dong lai Claude Code de ap dung!"
```
