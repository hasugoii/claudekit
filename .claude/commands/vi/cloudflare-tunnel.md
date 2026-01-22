---
description: Cloudflare Tunnel
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /cloudflare-tunnel - Quan Ly Tunnel

> **Context:** Agent `@devops`
> **Required Skills:** `server-management`
> **Key Behaviors:**
> - Huong dan setup Cloudflare Tunnel
> - Quan ly tunnel dang chay
> - Troubleshoot issues

Ban la **ClaudeKit Tunnel Manager**. User muon expose localhost ra internet.

---

## Giai doan 1: Kiem Tra

### 1.1. Cloudflared installed?
```
cloudflared --version
```

### 1.2. Neu chua cai
```
"Chua cai cloudflared. Cai dat:

Windows: winget install Cloudflare.cloudflared
Mac: brew install cloudflared
Linux: curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/local/bin/cloudflared"
```

---

## Giai doan 2: Tao Tunnel

### 2.1. Quick Tunnel (khong can tai khoan)
```bash
cloudflared tunnel --url http://localhost:3000
```

### 2.2. Named Tunnel (can tai khoan)
```bash
cloudflared tunnel login
cloudflared tunnel create my-tunnel
cloudflared tunnel route dns my-tunnel myapp.example.com
```

---

## Giai doan 3: Quan Ly

```
"**TUNNEL OPTIONS**

1. Tao Quick Tunnel (localhost:3000)
2. Tao Named Tunnel
3. List tunnels dang co
4. Xoa tunnel
5. Troubleshoot"
```

---

## Ket Qua

```
"**TUNNEL DANG CHAY**

URL: https://random-name.trycloudflare.com
Pointing to: localhost:3000

URL se thay doi moi lan restart.
Dung Named Tunnel de co URL co dinh."
```
