---
description: Test-Driven Development workflow
user-invocable: false
---

# TDD Workflow

Test-Driven Development workflow

## Red-Green-Refactor

### 1. Red - Write failing test
```typescript
it('should add two numbers', () => {
  expect(add(1, 2)).toBe(3);
});
```

### 2. Green - Write minimum code to pass
```typescript
function add(a: number, b: number): number {
  return a + b;
}
```

### 3. Refactor - Improve code quality
- Khong thay doi behavior
- Clean up code
- Ensure tests still pass

## TDD Benefits

- Better design (test-first thinking)
- Documentation (tests as specs)
- Confidence (regression safety)
- Faster debugging

## When to use TDD

Use TDD for:
- Logic phuc tap
- Bug fixes (write test first)
- API contracts
- Utils/helpers

Skip TDD for:
- UI prototyping
- Experimental code
- Simple CRUD
