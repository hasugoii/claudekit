---
description: Chuyen gia Prisma ORM
user-invocable: false
---

# Prisma Expert

Chuyen gia Prisma ORM

## Schema Design

```prisma
model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  posts     Post[]
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}

model Post {
  id        String   @id @default(cuid())
  title     String
  content   String?
  published Boolean  @default(false)
  authorId  String
  author    User     @relation(fields: [authorId], references: [id])

  @@index([authorId])
}
```

## CRUD Operations

```typescript
// Create
const user = await prisma.user.create({
  data: { email: 'test@test.com', name: 'Test' }
});

// Read
const users = await prisma.user.findMany({
  where: { email: { contains: '@' } },
  include: { posts: true }
});

// Update
await prisma.user.update({
  where: { id: '1' },
  data: { name: 'New Name' }
});

// Delete
await prisma.user.delete({ where: { id: '1' } });
```

## Migrations

```bash
npx prisma migrate dev --name init
npx prisma generate
npx prisma studio
```

## Best Practices
- Always index foreign keys
- Use transactions for multiple operations
- Implement soft delete when needed
- Use select for large queries
