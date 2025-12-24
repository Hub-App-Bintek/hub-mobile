# Forgot Password API Documentation

## Overview
The forgot password flow consists of three endpoints that allow users to reset their passwords securely. Users must be fully registered (VERIFIED status, ACTIVE activity status, and COMPLETED registration status for homeowners) to initiate password reset.

## Endpoints

### 1. Initiate Forgot Password
**Endpoint:** `POST /api/auth/forgot-password`

**Description:** Sends an OTP to the user's email to initiate the password reset process.

**Request Body:**
```json
{
  "email": "user@example.com"
}
```

**Response (Success - 200 OK):**
```json
"Password reset OTP sent successfully"
```

**Response (Error - 400/403/404/500):**
```json
{
  "code": "ERROR_CODE",
  "message": "Error message",
  "timestamp": "2025-12-24T10:46:13.000Z"
}
```

**Validation Rules:**
- Email is required and must be valid format
- User must exist
- User must have `VerificationStatus.VERIFIED`
- User must have `UserActivityStatus.ACTIVE`
- For homeowners: must have `RegistrationStatus.COMPLETED`

### 2. Verify Forgot Password OTP
**Endpoint:** `POST /api/auth/verify-forgot-password-otp`

**Description:** Verifies the OTP code and returns a reset token for password reset.

**Request Body:**
```json
{
  "email": "user@example.com",
  "otpCode": "123456"
}
```

**Response (Success - 200 OK):**
```json
{
  "resetToken": "abc123-def456-ghi789",
  "expiresIn": 900000
}
```

**Response (Error - 400/403/404/500):**
```json
{
  "code": "ERROR_CODE",
  "message": "Error message",
  "timestamp": "2025-12-24T10:46:13.000Z"
}
```

**Validation Rules:**
- Email is required and must be valid format
- OTP code is required
- OTP must be valid and not expired
- Reset token expires in 15 minutes (900000 milliseconds)

### 3. Reset Password
**Endpoint:** `POST /api/auth/reset-password`

**Description:** Resets the user's password using the reset token.

**Request Body:**
```json
{
  "resetToken": "abc123-def456-ghi789",
  "newPassword": "NewPassword123!",
  "confirmPassword": "NewPassword123!"
}
```

**Response (Success - 200 OK):**
```json
"Password reset successfully"
```

**Response (Error - 400/403/404/500):**
```json
{
  "code": "ERROR_CODE",
  "message": "Error message",
  "timestamp": "2025-12-24T10:46:13.000Z"
}
```

**Validation Rules:**
- Reset token is required and must be valid/unexpired
- New password must be at least 8 characters and contain at least one special character
- Confirm password must match new password

## Error Codes
- `USER_NOT_FOUND` (404): User with provided email does not exist
- `AUTH_INVALID_STATUS` (403): User is not in eligible status (not VERIFIED or not ACTIVE)
- `AUTH_REGISTRATION_INCOMPLETE` (403): Homeowner registration is not completed
- `AUTH_INVALID_OTP` (400): Invalid or expired OTP
- `AUTH_INVALID_TOKEN` (400): Invalid or expired reset token
- `PASSWORD_MISMATCH` (400): Password confirmation does not match

## Flow Example
1. User calls `/api/auth/forgot-password` with email
2. System validates user eligibility and sends OTP
3. User calls `/api/auth/verify-forgot-password-otp` with email and OTP
4. System validates OTP and returns reset token
5. User calls `/api/auth/reset-password` with reset token and new password
6. System updates password and marks token as used