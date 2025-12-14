## API Contracts for Contract Download Endpoints

Below are the detailed API contracts for the three download endpoints in `ContractController.java`, following OpenAPI-style documentation. These endpoints handle file downloads for contracts and use global exception handling via `GlobalDomainExceptionHandler`.

### Base Information
- **Base Path**: `/api/contracts`
- **Authentication**: Bearer token in `Authorization` header
- **Authorization**: Requires role `HOMEOWNER` or `CONSULTANT`
- **Success Response**: Binary file stream with appropriate headers
- **Error Response**: JSON `ApiErrorResponse` handled by global exception handler

---

### 1. Download Approved Contract

**Endpoint**: `GET /api/contracts/{contractId}/download/approved`

**Description**: Downloads the approved version of a contract as a binary file stream.

**Parameters**:
- **Path Parameters**:
  - `contractId` (UUID, required): Unique identifier of the contract
- **Headers**:
  - `Authorization` (string, required): Bearer token for authentication

**Security**:
- Bearer Authentication
- Role-based authorization: `HOMEOWNER` or `CONSULTANT`

**Responses**:

**200 OK - Success**
```yaml
description: Contract file downloaded successfully
content:
  application/octet-stream:
    schema:
      type: string
      format: binary
headers:
  Content-Type:
    schema:
      type: string
    description: MIME type of the file (e.g., application/pdf, application/vnd.openxmlformats-officedocument.wordprocessingml.document)
  Content-Disposition:
    schema:
      type: string
    description: Attachment header with filename (e.g., attachment; filename="contract-approved.pdf")
  Content-Length:
    schema:
      type: integer
    description: Size of the file in bytes
```

**Error Responses** (handled by `GlobalDomainExceptionHandler`):
```yaml
content:
  application/json:
    schema:
      $ref: '#/components/schemas/ApiErrorResponse'
```

Common error codes:
- **401 Unauthorized**: Invalid or missing authentication token
- **403 Forbidden**: User lacks required role or access to contract
- **404 Not Found**: Contract not found or not approved
- **500 Internal Server Error**: Unexpected server error

---

### 2. Download Latest Contract

**Endpoint**: `GET /api/contracts/{contractId}/download/latest`

**Description**: Downloads the latest version of a contract as a binary file stream.

**Parameters**:
- **Path Parameters**:
  - `contractId` (UUID, required): Unique identifier of the contract
- **Headers**:
  - `Authorization` (string, required): Bearer token for authentication

**Security**:
- Bearer Authentication
- Role-based authorization: `HOMEOWNER` or `CONSULTANT`

**Responses**:

**200 OK - Success**
```yaml
description: Latest contract file downloaded successfully
content:
  application/octet-stream:
    schema:
      type: string
      format: binary
headers:
  Content-Type:
    schema:
      type: string
    description: MIME type of the file
  Content-Disposition:
    schema:
      type: string
    description: Attachment header with filename
  Content-Length:
    schema:
      type: integer
    description: Size of the file in bytes
```

**Error Responses** (handled by `GlobalDomainExceptionHandler`):
```yaml
content:
  application/json:
    schema:
      $ref: '#/components/schemas/ApiErrorResponse'
```

Common error codes:
- **401 Unauthorized**: Invalid or missing authentication token
- **403 Forbidden**: User lacks required role or access to contract
- **404 Not Found**: Contract not found
- **500 Internal Server Error**: Unexpected server error

---

### 3. Download Contract Version

**Endpoint**: `GET /api/contracts/{contractId}/versions/{documentVersionId}/download`

**Description**: Downloads a specific version of a contract document as a binary file stream.

**Parameters**:
- **Path Parameters**:
  - `contractId` (UUID, required): Unique identifier of the contract
  - `documentVersionId` (UUID, required): Unique identifier of the document version
- **Headers**:
  - `Authorization` (string, required): Bearer token for authentication

**Security**:
- Bearer Authentication
- Role-based authorization: `HOMEOWNER` or `CONSULTANT`

**Responses**:

**200 OK - Success**
```yaml
description: Contract version file downloaded successfully
content:
  application/octet-stream:
    schema:
      type: string
      format: binary
headers:
  Content-Type:
    schema:
      type: string
    description: MIME type of the file
  Content-Disposition:
    schema:
      type: string
    description: Attachment header with filename
  Content-Length:
    schema:
      type: integer
    description: Size of the file in bytes
```

**Error Responses** (handled by `GlobalDomainExceptionHandler`):
```yaml
content:
  application/json:
    schema:
      $ref: '#/components/schemas/ApiErrorResponse'
```

Common error codes:
- **401 Unauthorized**: Invalid or missing authentication token
- **403 Forbidden**: User lacks required role or access to contract
- **404 Not Found**: Contract or document version not found
- **500 Internal Server Error**: Unexpected server error

---

### Shared Components

**ApiErrorResponse Schema**:
```yaml
ApiErrorResponse:
  type: object
  properties:
    errorCode:
      type: string
      description: Error code identifier
      example: "CONTRACT_NOT_FOUND"
    message:
      type: string
      description: Human-readable error message
      example: "Contract not found"
    data:
      type: object
      description: Optional additional error data
      nullable: true
```

**Error Handling Details**:

- **DomainException**: Handled by `GlobalDomainExceptionHandler.handleDomainException()`
  - Returns HTTP status from `ErrorCode.getHttpStatus()`
  - Response body contains error code and message from the exception

- **General Exception**: Handled by `GlobalDomainExceptionHandler.handleException()`
  - Returns `500 Internal Server Error`
  - Response body contains `INTERNAL_SERVER_ERROR` code and exception message

**Content Negotiation**:
- Success responses return binary streams with file-specific headers
- Error responses automatically return JSON due to global exception handling
- Spring Boot handles content-type negotiation based on the response type and Accept headers