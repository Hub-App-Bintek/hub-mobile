# API Contract Documentation

## 1. Create Contract Draft

### Endpoint
`POST /api/contracts/consultations/{consultationId}/draft`

### Description
Creates a new contract draft for a specific consultation. This endpoint allows consultants to generate and upload a contract draft with optional file attachment.

### Authentication
- **Type**: Bearer Token
- **Required Role**: CONSULTANT
- **Header**: `Authorization: Bearer <token>`

### Request

#### Content-Type
`multipart/form-data`

#### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `consultationId` | UUID | Yes | The unique identifier of the consultation |

#### Form Data Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `request` | String (JSON) | Yes | JSON string containing contract generation details |
| `file` | MultipartFile | No | Contract document file (optional) |

#### Request JSON Schema (`request` parameter)
```json
{
  "contractValue": "number (BigDecimal)",
  "installments": [
    {
      "value": "number (BigDecimal)",
      "percentage": "boolean",
      "dueDate": "string (LocalDate, ISO format)"
    }
  ],
  "fileUrl": "string"
}
```

**Field Descriptions:**
- `contractValue`: The total value of the contract
- `installments`: Array of payment installments (optional). If null/empty, defaults to single payment after signing
  - `value`: Payment amount (percentage if `percentage=true`, nominal if `percentage=false`)
  - `percentage`: Flag indicating if value is percentage (true) or nominal (false)
  - `dueDate`: Custom due date for the installment
- `fileUrl`: URL to the contract file (optional)

### Response

#### Success Response (201 Created)
```json
{
  "id": "string (UUID)",
  "consultationId": "string (UUID)",
  "fileId": "string (UUID)",
  "digitalSignature": "boolean",
  "status": "string (ContractStatus)",
  "createdAt": "string (ISO 8601 timestamp)",
  "updatedAt": "string (ISO 8601 timestamp)"
}
```

**ContractStatus Values:**
- `REQUEST_FOR_APPROVAL`: Diajukan untuk approval homeowner
- `REVISION_REQUESTED`: Homeowner meminta revisi
- `APPROVED`: Disetujui homeowner
- `HOMEOWNER_SIGNED`: Homeowner sudah tanda tangan, menunggu konsultan
- `CONSULTANT_SIGNED`: Konsultan sudah tanda tangan, menunggu homeowner
- `SIGNED`: Kedua pihak sudah ditandatangani
- `CANCELLED`: Kontrak dibatalkan

#### Error Responses
- **400 Bad Request**: Invalid request format or missing required fields
- **401 Unauthorized**: Invalid or missing authorization header
- **403 Forbidden**: User does not have CONSULTANT role
- **500 Internal Server Error**: Unexpected server error

---

## 2. Upload Revised Contract

### Endpoint
`POST /api/contracts/revised-upload`

### Description
Uploads a revised contract document. This endpoint allows consultants to upload an updated contract version after revisions have been requested.

### Authentication
- **Type**: Bearer Token
- **Required Role**: CONSULTANT
- **Header**: `Authorization: Bearer <token>`

### Request

#### Content-Type
`multipart/form-data`

#### Form Data Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `request` | String (JSON) | Yes | JSON string containing revision details |
| `file` | MultipartFile | No | Revised contract document file (optional) |

#### Request JSON Schema (`request` parameter)
```json
{
  "contractValue": "number (BigDecimal)",
  "installments": [
    {
      "value": "number (BigDecimal)",
      "percentage": "boolean",
      "dueDate": "string (LocalDate, ISO format)"
    }
  ],
  "revisionNotes": "string"
}
```

**Field Descriptions:**
- `contractValue`: New contract value if changed (optional)
- `installments`: Updated installment plan (optional)
  - `value`: Payment amount (percentage if `percentage=true`, nominal if `percentage=false`)
  - `percentage`: Flag indicating if value is percentage (true) or nominal (false)
  - `dueDate`: Custom due date for the installment
- `revisionNotes`: Notes about the revision (optional)

### Response

#### Success Response (200 OK)
```json
{
  "id": "string (UUID)",
  "consultationId": "string (UUID)",
  "fileId": "string (UUID)",
  "digitalSignature": "boolean",
  "status": "string (ContractStatus)",
  "createdAt": "string (ISO 8601 timestamp)",
  "updatedAt": "string (ISO 8601 timestamp)"
}
```

**ContractStatus Values:** (Same as above)

#### Error Responses
- **400 Bad Request**: Invalid request format or missing required fields
- **401 Unauthorized**: Invalid or missing authorization header
- **403 Forbidden**: User does not have CONSULTANT role
- **500 Internal Server Error**: Unexpected server error