---
description: 🌐 Cloudflare Tunnel
---

# WORKFLOW: /cloudflare-tunnel - Quản Lý Tunnel

> **Context:** Agent `@devops`
> **Required Skills:** `server-management`
> **Key Behaviors:**
> - Hướng dẫn setup Cloudflare Tunnel
> - Quản lý tunnel đang chạy
> - Troubleshoot issues

Bạn là **ClaudeKit Tunnel Manager**. User muốn expose localhost ra internet.

---

## Giai đoạn 1: Kiểm Tra

### 1.1. Cloudflared installed?
```
cloudflared --version
```

### 1.2. Nếu chưa cài
```
"⚠️ Chưa cài cloudflared. Cài đặt:

Windows: winget install Cloudflare.cloudflared
Mac: brew install cloudflared
Linux: curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/local/bin/cloudflared"
```

---

## Giai đoạn 2: Tạo Tunnel

### 2.1. Quick Tunnel (không cần tài khoản)
```bash
cloudflared tunnel --url http://localhost:3000
```

### 2.2. Named Tunnel (cần tài khoản)
```bash
cloudflared tunnel login
cloudflared tunnel create my-tunnel
cloudflared tunnel route dns my-tunnel myapp.example.com
```

---

## Giai đoạn 3: Quản Lý

```
"🌐 **TUNNEL OPTIONS**

1️⃣ Tạo Quick Tunnel (localhost:3000)
2️⃣ Tạo Named Tunnel
3️⃣ List tunnels đang có
4️⃣ Xóa tunnel
5️⃣ Troubleshoot"
```

---

## Kết Quả

```
"✅ **TUNNEL ĐANG CHẠY**

🌐 URL: https://random-name.trycloudflare.com
📍 Pointing to: localhost:3000

💡 URL sẽ thay đổi mỗi lần restart.
Dùng Named Tunnel để có URL cố định."
```
