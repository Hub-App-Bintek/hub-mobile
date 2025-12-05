# API Contract: approveContract

## Endpoint Details

### HTTP Method
`POST`

### Endpoint URL Path
`/api/contracts/{contractId}/approve`

### Description
Approves a contract by the homeowner. This endpoint allows the homeowner to approve a specific version of the contract document, optionally providing revision notes. The contract must be in `REQUEST_FOR_APPROVAL` status, and the approved document version must be the latest available version.

## Request Details

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `contractId` | `UUID` | Yes | The unique identifier of the contract to approve |

### Query Parameters
None

### Headers
| Header | Type | Required | Description |
|--------|------|----------|-------------|
| `Authorization` | `String` | Yes | Bearer token for authentication. Must contain a valid JWT token with homeowner role. |

### Request Body Schema
```json
{
  "approvedDocumentVersionId": "uuid",
  "revisionNotes": "string"
}
```

#### Field Descriptions
- `approvedDocumentVersionId` (UUID, required): The ID of the document version being approved. Must exist in the `DocumentVersion` table and belong to the same consultation as the contract.
- `revisionNotes` (String, optional): Optional notes from the homeowner regarding the approval or any final revisions.

#### Example Request Body
```json
{
  "approvedDocumentVersionId": "550e8400-e29b-41d4-a716-446655440000",
  "revisionNotes": "Approved with minor formatting adjustments"
}
```

## Response Details

### Success Response (200 OK)
```json
{
  "id": "uuid",
  "consultationId": "uuid",
  "fileId": "uuid",
  "approvedDocumentVersionId": "uuid",
  "approvedVersion": "string",
  "approvedRevisionNotes": "string",
  "digitalSignature": false,
  "status": "APPROVED",
  "createdAt": "2023-12-09T13:17:29.321Z",
  "updatedAt": "2023-12-09T13:17:29.321Z"
}
```

#### Field Descriptions
- `id` (UUID): Contract ID
- `consultationId` (UUID): Associated consultation ID
- `fileId` (UUID): File ID of the contract document
- `approvedDocumentVersionId` (UUID): ID of the approved document version
- `approvedVersion` (String): Version string of the approved document (e.g., "1.2")
- `approvedRevisionNotes` (String): Revision notes provided during approval
- `digitalSignature` (Boolean): Whether the contract has been digitally signed
- `status` (ContractStatus): Current contract status (APPROVED after successful approval)
- `createdAt` (Instant): Contract creation timestamp in UTC
- `updatedAt` (Instant): Contract last update timestamp in UTC

### Error Responses

#### 400 Bad Request
```json
{
  "timestamp": "2023-12-09T13:17:29.321Z",
  "status": 400,
  "error": "BAD_REQUEST",
  "message": "Invalid request format",
  "path": "/api/contracts/550e8400-e29b-41d4-a716-446655440000/approve"
}
```

#### 401 Unauthorized
```json
{
  "timestamp": "2023-12-09T13:17:29.321Z",
  "status": 401,
  "error": "UNAUTHORIZED",
  "message": "Invalid authorization header",
  "path": "/api/contracts/550e8400-e29b-41d4-a716-446655440000/approve"
}
```

#### 403 Forbidden
```json
{
  "timestamp": "2023-12-09T13:17:29.321Z",
  "status": 403,
  "error": "FORBIDDEN",
  "message": "Access denied",
  "path": "/api/contracts/550e8400-e29b-41d4-a716-446655440000/approve"
}
```

#### 404 Not Found
```json
{
  "timestamp": "2023-12-09T13:17:29.321Z",
  "status": 404,
  "error": "NOT_FOUND",
  "message": "Contract not found",
  "path": "/api/contracts/550e8400-e29b-41d4-a716-446655440000/approve"
}
```

#### 500 Internal Server Error
```json
{
  "timestamp": "2023-12-09T13:17:29.321Z",
  "status": 500,
  "error": "INTERNAL_ERROR",
  "message": "Unexpected error occurred",
  "path": "/api/contracts/550e8400-e29b-41d4-a716-446655440000/approve"
}
```

## Authentication/Authorization Requirements
- **Authentication**: JWT Bearer token required in Authorization header
- **Authorization**: User must have `HOMEOWNER` role
- **Access Control**: User must be the homeowner associated with the consultation that owns the contract

## Error Handling and Edge Cases
- **Contract not found**: Returns 404 if contractId doesn't exist
- **Access denied**: Returns 403 if user is not the homeowner of the consultation
- **Invalid contract status**: Returns business error if contract status is not `REQUEST_FOR_APPROVAL`
- **Document version not found**: Returns business error if `approvedDocumentVersionId` doesn't exist
- **Document version ownership**: Returns business error if document version doesn't belong to the contract's consultation
- **Outdated version approval**: Returns business error if trying to approve a version older than the latest available
- **Notification failure**: Logged as warning but doesn't fail the approval process
- **Event publishing failure**: Logged as error but doesn't fail the approval process
- **Database transaction rollback**: All changes are rolled back if any step fails during the approval process