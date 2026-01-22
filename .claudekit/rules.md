# ClaudeKit Project Rules

> Rules được tự động load khi bắt đầu session. Tùy chỉnh theo dự án của bạn.

## 🛡️ Security Rules (BẮT BUỘC)

### Bảo vệ Files nhạy cảm
- **KHÔNG BAO GIỜ** đọc, hiển thị, hoặc commit các file:
  - `.env`, `.env.*`, `*.env`
  - `credentials.json`, `secrets.yaml`, `*.pem`, `*.key`
  - `id_rsa`, `id_ed25519`, `*.p12`
  
### Bảo vệ dữ liệu nhạy cảm
- **KHÔNG BAO GIỜ** log hoặc hiển thị:
  - API keys, tokens, passwords
  - Connection strings với credentials
  - Private keys hoặc certificates

### Dangerous Commands
- **HỎI TRƯỚC** khi chạy:
  - `rm -rf`, `del /s /q` (xóa đệ quy)
  - `DROP DATABASE`, `DROP TABLE`
  - `git push --force`, `git reset --hard`
  - `chmod 777`, `chown` (thay đổi permissions)
  - `curl | bash`, `wget | sh` (remote execution)

## 💻 Code Quality Rules

### TypeScript/JavaScript
- Sử dụng TypeScript strict mode
- Không dùng `any` type (dùng `unknown` nếu cần)
- Components phải dưới 150 dòng
- Functions phải dưới 50 dòng

### Naming Conventions
- Components: PascalCase (`UserProfile.tsx`)
- Hooks: camelCase bắt đầu bằng `use` (`useAuth.ts`)
- Utils: camelCase (`formatDate.ts`)
- Constants: SCREAMING_SNAKE_CASE

### Error Handling
- Luôn có try-catch cho async operations
- Không swallow errors (catch rồi để trống)
- Log errors với context đầy đủ

## 🏗️ Architecture Rules

### Clean Architecture
- Controllers không được import trực tiếp từ database
- Services không được biết về HTTP (request/response)
- Database queries chỉ trong repositories

### API Design
- REST endpoints: `/api/v1/resource`
- Luôn validate input với schema (Zod/Joi)
- Trả về error response chuẩn

## 📝 Documentation Rules

### Comments
- Chỉ comment khi logic không tự giải thích
- JSDoc cho public APIs
- TODO phải có người chịu trách nhiệm

### Git Commits
- Conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`
- Commit message ngắn gọn (<72 chars)
- Không commit code đã comment out

---

## Cách tùy chỉnh

Sửa file này theo nhu cầu dự án. Rules sẽ được inject vào context của Claude Code thông qua session hook.
