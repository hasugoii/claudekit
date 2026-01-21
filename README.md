# ClaudeKit

> **Enhancement Kit for Claude Code** - Biến AI hỗn loạn thành code chất lượng production

![Version](https://img.shields.io/badge/version-1.1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## 🎯 ClaudeKit là gì?

ClaudeKit là framework giúp **Claude Code** trở nên mạnh mẽ hơn với:

- **20 Workflows** - Các lệnh có cấu trúc như `/plan`, `/code`, `/debug`
- **16 AI Agents** - Các chuyên gia như `@frontend`, `@backend`, `@security`
- **40+ Skills** - Kiến thức chuyên sâu về React, TypeScript, DevOps...
- **Context Persistence** - Lưu trữ context qua `brain.json` và `session.json`

## 🚀 Cài Đặt

### Tự động (Sắp có)

```bash
# Windows PowerShell
irm https://raw.githubusercontent.com/your-repo/claudekit/main/install.ps1 | iex

# macOS/Linux
curl -fsSL https://raw.githubusercontent.com/your-repo/claudekit/main/install.sh | bash
```

### Thủ công

1. Clone repository này
2. Copy toàn bộ nội dung vào workspace của bạn
3. Đọc `CLAUDE.md` để xem danh sách commands

## 📋 Workflows

### Phase 1: Planning
| Lệnh | Mô tả |
|------|-------|
| `/init` | ✨ Khởi tạo dự án mới |
| `/recap` | 🧠 Tóm tắt dự án (khôi phục context) |
| `/brainstorm` | 💡 Brainstorm ý tưởng |
| `/plan` | 📝 Thiết kế tính năng |
| `/next` | ❓ Gợi ý bước tiếp theo |

### Phase 2: Building
| Lệnh | Mô tả |
|------|-------|
| `/visualize` | 🎨 Thiết kế UI/UX |
| `/code` | 💻 Viết code theo Spec |
| `/run` | ▶️ Chạy ứng dụng |

### Phase 3: Operating
| Lệnh | Mô tả |
|------|-------|
| `/debug` | 🐛 Sửa lỗi hệ thống |
| `/test` | 🧪 Kiểm tra hệ thống |
| `/refactor` | 🔄 Refactor code |
| `/rollback` | ⏪ Rollback version |
| `/deploy` | 🚀 Deploy ứng dụng |

### Phase 4: Managing
| Lệnh | Mô tả |
|------|-------|
| `/save-brain` | 💾 Lưu context dự án |
| `/config` | ⚙️ Cài đặt skills/agents |
| `/audit` | 🔒 Kiểm tra bảo mật |
| `/ak-update` | 🔄 Cập nhật ClaudeKit |
| `/customize` | 🎭 Tùy chỉnh AI persona |

## 🤖 Agents

Gọi agent chuyên gia bằng `@agent`:

```
@frontend Giúp em tạo form đăng ký
@backend Thiết kế API cho tính năng này
@security Kiểm tra bảo mật code này
```

**Danh sách agents:**
- `@architect` - Thiết kế hệ thống
- `@frontend` - React, Next.js, TailwindCSS
- `@backend` - Node.js, Express, API
- `@database` - Prisma, SQL, Schema
- `@debugger` - Tìm và sửa bugs
- `@devops` - Docker, CI/CD, Deploy
- `@tester` - Unit tests, E2E
- `@security` - Bảo mật, OWASP
- `@pentester` - Pentest, vulnerabilities
- `@performance` - Tối ưu hiệu năng
- `@mobile` - React Native, Flutter
- `@game` - Game development
- `@seo` - SEO optimization
- `@doc` - Documentation
- `@explorer` - Khám phá codebase
- `@orchestrator` - Điều phối agents

## 🧠 Context Persistence

ClaudeKit sử dụng thư mục `.brain/` để lưu context:

```
.brain/
├── brain.json      # Kiến thức dự án (tech stack, schema, APIs)
└── session.json    # Trạng thái hiện tại (đang làm gì, pending tasks)
```

**Workflow:**
1. Bắt đầu ngày: `/recap` để nhớ lại
2. Làm việc bình thường
3. Cuối ngày: `/save-brain` để lưu

## 🌐 Ngôn Ngữ

ClaudeKit hỗ trợ 4 ngôn ngữ:
- English (en)
- Tiếng Việt (vi)
- 中文 (zh)
- 日本語 (ja)

Đổi ngôn ngữ:
```
/config language vi
```

## 📁 Cấu Trúc

```
claudekit/
├── CLAUDE.md           # Command mapping
├── workflows/          # 20 workflow files
│   └── vi/            # Vietnamese workflows
├── agents/            # 16 agent definitions
├── skills/            # 40+ skill modules
├── schemas/           # JSON schemas
└── templates/         # Example files
```

## 🔗 Credits

Adapted from [AntiKit](https://github.com/hasugoii/antikit) - Enhancement Kit for Google Antigravity (Gemini CLI).

## 📄 License

MIT License - Free to use and modify.
