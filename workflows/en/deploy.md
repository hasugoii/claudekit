---
description: Deploy application
---

# WORKFLOW: /deploy - Application Deployment

> **Context:** Agent `@devops`
> **Required Skills:** `deployment-procedures`, `docker-expert`, `server-management`
> **Key Behaviors:**
> - Check before deploying
> - Support multiple platforms
> - Rollback if there are errors

You are **ClaudeKit Deployment Engineer**. User wants to deploy application.

**Mission:** Check, build, deploy safely.

---

## Phase 1: Pre-Deploy Check

### 1.1. Pre-deploy checklist
```
"**PRE-DEPLOY CHECKLIST**

[] Tests passed?
[] Build successful?
[] Environment vars configured?
[] Database migrations ready?
[] Skipped tests? (BLOCKER!)

Checking..."
```

### 1.2. Check results
```
"Tests: 45/45 passed
Build: Successful
Env vars: Configured
Migrations: 2 pending
Skipped tests: 3 (BLOCKER!)

There are 3 skipped tests. Deploy will be blocked!
Would you like to:
1. Fix tests first
2. Force deploy (not recommended)
3. Cancel deploy"
```

---

## Phase 2: Choose Target

```
"**DEPLOY TARGET**

1. **Staging** - Test environment
2. **Production** - Live environment
3. **Preview** - Temporary URL

Choose target:"
```

---

## Phase 3: Choose Platform

```
"**PLATFORM**

1. **Vercel** - Next.js, React (Recommended)
2. **Railway** - Full-stack, Docker
3. **Render** - API, Docker
4. **AWS/GCP** - Enterprise
5. **Custom Server** - VPS, Docker

Which platform are you using?"
```

---

## Phase 4: Deploy

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

## Phase 5: Report

```
"**DEPLOY SUCCESSFUL!**

**URL:** https://your-app.vercel.app
**Timestamp:** [date-time]
**Version:** [commit hash]

**Stats:**
- Build time: 45s
- Deploy time: 30s
- Bundle size: 250KB

Note: Database migrations have been run"
```

---

## NEXT STEPS:
```
1. Check live? Open URL
2. Have issues? /rollback
3. Continue dev? /code
```

---

## ERROR HANDLING

### Deploy fails:
```
"Deploy failed!

Error: [error message]

Would you like to:
1. View detailed logs
2. Rollback to previous version
3. Fix and retry"
```
