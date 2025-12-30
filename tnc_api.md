# Terms and Conditions API

## Overview
The Terms and Conditions API provides public access to the application's terms of service and privacy policy documents. These endpoints serve HTML content directly without requiring authentication.

## Authentication
No authentication required - these endpoints are publicly accessible.

## Endpoints

### 1. Get Terms Document
**GET** `/api/terms/{type}`

Retrieve terms and conditions or privacy policy document based on the type parameter.

**Parameters:**
- `type` (path, required): Document type
  - `syarat_dan_ketentuan` - Terms and Conditions
  - `kebijakan_privasi` - Privacy Policy

**Request Example (Terms and Conditions):**
```bash
curl -X GET "http://localhost:8080/api/terms/syarat_dan_ketentuan"
```

**Request Example (Privacy Policy):**
```bash
curl -X GET "http://localhost:8080/api/terms/kebijakan_privasi"
```

**Response (200 OK):**
```html
<!DOCTYPE html>
<html>
<head>
    <title>Syarat dan Ketentuan</title>
</head>
<body>
    <!-- HTML content of the terms document -->
</body>
</html>
```

**Content-Type:** `text/html`

## Error Responses

**400 Bad Request:**
```json
"Invalid type parameter"
```

**404 Not Found:**
```json
// No response body - standard HTTP 404
```