### 1. Create Project
POST /api/projects

Creates a new project with the provided details and optional file attachment.

#### Request
Content-Type: multipart/form-data

Body: CreateProjectRequest

Sample Request

```json
{
  "name": "Sample Project",
  "longitude": 106.8456,
  "latitude": -6.2088,
  "locationDetail": "Detailed location in Jakarta",
  "type": "CONSULTATION",
  "landArea": 1000.50,
  "income": 50000.00,
  "provinceId": "31",
  "regencyId": "3171",
  "districtId": "317101",
  "villageId": "3171011001"
}
```

#### Responses
201 Created - Success

```json
{
  "projectId": "550e8400-e29b-41d4-a716-446655440000",
  "name": "Sample Project",
  "type": "CONSULTATION",
  "createdAt": "2023-12-05T13:28:36.490"
}
```

400 Bad Request - Invalid Data

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 400,
  "error": "Bad Request",
  "message": "Validation error message",
  "path": "/api/projects"
}
```

401 Unauthorized - Not Authenticated

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 401,
  "error": "Unauthorized",
  "message": "Authentication required",
  "path": "/api/projects"
}
```

500 Internal Server Error

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 500,
  "error": "Internal Server Error",
  "message": "An unexpected error occurred",
  "path": "/api/projects"
}
```


### 2. Create Consultation
POST /api/consultations

Creates a new consultation request with the provided details.

#### Request
Content-Type: application/json

Authorization: Bearer {token}

Body: CreateConsultationRequest

Sample Request

```json
{
  "consultantId": 123,
  "consultationType": "BERBAYAR",
  "channel": "CHAT",
  "projectId": "550e8400-e29b-41d4-a716-446655440000"
}
```

#### Responses
201 Created - Success

```json
{
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "homeOwnerId": 456,
  "homeOwnerName": "John Doe",
  "consultantId": 123,
  "consultantName": "Jane Smith",
  "designId": null,
  "designName": null,
  "consultationType": "BERBAYAR",
  "channel": "CHAT",
  "status": "MENUNGGU_KONFIRMASI_KONSULTAN",
  "startedAt": null,
  "completedAt": null,
  "createdAt": "2023-12-05T13:28:36.490Z",
  "updatedAt": "2023-12-05T13:28:36.490Z",
  "projectId": "550e8400-e29b-41d4-a716-446655440000"
}
```

400 Bad Request - Invalid Data

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 400,
  "error": "Bad Request",
  "message": "Validation error message",
  "path": "/api/consultations"
}
```

401 Unauthorized - Not Authenticated

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 401,
  "error": "Unauthorized",
  "message": "Authentication required",
  "path": "/api/consultations"
}
```

500 Internal Server Error

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 500,
  "error": "Internal Server Error",
  "message": "An unexpected error occurred",
  "path": "/api/consultations"
}
```

### 3. Get Consultations
GET /api/consultations/projects

Retrieves a list of projects associated with consultations for the authenticated user (HOME_OWNER or CONSULTANT), optionally filtered by consultation status.

#### Request
Authorization: Bearer {token}

Query Parameters:
- status (optional): Filter by consultation status. Allowed values: SEDANG_BERJALAN, MENUNGGU_KONFIRMASI, SELESAI

Sample Request

```
GET /api/consultations/projects?status=SEDANG_BERJALAN
```

#### Responses
200 OK - Success

```json
[
  {
    "projectId": "550e8400-e29b-41d4-a716-446655440000",
    "projectName": "Rumah Minimalis",
    "homeOwnerId": 456,
    "homeOwnerName": "John Doe",
    "consultantId": 123,
    "consultantName": "Jane Smith",
    "city": "Jakarta",
    "status": "SEDANG_BERJALAN",
    "state": "DKI Jakarta"
  },
  {
    "projectId": "550e8400-e29b-41d4-a716-446655440001",
    "projectName": "Villa Mewah",
    "homeOwnerId": 789,
    "homeOwnerName": "Alice Johnson",
    "consultantId": 123,
    "consultantName": "Jane Smith",
    "city": "Bandung",
    "status": "MENUNGGU_KONFIRMASI",
    "state": "Jawa Barat"
  }
]
```

