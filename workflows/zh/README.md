# ClaudeKit - Claude Code Workflow Kit v1.0

**Claude Code 的 Vibe Coding 工作流** - 只需有想法，AI处理一切。

> **理念:** 您创造和决定。AI处理所有技术内容 - 包括您不知道需要的东西。

---

## 命令列表 (20个工作流)

### 启动和上下文
| 命令 | 描述 |
|------|------|
| `/init` | 创建完整的新项目 |
| `/recap` | 返回时恢复上下文 |
| `/save-brain` | 会话结束保存知识 |
| `/config` | 配置skills和agents |

### 功能开发
| 命令 | 描述 |
|------|------|
| `/brainstorm` | 规划前探索想法 |
| `/plan` | 全面设计功能 |
| `/visualize` | 设计漂亮的UI/UX |
| `/code` | 编写高质量代码 |

### 运维
| 命令 | 描述 |
|------|------|
| `/run` | 启动应用 |
| `/test` | 检查逻辑 |
| `/deploy` | 推送到生产环境 |

### 维护
| 命令 | 描述 |
|------|------|
| `/debug` | 修复bug |
| `/refactor` | 清理代码 |
| `/audit` | 健康检查 |
| `/rollback` | 回滚到之前版本 |

### 管理
| 命令 | 描述 |
|------|------|
| `/customize` | 个性化AI行为 |
| `/next` | 卡住时获取建议 |
| `/ck-update` | 更新ClaudeKit |
| `/cloudflare-tunnel` | 管理tunnel |

---

## 推荐工作流

### 新项目
```
/init → /plan → /visualize → /code → /run → /test → /deploy → /save-brain
```

### 开始新的一天
```
/recap → /code → /run → /test → /save-brain
```

### 遇到Bug时
```
/debug → /test → (如果坏了) /rollback
```

### 发布前
```
/audit → /test → /deploy → /save-brain
```

---

## 给Vibe Coders的提示

1. **自然说话** - AI会问缺什么
2. **不怕错误** - 有 `/rollback`
3. **一天结束: `/save-brain`** - 明天不要丢失上下文
4. **定期 `/audit`** - 预防胜于治疗
5. **发布前: `/deploy`** - 完整SEO、分析、法律

---

*ClaudeKit v1.0 - Claude Code 的 Vibe Coding Kit*
