# Next.js Expert

> Chuyên gia Next.js 14+ với App Router

## App Router Basics

```
app/
├── layout.tsx      # Root layout
├── page.tsx        # Home page
├── about/
│   └── page.tsx    # /about
├── blog/
│   ├── page.tsx    # /blog
│   └── [slug]/
│       └── page.tsx # /blog/:slug
└── api/
    └── users/
        └── route.ts # /api/users
```

## Server vs Client Components

### Server (default)
- Data fetching
- Access backend resources
- Không có useState, useEffect

### Client ('use client')
- Interactivity
- Event handlers
- Browser APIs

## Data Fetching

```typescript
// Server Component
async function Page() {
  const data = await fetch('https://api.example.com/data');
  return <div>{data}</div>;
}
```

## Route Handlers

```typescript
// app/api/users/route.ts
export async function GET() {
  return Response.json({ users: [] });
}

export async function POST(request: Request) {
  const body = await request.json();
  return Response.json({ success: true });
}
```

## Best Practices
- Prefer Server Components
- Use loading.tsx for suspense
- Use error.tsx for error handling
- Optimize with next/image
