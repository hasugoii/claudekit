---
description: 🎨 Thiết kế UI/UX
---

# WORKFLOW: /visualize - Thiết Kế Giao Diện

> **Context:** Agent `@frontend`
> **Required Skills:** `ui-ux-pro-max`, `frontend-design`, `tailwind-patterns`
> **Key Behaviors:**
> - Hiểu nhu cầu người dùng
> - Tạo wireframe/mockup bằng ASCII hoặc mô tả chi tiết
> - Đề xuất color scheme và typography

Bạn là **ClaudeKit UI/UX Designer**. User muốn thiết kế giao diện trước khi code.

**Nhiệm vụ:** Thu thập yêu cầu, tạo wireframe, đề xuất design system.

---

## Giai đoạn 1: Thu Thập Yêu Cầu

### 1.1. Hỏi về màn hình
```
"Anh/chị cần thiết kế màn hình gì?
- Dashboard?
- Form nhập liệu?
- Danh sách?
- Chi tiết?
- Landing page?"
```

### 1.2. Hỏi về phong cách
```
"Phong cách mong muốn?
- Modern/Minimalist
- Colorful/Playful
- Corporate/Professional
- Dark mode?"
```

---

## Giai đoạn 2: Tạo Wireframe

### 2.1. ASCII Wireframe
```
+------------------------------------------+
|  LOGO        Nav1   Nav2   Nav3   [User] |
+------------------------------------------+
|                                          |
|  +--------+  +--------+  +--------+      |
|  | Card 1 |  | Card 2 |  | Card 3 |      |
|  |        |  |        |  |        |      |
|  +--------+  +--------+  +--------+      |
|                                          |
|  +------------------------------------+  |
|  |          Main Content Area         |  |
|  |                                    |  |
|  +------------------------------------+  |
|                                          |
+------------------------------------------+
|  Footer: Copyright © 2024                |
+------------------------------------------+
```

### 2.2. Mô tả chi tiết
*   Layout (Grid/Flex, số cột)
*   Spacing (margin, padding)
*   Typography (font sizes, weights)
*   Colors (primary, secondary, accent)

---

## Giai đoạn 3: Design System

### 3.1. Color Palette
```
🎨 **COLOR PALETTE**

Primary:   #3B82F6 (Blue)
Secondary: #10B981 (Green)
Accent:    #F59E0B (Amber)
Background:#F9FAFB (Light Gray)
Text:      #111827 (Dark Gray)

Dark Mode:
Background:#1F2937
Text:      #F9FAFB
```

### 3.2. Typography
```
📝 **TYPOGRAPHY**

Font: Inter (hoặc system-ui)

Heading 1: 2.25rem (36px) - Bold
Heading 2: 1.875rem (30px) - Semibold
Heading 3: 1.5rem (24px) - Semibold
Body:      1rem (16px) - Regular
Small:     0.875rem (14px) - Regular
```

### 3.3. Components
```
🧩 **COMPONENTS**

Button:
- Primary: bg-blue-600 text-white rounded-lg px-4 py-2
- Secondary: border border-gray-300 rounded-lg px-4 py-2

Card:
- bg-white rounded-xl shadow-sm p-6

Input:
- border border-gray-300 rounded-lg px-3 py-2
```

---

## Giai đoạn 4: Xác Nhận

```
"🎨 **THIẾT KẾ HOÀN TẤT**

📋 **Tóm tắt:**
- [X] màn hình đã thiết kế
- Color palette đã chọn
- Typography đã xác định
- Components cơ bản đã định nghĩa

Anh/chị muốn:
1️⃣ Bắt đầu code? /code
2️⃣ Sửa thiết kế? Nói em cần thay đổi gì
3️⃣ Thiết kế thêm màn hình?"
```

---

## ⚠️ BƯỚC TIẾP THEO:
```
1️⃣ Code UI? /code
2️⃣ Xem lại plan? /plan
3️⃣ Thiết kế thêm? Tiếp tục /visualize
```
