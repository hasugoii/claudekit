---
description: 💾 Lưu context dự án
---

# WORKFLOW: /save-brain - Lưu Kiến Thức Dự Án

> **Context:** Agent `@orchestrator`
> **Required Skills:** `documentation-templates`
> **Key Behaviors:**
> - Scan toàn bộ codebase để hiểu context
> - Lưu kiến thức vào brain.json và session.json
> - Tạo summary ngắn gọn cho /recap

Bạn là **ClaudeKit Memory Manager**. User muốn lưu lại context để lần sau quay lại dễ dàng.

**Nhiệm vụ:** Scan dự án, tạo/cập nhật brain.json và session.json.

---

## Giai đoạn 1: Scan Dự Án

### 1.1. Đọc các files quan trọng
```
├── package.json → Tech stack, dependencies
├── prisma/schema.prisma → Database schema
├── src/app/ → Routes, pages
├── src/components/ → UI components
├── src/lib/ → Utilities
├── docs/specs/ → Feature specs
└── .env.example → Environment vars
```

### 1.2. Phân tích Git
```
git log -20 --oneline → Recent commits
git status → Current changes
```

---

## Giai đoạn 2: Tạo/Cập Nhật brain.json

### 2.1. Nếu chưa có .brain/
*   Tạo thư mục `.brain/`
*   Tạo `brain.json` với template

### 2.2. Cập nhật thông tin
```json
{
  "meta": {
    "schema_version": "1.0.0",
    "claudekit_version": "1.1.0",
    "updated_at": "[timestamp]"
  },
  "project": {
    "name": "[từ package.json]",
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

## Giai đoạn 3: Tạo/Cập Nhật session.json

### 3.1. Lưu trạng thái hiện tại
```json
{
  "working_on": {
    "feature": "[Tính năng đang làm]",
    "task": "[Task cụ thể]",
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

## Giai đoạn 4: Báo Cáo

```
"💾 **ĐÃ LƯU BRAIN!**

📁 Files đã tạo/cập nhật:
- .brain/brain.json (kiến thức dự án)
- .brain/session.json (trạng thái hiện tại)

📊 **Thống kê:**
- Tech: {frontend} + {backend} + {database}
- Features: {count} tính năng
- APIs: {count} endpoints
- Tables: {count} bảng

🕐 Lưu lúc: {timestamp}

💡 Lần sau quay lại, gõ /recap để nhớ lại tất cả!"
```

---

## ⚠️ BƯỚC TIẾP THEO:
```
1️⃣ Tiếp tục làm việc? /code
2️⃣ Kiểm tra lại? /recap
3️⃣ Xong việc hôm nay? Goodbye! 👋
```

---

## 🛡️ XỬ LÝ LỖI (Ẩn khỏi User)

### Khi không ghi được file:
```
"Không ghi được file .brain/. Có thể do quyền ghi.
Em tạo file ở docs/.brain/ thay nhé?"
```
