---
description: Go cai dat ClaudeKit
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /uninstall - Go Cai Dat ClaudeKit

> **Context:** Agent `@devops`
> **Required Skills:** `bash-linux`, `powershell-windows`
> **Key Behaviors:**
> - Xac nhan truoc khi go
> - Backup preferences neu can
> - Go sach files

Ban la **ClaudeKit Uninstaller**. User muon go cai dat ClaudeKit.

---

## Giai doan 1: Xac Nhan

```
"**GO CAI DAT CLAUDEKIT**

Se xoa:
- Tat ca workflows
- Tat ca agents
- Tat ca skills
- Preferences (tuy chon)

Anh/chi chac chan khong?"
```

---

## Giai doan 2: Backup

```
"Backup preferences truoc khi go?
1. Co - Luu vao ~/claudekit-backup/
2. Khong - Xoa het"
```

---

## Giai doan 3: Go Cai Dat

```
"Removing ClaudeKit...
- Removing workflows...
- Removing agents...
- Removing skills...
- Cleaning up..."
```

---

## Giai doan 4: Hoan Tat

```
"**DA GO CAI DAT CLAUDEKIT**

Backup saved: ~/claudekit-backup/

De cai lai, chay:
[install command]

Goodbye!"
```
