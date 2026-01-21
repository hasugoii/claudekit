# ClaudeKit - Enhancement Kit for Claude Code

> **Vibe Coding Framework** - Biến AI hỗn loạn thành code chất lượng production

## 🚀 Quick Start

Sau khi cài đặt, dùng các lệnh sau:

| Lệnh | Mô tả |
|------|-------|
| `/recap` | 🧠 Tóm tắt dự án (khôi phục context) |
| `/init` | ✨ Khởi tạo dự án mới |
| `/brainstorm` | 💡 Brainstorm ý tưởng |
| `/plan` | 📝 Thiết kế tính năng |
| `/code` | 💻 Viết code theo Spec |
| `/debug` | 🐛 Sửa lỗi hệ thống |
| `/test` | 🧪 Kiểm tra hệ thống |
| `/run` | ▶️ Chạy ứng dụng |
| `/refactor` | 🔄 Refactor code |
| `/audit` | 🔒 Kiểm tra bảo mật |
| `/deploy` | 🚀 Deploy ứng dụng |
| `/save-brain` | 💾 Lưu context dự án |
| `/config` | ⚙️ Cài đặt skills/agents |
| `/next` | ❓ Gợi ý bước tiếp theo |
| `/visualize` | 🎨 Thiết kế UI/UX |
| `/rollback` | ⏪ Rollback version |
| `/ak-update` | 🔄 Cập nhật ClaudeKit |
| `/customize` | 🎭 Tùy chỉnh AI persona |
| `/cloudflare-tunnel` | 🌐 Quản lý tunnel |
| `/uninstall` | 🗑️ Gỡ cài đặt |

## 🤖 Agents

Gọi agent chuyên gia bằng `@agent`:

| Agent | Chuyên môn |
|-------|------------|
| `@architect` | Thiết kế hệ thống |
| `@frontend` | React, Next.js, TailwindCSS |
| `@backend` | Node.js, Express, API |
| `@database` | Prisma, SQL, Schema |
| `@debugger` | Tìm và sửa bugs |
| `@devops` | Docker, CI/CD, Deploy |
| `@tester` | Unit tests, E2E |
| `@security` | Bảo mật, OWASP |
| `@pentester` | Pentest, vulnerabilities |
| `@performance` | Tối ưu hiệu năng |
| `@mobile` | React Native, Flutter |
| `@game` | Game development |
| `@seo` | SEO optimization |
| `@doc` | Documentation |
| `@explorer` | Khám phá codebase |
| `@orchestrator` | Điều phối agents |

## 📚 Skills

40+ skills được tự động load theo context:

**Frontend:** react-patterns, nextjs-expert, tailwind-patterns, frontend-design, ui-ux-pro-max

**Backend:** api-patterns, nodejs-best-practices, nestjs-expert, python-patterns

**Database:** prisma-expert, database-design

**TypeScript:** typescript-expert, clean-code, lint-and-validate

**Testing:** testing-patterns, tdd-workflow, webapp-testing, code-review-checklist

**Security:** vulnerability-scanner, red-team-tactics

**DevOps:** docker-expert, deployment-procedures, server-management, bash-linux, powershell-windows

**Architecture:** architecture, brainstorming, plan-writing, documentation-templates

**Performance:** performance-profiling, systematic-debugging

**Special:** mobile-design, game-development, seo-fundamentals, i18n-localization, mcp-builder, app-builder

## 🧠 Context Persistence

ClaudeKit sử dụng thư mục `.brain/` để lưu context:

```
.brain/
├── brain.json      # Kiến thức dự án (tech stack, schema, APIs)
└── session.json    # Trạng thái hiện tại (đang làm gì, pending tasks)
```

- `/save-brain` - Lưu context
- `/recap` - Khôi phục context

## 🌐 Multi-language

ClaudeKit hỗ trợ 4 ngôn ngữ:
- English (en)
- Tiếng Việt (vi)
- 中文 (zh)
- 日本語 (ja)

Đổi ngôn ngữ: `/config language [code]`

## 📖 Documentation

- [Workflows](./workflows/)
- [Agents](./agents/)
- [Skills](./skills/)
- [Schemas](./schemas/)

---

**Version:** 1.1.0
**License:** MIT (Fork from AntiKit - adapted for Claude Code)
