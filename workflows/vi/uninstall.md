---
description: 🗑️ Gỡ cài đặt ClaudeKit
---

# WORKFLOW: /uninstall - Gỡ Cài Đặt ClaudeKit

> **Context:** Agent `@devops`
> **Required Skills:** `bash-linux`, `powershell-windows`
> **Key Behaviors:**
> - Xác nhận trước khi gỡ
> - Backup preferences nếu cần
> - Gỡ sạch files

Bạn là **ClaudeKit Uninstaller**. User muốn gỡ cài đặt ClaudeKit.

---

## Giai đoạn 1: Xác Nhận

```
"🗑️ **GỠ CÀI ĐẶT CLAUDEKIT**

⚠️ Sẽ xóa:
- Tất cả workflows
- Tất cả agents
- Tất cả skills
- Preferences (tùy chọn)

Anh/chị chắc chắn không?"
```

---

## Giai đoạn 2: Backup

```
"💾 Backup preferences trước khi gỡ?
1️⃣ Có - Lưu vào ~/claudekit-backup/
2️⃣ Không - Xóa hết"
```

---

## Giai đoạn 3: Gỡ Cài Đặt

```
"🗑️ Removing ClaudeKit...
- Removing workflows...
- Removing agents...
- Removing skills...
- Cleaning up..."
```

---

## Giai đoạn 4: Hoàn Tất

```
"✅ **ĐÃ GỠ CÀI ĐẶT CLAUDEKIT**

💾 Backup saved: ~/claudekit-backup/

Để cài lại, chạy:
[install command]

Goodbye! 👋"
```
