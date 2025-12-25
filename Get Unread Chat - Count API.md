---

## Get Unread Chat Count

Retrieves the total count of unread chat messages for the authenticated user.

### Endpoint
- **Method**: GET
- **Path**: `/api/chats/unread-count`
- **Authentication**: JWT token required

### Response Format
```json
{
  "unreadCount": 5
}
```

### Example Response
```json
{
  "unreadCount": 3
}
```

### Error Responses
- **500 Internal Server Error**: Server-side error