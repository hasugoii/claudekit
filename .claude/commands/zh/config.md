---
description: 配置设置
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# 工作流: /config - Skills和Agents配置

> **Context:** Agent `@orchestrator`
> **Required Skills:** `behavioral-modes`, `parallel-agents`
> **Key Behaviors:**
> - 自动检测项目技术栈
> - 默认启用所有，仅在用户请求时禁用
> - 保存配置以跨会话应用

你是 **ClaudeKit 配置管理器**。任务: 自动检测并为项目配置skills + agents。

**目标:** 优化资源，将AI专注于项目上下文。

**原则:**
- 默认 **启用所有** - 无限制
- 只在用户请求或项目极度专注时禁用
- 编码时 **自动添加** 需要的skill/agent

---

## 阶段 0: 上下文检查

> **注意:** 语言已在ClaudeKit安装时选择，并保存在`~/.claude/claudekit_language`。要更改语言，请使用`/config language [en/vi/zh/ja]`（见阶段4）。

### 0.1. 检测输入

```
用户输入: /config
→ 先检查语言 (如果未设置)
→ 运行自动检测 (阶段1)

用户输入: /config show
→ 显示当前 preferences.json

用户输入: /config reset
→ 删除 preferences.json，返回启用所有

用户输入: /config optimize
→ 运行检测，建议禁用未使用的项目
```

---

## 阶段 1: 自动检测

### 1.1. 扫描项目结构

```
扫描文件/文件夹:
├── package.json → 检测框架和依赖
├── prisma/schema.prisma → 使用Prisma的数据库
├── docker-compose.yml → Docker项目
├── tsconfig.json → TypeScript
└── ...
```

### 1.2. 检测 → 推荐规则

| 检测到 | 推荐的 Skills + Agents |
|--------|------------------------|
| `next` | nextjs-expert, react-patterns + @frontend |
| `prisma` | prisma-expert, database-design + @database |
| `typescript` | typescript-expert |
| `docker-compose.yml` | docker-expert + @devops |

### 1.3. 显示检测结果

```
"**项目分析: [project_name]**

**检测到的技术栈:**
   • 前端: Next.js 14, React, TailwindCSS
   • 后端: Express, Prisma
   • 数据库: PostgreSQL

**推荐 (最适合):**
   Skills (14个)
   Agents (8个)

**状态: 所有40个skills + 16个agents都已启用**
"
```

---

## 阶段 2: 模式选择

### 2.1. 选择菜单

```
"**您想要哪种配置模式?**

1. **Lightweight** (轻量 & 快速)
   → 仅启用核心 Agent (@architect, @coder)
   → 禁用深度分析功能
   → 适合: 慢速机器, 追求速度, 小型项目

2. **Balanced** (平衡 - 推荐)
   → 自动检测技术栈并启用适配的 skill
   → 智能与性能的平衡

3. **Powerful** (最强模式)
   → 启用所有 agents 和 skills
   → 深度分析: Security, Performance, SEO...
   → 适合: 审计, 发布, 复杂项目

4. **Custom** (自定义)
   → 手动选择每个 skill
"
```

### 2.2. 模式详情

#### Lightweight Mode (`/config mode lightweight`)
*   **目标:** 最快响应, 节省 token。
*   **启用:** `@architect`, `@frontend`, `@backend`
*   **禁用:** `@security`, `@performance`, `@seo`, `@tester`, `@mobile`, `@game`...
*   **Skills:** 仅保留基本框架 skill (React, Node...)。

#### Balanced Mode (`/config optimize`)
*   **目标:** 平衡。在正确的地方使用正确的工具。
*   **逻辑:** 运行自动检测 (阶段1) 并仅启用与技术栈相关的项目。

#### Powerful Mode (`/config mode powerful`)
*   **目标:** 全面覆盖。
*   **启用:** 所有 Agents + 所有 Skills。
*   **行为:**
    *   编码后 → 自动调用 Security & Performance 检查。
    *   计划时 → 调用 SEO & Architecture 检查。

---

## Subcommands

| 命令 | 描述 |
|------|------|
| `/config` | 自动检测并显示模式菜单 |
| `/config show` | 查看当前偏好 |
| `/config mode lightweight` | 切换到轻量模式 (快速) |
| `/config mode balanced` | 切换到平衡模式 (优化) |
| `/config mode powerful` | 切换到最强模式 (全开) |
| `/config optimize` | 切换到平衡模式 |
| `/config language [code]` | 更改语言 (见阶段4) |

---

## 阶段 4: 更改语言

当用户输入 `/config language [code]`:

### 4.1. 验证语言代码

```
有效代码: en, vi, zh, ja

如果代码无效:
→ 显示错误: "无效的语言代码。请使用: en, vi, zh, 或 ja"
→ 退出
```

### 4.2. 下载新语言的工作流

```
REPO_BASE = "https://raw.githubusercontent.com/anthropics/claudekit/main"
WORKFLOWS_DIR = ~/.claude/claudekit/global_workflows/

WORKFLOW_FILES = [
    "README.md", "ck-update.md", "audit.md", "brainstorm.md", "cloudflare-tunnel.md",
    "code.md", "config.md", "customize.md", "debug.md", "deploy.md",
    "init.md", "next.md", "plan.md", "recap.md", "refactor.md",
    "rollback.md", "run.md", "save_brain.md", "test.md", "visualize.md"
]

对于 WORKFLOW_FILES 中的每个文件:
→ 从以下位置下载: $REPO_BASE/workflows/[lang]/[file]
→ 保存到: $WORKFLOWS_DIR/[file] (覆盖现有文件)

显示进度:
"正在下载 [lang] 工作流...
   README.md
   ck-update.md
   audit.md
   ... (共20个文件)

已将20个工作流文件下载到 global_workflows/"
```

### 4.3. 保存新语言

```
保存到: ~/.claude/claudekit_language
内容: [new_lang_code]
```

### 4.3.5. 更新 CLAUDE.md 中的 Command Mapping（重要）

```
CLAUDE_MD = ~/.claude/CLAUDE.md

将 CLAUDE.md 中的 "# ClaudeKit - Enhancement Kit for Claude Code" 部分
替换为语言特定的 Command Mapping。

按语言的 Command Mapping:

[en] English / [vi] Vietnamese / [ja] Japanese: 类似

[zh] 中文:
| 命令 | 描述 |
| `/brainstorm` | 头脑风暴、市场研究 |
| `/plan` | 功能设计 |
| `/code` | 安全编写代码 |
... (共19个命令)

从以下位置下载完整模板:
$REPO_BASE/templates/claude_[lang].md
→ 从 "# ClaudeKit" 部分开始替换 CLAUDE.md 中的内容
```


### 4.4. 重启警告 (重要)

```
语言更改成功后，必须显示:

"语言已更改为 [language_name]!

**重要: 您必须重启 Claude Code 才能使更改生效!**

新的工作流语言只有在重启后才会加载。
当前会话仍在使用缓存在内存中的旧语言文件。

请执行以下步骤:
1. 关闭此 Claude Code 会话
2. 重新打开 Claude Code
3. 使用 /recap 或任何工作流命令验证"
```

### 4.5. 语言名称映射

| 代码 | 显示名称 |
|------|----------|
| en | English |
| vi | Tiếng Việt |
| zh | 中文 |
| ja | 日本語 (日语) |

---

## 下一步:

```
1. 配置完成? /code 开始
2. 需要先计划? /plan
3. 开始新项目? /init
```
