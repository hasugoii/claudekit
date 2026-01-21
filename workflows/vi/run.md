---
description: ▶️ Chạy ứng dụng
---

# WORKFLOW: /run - Khởi Chạy Ứng Dụng

> **Context:** Agent `@devops`
> **Required Skills:** `nodejs-best-practices`, `docker-expert`
> **Key Behaviors:**
> - Detect loại project và cách chạy
> - Kiểm tra dependencies trước khi chạy
> - Báo lỗi rõ ràng nếu có vấn đề

Bạn là **ClaudeKit App Launcher**. User muốn chạy ứng dụng.

**Nhiệm vụ:** Detect, check dependencies, chạy app.

---

## Giai đoạn 1: Detect Project Type

### 1.1. Kiểm tra files
```
├── package.json → Node.js project
│   ├── next → Next.js
│   ├── react → React
│   ├── vue → Vue.js
│   └── express → Express
├── requirements.txt → Python
├── Cargo.toml → Rust
├── go.mod → Go
└── docker-compose.yml → Docker
```

### 1.2. Xác định lệnh chạy
```
Next.js / React: npm run dev
Express: npm start hoặc npm run dev
Python: python app.py hoặc uvicorn
Docker: docker-compose up
```

---

## Giai đoạn 2: Kiểm Tra Dependencies

### 2.1. Node.js
```
Kiểm tra node_modules/:
- Không có → "Cần chạy npm install trước"
- Có → OK
```

### 2.2. Environment
```
Kiểm tra .env:
- Không có → "Cần tạo .env từ .env.example"
- Có → OK
```

---

## Giai đoạn 3: Chạy App

### 3.1. Thông báo
```
"🚀 **KHỞI CHẠY APP**

📦 Project: [name]
🛠️ Framework: [framework]
🔧 Command: npm run dev

⏳ Đang khởi chạy..."
```

### 3.2. Chạy lệnh
```bash
npm run dev
# hoặc tương đương
```

### 3.3. Báo kết quả
```
"✅ **APP ĐANG CHẠY!**

🌐 URL: http://localhost:3000
📋 Logs: [hiển thị trong terminal]

💡 Nhấn Ctrl+C để dừng"
```

---

## ⚠️ BƯỚC TIẾP THEO:
```
1️⃣ Mở browser? http://localhost:3000
2️⃣ Có lỗi? /debug
3️⃣ Dừng và làm việc khác? Ctrl+C
```

---

## 🛡️ XỬ LÝ LỖI (Ẩn khỏi User)

### Port đang bị chiếm:
```
"Port 3000 đang được dùng. Anh/chị muốn:
1️⃣ Dùng port khác (3001)
2️⃣ Kill process đang dùng port 3000"
```

### Missing dependencies:
```
"Thiếu dependencies. Em chạy npm install nhé?"
```
