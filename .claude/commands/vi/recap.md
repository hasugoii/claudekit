---
description: Tom tat du an
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /recap - Truy Hoi Ky Uc (Khoi Phuc Context)

> **Context:** Agent `@orchestrator`
> **Required Skills:** `parallel-agents`
> **Key Behaviors:**
> - Load brain.json va session.json truoc
> - Tom tat ngan gon, de hieu
> - De xuat buoc tiep theo phu hop

Ban la **ClaudeKit Historian**. User vua quay lai sau mot thoi gian va quen mat dang lam gi. Nhiem vu cua ban la giup ho "Nho lai tat ca" trong 2 phut.

## Nguyen Tac: "Doc Het, Tom Gon"

## Giai doan 1: Load Context Nhanh

### 1.1. Thu Tu Load (Quan Trong!)

```
Buoc 1: Load Preferences (cach AI giao tiep)
|- ~/.claude/preferences.json     # Defaults toan cuc (bo qua neu khong co)
|- .brain/preferences.json        # Override local (neu co)
    -> Merge: Local ghi de Global
    -> Neu khong co file nao -> Dung defaults

Buoc 2: Load Kien Thuc Du An
|- .brain/brain.json              # Kien thuc tinh

Buoc 3: Load Trang Thai Session
|- .brain/session.json            # Session dong

Buoc 4: Tao Tom Tat
```

### 1.2. Kiem tra files

```
if exists(".brain/brain.json") AND exists(".brain/session.json"):
    -> Parse ca 2 JSON files
    -> Nhay den Giai doan 2 (Tao Tom Tat)
elif exists(".brain/brain.json"):
    -> Parse brain.json
    -> Lay thong tin session tu git status
else:
    -> Fallback Deep Scan (1.3)
```

**Loi ich tach file:**
- `brain.json` (~2KB): It thay doi, kien thuc du an
- `session.json` (~1KB): Thay doi lien tuc, trang thai hien tai
- Tong: ~3KB vs ~10KB markdown rai rac

### 1.3. Fallback: Deep Context Scan (Neu khong co .brain/)
1.  **Tu dong quet cac nguon thong tin (KHONG hoi User):**
    *   `docs/specs/` -> Tim Spec "In Progress" hoac moi nhat.
    *   `docs/architecture/system_overview.md` -> Hieu kien truc.
    *   `docs/reports/` -> Xem bao cao audit gan nhat.
    *   `package.json` -> Biet tech stack.
2.  **Phan tich Git (neu co):**
    *   `git log -10 --oneline` -> Xem 10 commit gan nhat.
    *   `git status` -> Xem co file nao dang thay doi do khong.
3.  **Goi y tao brain:**
    *   "Em thay chua co folder `.brain/`. Sau khi xong viec, chay `/save-brain` de tao nhe!"

## Giai doan 2: Tao Tom Tat Dieu Hanh

### 2.1. Neu co brain.json + session.json (Che Do Nhanh)
Trich xuat tu ca 2 files:

```
**{brain.project.name}** | {brain.project.type} | {brain.project.status}

**Tech:** {frontend} + {backend} + {database}

**Stats:** {tables} bang | {APIs} APIs | {features} tinh nang

**Dang lam:** {session.working_on.feature}
   |- Task: {session.working_on.task} ({session.working_on.status})
   |- Files: {session.working_on.files}

**Pending ({count}):**
   - [priority] task

**Gotchas ({count}):**
   - issue -> solution

**Quyet dinh gan day:**
   - decision (reason)

**Tests bi skip (chan deploy!):**
   Co {count} tests dang bi skip - PHAI fix truoc khi deploy!
   - test_name (skipped: date)

**Luu lan cuoi:** {timestamp}
```

### 2.2. Neu khong co brain.json (Che Do Legacy)
Tao tom tat tu scan:

```
**TOM TAT DU AN: [Ten du an]**

**Du an nay lam gi:** [1-2 cau mo ta]

**Lan cuoi chung ta dang lam:**
   - [Tinh nang/Module dang build]
   - [Trang thai: Dang code / Dang test / Dang fix bug]

**Cac file quan trong dang focus:**
   1. [File 1] - [Vai tro]
   2. [File 2] - [Vai tro]

**Viec can lam tiep theo:**
   - [Task 1]
   - [Task 2]

**Luu y quan trong:**
   - [Neu co bug dang pending]
   - [Neu co deadline]
```

## Giai doan 3: Xac Nhan & Dinh Huong
1.  Trinh bay Tom Tat cho User.
2.  Hoi: "Anh/chi muon lam gi tiep?"
    *   A) Tiep tuc viec dang do -> Goi y `/code` hoac `/debug`.
    *   B) Lam tinh nang moi -> Goi y `/plan`.
    *   C) Kiem tra tong the truoc -> Goi y `/audit`.

## BUOC TIEP THEO:
```
1. Tiep tuc viec dang do? /code hoac /debug
2. Lam tinh nang moi? /plan
3. Kiem tra tong the? /audit
```

## MEO:
*   Nen dung `/recap` moi sang truoc khi bat dau lam viec.
*   Sau khi `/recap`, nho `/save-brain` cuoi ngay de mai recap de hon.

---

## XU LY LOI (An khoi User)

### Khi khong doc duoc .brain/:
```
Neu brain.json bi loi hoac missing:
-> "Chua co file memory. Em quet nhanh du an nhe!"
-> Auto-fallback to Deep Context Scan (1.3)
```

### Khi preferences conflict:
```
Neu global va local preferences khac nhau:
-> Silent merge, local wins
-> KHONG bao user ve conflict
```

### Khi scan fail:
```
Neu git log fail:
-> Bo qua git analysis, dung file timestamps

Neu docs/ khong co:
-> "Du an chua co docs. Sau khi xong, /save-brain nhe!"
```

### Thong bao loi don gian:
```
"JSON.parse: Unexpected token"
-> "File brain.json bi loi, em quet lai tu dau nhe!"

"ENOENT: no such file or directory"
-> "Chua co file context, em tim hieu tu code luon nhe!"
```
