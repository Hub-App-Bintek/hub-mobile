### 3. Approve Design Document

Approve a design document (Home Owner action). The home owner can optionally specify the approved version and add revision notes.

**Endpoint:** `POST /api/design-documents/{id}/approve`

**Authorization:** Home Owner role required

**Path Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| id | UUID | Yes | The design document ID |

**Request Body Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| approvedVersion | String | No | The version number of the design documents being approved. If provided, the system validates that this version exists and contains all required document types (DED, RAB, BOQ) |
| revisionNotes | String | No | Optional notes from the home owner regarding the approval or any revision comments |

**Request Body:**
```json
{
  "approvedVersion": "1",
  "revisionNotes": "Approved with minor revisions"
}
```

**Headers:**
```
Authorization: Bearer <jwt_token>
```

**Sample Request:**
```bash
curl -X POST "http://localhost:8080/api/design-documents/550e8400-e29b-41d4-a716-446655440001/approve" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." \
  -H "Content-Type: application/json" \
  -d '{
    "approvedVersion": "1",
    "revisionNotes": "Approved with minor revisions"
  }'
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
  "approvedVersion": "1",
  "approvedRevisionNotes": "Approved with minor revisions",
  "status": "APPROVED",
  "createdAt": "2025-11-06T07:17:05.922Z",
  "updatedAt": "2025-11-06T07:20:05.922Z"
}
```