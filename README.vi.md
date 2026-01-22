<p align="center">
  <img src="https://img.shields.io/badge/ClaudeKit-v1.2.0-blue?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/Workflows-20+-green?style=for-the-badge" alt="Workflows" />
  <img src="https://img.shields.io/badge/Agents-16-purple?style=for-the-badge" alt="Agents" />
  <img src="https://img.shields.io/badge/Skills-40-orange?style=for-the-badge" alt="Skills" />
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License" />
</p>

<h1 align="center">ClaudeKit</h1>

<p align="center">
  <strong>Vibe Coding Framework cho Claude Code</strong><br/>
  <em>Biến AI hỗn loạn thành code chất lượng production</em>
</p>

<p align="center">
  <a href="README.md">English</a> |
  <a href="README.vi.md">Tiếng Việt</a> |
  <a href="README.zh.md">中文</a> |
  <a href="README.ja.md">日本語</a>
</p>

---

## Vấn Đề

Bạn đã từng gặp những tình huống này khi code với AI chưa?

| Không có ClaudeKit | Với ClaudeKit |
|--------------------|---------------|
| "Sau 30 tin nhắn, AI quên mất database schema" | `/recap` khôi phục toàn bộ context ngay lập tức |
| "Code chạy trong chat nhưng crash trong production" | `/code` theo TDD với testing tích hợp |
| "Sửa một bug tạo ra ba bug mới" | `/debug` phân tích nguyên nhân gốc có hệ thống |
| "Tiếp theo làm gì đây?" | `/next` gợi ý bước tiếp theo tối ưu |
| "Phát hiện lỗi bảo mật quá muộn" | `/audit` phát hiện vulnerabilities sớm |
| "Mất hết tiến độ khi session kết thúc" | `/save-brain` lưu kiến thức xuyên sessions |

---

## ClaudeKit là gì?

ClaudeKit là **Bộ Nâng Cấp cho Claude Code** giúp biến đổi trải nghiệm code với AI:

- **20 Slash Commands** - Workflows có cấu trúc như `/plan`, `/code`, `/debug`, `/deploy`
- **16 AI Agents** - Chuyên gia như `@frontend`, `@backend`, `@security`, `@devops`
- **40+ Skills** - Kiến thức chuyên sâu về React, TypeScript, Docker, Security...
- **Auto-Agent Loading** - Agents tự động kích hoạt dựa trên loại dự án
- **Context Persistence** - AI nhớ mọi thứ qua `brain.json`
- **Safety Rules** - Bảo vệ khỏi các thao tác nguy hiểm

---

## Nền Tảng Hỗ Trợ

ClaudeKit được thiết kế để hoạt động với **nhiều AI coding assistants** trên các editors khác nhau:

### AI Assistants

| AI Assistant | Extension | Trạng Thái |
|--------------|-----------|------------|
| **Claude Code** | VSCode Extension | ✅ Hỗ trợ đầy đủ |
| **Google Antigravity** | VSCode Extension (Gemini) | ✅ Hỗ trợ đầy đủ |

> ClaudeKit sử dụng cùng cấu trúc thư mục (`~/.claude/`) mà cả Claude Code và Antigravity extensions đều nhận diện, giúp nó tương thích với cả hai AI assistants!

### Editors (Dựa trên VSCode)

| Editor | Trạng Thái | Ghi Chú |
|--------|------------|---------|
| **VSCode** | ✅ Hỗ trợ đầy đủ | Extensions chính thức có sẵn |
| **Cursor** | ✅ Hỗ trợ đầy đủ | AI editor dựa trên VSCode |
| **Windsurf** | ✅ Hỗ trợ đầy đủ | Editor dựa trên VSCode |
| **VSCodium** | ✅ Hỗ trợ đầy đủ | VSCode mã nguồn mở |
| **Theia** | ✅ Tương thích | IDEs dựa trên Eclipse Theia |
| **code-server** | ✅ Tương thích | VSCode trên trình duyệt |
| **GitHub Codespaces** | ✅ Tương thích | Phát triển trên cloud |

