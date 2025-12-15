# POST /api/projects

## Deskripsi
Endpoint ini digunakan untuk membuat proyek baru.

## Request
- **Method:** POST
- **Path:** `/api/projects`
- **Headers:**
  - `Content-Type: application/json`
  - `Authorization: Bearer <token>` (jika diperlukan)

- **Body:**
  ```json
  {
    "name": "string (max 100 characters)",
    "longitude": "number (between -180 and 180)",
    "latitude": "number (between -90 and 90)",
    "locationDetail": "string (max 255 characters)",
    "type": "string (PROTOTYPE or NON_PROTOTYPE)",
    "landArea": "number (must be greater than 0)",
    "buildingArea": "number (must be greater than 0, optional)",
    "income": "number (must be greater than 0)",
    "provinceId": "string (required)",
    "regencyId": "string (required)",
    "districtId": "string (required)",
    "villageId": "string (required)"
  }

Response
Status Code: 201 Created
Body:
{
  "id": "number",
  "projectId": "string (UUID)",
  "name": "string",
  "longitude": "number",
  "latitude": "number",
  "locationDetail": "string",
  "provinceId": "string",
  "regencyId": "string",
  "districtId": "string",
  "villageId": "string",
  "type": "string",
  "landArea": "number",
  "buildingArea": "number",
  "income": "number",
  "fileUrl": "string (optional)",
  "status": "string",
  "state": "string",
  "stateDescription": "string (optional)",
  "user": "object (user details)",
  "createdAt": "string (ISO 8601)",
  "updatedAt": "string (ISO 8601)"
}

Error Responses
Status Code: 400 Bad Request

Body:
{
  "error": "string",
  "message": "string"
}
Penyebab: Data request tidak valid atau tidak lengkap.
Status Code: 401 Unauthorized

Body:
{
  "error": "string",
  "message": "string"
}
Penyebab: Token autentikasi tidak valid atau tidak disediakan.
Status Code: 500 Internal Server Error

Body:
{
  "error": "string",
  "message": "string"
}
Penyebab: Kesalahan server internal.
