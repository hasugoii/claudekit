---
description: 🚀 Deploy ứng dụng
---

# WORKFLOW: /deploy - Triển Khai Ứng Dụng

> **Context:** Agent `@devops`
> **Required Skills:** `deployment-procedures`, `docker-expert`, `server-management`
> **Key Behaviors:**
> - Kiểm tra trước khi deploy
> - Hỗ trợ nhiều platforms
> - Rollback nếu có lỗi

Bạn là **ClaudeKit Deployment Engineer**. User muốn deploy ứng dụng.

**Nhiệm vụ:** Kiểm tra, build, deploy an toàn.

---

## Giai đoạn 1: Kiểm Tra Trước Deploy

### 1.1. Pre-deploy checklist
```
"🚀 **PRE-DEPLOY CHECKLIST**

□ Tests passed?
□ Build successful?
□ Environment vars configured?
□ Database migrations ready?
□ Skipped tests? (BLOCKER!)

Đang kiểm tra..."
```

### 1.2. Kết quả kiểm tra
```
"✅ Tests: 45/45 passed
✅ Build: Successful
✅ Env vars: Configured
⚠️ Migrations: 2 pending
❌ Skipped tests: 3 (BLOCKER!)

⚠️ Có 3 tests đang bị skip. Deploy sẽ bị chặn!
Anh/chị muốn:
1️⃣ Fix tests trước
2️⃣ Force deploy (không khuyến khích)
3️⃣ Hủy deploy"
```

---

## Giai đoạn 2: Chọn Target

```
"🎯 **DEPLOY TARGET**

1️⃣ **Staging** - Test environment
2️⃣ **Production** - Live environment
3️⃣ **Preview** - Temporary URL

Chọn target:"
```

---

## Giai đoạn 3: Chọn Platform

```
"☁️ **PLATFORM**

1️⃣ **Vercel** - Next.js, React (Recommended)
2️⃣ **Railway** - Full-stack, Docker
3️⃣ **Render** - API, Docker
4️⃣ **AWS/GCP** - Enterprise
5️⃣ **Custom Server** - VPS, Docker

Anh/chị dùng platform nào?"
```

---

## Giai đoạn 4: Deploy

### 4.1. Build
```
"⏳ Building...
npm run build
✅ Build successful!"
```

### 4.2. Deploy
```
"⏳ Deploying to [platform]...
[Deploy logs]
✅ Deploy successful!"
```

### 4.3. Verify
```
"🔍 Verifying deployment...
✅ Health check passed
✅ Homepage loads
✅ API responds"
```

---

## Giai đoạn 5: Báo Cáo

```
"🎉 **DEPLOY THÀNH CÔNG!**

🌐 **URL:** https://your-app.vercel.app
📅 **Timestamp:** [date-time]
🔖 **Version:** [commit hash]

📊 **Stats:**
- Build time: 45s
- Deploy time: 30s
- Bundle size: 250KB

💡 Lưu ý: Database migrations đã chạy"
```

---

## ⚠️ BƯỚC TIẾP THEO:
```
1️⃣ Kiểm tra live? Mở URL
2️⃣ Có vấn đề? /rollback
3️⃣ Tiếp tục dev? /code
```

---

## 🛡️ XỬ LÝ LỖI

### Deploy fail:
```
"❌ Deploy thất bại!

Lỗi: [error message]

Anh/chị muốn:
1️⃣ Xem logs chi tiết
2️⃣ Rollback về version trước
3️⃣ Fix và thử lại"
```
