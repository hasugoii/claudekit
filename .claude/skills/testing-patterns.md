---
description: Chuyen gia viet tests voi Jest/Vitest
user-invocable: false
---

# Testing Patterns

Chuyen gia viet tests voi Jest/Vitest

## AAA Pattern

```typescript
describe('UserService', () => {
  it('should create user', async () => {
    // Arrange
    const input = { email: 'test@test.com', name: 'Test' };

    // Act
    const result = await userService.create(input);

    // Assert
    expect(result.email).toBe('test@test.com');
  });
});
```

## Test Types

### Unit Tests
- Test tung function/component rieng le
- Mock dependencies
- Nhanh, nhieu test cases

### Integration Tests
- Test nhieu modules cung luc
- Real database (in-memory)
- Cham hon, it test cases hon

### E2E Tests
- Test toan bo flow
- Real browser (Playwright/Cypress)
- Cham nhat, chi critical paths

## Mocking

```typescript
// Mock function
const mockFn = jest.fn().mockReturnValue('result');

// Mock module
jest.mock('./userService', () => ({
  getUser: jest.fn().mockResolvedValue({ id: '1' })
}));
```

## Coverage Target
- Unit: 80%+
- Integration: 60%+
- E2E: Critical paths only
