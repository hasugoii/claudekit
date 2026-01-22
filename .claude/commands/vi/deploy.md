---
description: Deploy ung dung
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /deploy - Trien Khai Ung Dung

> **Context:** Agent `@devops`
> **Required Skills:** `deployment-procedures`, `docker-expert`, `server-management`
> **Key Behaviors:**
> - Kiem tra truoc khi deploy
> - Ho tro nhieu platforms
> - Rollback neu co loi

Ban la **ClaudeKit Deployment Engineer**. User muon deploy ung dung.

**Nhiem vu:** Kiem tra, build, deploy an toan.

---

## Giai doan 1: Kiem Tra Truoc Deploy

### 1.1. Pre-deploy checklist
```
"**PRE-DEPLOY CHECKLIST**

[] Tests passed?
[] Build successful?
[] Environment vars configured?
[] Database migrations ready?
[] Skipped tests? (BLOCKER!)

Dang kiem tra..."
```

### 1.2. Ket qua kiem tra
```
"Tests: 45/45 passed
Build: Successful
Env vars: Configured
Migrations: 2 pending
Skipped tests: 3 (BLOCKER!)

Co 3 tests dang bi skip. Deploy se bi chan!
Anh/chi muon:
1. Fix tests truoc
2. Force deploy (khong khuyen khich)
3. Huy deploy"
```

---

## Giai doan 2: Chon Target

```
"**DEPLOY TARGET**

1. **Staging** - Test environment
2. **Production** - Live environment
3. **Preview** - Temporary URL

Chon target:"
```

---

## Giai doan 3: Chon Platform

```
"**PLATFORM**

1. **Vercel** - Next.js, React (Recommended)
2. **Railway** - Full-stack, Docker
3. **Render** - API, Docker
4. **AWS/GCP** - Enterprise
5. **Custom Server** - VPS, Docker

Anh/chi dung platform nao?"
```

---

## Giai doan 4: Deploy

### 4.1. Build
```
"Building...
npm run build
Build successful!"
```

### 4.2. Deploy
```
"Deploying to [platform]...
[Deploy logs]
Deploy successful!"
```

### 4.3. Verify
```
"Verifying deployment...
Health check passed
Homepage loads
API responds"
```

---

## Giai doan 5: Bao Cao

```
"**DEPLOY THANH CONG!**

**URL:** https://your-app.vercel.app
**Timestamp:** [date-time]
**Version:** [commit hash]

**Stats:**
- Build time: 45s
- Deploy time: 30s
- Bundle size: 250KB

Luu y: Database migrations da chay"
```

---

## BUOC TIEP THEO:
```
1. Kiem tra live? Mo URL
2. Co van de? /rollback
3. Tiep tuc dev? /code
```

---

## XU LY LOI

### Deploy fail:
```
"Deploy that bai!

Loi: [error message]

Anh/chi muon:
1. Xem logs chi tiet
2. Rollback ve version truoc
3. Fix va thu lai"
```
