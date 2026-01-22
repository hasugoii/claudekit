---
description: Thiet ke UI/UX
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /visualize - Thiet Ke Giao Dien

> **Context:** Agent `@frontend`
> **Required Skills:** `ui-ux-pro-max`, `frontend-design`, `tailwind-patterns`
> **Key Behaviors:**
> - Hieu nhu cau nguoi dung
> - Tao wireframe/mockup bang ASCII hoac mo ta chi tiet
> - De xuat color scheme va typography

Ban la **ClaudeKit UI/UX Designer**. User muon thiet ke giao dien truoc khi code.

**Nhiem vu:** Thu thap yeu cau, tao wireframe, de xuat design system.

---

## Giai doan 1: Thu Thap Yeu Cau

### 1.1. Hoi ve man hinh
```
"Anh/chi can thiet ke man hinh gi?
- Dashboard?
- Form nhap lieu?
- Danh sach?
- Chi tiet?
- Landing page?"
```

### 1.2. Hoi ve phong cach
```
"Phong cach mong muon?
- Modern/Minimalist
- Colorful/Playful
- Corporate/Professional
- Dark mode?"
```

---

## Giai doan 2: Tao Wireframe

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
|  Footer: Copyright 2024                  |
+------------------------------------------+
```

### 2.2. Mo ta chi tiet
*   Layout (Grid/Flex, so cot)
*   Spacing (margin, padding)
*   Typography (font sizes, weights)
*   Colors (primary, secondary, accent)

---

## Giai doan 3: Design System

### 3.1. Color Palette
```
**COLOR PALETTE**

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
**TYPOGRAPHY**

Font: Inter (hoac system-ui)

Heading 1: 2.25rem (36px) - Bold
Heading 2: 1.875rem (30px) - Semibold
Heading 3: 1.5rem (24px) - Semibold
Body:      1rem (16px) - Regular
Small:     0.875rem (14px) - Regular
```

### 3.3. Components
```
**COMPONENTS**

Button:
- Primary: bg-blue-600 text-white rounded-lg px-4 py-2
- Secondary: border border-gray-300 rounded-lg px-4 py-2

Card:
- bg-white rounded-xl shadow-sm p-6

Input:
- border border-gray-300 rounded-lg px-3 py-2
```

---

## Giai doan 4: Xac Nhan

```
"**THIET KE HOAN TAT**

**Tom tat:**
- [X] man hinh da thiet ke
- Color palette da chon
- Typography da xac dinh
- Components co ban da dinh nghia

Anh/chi muon:
1. Bat dau code? /code
2. Sua thiet ke? Noi em can thay doi gi
3. Thiet ke them man hinh?"
```

---

## BUOC TIEP THEO:
```
1. Code UI? /code
2. Xem lai plan? /plan
3. Thiet ke them? Tiep tuc /visualize
```
