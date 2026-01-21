# TDD Workflow

> Test-Driven Development workflow

## Red-Green-Refactor

### 1. 🔴 Red - Write failing test
```typescript
it('should add two numbers', () => {
  expect(add(1, 2)).toBe(3);
});
```

### 2. 🟢 Green - Write minimum code to pass
```typescript
function add(a: number, b: number): number {
  return a + b;
}
```

### 3. 🔄 Refactor - Improve code quality
- Không thay đổi behavior
- Clean up code
- Ensure tests still pass

## TDD Benefits

- Better design (test-first thinking)
- Documentation (tests as specs)
- Confidence (regression safety)
- Faster debugging

## When to use TDD

✅ Logic phức tạp
✅ Bug fixes (write test first)
✅ API contracts
✅ Utils/helpers

❌ UI prototyping
❌ Experimental code
❌ Simple CRUD