400 Bad Request - Invalid Status Parameter

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 400,
  "error": "Bad Request",
  "message": "Invalid status value. Allowed values: SEDANG_BERJALAN, MENUNGGU_KONFIRMASI, SELESAI",
  "path": "/api/consultations/projects"
}
```

401 Unauthorized - Not Authenticated

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 401,
  "error": "Unauthorized",
  "message": "Authentication required",
  "path": "/api/consultations/projects"
}
```

500 Internal Server Error

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 500,
  "error": "Internal Server Error",
  "message": "An unexpected error occurred",
  "path": "/api/consultations/projects"
}
```

### 4. Accept Consultation
POST /api/consultations/{id}/accept

Allows a consultant to accept a consultation request. The consultant must specify if a survey is needed, and if so, provide survey date, time, and optional notes.

#### Request
Authorization: Bearer {token}

Path Parameters:
- id (required): UUID of the consultation to accept

Request Body:

```json
{
  "needsSurvey": true,
  "surveyDate": "2023-12-15",
  "surveyTime": "14:00",
  "notes": "Optional notes about the survey"
}
```

Field Descriptions:
- needsSurvey (boolean, required): Indicates whether a survey is required for this consultation
- surveyDate (string, optional): Date of the survey in YYYY-MM-DD format (required if needsSurvey is true)
- surveyTime (string, optional): Time of the survey in HH:MM format (required if needsSurvey is true)
- notes (string, optional): Additional notes about the consultation acceptance

Sample Request

```
POST /api/consultations/550e8400-e29b-41d4-a716-446655440000/accept
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json

{
  "needsSurvey": true,
  "surveyDate": "2023-12-15",
  "surveyTime": "14:00",
  "notes": "Survey scheduled for initial assessment"
}
```

#### Responses
200 OK - Success

```json
{
  "consultationId": "550e8400-e29b-41d4-a716-446655440000",
  "homeOwnerId": 456,
  "homeOwnerName": "John Doe",
  "consultantId": 123,
  "consultantName": "Jane Smith",
  "designId": null,
  "designName": null,
  "consultationType": "DESIGN",
  "channel": "ONLINE",
  "status": "MENUNGGU_JADWAL_SURVEY",
  "startedAt": null,
  "completedAt": null,
  "createdAt": "2023-12-05T13:28:36.490Z",
  "updatedAt": "2023-12-05T13:28:36.490Z",
  "projectId": "550e8400-e29b-41d4-a716-446655440001"
}
```

400 Bad Request - Invalid Request Data

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 400,
  "error": "Bad Request",
  "message": "Survey date and time are required when survey is needed",
  "path": "/api/consultations/550e8400-e29b-41d4-a716-446655440000/accept"
}
```

401 Unauthorized - Not Authenticated

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 401,
  "error": "Unauthorized",
  "message": "Authentication required",
  "path": "/api/consultations/550e8400-e29b-41d4-a716-446655440000/accept"
}
```

403 Forbidden - Insufficient Permissions

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 403,
  "error": "Forbidden",
  "message": "Access denied",
  "path": "/api/consultations/550e8400-e29b-41d4-a716-446655440000/accept"
}
```

500 Internal Server Error

```json
{
  "timestamp": "2023-12-05T13:28:36.490Z",
  "status": 500,
  "error": "Internal Server Error",
  "message": "An unexpected error occurred",
  "path": "/api/consultations/550e8400-e29b-41d4-a716-446655440000/accept"
}
```
#### 5. Get Consultation Detail
**GET** `/api/consultations/{id}`

Get detailed information about a consultation.

**Parameters:**
- `id` (path): Consultation UUID

**Request Example:**
```bash
curl -X GET "http://localhost:8080/api/consultations/123e4567-e89b-12d3-a456-426614174000" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

**Response (200 OK):**
```json
{
  "consultationId": "123e4567-e89b-12d3-a456-426614174000",
  "homeOwnerId": 1,
  "homeOwnerName": "John Doe",
  "consultantId": 2,
  "consultantName": "Jane Consultant",
  "designId": "456e7890-e89b-12d3-a456-426614174001",
  "designName": "Modern House Design",
  "consultationType": "BERBAYAR",
  "channel": "CHAT",
  "status": "AKTIF",
  "startedAt": "2024-01-15T10:00:00Z",
  "completedAt": null,
  "createdAt": "2024-01-15T09:00:00Z",
  "updatedAt": "2024-01-15T10:00:00Z",
  "projectId": "789e0123-e89b-12d3-a456-426614174002"
}