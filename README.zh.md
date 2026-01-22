<p align="center">
  <img src="https://img.shields.io/badge/ClaudeKit-v1.2.0-blue?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/Workflows-20+-green?style=for-the-badge" alt="Workflows" />
  <img src="https://img.shields.io/badge/Agents-16-purple?style=for-the-badge" alt="Agents" />
  <img src="https://img.shields.io/badge/Skills-40-orange?style=for-the-badge" alt="Skills" />
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License" />
</p>

<h1 align="center">ClaudeKit</h1>

<p align="center">
  <strong>Claude Code 的 Vibe Coding 框架</strong><br/>
  <em>将AI混乱转变为生产就绪的代码</em>
</p>

<p align="center">
  <a href="README.md">English</a> |
  <a href="README.vi.md">Tiếng Việt</a> |
  <a href="README.zh.md">中文</a> |
  <a href="README.ja.md">日本語</a>
</p>

---

## 问题

你在使用AI编程助手时遇到过这些情况吗？

| 没有 ClaudeKit | 有 ClaudeKit |
|---------------|--------------|
| "30条消息后，AI忘记了你的数据库架构" | `/recap` 立即恢复完整项目上下文 |
| "代码在聊天中运行但在生产环境崩溃" | `/code` 遵循TDD并内置测试 |
| "修复一个bug产生三个新bug" | `/debug` 使用系统化根因分析 |
| "下一步该做什么？" | `/next` 建议最优下一步 |
| "安全问题发现太晚" | `/audit` 及早发现漏洞 |
| "会话结束时丢失所有进度" | `/save-brain` 跨会话保存知识 |

---

## 什么是 ClaudeKit？

ClaudeKit 是 **Claude Code 的增强套件**，它通过以下方式改变您的AI编程体验：

- **20个斜杠命令** - 结构化工作流如 `/plan`, `/code`, `/debug`, `/deploy`
- **16个AI代理** - 专家如 `@frontend`, `@backend`, `@security`, `@devops`
- **40+技能** - React, TypeScript, Docker, Security等深度专业知识
- **自动代理加载** - 代理根据项目类型自动激活
- **上下文持久化** - AI通过 `brain.json` 记住一切
- **安全规则** - 防止危险操作

---

## 支持的平台

ClaudeKit 设计用于在各种编辑器上与**多个AI编程助手**一起工作：

### AI 助手

| AI 助手 | 扩展 | 状态 |
|--------|------|------|
| **Claude Code** | VSCode 扩展 | ✅ 完全支持 |
| **Google Antigravity** | VSCode 扩展 (Gemini) | ✅ 完全支持 |

> ClaudeKit 使用相同的目录结构（`~/.claude/`），Claude Code 和 Antigravity 扩展都能识别，使其与两个AI助手兼容！

### 编辑器（基于VSCode）

| 编辑器 | 状态 | 备注 |
|-------|------|------|
| **VSCode** | ✅ 完全支持 | 官方扩展可用 |
| **Cursor** | ✅ 完全支持 | 基于VSCode的AI编辑器 |
| **Windsurf** | ✅ 完全支持 | 基于VSCode的编辑器 |
| **VSCodium** | ✅ 完全支持 | 开源VSCode |
| **Theia** | ✅ 兼容 | 基于Eclipse Theia的IDE |
| **code-server** | ✅ 兼容 | 浏览器中的VSCode |
| **GitHub Codespaces** | ✅ 兼容 | 云端开发 |

