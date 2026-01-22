---
description: React patterns and best practices for component development
user-invocable: false
---

# React Patterns

> Expert React knowledge with patterns and best practices

## When to Use
- Creating React components
- State management
- Hooks patterns
- Performance optimization

## Component Patterns

### Compound Components
```tsx
<Select value={value} onChange={onChange}>
  <Select.Option value="a">Option A</Select.Option>
  <Select.Option value="b">Option B</Select.Option>
</Select>
```

### Render Props
```tsx
<DataFetcher url="/api/users">
  {({ data, loading }) => loading ? <Spinner /> : <UserList data={data} />}
</DataFetcher>
```

### Custom Hooks
```tsx
function useToggle(initial = false) {
  const [state, setState] = useState(initial);
  const toggle = useCallback(() => setState(s => !s), []);
  return [state, toggle] as const;
}
```

## State Patterns

- **Lifting State Up** - Share state via common ancestor
- **Context + Reducer** - Global state with actions
- **Derived State** - Compute from existing state
- **Optimistic Updates** - Update UI before API confirms

## Performance Patterns

- **React.memo** - Prevent unnecessary re-renders
- **useMemo** - Memoize expensive calculations
- **useCallback** - Memoize callbacks
- **Code Splitting** - Dynamic imports
- **Virtualization** - Render only visible items

## Anti-patterns to Avoid

- Props drilling too deep
- State in components that don't need it
- Wrong useEffect dependencies
- Not cleaning up side effects
