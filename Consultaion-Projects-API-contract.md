# Consultation Projects API Contract

## Overview
The Consultation Projects API provides endpoints for retrieving project lists with consultation statistics and detailed project information. This API is designed for frontend integration and provides project information along with consultation status counts and detailed project data.

## Authentication
All endpoints require JWT authentication with `Authorization: Bearer <token>` header and user must have `HOME_OWNER` or `CONSULTANT` role.

## Endpoints

### Get Projects with Statistics
**GET** `/api/consultations/projects`

Retrieves a list of projects associated with consultations for the authenticated user, along with consultation status statistics.

#### Query Parameters
- `status` (optional): Filter projects by consultation status
  - `SEDANG_BERJALAN`: Projects with ongoing consultations
  - `MENUNGGU_KONFIRMASI`: Projects waiting for consultant confirmation
  - `SELESAI`: Completed projects


#### Response (200 OK)
```json
{
  "projects": [
    {
      "projectId": "123e4567-e89b-12d3-a456-426614174000",
      "projectName": "Rumah Minimalis Jakarta",
      "city": "Jakarta Selatan",
      "projectStatus": "ACTIVE",
      "state": "IN_PROGRESS",
      "stateDescription": "Konsultasi sedang berlangsung",
      "consultationInfo": {
        "consultationId": "456e7890-e89b-12d3-a456-426614174001",
        "homeOwnerId": 1,
        "homeOwnerName": "John Doe",
        "consultantId": 2,
        "consultantName": "Jane Consultant",
        "consultationStatus": "AKTIF",
        "consultationType": "ONLINE",
        "channel": "CHAT",
        "startedAt": "2024-01-15T10:00:00Z",
        "completedAt": null,
        "createdAt": "2024-01-10T09:00:00Z",
        "updatedAt": "2024-01-15T10:00:00Z"
      }
    }
  ],
  "inProgressCount": 3,
  "pendingCount": 1,
  "doneCount": 5
}
```

### Get Project Detail V2
**GET** `/api/projects/{id}/v2`

Retrieves detailed information for a specific project including consultation details.

#### Path Parameters
- `id` (required): Project UUID identifier

#### Request Headers
- `Authorization` (required): Bearer token for authentication


#### Response (200 OK)
```json
{
  "projectId": "123e4567-e89b-12d3-a456-426614174000",
  "projectName": "Rumah Minimalis Jakarta",
  "projectType": "RESIDENTIAL",
  "projectStatus": "ACTIVE",
  "projectState": "IN_PROGRESS",
  "projectStateDescription": "Konsultasi sedang berlangsung",
  "projectLocation": {
    "longitude": 106.816666,
    "latitude": -6.2,
    "provinceId": "31",
    "provinceName": "DKI Jakarta",
    "regencyId": "3171",
    "regencyName": "Jakarta Selatan",
    "districtId": "3171010",
    "districtName": "Kebayoran Baru",
    "villageId": "3171010001",
    "villageName": "Kebayoran Baru",
    "locationDetail": "Jl. Sudirman No. 1"
  },
  "landArea": 200.5,
  "createdAt": "2024-01-10T09:00:00Z",
  "updatedAt": "2024-01-15T10:00:00Z",
  "consultationInfo": {
    "homeOwnerId": 1,
    "homeOwnerName": "John Doe",
    "consultantId": 2,
    "consultantName": "Jane Consultant",
    "consultationId": "456e7890-e89b-12d3-a456-426614174001",
    "consultationStatus": "AKTIF",
    "consultationType": "ONLINE",
    "channel": "CHAT",
    "startedAt": "2024-01-15T10:00:00Z",
    "completedAt": null,
    "createdAt": "2024-01-10T09:00:00Z",
    "updatedAt": "2024-01-15T10:00:00Z"
  }
}
```

## Error Responses

#### 400 Bad Request - Invalid Status Parameter
```json
{
  "errorCode": "BAD_REQUEST",
  "message": "Invalid status value. Allowed values: SEDANG_BERJALAN, MENUNGGU_KONFIRMASI, SELESAI"
}
```

#### 401 Unauthorized - Invalid/Missing Token
```json
{
  "errorCode": "UNAUTHORIZED",
  "message": "Authentication required"
}
```

#### 403 Forbidden - Insufficient Permissions
```json
{
  "errorCode": "FORBIDDEN",
  "message": "Access denied"
}
```

#### 404 Not Found - Project Not Found
```json
{
  "errorCode": "PROJECT_NOT_FOUND",
  "message": "Project with the specified ID was not found"
}
```

#### 403 Forbidden - Access Denied
```json
{
  "errorCode": "ACCESS_DENIED",
  "message": "You do not have permission to access this project"
}
```

#### 500 Internal Server Error
```json
{
  "errorCode": "INTERNAL_ERROR",
  "message": "An unexpected error occurred while retrieving projects"
}
```
