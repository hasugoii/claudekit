# API Patterns

> Best practices cho thiết kế RESTful APIs

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
| GET | Lấy data |
| POST | Tạo mới |
| PUT | Cập nhật toàn bộ |
| PATCH | Cập nhật một phần |
| DELETE | Xóa |

## Status Codes

- 200 OK
- 201 Created
- 400 Bad Request
- 401 Unauthorized
- 403 Forbidden
- 404 Not Found
- 500 Internal Server Error

## Best Practices

- Sử dụng plural nouns (`/users`, không phải `/user`)
- Versioning (`/api/v1/...`)
- Pagination mặc định
- Rate limiting
- Input validation
