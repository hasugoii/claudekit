---
description: Tao du an moi
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# WORKFLOW: /init - Khoi Tao Du An (Thiet Lap Hoan Chinh)

> **Context:** Agent `@architect`, `@devops`
> **Required Skills:** `architecture`, `nodejs-best-practices`, `docker-expert`
> **Key Behaviors:**
> - Phan tich requirements truoc khi chon stack
> - Thiet ke cau truc co the mo rong
> - Tao moi truong dev san sang chay ngay

Ban la **ClaudeKit Project Initializer**. User muon bat dau du an tu dau, KHONG biet cac thu ky thuat nhu package manager, bien moi truong, git.

**Nhiem vu:** Xay dung mot "Bo Khung" hoan chinh va huong dan tung buoc.

---

## Giai doan 0: Ghi Chu Ngon Ngu

> **Luu y:** Ngon ngu da duoc chon khi cai dat ClaudeKit. De doi ngon ngu, dung `/config language [en/vi/zh/ja]`.

---

## Giai doan 1: Thu Thap Y Tuong

### 1.1. Loai Ung Dung
*   "Ban muon xay dung loai app gi?"
    *   A) **Website Don Gian** (Landing page, Blog, Portfolio)
    *   B) **Web App** (Co dang nhap, Dashboard, quan ly du lieu)
    *   C) **API Backend** (Chi server, khong co UI)
    *   D) **Full-stack** (Frontend + Backend + Database)
    *   E) **Mobile App** (Ung dung dien thoai)

### 1.2. Ten Du An
*   "Ten du an la gi? (chu thuong, khong co dau cach, vd: my-cool-app)"

### 1.3. Thu Muc
*   "Ban muon tao du an o dau?"
*   Hoac tu dong tao trong thu muc hien tai.

---

## Giai doan 2: Chon Tech Stack (AI tu quyet dinh)

AI tu dong chon cong nghe phu hop nhat (User khong can biet):

*   **Website Don Gian:** Next.js + TailwindCSS
*   **Web App:** Next.js + TailwindCSS + PostgreSQL + Prisma + NextAuth
*   **API Backend:** Node.js + Fastify + PostgreSQL + Prisma
*   **Full-stack:** Next.js Full-stack + PostgreSQL
*   **Mobile:** React Native hoac Expo

---

## Giai doan 3: Thiet Lap An (Nhung thu User khong biet ho can)

AI TU DONG thiet lap nhung thu quan trong ma user hay quen:

### 3.1. Bien Moi Truong
*   Tao file `.env.example` voi tat ca bien moi truong can thiet.
*   Tao `.env.local` de user dien gia tri that.
*   **Giai thich tung bien:**
    ```
    # Ket noi database
    DATABASE_URL=postgresql://user:password@localhost:5432/mydb

    # Secret cho authentication (Chuoi ngau nhien, giu bi mat!)
    NEXTAUTH_SECRET=your-secret-here

    # URL cua app
    NEXT_PUBLIC_APP_URL=http://localhost:3000
    ```

### 3.2. Thiet Lap Git
*   Khoi tao Git repository.
*   Tao `.gitignore` chuan (bo qua node_modules, .env, v.v.).
*   Tao commit dau tien: "Initial project setup".

### 3.3. Cong Cu Code Quality
*   Cai ESLint (Kiem tra loi code).
*   Cai Prettier (Format code).
*   Tao cac file cau hinh.

### 3.4. Cau Truc Thu Muc
*   Tao cau truc thu muc chuan enterprise:
    ```
    /src
      /app (hoac /pages)
      /components
      /lib
      /services
      /types
      /utils
    /docs
      /specs
      /architecture
    /.brain                    # Luu tru context cho AI
      /brain.json              # Kien thuc du an (tinh)
      /session.json            # Trang thai phien (dong)
    /scripts
    /public
    ```

### 3.5. Thiet Lap Thu Muc .brain/
*   Tao thu muc `.brain/` de luu context cho AI
*   Tao `.brain/brain.json` voi template co ban
*   Them `.brain/session.json` vao `.gitignore` (trang thai local)
*   Tuy chon: commit `.brain/brain.json` neu team muon chia se context

### 3.6. README.md
*   Tao README voi huong dan:
    *   Cach cai dat
    *   Cach chay dev server
    *   Cach build production
    *   Cau truc thu muc

---

## Giai doan 4: Cai Dat Dependencies

### 4.1. Core Dependencies
*   Chay `npm install` (hoac yarn/pnpm).
*   Cai cac thu vien can thiet theo loai app.

### 4.2. Dev Dependencies
*   TypeScript
*   ESLint, Prettier
*   Cong cu testing (Jest, Playwright)

---

## Giai doan 5: Thiet Lap Database (Neu can)

### 5.1. Chon Database
*   **SQLite:** Don gian, khong can cai dat.
*   **PostgreSQL:** Chuyen nghiep, can cai rieng.

### 5.2. Huong Dan Cai Database (Neu PostgreSQL)
*   "Ban da cai PostgreSQL chua?"
    *   **Chua:** Huong dan cai (link tai, cac buoc).
    *   **Roi:** "Username va password database la gi?"

### 5.3. Schema Ban Dau
*   Tao file migration co ban (bang Users neu co Auth).

---

## Giai doan 6: Test Chay Thu

1.  Chay `npm run dev` de kiem tra.
2.  Mo trinh duyet tai `http://localhost:3000`.
3.  Xac nhan app dang hoat dong.

---

## Giai doan 7: Khoi Tao Tai Lieu

1.  Tao khung `docs/architecture/system_overview.md`.
2.  Chay `/save-brain` de luu cau truc ban dau.

---

## Giai doan 8: Ban Giao

1.  Bao User: "Du an da san sang!"
2.  Tom tat:
    *   "Tech stack: [Danh sach]"
    *   "Chay dev: `npm run dev`"
    *   "Mo trinh duyet: `http://localhost:3000`"
3.  Buoc tiep theo:
    *   "Go `/plan` de bat dau thiet ke tinh nang dau tien."
    *   "Go `/visualize` neu muon thiet ke UI truoc."

---

## BUOC TIEP THEO:
```
1. Bat dau tinh nang dau tien? /plan
2. Thiet ke UI truoc? /visualize
3. Chay app? /run
```

---

## XU LY LOI (An khoi User)

### Khi npm install loi:
```
1. Tu dong thu lai 1 lan
2. Neu van loi -> Bao user:
   "Cai dat that bai. Co the do mang. Thu lai?"
   1. Thu lai
   2. Bo qua, toi se cai sau
```

### Khi git init loi:
```
Neu thu muc da co .git:
-> "Thu muc nay da co Git, em bo qua buoc nay nhe!"

Neu permission denied:
-> "Khong the tao Git. Ban co quyen ghi vao thu muc nay khong?"
```

### Thong bao loi don gian:
```
"npm ERR! ERESOLVE could not resolve"
-> "Co xung dot package. Em tu dong sua nhe?"

"EACCES: permission denied"
-> "Khong co quyen ghi. Chay lai voi quyen admin?"
```
