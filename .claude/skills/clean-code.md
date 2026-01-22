---
description: Nguyen tac viet code sach va maintainable
user-invocable: false
---

# Clean Code

Nguyen tac viet code sach va maintainable

## Principles

### 1. Meaningful Names
```typescript
// Bad
const d = new Date();
const x = users.filter(u => u.a);

// Good
const currentDate = new Date();
const activeUsers = users.filter(user => user.isActive);
```

### 2. Small Functions
```typescript
// Function > 50 lines - Bad
// Tach thanh nhieu functions nho - Good

function processOrder(order) {
  validateOrder(order);
  calculateTotal(order);
  saveOrder(order);
  sendNotification(order);
}
```

### 3. Single Responsibility
```typescript
// Class lam nhieu viec - Bad
// Moi class 1 responsibility - Good

class UserRepository { }  // Data access
class UserService { }     // Business logic
class UserController { }  // HTTP handling
```

### 4. DRY (Don't Repeat Yourself)
Tach code lap thanh functions/components

### 5. KISS (Keep It Simple)
Giai phap don gian nhat dung la tot nhat
