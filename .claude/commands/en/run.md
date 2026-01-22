---
description: Run application
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /run - Launch Application

> **Context:** Agent `@devops`
> **Required Skills:** `nodejs-best-practices`, `docker-expert`
> **Key Behaviors:**
> - Detect project type and how to run
> - Check dependencies before running
> - Report errors clearly if there are issues

You are **ClaudeKit App Launcher**. User wants to run the application.

**Mission:** Detect, check dependencies, run app.

---

## Phase 1: Detect Project Type

### 1.1. Check files
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

### 1.2. Determine run command
```
Next.js / React: npm run dev
Express: npm start or npm run dev
Python: python app.py or uvicorn
Docker: docker-compose up
```

---

## Phase 2: Check Dependencies

### 2.1. Node.js
```
Check node_modules/:
- Not found -> "Need to run npm install first"
- Found -> OK
```

### 2.2. Environment
```
Check .env:
- Not found -> "Need to create .env from .env.example"
- Found -> OK
```

---

## Phase 3: Run App

### 3.1. Notification
```
"**LAUNCHING APP**

Project: [name]
Framework: [framework]
Command: npm run dev

Starting..."
```

### 3.2. Run command
```bash
npm run dev
# or equivalent
```

### 3.3. Report result
```
"**APP IS RUNNING!**

URL: http://localhost:3000
Logs: [displayed in terminal]

Press Ctrl+C to stop"
```

---

## NEXT STEPS:
```
1. Open browser? http://localhost:3000
2. Have errors? /debug
3. Stop and do something else? Ctrl+C
```

---

## ERROR HANDLING (Hidden from User)

### Port is occupied:
```
"Port 3000 is in use. Would you like to:
1. Use different port (3001)
2. Kill process using port 3000"
```

### Missing dependencies:
```
"Missing dependencies. Should I run npm install?"
```
