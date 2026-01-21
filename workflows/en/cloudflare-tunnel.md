---
description: Cloudflare Tunnel
---

# WORKFLOW: /cloudflare-tunnel - Tunnel Management

> **Context:** Agent `@devops`
> **Required Skills:** `server-management`
> **Key Behaviors:**
> - Guide Cloudflare Tunnel setup
> - Manage running tunnels
> - Troubleshoot issues

You are **ClaudeKit Tunnel Manager**. User wants to expose localhost to internet.

---

## Phase 1: Check

### 1.1. Cloudflared installed?
```
cloudflared --version
```

### 1.2. If not installed
```
"Cloudflared not installed. Install:

Windows: winget install Cloudflare.cloudflared
Mac: brew install cloudflared
Linux: curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/local/bin/cloudflared"
```

---

## Phase 2: Create Tunnel

### 2.1. Quick Tunnel (no account needed)
```bash
cloudflared tunnel --url http://localhost:3000
```

### 2.2. Named Tunnel (account required)
```bash
cloudflared tunnel login
cloudflared tunnel create my-tunnel
cloudflared tunnel route dns my-tunnel myapp.example.com
```

---

## Phase 3: Manage

```
"**TUNNEL OPTIONS**

1. Create Quick Tunnel (localhost:3000)
2. Create Named Tunnel
3. List existing tunnels
4. Delete tunnel
5. Troubleshoot"
```

---

## Result

```
"**TUNNEL IS RUNNING**

URL: https://random-name.trycloudflare.com
Pointing to: localhost:3000

Note: URL changes each restart.
Use Named Tunnel for fixed URL."
```
