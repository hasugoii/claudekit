---
description: Dieu phoi nhieu agents lam viec song song
user-invocable: false
---

# Parallel Agents

Dieu phoi nhieu agents lam viec song song

## Khi nao dung

- Task phuc tap can nhieu chuyen mon
- Co the chia thanh subtasks doc lap
- Can output tu nhieu perspectives

## Coordination Pattern

```
Orchestrator
    |
    +-> @frontend (UI tasks)
    |
    +-> @backend (API tasks)
    |
    +-> @database (Schema tasks)

    v Sync Point

Result Merge
```

## Execution Modes

### Parallel (independent tasks)
```
Task A --> Agent 1 --+
Task B --> Agent 2 --+--> Merge
Task C --> Agent 3 --+
```

### Sequential (dependent tasks)
```
Task A --> Agent 1 --> Task B --> Agent 2 --> Result
```

## Conflict Resolution

- API contracts agreed first
- Shared interfaces defined
- Review by orchestrator
