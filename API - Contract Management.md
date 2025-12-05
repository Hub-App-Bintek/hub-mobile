# 📋 **DOKUMENTASI API CONTRACT MANAGEMENT**


### 🏗️ **1. CONTRACT CREATION & GENERATION**

#### **Generate Contract Draft** (Consultant - MENYIAPKAN_KONTRAK)
```http
POST /api/contracts/{consultationId}/generate-draft
Authorization: Bearer {token}
Content-Type: application/json

{
  "contractValue": 15000000.00,
  "installments": [
    {
      "percentage": 30.0,
      "dueDate": "2024-12-01"
    },
    {
      "percentage": 40.0,
      "dueDate": "2024-12-15"
    },
    {
      "percentage": 30.0,
      "dueDate": "2024-12-30"
    }
  ]
}
```

**Response (200 OK):** Binary DOCX file stream with headers:
```
Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document
Content-Disposition: attachment; filename="contract-draft.docx"
```

#### **Create Contract Draft (Manual Upload/File Upload)** (Consultant - MENYIAPKAN_KONTRAK)
```http
POST /api/contracts/consultations/{consultationId}/draft
Authorization: Bearer {token}
Content-Type: multipart/form-data

request: [JSON string containing contract details]
file: [contract.pdf] (optional - if not provided, use fileUrl from request JSON)
```

**Request JSON (in 'request' parameter):**
```json
{
  "contractValue": 15000000.00,
  "installments": [
    {
      "percentage": 30.0,
      "dueDate": "2024-12-01"
    },
    {
      "percentage": 70.0,
      "dueDate": "2024-12-15"
    }
  ],
  "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/contract.pdf"
}
```

**Response (201 Created):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "fileId": "550e8400-e29b-41d4-a716-446655440002",
  "digitalSignature": false,
  "status": "DRAFT",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:00:00Z"
}
```

---

### 🔄 **1.1 CONTRACT REVISION UPLOAD**

#### **Upload Revised Contract** (Consultant - After Revision Request)
```http
POST /api/contracts/revised-upload
Authorization: Bearer {token}
Content-Type: multipart/form-data

file: [revised-contract.pdf] (optional)
revisionNotes: "Updated contract with reduced pricing" (optional)
```

**Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440004",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "fileId": "550e8400-e29b-41d4-a716-446655440005",
  "digitalSignature": false,
  "status": "DRAFT",
  "createdAt": "2024-11-01T00:20:00Z",
  "updatedAt": "2024-11-01T00:20:00Z"
}
```

#### **Download Contract File** (Both - REQUEST_FOR_APPROVAL/APPROVED/SIGNED)
```http
GET /api/files/download/{fileId}
Authorization: Bearer {token}
```

**Response (200 OK):** Binary file stream with headers:
```
Content-Type: application/pdf
Content-Disposition: attachment; filename="contract.pdf"
```

### ✅ **3. CONTRACT APPROVAL WORKFLOW**


#### **Approve Contract** (Home Owner - REQUEST_FOR_APPROVAL)
```http
POST /api/contracts/{contractId}/approve
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "fileId": "550e8400-e29b-41d4-a716-446655440002",
  "digitalSignature": false,
  "status": "APPROVED",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:10:00Z"
}
```

#### **Reject Contract** (Home Owner - REQUEST_FOR_APPROVAL)
```http
POST /api/contracts/{contractId}/reject?reason=Contract value too high
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "fileId": "550e8400-e29b-41d4-a716-446655440002",
  "digitalSignature": false,
  "status": "REJECTED",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:10:00Z"
}
```

#### **Request Contract Revision** (Home Owner - REQUEST_FOR_REVISION)
```http
POST /api/contracts/{contractId}/request-revision?revisionNotes=Please reduce contract value by 20%
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440002",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "fileId": "550e8400-e29b-41d4-a716-446655440003",
  "digitalSignature": false,
  "status": "DRAFT",
  "createdAt": "2024-11-01T00:15:00Z",
  "updatedAt": "2024-11-01T00:15:00Z"
}
```

---

### ✍️ **4. CONTRACT SIGNING**

#### **Sign Contract** (Both - APPROVED)
```http
PATCH /api/contracts/{id}/sign
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "fileId": "550e8400-e29b-41d4-a716-446655440002",
  "digitalSignature": true,
  "status": "SIGNED",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:20:00Z"
}

---

### 📋 **5. CONTRACT RETRIEVAL**

#### **Get Active Contract** (Both - Any Status)
```http
GET /api/contracts/consultations/{consultationId}
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "fileId": "550e8400-e29b-41d4-a716-446655440002",
  "digitalSignature": false,
  "status": "APPROVED",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:10:00Z"
}
```

#### **Get Contract Versions** (Both - Any Status)
```http
GET /api/contracts/projects/{projectId}/consultations/{consultationId}/versions
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
[
  {
    "id": "550e8400-e29b-41d4-a716-446655440010",
    "consultationId": "550e8400-e29b-41d4-a716-446655440001",
    "documentType": "CONTRACT",
    "version": "1.0",
    "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/draft-contract.docx",
    "fileId": "550e8400-e29b-41d4-a716-446655440011",
    "uploadedBy": "CONSULTANT",
    "status": "UPLOADED",
    "notes": "Initial contract draft",
    "uploadedAt": "2024-11-01T00:00:00Z",
    "createdAt": "2024-11-01T00:00:00Z",
    "updatedAt": "2024-11-01T00:00:00Z"
  },
  {
    "id": "550e8400-e29b-41d4-a716-446655440012",
    "consultationId": "550e8400-e29b-41d4-a716-446655440001",
    "documentType": "CONTRACT",
    "version": "1.1",
    "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/revised-contract.docx",
    "fileId": "550e8400-e29b-41d4-a716-446655440013",
    "uploadedBy": "CONSULTANT",
    "status": "UPLOADED",
    "notes": "Revised contract after homeowner feedback",
    "uploadedAt": "2024-11-02T00:00:00Z",
    "createdAt": "2024-11-02T00:00:00Z",
    "updatedAt": "2024-11-02T00:00:00Z"
  },
  {
    "id": "550e8400-e29b-41d4-a716-446655440014",
    "consultationId": "550e8400-e29b-41d4-a716-446655440001",
    "documentType": "CONTRACT",
    "version": "2.0",
    "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/final-contract.docx",
    "fileId": "550e8400-e29b-41d4-a716-446655440015",
    "uploadedBy": "CONSULTANT",
    "status": "FINAL",
    "notes": "Final signed contract",
    "uploadedAt": "2024-11-03T00:00:00Z",
    "createdAt": "2024-11-03T00:00:00Z",
    "updatedAt": "2024-11-03T00:00:00Z"
  }
]
```