---
description: 卸载 ClaudeKit
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# 工作流: /uninstall - 删除 ClaudeKit

> **Context:** Agent `@devops`
> **Required Skills:** `server-management`, `powershell-windows`, `bash-linux`
> **Key Behaviors:**
> - 删除前确认
> - 准确列出将被删除的内容
> - 必要时提供重新安装说明

你是 **ClaudeKit 卸载器**。任务: 安全地从系统中删除 ClaudeKit。

**目标:** 干净地删除，同时根据需要保留用户数据。

---

## 阶段 1: 确认

```
"**卸载 CLAUDEKIT**

您即将从系统中删除 ClaudeKit。以下文件将被删除:

**将被删除的文件:**
- ~/.claude/claudekit/global_workflows/ (20个工作流文件)
- ~/.claude/claudekit/agents/ (16个代理文件)
- ~/.claude/claudekit/skills/ (40个技能文件夹)
- ~/.claude/claudekit/schemas/ (3个模式文件)
- ~/.claude/claudekit/templates/ (3个模板文件)
- ~/.claude/claudekit_version
- ~/.claude/claudekit_language
- ~/.claude/CLAUDE.md 中的 ClaudeKit 部分

**注意:** 以下内容不会被删除:
- 您的项目文件
- 项目中的 ~/.brain/ 文件夹
- 其他 Claude Code 设置

您确定要卸载吗?
1. 是 - 完全删除 ClaudeKit
2. 否 - 取消卸载"
```

---

## 阶段 2: 执行卸载

如果用户确认（是）:

### 2.1. 删除 ClaudeKit 目录

```
删除以下目录:
rm -rf ~/.claude/claudekit/global_workflows/
rm -rf ~/.claude/claudekit/agents/
rm -rf ~/.claude/claudekit/skills/
rm -rf ~/.claude/claudekit/schemas/
rm -rf ~/.claude/claudekit/templates/

显示进度:
"正在删除 ClaudeKit 文件...
   已删除 global_workflows/
   已删除 agents/
   已删除 skills/
   已删除 schemas/
   已删除 templates/"
```

### 2.2. 删除配置文件

```
删除配置文件:
rm ~/.claude/claudekit_version
rm ~/.claude/claudekit_language

"已删除配置文件"
```

### 2.3. 清理 CLAUDE.md

```
CLAUDE_MD = ~/.claude/CLAUDE.md

从 CLAUDE.md 中删除 "# ClaudeKit - Enhancement Kit for Claude Code" 部分
及其后的所有内容。

如果删除后 CLAUDE.md 为空，则删除该文件。

"已清理 CLAUDE.md"
```

### 2.4. 删除空的 ClaudeKit 目录

```
如果 ~/.claude/claudekit/ 现在为空:
rm -rf ~/.claude/claudekit/

"已删除空的 claudekit 目录"
```

---

## 阶段 3: 完成

```
"**CLAUDEKIT 卸载成功！**

所有 ClaudeKit 文件已从系统中删除。

**重要: 您必须重启 Claude Code 才能使更改生效！**

**已删除:**
- 20个工作流文件
- 16个代理
- 40个技能
- 6个模式/模板文件
- ClaudeKit 配置

**以后重新安装 ClaudeKit:**
Windows: irm https://raw.githubusercontent.com/anthropics/claudekit/main/install.ps1 | iex
Mac/Linux: curl -fsSL https://raw.githubusercontent.com/anthropics/claudekit/main/install.sh | bash

感谢您使用 ClaudeKit！"
```

---

## 阶段 4: 如果用户取消

```
"卸载已取消。

ClaudeKit 仍安装在您的系统上。

继续使用 ClaudeKit:
- /recap - 恢复上下文
- /plan - 开始规划
- /code - 开始编码"
```
