# Design Document API Documentation

## Overview

The Design Document API provides endpoints for managing design documents in the consultation workflow. This includes uploading design documents, approving documents, and managing revision requests between consultants and homeowners.

## Authentication

All endpoints require JWT authentication via the `Authorization` header:
```
Authorization: Bearer <jwt_token>
```

## Base URL

```
/api/design-documents
```

## Endpoints

### 1. Upload Design Document

Upload design document files (DED, RAB, BOQ) for a consultation.

**Endpoint:** `POST /api/design-documents/upload`

**Authorization:** Consultant role required

**Content-Type:** `multipart/form-data`

**Request Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| consultationId | String (UUID) | Yes | The consultation ID |
| fileDed | File | No | Design Estimate Document file |
| fileRab | File | No | Budget Plan Document file |
| fileBoq | File | No | Bill of Quantities Document file |

**Headers:**
```
Authorization: Bearer <jwt_token>
Content-Type: multipart/form-data
```

**Sample Request:**
```bash
curl -X POST "http://localhost:8080/api/design-documents/upload" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." \
  -F "consultationId=550e8400-e29b-41d4-a716-446655440000" \
  -F "fileDed=@design_estimate.pdf" \
  -F "fileRab=@budget_plan.pdf" \
  -F "fileBoq=@bill_of_quantities.pdf"
```

**Success Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440001",
  "consultationId": "550e8400-e29b-41d4-a716-446655440000",
  "consultantId": 123,
  "fileDedName": "design_estimate.pdf",
  "fileDedUrl": "https://storage.example.com/files/design_estimate.pdf",
  "fileRabName": "budget_plan.pdf",
  "fileRabUrl": "https://storage.example.com/files/budget_plan.pdf",
  "fileBoqName": "bill_of_quantities.pdf",
  "fileBoqUrl": "https://storage.example.com/files/bill_of_quantities.pdf",
  "version": 1,
  "status": "SUBMITTED",
  "createdAt": "2025-11-06T07:17:05.922Z",
  "updatedAt": "2025-11-06T07:17:05.922Z"
}
```

**Error Responses:**

**400 Bad Request:**
```json
{
  "code": "VALIDATION_ERROR",
  "message": "Consultation ID is required"
}
```

**403 Forbidden:**
```json
{
  "code": "ACCESS_DENIED",
  "message": "User does not have CONSULTANT role"
}
```

**500 Internal Server Error:**
```json
{
  "code": "INTERNAL_ERROR",
  "message": "File upload failed"
}
```

---

### 2. Approve Design Document

Approve a design document (Home Owner action).

**Endpoint:** `POST /api/design-documents/{id}/approve`

**Authorization:** Home Owner role required

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | UUID | Yes | The design document ID |

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Sample Request:**
```bash
curl -X POST "http://localhost:8080/api/design-documents/550e8400-e29b-41d4-a716-446655440001/approve" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

**Success Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440001",
  "consultationId": "550e8400-e29b-41d4-a716-446655440000",
  "consultantId": 123,
  "fileDedName": "design_estimate.pdf",
  "fileDedUrl": "https://storage.example.com/files/design_estimate.pdf",
  "fileRabName": "budget_plan.pdf",
  "fileRabUrl": "https://storage.example.com/files/budget_plan.pdf",
  "fileBoqName": "bill_of_quantities.pdf",
  "fileBoqUrl": "https://storage.example.com/files/bill_of_quantities.pdf",
  "version": 1,
  "status": "APPROVED",
  "createdAt": "2025-11-06T07:17:05.922Z",
  "updatedAt": "2025-11-06T07:20:05.922Z"
}
```

---

### 3. Create Revision Request

Create a revision request for a design document (Home Owner action).

**Endpoint:** `POST /api/design-documents/{id}/revision-request`

**Authorization:** Home Owner role required

**Path Parameters:**

| Parameter | Type | Required | Description         |
|-----------|------|----------|---------------------|
| id | UUID | Yes | The consultation ID |

**Request Body:**
```json
{
  "designDocumentId": "550e8400-e29b-41d4-a716-446655440001",
  "notes": "Please revise the budget estimates"
}
```

**Headers:**
```
Authorization: Bearer <jwt_token>
Content-Type: application/json
```

**Sample Request:**
```bash
curl -X POST "http://localhost:8080/api/design-documents/550e8400-e29b-41d4-a716-446655440001/revision-request" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." \
  -H "Content-Type: application/json" \
  -d '{
    "designDocumentId": "550e8400-e29b-41d4-a716-446655440001",
    "notes": "Please revise the budget estimates"
  }'
```

**Success Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440002",
  "designDocumentId": "550e8400-e29b-41d4-a716-446655440001",
  "homeOwnerId": 456,
  "notes": "Please revise the budget estimates",
  "status": "PENDING",
  "remainingRequests": 2,
  "createdAt": "2025-11-06T07:25:05.922Z",
  "updatedAt": "2025-11-06T07:25:05.922Z"
}
```

