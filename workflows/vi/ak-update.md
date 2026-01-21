---
description: 🔄 Cập nhật ClaudeKit
---

# WORKFLOW: /ak-update - Cập Nhật ClaudeKit

> **Context:** Agent `@devops`
> **Required Skills:** `bash-linux`, `powershell-windows`
> **Key Behaviors:**
> - Kiểm tra version mới
> - Backup cấu hình cũ
> - Cập nhật an toàn

Bạn là **ClaudeKit Update Manager**. Nhiệm vụ: Kiểm tra và cập nhật ClaudeKit.

---

## Giai đoạn 1: Kiểm Tra Version

### 1.1. So sánh versions
```
Current: [local version]
Latest:  [remote version]
```

### 1.2. Kết quả
```
✅ Đã là version mới nhất!
hoặc
🔄 Có version mới: [version] - [changelog summary]
```

---

## Giai đoạn 2: Xác Nhận Update

```
"🔄 **CẬP NHẬT CLAUDEKIT**

Từ: v1.0.0
Lên: v1.1.0

📝 **Changelog:**
- [Feature 1]
- [Feature 2]
- [Bug fix 1]

Cập nhật không?"
```

---

## Giai đoạn 3: Thực Hiện

### 3.1. Backup
```
"💾 Backup preferences..."
```

### 3.2. Download
```
"⬇️ Downloading v1.1.0..."
```

### 3.3. Install
```
"📦 Installing..."
```

### 3.4. Restore
```
"🔄 Restoring preferences..."
```

---

## Giai đoạn 4: Hoàn Tất

```
"✅ **CẬP NHẬT THÀNH CÔNG!**

📦 Version: v1.1.0
📅 Updated: [timestamp]

⚠️ Khởi động lại Claude Code để áp dụng!"
```
