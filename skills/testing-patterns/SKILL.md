# Testing Patterns

> Chuyên gia viết tests với Jest/Vitest

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
- Test từng function/component riêng lẻ
- Mock dependencies
- Nhanh, nhiều test cases

### Integration Tests
- Test nhiều modules cùng lúc
- Real database (in-memory)
- Chậm hơn, ít test cases hơn

### E2E Tests
- Test toàn bộ flow
- Real browser (Playwright/Cypress)
- Chậm nhất, chỉ critical paths

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
