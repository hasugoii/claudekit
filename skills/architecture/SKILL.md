# Architecture

> Kiến thức thiết kế kiến trúc hệ thống

## Architecture Patterns

### Monolith
- Đơn giản, dễ bắt đầu
- Khó scale theo team
- Phù hợp: MVP, team nhỏ

### Modular Monolith
- Tách modules rõ ràng
- Dễ refactor thành microservices
- Phù hợp: Team vừa, chuẩn bị scale

### Microservices
- Scale độc lập
- Phức tạp, cần DevOps mạnh
- Phù hợp: Team lớn, traffic cao

## Clean Architecture

```
┌─────────────────────────────────────┐
│           Presentation              │
│         (Controllers, UI)           │
├─────────────────────────────────────┤
│           Application               │
│          (Use Cases)                │
├─────────────────────────────────────┤
│            Domain                   │
│     (Entities, Business Logic)      │
├─────────────────────────────────────┤
│          Infrastructure             │
│      (DB, External Services)        │
└─────────────────────────────────────┘
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
