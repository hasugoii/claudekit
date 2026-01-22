---
description: Kien thuc thiet ke kien truc he thong
user-invocable: false
---

# Architecture

Kien thuc thiet ke kien truc he thong

## Architecture Patterns

### Monolith
- Don gian, de bat dau
- Kho scale theo team
- Phu hop: MVP, team nho

### Modular Monolith
- Tach modules ro rang
- De refactor thanh microservices
- Phu hop: Team vua, chuan bi scale

### Microservices
- Scale doc lap
- Phuc tap, can DevOps manh
- Phu hop: Team lon, traffic cao

## Clean Architecture

```
+-------------------------------------+
|           Presentation              |
|         (Controllers, UI)           |
+-------------------------------------+
|           Application               |
|          (Use Cases)                |
+-------------------------------------+
|            Domain                   |
|     (Entities, Business Logic)      |
+-------------------------------------+
|          Infrastructure             |
|      (DB, External Services)        |
+-------------------------------------+
```

## Design Principles

- **SOLID** - Single Responsibility, Open/Closed, Liskov, Interface Segregation, Dependency Inversion
- **DRY** - Don't Repeat Yourself
- **KISS** - Keep It Simple, Stupid
- **YAGNI** - You Aren't Gonna Need It

## Scalability

- Horizontal scaling (more instances)
- Load balancing
- Caching (Redis, CDN)
- Database replication
- Message queues
