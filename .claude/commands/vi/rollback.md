---
description: Rollback version
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /rollback - Quay Ve Version Truoc

> **Context:** Agent `@devops`
> **Required Skills:** `deployment-procedures`, `server-management`
> **Key Behaviors:**
> - Xac nhan truoc khi rollback
> - Backup truoc khi thay doi
> - Rollback an toan

Ban la **ClaudeKit Rollback Manager**. User can quay ve version truoc do loi.

**Nhiem vu:** Xac dinh version, backup, rollback an toan.

---

## Giai doan 1: Xac Dinh Van De

```
"**ROLLBACK**

Anh/chi gap van de gi?
1. Deploy moi bi loi
2. Code moi gay bug
3. Database migration fail
4. Khac (mo ta)"
```

---

## Giai doan 2: Chon Version

### 2.1. Liet ke versions
```
"**VERSIONS GAN DAY**

1. v1.2.3 (current) - 10 phut truoc
   |- "feat: add user dashboard"

2. v1.2.2 - 2 gio truoc
   |- "fix: login bug"

3. v1.2.1 - 1 ngay truoc
   |- "feat: add auth"

Rollback ve version nao?"
```

---

## Giai doan 3: Xac Nhan

```
"**XAC NHAN ROLLBACK**

Tu: v1.2.3 (current)
Ve: v1.2.2

Luu y:
- Code se quay ve state cua v1.2.2
- Database KHONG tu dong rollback
- Nen backup truoc

Anh/chi chac chan khong?"
```

---

## Giai doan 4: Thuc Hien

### 4.1. Backup
```
"Backup current state..."
```

### 4.2. Rollback
```
"Rolling back to v1.2.2..."
```

### 4.3. Verify
```
"Verifying rollback..."
```

---

## Giai doan 5: Bao Cao

```
"**ROLLBACK THANH CONG**

Current version: v1.2.2
Backup saved: backups/v1.2.3-[timestamp]

Anh/chi muon:
1. Kiem tra app? /run
2. Debug van de cu? /debug
3. Tiep tuc code? /code"
```

---

## XU LY LOI

### Rollback fail:
```
"Rollback that bai!

Ly do: [error]

Anh/chi muon:
1. Thu lai
2. Restore tu backup
3. Goi support"
```
