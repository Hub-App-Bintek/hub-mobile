# Notification Inbox API Documentation

## Overview
The Notification Inbox API provides endpoints for managing user notifications, including retrieving notifications, getting unread counts, and marking notifications as read.

## Base URL
```
/api/notifications
```

## Authentication
All endpoints require JWT authentication via Authorization header:
```
Authorization: Bearer <jwt_token>
```

## Endpoints

### 1. Get Notifications

**Endpoint:** `GET /api/notifications`

**Description:** Retrieves paginated list of notifications for the authenticated user.

**Authorization:** Requires `HOMEOWNER` or `CONSULTANT` role

**Query Parameters:**
- `page` (integer, optional, default: 0): Page number (0-based)
- `size` (integer, optional, default: 20): Number of items per page
- `unreadOnly` (boolean, optional, default: false): If true, returns only unread notifications

**Headers:**
- `Authorization: Bearer <jwt_token>`

**Sample Request:**
```bash
GET /api/notifications?page=0&size=10&unreadOnly=false
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Sample Response (Success - 200 OK):**
```json
{
  "notifications": [
    {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "notificationId": "notif-123",
      "title": "Permintaan Konsultasi Baru",
      "message": "Permintaan konsultasi baru dari Home Owner John Doe untuk properti Jl. Sudirman No. 123.",
      "channel": "PUSH",
      "template": "CONSULTATION_REQUEST",
      "isRead": false,
      "createdAt": "2024-12-23T07:00:00Z",
      "readAt": null
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440001",
      "notificationId": "notif-124",
      "title": "Kontrak Baru Dibuat",
      "message": "Kontrak baru telah dibuat oleh konsultan Jane Smith. ID Kontrak: CTR-001, Tanggal Pembuatan: 2024-12-23, Nilai Kontrak: 5000000, Ringkasan Layanan: Desain rumah 2 lantai.",
      "channel": "EMAIL",
      "template": "CONTRACT_CREATED",
      "isRead": true,
      "createdAt": "2024-12-22T10:30:00Z",
      "readAt": "2024-12-22T11:00:00Z"
    }
  ],
  "currentPage": 0,
  "totalPages": 2,
  "totalElements": 25,
  "pageSize": 10,
  "hasNext": true,
  "hasPrevious": false,
  "unreadCount": 5
}
```

**Sample Response (Error - 500 Internal Server Error):**
```json
{
  "status": 500,
  "code": "INTERNAL_ERROR",
  "message": "An unexpected error occurred while retrieving notifications"
}
```

---

### 2. Get Unread Count

**Endpoint:** `GET /api/notifications/unread-count`

**Description:** Retrieves the count of unread notifications for the authenticated user.

**Authorization:** Requires `HOMEOWNER` or `CONSULTANT` role

**Headers:**
- `Authorization: Bearer <jwt_token>`

**Sample Request:**
```bash
GET /api/notifications/unread-count
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Sample Response (Success - 200 OK):**
```json
{
  "unreadCount": 5
}
```

**Sample Response (Error - 500 Internal Server Error):**
```json
{
  "status": 500,
  "code": "INTERNAL_ERROR",
  "message": "An unexpected error occurred while retrieving unread count"
}
```

---

### 3. Mark Notifications as Read

**Endpoint:** `PATCH /api/notifications/mark-read`

**Description:** Marks specific notifications as read, or all notifications if no IDs are provided.

**Authorization:** Requires `HOMEOWNER` or `CONSULTANT` role

**Headers:**
- `Authorization: Bearer <jwt_token>`
- `Content-Type: application/json`

**Request Body:**
```json
{
  "notificationIds": ["550e8400-e29b-41d4-a716-446655440000", "550e8400-e29b-41d4-a716-446655440001"]
}
```
- `notificationIds` (array of UUID strings, optional): List of notification IDs to mark as read. If null or empty, marks all notifications as read.

**Sample Request (Mark specific notifications):**
```bash
PATCH /api/notifications/mark-read
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json

{
  "notificationIds": ["550e8400-e29b-41d4-a716-446655440000"]
}
```

**Sample Request (Mark all notifications):**
```bash
PATCH /api/notifications/mark-read
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json

{
  "notificationIds": []
}
```

**Sample Response (Success - 200 OK):**
```json
{
  "updatedCount": 1
}
```

**Sample Response (Error - 500 Internal Server Error):**
```json
{
  "status": 500,
  "code": "INTERNAL_ERROR",
  "message": "An unexpected error occurred while marking notifications as read"
}
```

## Data Models

### NotificationInboxResponse
```json
{
  "id": "UUID",
  "notificationId": "string",
  "title": "string",
  "message": "string",
  "channel": "EMAIL | PUSH | SMS | ALL",
  "template": "CONSULTATION_REQUEST | CONSULTATION_ACCEPTED | CONTRACT_CREATED | ...",
  "isRead": "boolean",
  "createdAt": "ISO 8601 timestamp",
  "readAt": "ISO 8601 timestamp | null"
}
```

### NotificationInboxPageResponse
```json
{
  "notifications": "Array<NotificationInboxResponse>",
  "currentPage": "integer",
  "totalPages": "integer",
  "totalElements": "long",
  "pageSize": "integer",
  "hasNext": "boolean",
  "hasPrevious": "boolean",
  "unreadCount": "long"
}
```

### MarkAsReadRequest
```json
{
  "notificationIds": "Array<UUID> | null"
}
```

## Notification Templates
The API uses predefined notification templates. See `NotificationTemplate` enum for all available templates and their placeholders.

## Error Handling
All endpoints return standardized error responses with HTTP status codes and error details in the response body.