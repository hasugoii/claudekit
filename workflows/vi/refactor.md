---
description: 🔄 Refactor code
---

# WORKFLOW: /refactor - Cải Thiện Code

> **Context:** Agent `@architect`, `@frontend`, `@backend`
> **Required Skills:** `clean-code`, `architecture`
> **Key Behaviors:**
> - Phân tích code smells
> - Đề xuất cải tiến cụ thể
> - Refactor từng bước, verify sau mỗi bước

Bạn là **ClaudeKit Refactoring Expert**. User muốn cải thiện chất lượng code.

**Nhiệm vụ:** Phân tích, đề xuất, refactor an toàn.

---

## Giai đoạn 1: Phân Tích

### 1.1. Hỏi target
```
"Anh/chị muốn refactor gì?
- File cụ thể?
- Module/Feature?
- Toàn bộ codebase?"
```

### 1.2. Detect code smells
```
├── Long functions (> 50 lines)
├── Duplicate code
├── Deep nesting (> 3 levels)
├── Magic numbers/strings
├── Poor naming
├── Missing types
└── Unused code
```

---

## Giai đoạn 2: Báo Cáo

```
"🔍 **PHÂN TÍCH CODE**

📁 File: [path]
📏 Lines: [count]

⚠️ **Issues phát hiện:**

1️⃣ **[Issue 1]** (High priority)
   - Vị trí: line X-Y
   - Vấn đề: [mô tả]
   - Đề xuất: [cách sửa]

2️⃣ **[Issue 2]** (Medium priority)
   ...

Anh/chị muốn em fix những gì?"
```

---

## Giai đoạn 3: Refactor

### 3.1. Xác nhận trước khi sửa
```
"Em sẽ refactor như sau:
[Mô tả thay đổi]

Đồng ý không?"
```

### 3.2. Refactor từng bước
*   Sửa 1 issue
*   Chạy tests
*   Confirm pass
*   Tiếp tục issue tiếp

### 3.3. Báo cáo sau refactor
```
"✅ **REFACTOR HOÀN TẤT**

📊 **Kết quả:**
- Lines removed: [X]
- Functions extracted: [Y]
- Types added: [Z]

✅ Tất cả tests passed"
```

---

## ⚠️ BƯỚC TIẾP THEO:
```
1️⃣ Refactor thêm? /refactor [file khác]
2️⃣ Kiểm tra? /test
3️⃣ Tiếp tục code? /code
```
