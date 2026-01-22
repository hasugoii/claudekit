---
description: 管理Cloudflare Tunnel
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Cloudflare Tunnel 配置

> **Context:** Agent `@devops`
> **Required Skills:** `server-management`, `deployment-procedures`
> **Key Behaviors:**
> - 使用现有tunnel，不要创建新的
> - 添加hostname后验证DNS路由
> - 配置更改后重启tunnel

## 重要 - 更改前请阅读

系统使用**一个单一tunnel**用于多个服务。不要创建新tunnel，只在现有配置中添加hostnames。

---

## 当前状态

### 活动Tunnel
| 属性 | 值 |
|------|-----|
| **Tunnel ID** | `aa304557-6390-44bd-a052-7d7fe2a6e7d6` |
| **Tunnel名称** | `revenue-bot` |
| **域名** | `ebebot.click` |

### 已配置的Hostnames
| Hostname | 服务 (端口) | 描述 |
|----------|-------------|------|
| `webhook.ebebot.click` | `http://localhost:39412` | LINE Bot webhook |
| `pg.ebebot.click` | `http://localhost:8888` | Erablue App |

---

## 如何添加新Hostname

### 步骤1: 更新config.yml
在 `- service: http_status:404` 行**之前**添加新hostname:

```yaml
ingress:
  - hostname: new-service.ebebot.click
    service: http://localhost:XXXX
  - service: http_status:404  # <-- 始终保持最后
```

### 步骤2: 添加DNS路由
```powershell
cloudflared tunnel route dns aa304557-... new-service.ebebot.click
```

### 步骤3: 重启tunnel

### 步骤4: 验证
```powershell
curl https://new-service.ebebot.click
```

---

## 常见错误

### Error 1033 - Tunnel未连接
**原因**: Cloudflared未运行
**解决方案**: 重启服务

### Error 502 - Bad Gateway
**原因**: 后端服务未运行或端口错误
**解决方案**: 检查端口

---

## 不要做

1. 不要创建新tunnel
2. 不要删除 `.json` 凭证文件
3. 不要手动运行cloudflared
