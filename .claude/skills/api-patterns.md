---
description: Best practices cho thiet ke RESTful APIs
user-invocable: false
---

# API Patterns

Best practices cho thiet ke RESTful APIs

## Response Format

### Success
```json
{
  "success": true,
  "data": { ... },
  "pagination": {
    "page": 1,
    "limit": 10,
    "total": 100
  }
}
```

### Error
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email is required"
  }
}
```

## HTTP Methods

| Method | Usage |
|--------|-------|
| GET | Lay data |
| POST | Tao moi |
| PUT | Cap nhat toan bo |
| PATCH | Cap nhat mot phan |
| DELETE | Xoa |

## Status Codes

- 200 OK
- 201 Created
- 400 Bad Request
- 401 Unauthorized
- 403 Forbidden
- 404 Not Found
- 500 Internal Server Error

## Best Practices

- Su dung plural nouns (`/users`, khong phai `/user`)
- Versioning (`/api/v1/...`)
- Pagination mac dinh
- Rate limiting
- Input validation
