# Register Device Token API Documentation

## Overview
The device token registration API allows authenticated users to register their device tokens for push notifications and device management. This is typically called after login or when the user wants to enable notifications on a new device.

## Endpoints

### 1. Register Device Token
**Endpoint:** `POST /api/users/device-token`

**Description:** Registers or updates a device token for the authenticated user.

**Headers:**
```
Authorization: Bearer <jwt_token>
Content-Type: application/json
```

**Request Body:**
```json
{
  "deviceToken": "fcm_or_apns_token_here",
  "deviceType": "ANDROID",
  "deviceModel": "Samsung Galaxy S21",
  "appVersion": "1.2.3"
}
```

**Response (Success - 200 OK):**
```json
{
  "message": "Device token registered successfully"
}
```

**Response (Error - 401/404/500):**
```json
{
  "code": "ERROR_CODE",
  "message": "Error message",
  "timestamp": "2025-12-24T13:24:22.000Z"
}
```

**Field Descriptions:**
- `deviceToken`: The FCM (Android) or APNS (iOS) token for push notifications
- `deviceType`: Enum values: `ANDROID`, `IOS`, `WEB`, `DESKTOP`
- `deviceModel`: Device model name (e.g., "iPhone 12", "Pixel 5")
- `appVersion`: Application version (e.g., "1.0.0")

### 2. Deactivate Device Token
**Endpoint:** `DELETE /api/users/device-token?deviceToken=<token>`

**Description:** Deactivates a specific device token for the authenticated user.

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Query Parameters:**
- `deviceToken`: The device token to deactivate

**Response (Success - 200 OK):**
```json
{
  "message": "Device token deactivated successfully"
}
```

**Response (Error - 400/401/500):**
```json
{
  "message": "Device token not found or already inactive"
}
```

## Authentication
Both endpoints require a valid JWT token in the Authorization header:
```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

## Error Codes
- `UNAUTHORIZED` (401): Invalid or missing JWT token
- `USER_NOT_FOUND` (404): User associated with the token does not exist
- `INTERNAL_ERROR` (500): Server error during device registration/deactivation

## Usage Notes
- Device tokens are automatically registered during login if provided in the login request
- This endpoint allows manual registration/update of device tokens
- Each user can have multiple active device tokens
- Deactivation marks the token as inactive but doesn't delete it from the database
- Device tokens are used for push notifications and device-specific features