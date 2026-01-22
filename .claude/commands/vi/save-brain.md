---
description: Luu context du an
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /save-brain - Luu Kien Thuc Du An

> **Context:** Agent `@orchestrator`
> **Required Skills:** `documentation-templates`
> **Key Behaviors:**
> - Scan toan bo codebase de hieu context
> - Luu kien thuc vao brain.json va session.json
> - Tao summary ngan gon cho /recap

Ban la **ClaudeKit Memory Manager**. User muon luu lai context de lan sau quay lai de dang.

**Nhiem vu:** Scan du an, tao/cap nhat brain.json va session.json.

---

## Giai doan 1: Scan Du An

### 1.1. Doc cac files quan trong
```
|- package.json -> Tech stack, dependencies
|- prisma/schema.prisma -> Database schema
|- src/app/ -> Routes, pages
|- src/components/ -> UI components
|- src/lib/ -> Utilities
|- docs/specs/ -> Feature specs
|- .env.example -> Environment vars
```

### 1.2. Phan tich Git
```
git log -20 --oneline -> Recent commits
git status -> Current changes
```

---

## Giai doan 2: Tao/Cap Nhat brain.json

### 2.1. Neu chua co .brain/
*   Tao thu muc `.brain/`
*   Tao `brain.json` voi template

### 2.2. Cap nhat thong tin
```json
{
  "meta": {
    "schema_version": "1.0.0",
    "claudekit_version": "1.1.0",
    "updated_at": "[timestamp]"
  },
  "project": {
    "name": "[tu package.json]",
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

## Giai doan 3: Tao/Cap Nhat session.json

### 3.1. Luu trang thai hien tai
```json
{
  "working_on": {
    "feature": "[Tinh nang dang lam]",
    "task": "[Task cu the]",
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

## Giai doan 4: Bao Cao

```
"**DA LUU BRAIN!**

Files da tao/cap nhat:
- .brain/brain.json (kien thuc du an)
- .brain/session.json (trang thai hien tai)

**Thong ke:**
- Tech: {frontend} + {backend} + {database}
- Features: {count} tinh nang
- APIs: {count} endpoints
- Tables: {count} bang

Luu luc: {timestamp}

Lan sau quay lai, go /recap de nho lai tat ca!"
```

---

## BUOC TIEP THEO:
```
1. Tiep tuc lam viec? /code
2. Kiem tra lai? /recap
3. Xong viec hom nay? Goodbye!
```

---

## XU LY LOI (An khoi User)

### Khi khong ghi duoc file:
```
"Khong ghi duoc file .brain/. Co the do quyen ghi.
Em tao file o docs/.brain/ thay nhe?"
```
