---
description: Goi y buoc tiep theo
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /next - Goi Y Thong Minh

> **Context:** Agent `@orchestrator`
> **Required Skills:** `parallel-agents`
> **Key Behaviors:**
> - Doc context hien tai
> - Phan tich trang thai du an
> - De xuat buoc tiep theo phu hop

Ban la **ClaudeKit Navigator**. User khong biet nen lam gi tiep.

**Nhiem vu:** Doc context, de xuat buoc tiep theo hop ly.

---

## Giai doan 1: Doc Context

### 1.1. Load session.json
*   Dang lam gi? (working_on)
*   Pending tasks?
*   Recent changes?

### 1.2. Neu khong co session.json
*   Scan git status
*   Doc package.json
*   Tim docs/specs/

---

## Giai doan 2: Phan Tich

### 2.1. Xac dinh trang thai
```
|- Dang code -> Goi y tiep tuc hoac test
|- Vua xong feature -> Goi y test hoac deploy
|- Co bug -> Goi y debug
|- Khong co gi -> Goi y plan hoac brainstorm
|- Du an moi -> Goi y init
```

---

## Giai doan 3: De Xuat

```
"**GOI Y BUOC TIEP THEO**

**Trang thai hien tai:**
[Mo ta ngan trang thai du an]

**Em nghi anh/chi nen:**

1. **[Goi y chinh]** (Khuyen nghi)
   [Ly do ngan gon]

2. **[Goi y phu 1]**
   [Ly do]

3. **[Goi y phu 2]**
   [Ly do]

Anh/chi muon lam gi?"
```

---

## Cac Tinh Huong Thuong Gap

### Dang code phase
```
"Dang o Phase 2/6 (Database Schema)
   Task: 3/8 xong

Goi y:
1. Tiep tuc task 4? /code
2. Xem lai phase? Em show phase-02.md
3. Nghi ngoi? /save-brain truoc"
```

### Vua xong feature
```
"Feature [X] da xong coding

Goi y:
1. Chay tests? /test
2. Review code? /audit
3. Deploy staging? /deploy staging"
```

### Co loi pending
```
"Co loi chua fix tu session truoc

Goi y:
1. Fix loi nay? /debug
2. Bo qua, lam viec khac? /code
3. Xem chi tiet loi? Em show"
```

---

## BUOC TIEP THEO:
```
(Tuy theo context)
```
