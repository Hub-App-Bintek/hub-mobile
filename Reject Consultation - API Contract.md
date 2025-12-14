### API Contract: Reject Consultation

**HTTP Method:** POST

**Endpoint URL:** `/api/consultations/{id}/reject`

**Authorization:** Required (Bearer token in Authorization header). User must have 'CONSULTANT' role.

**Request Body:** None

**Success Response (200 OK):**
```json
{
  "consultationId": "uuid",
  "homeOwnerId": "long",
  "homeOwnerName": "string",
  "consultantId": "long",
  "consultantName": "string",
  "designId": "uuid (nullable)",
  "designName": "string (nullable)",
  "consultationType": "enum",
  "channel": "enum",
  "status": "enum",
  "startedAt": "instant (nullable)",
  "completedAt": "instant (nullable)",
  "cancellationReason": "string (nullable)",
  "createdAt": "instant",
  "updatedAt": "instant",
  "projectId": "uuid"
}
```

**Error Responses:**
- **Domain-specific errors (e.g., 400 Bad Request, 404 Not Found, 403 Forbidden):** 
  ```json
  {
    "status": "http_status_code",
    "code": "error_code",
    "message": "error_message"
  }
  ```
- **Internal Server Error (500):**
  ```json
  {
    "status": 500,
    "code": "INTERNAL_ERROR",
    "message": "An unexpected error occurred while rejecting the consultation"
  }
  ```