> **总结：** 如果您在任何基于VSCode的编辑器上使用 **Claude Code** 或 **Antigravity** 扩展，ClaudeKit 都可以为您工作！
>
> **姐妹项目：** 查看 [AntiKit](https://github.com/hasugoii/antikit) - ClaudeKit 改编自的 Google Antigravity 原始增强套件。

---

## 快速开始

### 安装

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/hasugoii/claudekit/main/install.ps1 | iex
```

**macOS / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/hasugoii/claudekit/main/install.sh | bash
```

### 第一步

1. 在VSCode中打开 **Claude Code**
2. 输入 `/recap` 查看可用命令
3. 使用 `/init` 开始新项目
4. 让ClaudeKit指导您的开发流程！

---

## 命令（斜杠命令）

### 阶段1：规划

| 命令 | 描述 |
|-----|------|
| `/init` | 使用brain.json初始化新项目 |
| `/recap` | 恢复项目上下文（每日开始） |
| `/brainstorm` | 生成和评估想法 |
| `/plan` | 设计带规格的功能 |
| `/next` | 获取AI建议的下一步 |

### 阶段2：构建

| 命令 | 描述 |
|-----|------|
| `/visualize` | 设计UI/UX模型 |
| `/code` | 编写生产就绪代码（TDD） |
| `/run` | 执行和测试应用程序 |

### 阶段3：运维

| 命令 | 描述 |
|-----|------|
| `/debug` | 使用根因分析进行系统调试 |
| `/test` | 运行综合测试套件 |
| `/refactor` | 改进代码质量和结构 |
| `/rollback` | 安全回滚到之前版本 |
| `/deploy` | 部署到生产环境 |

### 阶段4：管理

| 命令 | 描述 |
|-----|------|
| `/save-brain` | 保存项目知识 |
| `/config` | 配置ClaudeKit设置 |
| `/audit` | 安全和质量审计 |
| `/ck-update` | 更新ClaudeKit到最新版本 |
| `/customize` | 自定义AI角色和行为 |

---

## 代理

使用 `@agent` 调用专业AI代理：

```
@frontend 帮我创建响应式导航栏
@backend 设计用户认证的REST API
@security 审查这段代码的漏洞
@devops 设置Docker配置
```

### 可用代理

| 代理 | 专业领域 |
|-----|---------|
| `@architect` | 系统设计，架构模式 |
| `@frontend` | React, Next.js, Vue, TailwindCSS |
| `@backend` | Node.js, Express, NestJS, APIs |
| `@database` | Prisma, TypeORM, SQL, Schema设计 |
| `@debugger` | Bug追踪，根因分析 |
| `@devops` | Docker, CI/CD, Kubernetes, 部署 |
| `@tester` | 单元测试, E2E, Jest, Playwright |
| `@security` | OWASP, 认证, 加密 |
| `@pentester` | 渗透测试, 漏洞 |
| `@performance` | 优化, 分析, 缓存 |
| `@mobile` | React Native, Flutter, Expo |
| `@game` | 游戏开发, 物理, 图形 |
| `@seo` | SEO优化, meta标签 |
| `@doc-writer` | 文档, 技术写作 |
| `@explorer` | 代码库探索, 理解 |
| `@orchestrator` | 多代理协调 |

### 自动代理加载

ClaudeKit根据您的项目自动加载相关代理：

- **React/Next.js项目** → `@frontend` 自动加载
- **Express/NestJS项目** → `@backend` 自动加载
- **Prisma/TypeORM项目** → `@database` 自动加载
- **存在Dockerfile** → `@devops` 自动加载
- **存在Auth文件夹** → `@security` 自动加载

在 `.claudekit/agents.json` 中配置。

---

## 上下文持久化

ClaudeKit使用 `.brain/` 记住您的项目：

```
.brain/
├── brain.json      # 项目知识（技术栈，架构，APIs）
└── session.json    # 当前状态（活动任务，待办事项）
```

**每日工作流程：**
1. 每天开始：`/recap` 恢复上下文
2. 正常使用Claude Code工作
3. 每天结束：`/save-brain` 保存知识

---

## 安全与规则

ClaudeKit包含安全功能：

- **受保护文件** - 防止读取/修改 `.env`，凭证
- **危险命令** - 在 `rm -rf`, `DROP DATABASE` 等之前警告
- **项目规则** - 在 `.claudekit/rules.md` 中自定义规则

在 `.claudekit/safety.json` 中配置。

---

## 多语言支持

ClaudeKit支持4种语言：
- English (en)
- Tiếng Việt (vi)
- 中文 Chinese (zh)
- 日本語 Japanese (ja)

安装时切换语言或使用：
```
/config language zh
```

---

## 目录结构

```
~/.claude/
├── commands/           # 斜杠命令
│   ├── en/            # 英语命令
│   ├── vi/            # 越南语命令
│   ├── zh/            # 中文命令
│   └── ja/            # 日语命令
├── agents/            # 16个AI代理定义
├── skills/            # 40+技能模块
└── hooks/             # 会话钩子（自动加载上下文）

.claudekit/            # 项目级配置
├── rules.md           # 项目规则（类似.cursorrules）
├── safety.json        # 安全配置
└── agents.json        # 代理自动加载配置
```

---

## 致谢

改编自 [AntiKit](https://github.com/hasugoii/antikit) - Google Antigravity（Gemini CLI）的增强套件。

---

## 许可证

MIT许可证 - 自由使用、修改和分发。

---

<p align="center">
  <sub>
    <em>claude code kit, vibe coding, claude code enhancement, ai coding assistant, agentic development, autonomous ai agents, ai pair programming, claude code vscode, vibe code with claude, claude code 中文</em>
  </sub>
</p>