> **Tóm lại:** Nếu bạn sử dụng **Claude Code** hoặc **Antigravity** extension trên bất kỳ editor dựa trên VSCode nào, ClaudeKit sẽ hoạt động với bạn!
>
> **Dự án Anh Em:** Xem [AntiKit](https://github.com/hasugoii/antikit) - bộ enhancement kit gốc cho Google Antigravity mà ClaudeKit được chuyển đổi từ đó.

---

## Bắt Đầu Nhanh

### Yêu Cầu Trước

> **Quan trọng:** Bạn phải cài đặt một trong các AI coding extensions sau TRƯỚC KHI cài ClaudeKit:
> - [Claude Code](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code) - Extension chính thức của Anthropic
> - [Antigravity](https://marketplace.visualstudio.com/items?itemName=anthropic.antigravity) - Extension Gemini của Google
>
> ClaudeKit nâng cấp các extensions này - nó KHÔNG hoạt động độc lập.

### Cài Đặt

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/hasugoii/claudekit/main/install.ps1 | iex
```

**macOS / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/hasugoii/claudekit/main/install.sh | bash
```

### Các Bước Đầu Tiên

1. Mở **Claude Code** trong VSCode
2. Gõ `/recap` để xem các commands
3. Dùng `/init` để bắt đầu dự án mới
4. Để ClaudeKit hướng dẫn quy trình phát triển!

---

## Commands (Slash Commands)

### Phase 1: Lập Kế Hoạch

| Lệnh | Mô Tả |
|------|-------|
| `/init` | Khởi tạo dự án mới với brain.json |
| `/recap` | Khôi phục context dự án (đầu ngày) |
| `/brainstorm` | Sinh và đánh giá ý tưởng |
| `/plan` | Thiết kế tính năng với specifications |
| `/next` | Nhận gợi ý bước tiếp theo từ AI |

### Phase 2: Xây Dựng

| Lệnh | Mô Tả |
|------|-------|
| `/visualize` | Thiết kế UI/UX với mockups |
| `/code` | Viết code production-ready (TDD) |
| `/run` | Chạy và test ứng dụng |

### Phase 3: Vận Hành

| Lệnh | Mô Tả |
|------|-------|
| `/debug` | Debug có hệ thống với phân tích nguyên nhân gốc |
| `/test` | Chạy bộ test toàn diện |
| `/refactor` | Cải thiện chất lượng và cấu trúc code |
| `/rollback` | Quay lại phiên bản trước an toàn |
| `/deploy` | Deploy lên môi trường production |

### Phase 4: Quản Lý

| Lệnh | Mô Tả |
|------|-------|
| `/save-brain` | Lưu kiến thức dự án |
| `/config` | Cấu hình ClaudeKit |
| `/audit` | Kiểm tra bảo mật và chất lượng |
| `/ck-update` | Cập nhật ClaudeKit lên bản mới nhất |
| `/customize` | Tùy chỉnh AI persona và hành vi |

---

## Agents

Gọi AI agents chuyên gia bằng `@agent`:

```
@frontend Giúp em tạo navbar responsive
@backend Thiết kế REST API cho authentication
@security Review code này có vulnerabilities không
@devops Setup cấu hình Docker
```

### Danh Sách Agents

| Agent | Chuyên Môn |
|-------|------------|
| `@architect` | Thiết kế hệ thống, architecture patterns |
| `@frontend` | React, Next.js, Vue, TailwindCSS |
| `@backend` | Node.js, Express, NestJS, APIs |
| `@database` | Prisma, TypeORM, SQL, Schema design |
| `@debugger` | Tìm bugs, phân tích nguyên nhân gốc |
| `@devops` | Docker, CI/CD, Kubernetes, Deploy |
| `@tester` | Unit tests, E2E, Jest, Playwright |
| `@security` | OWASP, authentication, encryption |
| `@pentester` | Penetration testing, vulnerabilities |
| `@performance` | Tối ưu hóa, profiling, caching |
| `@mobile` | React Native, Flutter, Expo |
| `@game` | Game development, physics, graphics |
| `@seo` | SEO optimization, meta tags |
| `@doc-writer` | Documentation, technical writing |
| `@explorer` | Khám phá codebase, hiểu code |
| `@orchestrator` | Điều phối đa agents |

### Auto-Agent Loading

ClaudeKit tự động load agents phù hợp dựa trên dự án:

- **Dự án React/Next.js** → `@frontend` auto-loaded
- **Dự án Express/NestJS** → `@backend` auto-loaded
- **Dự án Prisma/TypeORM** → `@database` auto-loaded
- **Có Dockerfile** → `@devops` auto-loaded
- **Có thư mục Auth** → `@security` auto-loaded

Cấu hình trong `.claudekit/agents.json`.

---

## Context Persistence

ClaudeKit dùng `.brain/` để nhớ dự án:

```
.brain/
├── brain.json      # Kiến thức dự án (tech stack, schemas, APIs)
└── session.json    # Trạng thái hiện tại (task đang làm, pending items)
```

**Workflow Hàng Ngày:**
1. Đầu ngày: `/recap` để khôi phục context
2. Làm việc bình thường với Claude Code
3. Cuối ngày: `/save-brain` để lưu kiến thức

---

## Safety & Rules

ClaudeKit có các tính năng an toàn:

- **Protected Files** - Ngăn đọc/sửa `.env`, credentials
- **Dangerous Commands** - Cảnh báo trước `rm -rf`, `DROP DATABASE`, v.v.
- **Project Rules** - Rules tùy chỉnh trong `.claudekit/rules.md`

Cấu hình trong `.claudekit/safety.json`.

---

## Hỗ Trợ Đa Ngôn Ngữ

ClaudeKit hỗ trợ 4 ngôn ngữ:
- English (en)
- Tiếng Việt (vi)
- 中文 Chinese (zh)
- 日本語 Japanese (ja)

Đổi ngôn ngữ khi cài đặt hoặc dùng:
```
/config language vi
```

---

## Cấu Trúc Thư Mục

```
~/.claude/
├── commands/           # Slash commands
│   ├── en/            # English commands
│   ├── vi/            # Vietnamese commands
│   ├── zh/            # Chinese commands
│   └── ja/            # Japanese commands
├── agents/            # 16 AI agent definitions
├── skills/            # 40+ skill modules
└── hooks/             # Session hooks (auto-load context)

.claudekit/            # Cấu hình cấp dự án
├── rules.md           # Project rules (như .cursorrules)
├── safety.json        # Cấu hình an toàn
└── agents.json        # Cấu hình agent auto-loading
```

---

## Credits

Chuyển đổi từ [AntiKit](https://github.com/hasugoii/antikit) - Enhancement Kit cho Google Antigravity (Gemini CLI).

---

## License

MIT License - Tự do sử dụng, chỉnh sửa và phân phối.

---

<p align="center">
  <sub>
    <em>claude code kit, vibe coding, claude code enhancement, ai coding assistant, agentic development, autonomous ai agents, ai pair programming, claude code vscode, vibe code with claude, claude code tiếng việt, cursor ai extension, windsurf coding, antigravity compatible</em>
  </sub>
</p>
