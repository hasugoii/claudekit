---
description: Phuong phap debug co he thong
user-invocable: false
---

# Systematic Debugging

Phuong phap debug co he thong

## Quy trinh 5 buoc

### 1. Reproduce
- Xac dinh steps de reproduce
- Minimal reproduction case

### 2. Isolate
- Thu hep pham vi
- Binary search qua code

### 3. Analyze
- Doc error messages ky
- Check logs
- Breakpoints

### 4. Fix
- Fix root cause, khong patch symptoms
- Viet test case truoc

### 5. Verify
- Reproduce khong con bug
- Khong regression

## Debug Tools

| Tool | Purpose |
|------|---------|
| console.log | Quick inspection |
| debugger | Step-through |
| Chrome DevTools | Frontend |
| Node inspect | Backend |
| Logging | Production |

## Common Patterns
- Race condition -> Add delays, check order
- Memory leak -> Profile heap snapshots
- Null reference -> Check data flow
