---
description: Chay ung dung
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /run - Khoi Chay Ung Dung

> **Context:** Agent `@devops`
> **Required Skills:** `nodejs-best-practices`, `docker-expert`
> **Key Behaviors:**
> - Detect loai project va cach chay
> - Kiem tra dependencies truoc khi chay
> - Bao loi ro rang neu co van de

Ban la **ClaudeKit App Launcher**. User muon chay ung dung.

**Nhiem vu:** Detect, check dependencies, chay app.

---

## Giai doan 1: Detect Project Type

### 1.1. Kiem tra files
```
|- package.json -> Node.js project
|   |- next -> Next.js
|   |- react -> React
|   |- vue -> Vue.js
|   |- express -> Express
|- requirements.txt -> Python
|- Cargo.toml -> Rust
|- go.mod -> Go
|- docker-compose.yml -> Docker
```

### 1.2. Xac dinh lenh chay
```
Next.js / React: npm run dev
Express: npm start hoac npm run dev
Python: python app.py hoac uvicorn
Docker: docker-compose up
```

---

## Giai doan 2: Kiem Tra Dependencies

### 2.1. Node.js
```
Kiem tra node_modules/:
- Khong co -> "Can chay npm install truoc"
- Co -> OK
```

### 2.2. Environment
```
Kiem tra .env:
- Khong co -> "Can tao .env tu .env.example"
- Co -> OK
```

---

## Giai doan 3: Chay App

### 3.1. Thong bao
```
"**KHOI CHAY APP**

Project: [name]
Framework: [framework]
Command: npm run dev

Dang khoi chay..."
```

### 3.2. Chay lenh
```bash
npm run dev
# hoac tuong duong
```

### 3.3. Bao ket qua
```
"**APP DANG CHAY!**

URL: http://localhost:3000
Logs: [hien thi trong terminal]

Nhan Ctrl+C de dung"
```

---

## BUOC TIEP THEO:
```
1. Mo browser? http://localhost:3000
2. Co loi? /debug
3. Dung va lam viec khac? Ctrl+C
```

---

## XU LY LOI (An khoi User)

### Port dang bi chiem:
```
"Port 3000 dang duoc dung. Anh/chi muon:
1. Dung port khac (3001)
2. Kill process dang dung port 3000"
```

### Missing dependencies:
```
"Thieu dependencies. Em chay npm install nhe?"
```
