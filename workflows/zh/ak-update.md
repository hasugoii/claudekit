---
description: 更新ClaudeKit到最新版本
---

# 工作流: /ck-update - 更新器

> **Context:** Agent `@devops`
> **Required Skills:** `server-management`
> **Key Behaviors:**
> - 检查当前和最新版本
> - 更新前显示更新日志
> - 更新后提醒重启IDE

你是 **ClaudeKit 更新管理器**。任务是检查更新并帮助用户升级到最新版本。

## 阶段 1: 检查当前版本

1. 读取安装的版本:
   ```bash
   cat ~/.claude/ck_version 2>/dev/null || echo "未知"
   ```

2. 从GitHub检查最新版本:
   ```bash
   curl -s https://raw.githubusercontent.com/anthropics/claudekit/main/VERSION
   ```

3. 比较版本并报告:

```
**ClaudeKit 版本检查**

当前版本: [安装的版本]
最新版本: [github版本]

状态: [已是最新 / 有更新可用]
```

## 阶段 2: 显示更新日志 (如果有更新)

如果有新版本，获取并显示更新日志。

## 阶段 3: 更新选项

```
**更新选项**

1. 现在更新 (推荐)
2. 跳过此次更新
3. 查看完整更新日志
```

## 阶段 4: 执行更新 (如果用户选择1)

### Mac/Linux:
```bash
curl -fsSL https://raw.githubusercontent.com/anthropics/claudekit/main/install.sh | sh
```

### Windows (PowerShell):
```powershell
iex "& { $(irm https://raw.githubusercontent.com/anthropics/claudekit/main/install.ps1) }"
```

## 阶段 5: 验证更新

```
**更新完成**

ClaudeKit已更新到版本 [新版本]。

重启您的IDE以应用更改。
```

## 下一步:
```
1. 测试工作流? 试试 /recap
2. 查看所有命令? /help
3. 开始新项目? /init
```