**Error Responses:**

**400 Bad Request:**
```json
{
  "code": "BAD_REQUEST",
  "message": "Maximum revision requests (3) exceeded for this consultation"
}
```

**403 Forbidden:**
```json
{
  "code": "ACCESS_DENIED",
  "message": "User does not have HOME_OWNER role"
}
```

---

### 4. Get Design Document Versions

Retrieve all versions of design documents for a specific consultation.

**Endpoint:** `GET /api/design-documents/versions`

**Authorization:** Home Owner or Consultant role required

**Query Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| consultationId | UUID | Yes | The consultation ID |
| documentType | String | No | Filter by document type (DED, RAB, BOQ). If not provided, returns all types |

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Sample Request:**
```bash
curl -X GET "http://localhost:8080/api/design-documents/versions?consultationId=550e8400-e29b-41d4-a716-446655440000&documentType=DED" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

**Success Response (200 OK):**
```json
[
  {
    "version": "1",
    "versionName": "Version 1",
    "latestUploadedAt": "2025-11-06T07:17:05.922",
    "canDownload": true,
    "documents": [
      {
        "id": "550e8400-e29b-41d4-a716-446655440003",
        "consultationId": "550e8400-e29b-41d4-a716-446655440000",
        "documentType": "DED",
        "version": "1",
        "fileUrl": "https://storage.example.com/files/ded_v1.pdf",
        "fileId": "550e8400-e29b-41d4-a716-446655440004",
        "uploadedBy": "CONSULTANT",
        "status": "UPLOADED",
        "notes": "Initial DED upload for version 1",
        "uploadedAt": "2025-11-06T07:17:05.922",
        "createdAt": "2025-11-06T07:17:05.922",
        "updatedAt": "2025-11-06T07:17:05.922"
      },
      {
        "id": "550e8400-e29b-41d4-a716-446655440007",
        "consultationId": "550e8400-e29b-41d4-a716-446655440000",
        "documentType": "RAB",
        "version": "1",
        "fileUrl": "https://storage.example.com/files/rab_v1.pdf",
        "fileId": "550e8400-e29b-41d4-a716-446655440008",
        "uploadedBy": "CONSULTANT",
        "status": "UPLOADED",
        "notes": "Initial RAB upload for version 1",
        "uploadedAt": "2025-11-06T07:17:05.922",
        "createdAt": "2025-11-06T07:17:05.922",
        "updatedAt": "2025-11-06T07:17:05.922"
      }
    ]
  },
  {
    "version": "2",
    "versionName": "Version 2",
    "latestUploadedAt": "2025-11-07T09:25:15.123",
    "canDownload": true,
    "documents": [
      {
        "id": "550e8400-e29b-41d4-a716-446655440005",
        "consultationId": "550e8400-e29b-41d4-a716-446655440000",
        "documentType": "DED",
        "version": "2",
        "fileUrl": "https://storage.example.com/files/ded_v2.pdf",
        "fileId": "550e8400-e29b-41d4-a716-446655440006",
        "uploadedBy": "CONSULTANT",
        "status": "UPLOADED",
        "notes": "Revised DED upload for version 2",
        "uploadedAt": "2025-11-07T09:25:15.123",
        "createdAt": "2025-11-07T09:25:15.123",
        "updatedAt": "2025-11-07T09:25:15.123"
      }
    ]
  }
]
```


### 5. Download Design Documents for Version

Download all design documents for a specific version as a ZIP file.

**Endpoint:** `GET /api/design-documents/versions/{version}/download`

**Authorization:** Home Owner or Consultant role required

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| version | String | Yes | The version number to download |

**Query Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| consultationId | UUID | Yes | The consultation ID |

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Sample Request:**
```bash
curl -X GET "http://localhost:8080/api/design-documents/versions/1/download?consultationId=550e8400-e29b-41d4-a716-446655440000" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." \
  --output design-documents-v1.zip
```

**Success Response (200 OK):**
Returns a ZIP file containing all design documents for the specified version.

**Response Headers:**
```
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="design-documents-v{version}.zip"
Content-Length: {file_size}
```

**Error Responses:**

**400 Bad Request:**
```json
{
  "code": "VALIDATION_ERROR",
  "message": "Version parameter is required"
}
```

**403 Forbidden:**
```json
{
  "code": "ACCESS_DENIED",
  "message": "User does not have required role"
}
```

**404 Not Found:**
```json
{
  "code": "NOT_FOUND",
  "message": "Version not found for this consultation"
}
```

## Data Types

### DesignDocumentStatus Enum
- `DRAFT` - Document is in draft state
- `SUBMITTED` - Document has been submitted for review
- `REVISION_REQUESTED` - Revision has been requested
- `APPROVED` - Document has been approved


## Common Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| VALIDATION_ERROR | 400 | Invalid request data |
| ACCESS_DENIED | 403 | Insufficient permissions |
| NOT_FOUND | 404 | Resource not found |
| INTERNAL_ERROR | 500 | Internal server error |
