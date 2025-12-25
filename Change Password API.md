### POST /api/auth/change-password

#### Overview
- **Method**: POST
- **Path**: /api/auth/change-password
- **Content-Type**: application/json
- **Authentication**: Required (JWT Bearer token in Authorization header)
- **Description**: Allows an authenticated user to change their password. Requires the current password for verification and confirmation of the new password.

#### Request Headers
- `Authorization`: `Bearer <jwt_token>` (required)

#### Request Body
```json
{
  "currentPassword": "string (required)",
  "newPassword": "string (required, min 8 chars, must contain special character)",
  "confirmNewPassword": "string (required)"
}
```

#### Success Response
- **HTTP Status**: 200 OK
- **Response Body**:
```json
{
  "message": "Password changed successfully"
}
```

#### Error Scenarios

| HTTP Status | Error Code | Message | When it occurs |
|-------------|------------|---------|---------------|
| 400 | PASSWORD_MISMATCH | Password and confirmation password do not match | When `newPassword` and `confirmNewPassword` do not match |
| 400 | AUTH_INVALID_CREDENTIALS | Invalid credentials | When the provided `currentPassword` does not match the user's current password |
| 404 | USER_NOT_FOUND | User not found | When the authenticated user does not exist in the system |
| 401 | UNAUTHORIZED | Unauthorized | When no valid JWT token is provided or token is expired |
| 500 | INTERNAL_ERROR | An internal error has occurred | When an unexpected server error occurs during password change |

#### Validation Rules
- `currentPassword`: Must match the user's current password
- `newPassword`:
  - Minimum 8 characters
  - Must contain at least one special character (!@#$%^&*())
- `confirmNewPassword`: Must exactly match `newPassword`

#### Example Request
```bash
POST /api/auth/change-password
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json

{
  "currentPassword": "oldPassword123!",
  "newPassword": "newSecurePass123!",
  "confirmNewPassword": "newSecurePass123!"
}
```

#### Example Success Response
```json
{
  "message": "Password changed successfully"
}
```

#### Example Error Response
```json
{
  "errorCode": "AUTH_INVALID_CREDENTIALS",
  "message": "Invalid credentials",
  "data": null
}
```