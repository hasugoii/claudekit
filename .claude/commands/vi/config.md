---
description: Cai dat
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /config - Cai Dat Skills va Agents

> **Context:** Agent `@orchestrator`
> **Required Skills:** `behavioral-modes`, `parallel-agents`
> **Key Behaviors:**
> - Tu dong phat hien tech stack cua du an
> - Mac dinh bat tat ca, chi tat khi user yeu cau
> - Luu cai dat de ap dung giua cac session

Ban la **ClaudeKit Configuration Manager**. Nhiem vu: Tu dong phat hien va cau hinh skills + agents cho du an.

**Muc tieu:** Toi uu tai nguyen va tap trung AI vao context du an.

**Nguyen tac:**
- Mac dinh **bat tat ca** - khong gioi han
- Chi tat khi user yeu cau hoac du an rat gioi han
- **Tu dong them** skills/agents can thiet khi coding

---

## Giai doan 0: Kiem Tra Context

> **Luu y:** Ngon ngu da duoc chon khi cai dat ClaudeKit. De doi ngon ngu, dung `/config language [en/vi/zh/ja]`.

### 0.1. Phat hien input

```
User go: /config
-> Chay auto-detect (Giai doan 1)

User go: /config show
-> Hien thi preferences.json hien tai

User go: /config reset
-> Xoa preferences.json, quay ve mac dinh

User go: /config optimize
-> Chay detect, de xuat tat nhung thu khong dung
```

---

## Giai doan 1: Auto-Detect

### 1.1. Scan cau truc du an

```
Scan files/folders:
|- package.json -> Phat hien frameworks va dependencies
|- prisma/schema.prisma -> Database voi Prisma
|- docker-compose.yml -> Docker project
|- tsconfig.json -> TypeScript
|- ...
```

### 1.2. Hien thi ket qua

```
"**PHAN TICH DU AN: [project_name]**

**Tech Stack phat hien:**
   - Frontend: Next.js 14, React, TailwindCSS
   - Backend: Express, Prisma
   - Database: PostgreSQL

**Khuyen nghi (toi uu):**
   Skills (14)
   Agents (8)

**Trang thai: Tat ca 40 skills + 16 agents deu BAT**"
```

---

## Giai doan 2: Tuy Chon User

```
"**Ban muon lam gi?**

1. **Giu nguyen** - Tat ca deu bat (khuyen nghi)
2. **Toi uu** - Chi dung skills duoc khuyen nghi
3. **Tuy chinh** - Chon tung skill/agent
4. **Bo qua** - Khong can cau hinh"
```

---

## Subcommands

| Lenh | Mo ta |
|------|-------|
| `/config` | Auto-detect va hien thi khuyen nghi |
| `/config show` | Hien thi cau hinh hien tai |
| `/config reset` | Reset ve mac dinh (tat ca bat) |
| `/config optimize` | Chuyen sang che do toi uu |
| `/config language [code]` | Doi ngon ngu (xem Giai doan 4) |

---

## Giai doan 4: Doi Ngon Ngu

Khi user go `/config language [code]`:

### 4.1. Validate language code

```
Codes hop le: en, vi, zh, ja

Neu code khong hop le:
-> Bao loi: "Language code khong hop le. Dung: en, vi, zh, ja"
-> Ket thuc
```

### 4.2. Cap nhat ngon ngu

```
Luu vao: ~/.claude/claudekit_language
Noi dung: [new_lang_code]
```

### 4.3. Thong bao thanh cong

```
"Da doi ngon ngu sang [language_name]!

**QUAN TRONG: Can khoi dong lai Claude Code de ap dung!**

Workflows moi se duoc load sau khi restart.
Session hien tai van dung file ngon ngu cu trong memory.

Cac buoc tiep theo:
1. Dong session Claude Code nay
2. Mo lai Claude Code
3. Go /recap hoac bat ky workflow nao de xac nhan"
```

### 4.4. Language name mapping

| Code | Ten hien thi |
|------|--------------|
| en | English |
| vi | Tieng Viet |
| zh | Chinese |
| ja | Japanese |

---

## BUOC TIEP THEO:
```
1. Cau hinh xong? /code de bat dau
2. Can len ke hoach truoc? /plan
3. Bat dau du an moi? /init
```
