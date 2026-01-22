---
description: Chuyen gia TypeScript voi advanced types
user-invocable: false
---

# TypeScript Expert

Chuyen gia TypeScript voi advanced types

## Kien thuc chinh

### Utility Types
```typescript
Partial<T>    // Tat ca optional
Required<T>   // Tat ca required
Pick<T, K>    // Chon mot so keys
Omit<T, K>    // Bo mot so keys
Record<K, V>  // Object voi keys K, values V
```

### Generics
```typescript
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}
```

### Type Guards
```typescript
function isString(x: unknown): x is string {
  return typeof x === 'string';
}
```

### Discriminated Unions
```typescript
type Result<T> =
  | { success: true; data: T }
  | { success: false; error: string };
```

## Best Practices
- Prefer `unknown` over `any`
- Use strict mode
- Leverage inference
- Document complex types
