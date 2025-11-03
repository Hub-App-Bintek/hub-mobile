# 📋 **FINAL DOKUMENTASI API CONTRACT MANAGEMENT** - Frontend Integration Guide

## 👋 Halo Tim Frontend!

Sebagai Backend Engineer, saya telah menyelesaikan implementasi lengkap sistem contract management berdasarkan kode existing yang telah diperbarui. Berikut adalah dokumentasi komprehensif API untuk integrasi frontend dengan **response body lengkap** untuk setiap endpoint, termasuk **proses download dan upload file pada setiap tahap contract lifecycle**.

---

## 🎯 **OVERVIEW SISTEM CONTRACT MANAGEMENT**

### **Contract Status Workflow**
Sistem menggunakan **5 status contract** dengan transisi yang ketat:

| Status | UI State | User Action Required | Actor | File Operations |
|--------|----------|---------------------|-------|-----------------|
| `DRAFT` | Draft | Create/Upload Contract | Consultant | Upload Contract Files |
| `REQUEST_FOR_APPROVAL` | Review | Approve/Reject/Request Revision | Home Owner | Download Contract Files |
| `APPROVED` | Approved | Sign Contract | Both | Download Contract Files |
| `REJECTED` | Rejected | View Only | Both | Download Contract Files |
| `SIGNED` | Signed | View Contract | Both | Download Contract Files |

### **File Operations by Contract Stage**

| Stage | File Type | Upload By | Download By | Use Case | Max Size | Path Structure |
|-------|-----------|-----------|-------------|----------|----------|----------------|
| Contract Draft | PDF, DOC, DOCX | Consultant | Both | `CONTRACTS` | 10MB | `contracts/{consultationId}/draft/` |
| Contract Template | DOCX | System | Both | `CONTRACT_TEMPLATE` | N/A | `system/templates/` |

---

## 🔗 **API ENDPOINTS LENGKAP DENGAN RESPONSE BODY**

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

contractValue: 15000000.00
installments: [{"percentage": 30.0, "dueDate": "2024-12-01"}, {"percentage": 70.0, "dueDate": "2024-12-15"}]
file: [contract.pdf] (optional - if not provided, use fileUrl from request)
```

**Alternative: JSON Request (Backward Compatibility)**
```http
POST /api/contracts/consultations/{consultationId}/draft
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
  "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/draft/contract.pdf",
  "digitalSignature": false,
  "status": "DRAFT",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:00:00Z"
}
```

---

### 📄 **2. FILE OPERATIONS - CONTRACT FILES**

#### **Upload Contract File** (Consultant - DRAFT)
```http
POST /api/files/upload
Authorization: Bearer {token}
Content-Type: multipart/form-data

category: CONSULTATION
subCategory: CONTRACT
entityId: 550e8400-e29b-41d4-a716-446655440001
file: [contract.pdf]
```

**Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440002",
  "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/contract.pdf",
  "originalName": "contract.pdf",
  "fileSize": 2048576,
  "uploadedAt": "2024-11-01T14:00:00Z"
}
```

#### **Get Contract Files** (Both - REQUEST_FOR_APPROVAL/APPROVED/SIGNED)
```http
GET /api/files/list?category=CONSULTATION&entityId=550e8400-e29b-41d4-a716-446655440001
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
{
  "files": [
    {
      "id": "550e8400-e29b-41d4-a716-446655440002",
      "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/contract.pdf",
      "originalName": "contract.pdf",
      "fileSize": 2048576,
      "uploadedAt": "2024-11-01T14:00:00Z"
    }
  ]
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

**Alternative: Presigned URL (for backward compatibility)**
```http
GET /api/files/download-url?path=contracts/550e8400-e29b-41d4-a716-446655440001/contract.pdf
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
{
  "fileUrl": "https://minio.example.com/consultation-files/contracts/550e8400-e29b-41d4-a716-446655440001/contract.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&..."
}
```

---

### ✅ **3. CONTRACT APPROVAL WORKFLOW**

#### **Request Contract Approval** (Consultant - DRAFT)
```http
POST /api/contracts/{contractId}/request-approval
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/draft-contract.docx",
  "digitalSignature": false,
  "status": "REQUEST_FOR_APPROVAL",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:05:00Z"
}
```

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
  "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/draft-contract.docx",
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
  "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/draft-contract.docx",
  "digitalSignature": false,
  "status": "REJECTED",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:10:00Z"
}
```

#### **Request Contract Revision** (Home Owner - REQUEST_FOR_APPROVAL)
```http
POST /api/contracts/{contractId}/request-revision?revisionNotes=Please reduce contract value by 20%
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440002",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/draft-contract.docx",
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
  "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/draft-contract.docx",
  "digitalSignature": true,
  "status": "SIGNED",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:20:00Z"
}
```

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
  "fileUrl": "contracts/550e8400-e29b-41d4-a716-446655440001/draft-contract.docx",
  "digitalSignature": false,
  "status": "APPROVED",
  "createdAt": "2024-11-01T00:00:00Z",
  "updatedAt": "2024-11-01T00:10:00Z"
}
```

---

## 🎨 **FRONTEND IMPLEMENTATION GUIDE**

### **1. Contract Status Management Component**
```javascript
const ContractStatusManager = ({ consultationId, userRole, userId }) => {
  const [contract, setContract] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadContract();
  }, [consultationId]);

  const loadContract = async () => {
    try {
      const response = await fetch(`/api/contracts/consultations/${consultationId}`, {
        headers: { 'Authorization': `Bearer ${token}` }
      });

      if (response.ok) {
        const contractData = await response.json();
        setContract(contractData);
      }
    } catch (error) {
      console.error('Failed to load contract:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleRequestApproval = async () => {
    try {
      const response = await fetch(`/api/contracts/${contract.id}/request-approval`, {
        method: 'POST',
        headers: { 'Authorization': `Bearer ${token}` }
      });

      if (response.ok) {
        const updatedContract = await response.json();
        setContract(updatedContract);
        alert('Contract submitted for approval!');
      }
    } catch (error) {
      console.error('Failed to request approval:', error);
    }
  };

  const handleApprove = async () => {
    try {
      const response = await fetch(`/api/contracts/${contract.id}/approve`, {
        method: 'POST',
        headers: { 'Authorization': `Bearer ${token}` }
      });

      if (response.ok) {
        const updatedContract = await response.json();
        setContract(updatedContract);
        alert('Contract approved successfully!');
      }
    } catch (error) {
      console.error('Failed to approve contract:', error);
    }
  };

  const handleReject = async (reason) => {
    try {
      const response = await fetch(`/api/contracts/${contract.id}/reject?reason=${encodeURIComponent(reason)}`, {
        method: 'POST',
        headers: { 'Authorization': `Bearer ${token}` }
      });

      if (response.ok) {
        const updatedContract = await response.json();
        setContract(updatedContract);
        alert('Contract rejected!');
      }
    } catch (error) {
      console.error('Failed to reject contract:', error);
    }
  };

  const handleRequestRevision = async (revisionNotes) => {
    try {
      const response = await fetch(`/api/contracts/${contract.id}/request-revision?revisionNotes=${encodeURIComponent(revisionNotes)}`, {
        method: 'POST',
        headers: { 'Authorization': `Bearer ${token}` }
      });

      if (response.ok) {
        const updatedContract = await response.json();
        setContract(updatedContract);
        alert('Revision requested successfully!');
      }
    } catch (error) {
      console.error('Failed to request revision:', error);
    }
  };

  const handleSign = async () => {
    try {
      const response = await fetch(`/api/contracts/${contract.id}/sign`, {
        method: 'PATCH',
        headers: { 'Authorization': `Bearer ${token}` }
      });

      if (response.ok) {
        const updatedContract = await response.json();
        setContract(updatedContract);
        alert('Contract signed successfully!');
      }
    } catch (error) {
      console.error('Failed to sign contract:', error);
    }
  };

  if (loading) return <div>Loading contract...</div>;
  if (!contract) return <div>No contract found</div>;

  return (
    <div className="contract-manager">
      <div className="contract-header">
        <h3>Contract Management</h3>
        <div className="contract-status">
          Status: <span className={`status-${contract.status.toLowerCase()}`}>{contract.status}</span>
        </div>
      </div>

      <ContractFileViewer contract={contract} />

      <div className="contract-actions">
        {userRole === 'CONSULTANT' && contract.status === 'DRAFT' && (
          <button onClick={handleRequestApproval} className="btn-primary">
            Request Approval
          </button>
        )}

        {userRole === 'HOME_OWNER' && contract.status === 'REQUEST_FOR_APPROVAL' && (
          <div className="approval-actions">
            <button onClick={handleApprove} className="btn-success">
              Approve Contract
            </button>
            <button onClick={() => {
              const reason = prompt('Reason for rejection:');
              if (reason) handleReject(reason);
            }} className="btn-danger">
              Reject Contract
            </button>
            <button onClick={() => {
              const notes = prompt('Revision notes:');
              if (notes) handleRequestRevision(notes);
            }} className="btn-warning">
              Request Revision
            </button>
          </div>
        )}

        {(userRole === 'HOME_OWNER' || userRole === 'CONSULTANT') &&
         contract.status === 'APPROVED' && !contract.digitalSignature && (
          <button onClick={handleSign} className="btn-primary">
            Sign Contract
          </button>
        )}
      </div>
    </div>
  );
};
```

### **2. Contract File Upload Component**
```javascript
const ContractFileUpload = ({ consultationId, onUploadSuccess }) => {
  const [uploading, setUploading] = useState(false);
  const [files, setFiles] = useState([]);

  const handleFileSelect = (event) => {
    const selectedFiles = Array.from(event.target.files);
    const validFiles = selectedFiles.filter(file =>
      ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
      .includes(file.type) && file.size <= 10 * 1024 * 1024 // 10MB
    );

    if (validFiles.length !== selectedFiles.length) {
      alert('Some files were rejected. Only PDF, DOC, DOCX files under 10MB are allowed.');
    }

    setFiles(validFiles);
  };

  const handleUpload = async () => {
    if (files.length === 0) return;

    setUploading(true);

    try {
      const uploadPromises = files.map(async (file) => {
        const formData = new FormData();
        formData.append('category', 'CONSULTATION');
        formData.append('subCategory', 'CONTRACT');
        formData.append('entityId', consultationId);
        formData.append('file', file);

        const response = await fetch('/api/files/upload', {
          method: 'POST',
          headers: { 'Authorization': `Bearer ${token}` },
          body: formData
        });

        if (!response.ok) {
          throw new Error(`Failed to upload ${file.name}`);
        }

        return await response.json();
      });

      const results = await Promise.all(uploadPromises);
      onUploadSuccess(results);
      setFiles([]);
    } catch (error) {
      console.error('Upload failed:', error);
      alert('Upload failed: ' + error.message);
    } finally {
      setUploading(false);
    }
  };

  return (
    <div className="contract-file-upload">
      <h4>Upload Contract Files</h4>
      <input
        type="file"
        multiple
        accept=".pdf,.doc,.docx"
        onChange={handleFileSelect}
        disabled={uploading}
      />

      {files.length > 0 && (
        <div className="file-list">
          {files.map((file, index) => (
            <div key={index} className="file-item">
              <span>{file.name}</span>
              <span>({formatFileSize(file.size)})</span>
            </div>
          ))}
        </div>
      )}

      <button
        onClick={handleUpload}
        disabled={uploading || files.length === 0}
      >
        {uploading ? 'Uploading...' : 'Upload Contract Files'}
      </button>
    </div>
  );
};
```

### **3. Contract File Viewer Component**
```javascript
const ContractFileViewer = ({ contract }) => {
  const [files, setFiles] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (contract) {
      loadContractFiles();
    }
  }, [contract]);

  const loadContractFiles = async () => {
    try {
      const response = await fetch(`/api/files/list?category=CONSULTATION&entityId=${contract.consultationId}`, {
        headers: { 'Authorization': `Bearer ${token}` }
      });

      if (response.ok) {
        const fileList = await response.json();
        setFiles(fileList.files || []);
      }
    } catch (error) {
      console.error('Failed to load contract files:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleDownload = async (fileId, fileName) => {
    try {
      const response = await fetch(`/api/files/download/${fileId}`, {
        method: 'GET',
        headers: { 'Authorization': `Bearer ${token}` }
      });

      if (response.ok) {
        const blob = await response.blob();
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = fileName;
        a.click();
        window.URL.revokeObjectURL(url);
      }
    } catch (error) {
      console.error('Download failed:', error);
    }
  };

  if (loading) return <div>Loading contract files...</div>;

  return (
    <div className="contract-files">
      <h4>Contract Files</h4>

      {files.length === 0 ? (
        <p>No contract files uploaded yet.</p>
      ) : (
        files.map(file => (
          <div key={file.id} className="file-item">
            <div className="file-info">
              <span className="file-name">{file.originalName}</span>
              <span className="file-size">({formatFileSize(file.fileSize)})</span>
              <span className="file-date">
                {new Date(file.uploadedAt).toLocaleDateString()}
              </span>
            </div>

            <button
              onClick={() => handleDownload(file.id, file.originalName)}
              className="btn-download"
            >
              Download
            </button>
          </div>
        ))
      )}
    </div>
  );
};
```

---

## 🔄 **CONTRACT WORKFLOW INTEGRATION FLOW WITH FILE OPERATIONS**

### **Complete Contract Management Process Journey:**

1. **Consultant Creates Contract Draft**
   - Option 1: `POST /api/contracts/{consultationId}/generate-draft` → Status: `DRAFT`
   - Option 2: Direct file upload via `POST /api/contracts/consultations/{consultationId}/draft` (multipart/form-data)
   - Option 3: Manual upload via `POST /api/files/upload` + `POST /api/contracts/consultations/{consultationId}/draft` (JSON)
   - **File Operation**: Files uploaded to `contracts/{consultationId}/draft/` path

2. **Consultant Requests Approval**
   - `POST /api/contracts/{contractId}/request-approval` → Status: `REQUEST_FOR_APPROVAL`
   - **File Access**: Home Owner can download contract files via `GET /api/files/download/{fileId}`

3. **Home Owner Reviews Contract**
   - Download and review contract files using `GET /api/files/list`
   - Options:
     - `POST /api/contracts/{contractId}/approve` → Status: `APPROVED`
     - `POST /api/contracts/{contractId}/reject` → Status: `REJECTED`
     - `POST /api/contracts/{contractId}/request-revision` → Status: `DRAFT` (new contract created)

4. **Contract Signing Phase**
   - `PATCH /api/contracts/{id}/sign` → Status: `SIGNED`
   - **File Access**: Both parties can download signed contract using FileController

5. **Contract Completion**
   - Contract is signed and active
   - **File Access**: Both parties retain access to all contract files via FileController

---

## ⚠️ **ERROR HANDLING**

### **Contract Operation Error Responses**
```json
{
  "errorCode": "VALIDATION_ERROR",
  "message": "Request tidak valid"
}
```

```json
{
  "errorCode": "CONTRACT_NOT_FOUND",
  "message": "Contract not found"
}
```

```json
{
  "errorCode": "CONSULTATION_NOT_FOUND",
  "message": "Consultation not found"
}
```

```json
{
  "errorCode": "INVALID_STATUS",
  "message": "Invalid contract status for this operation"
}
```

```json
{
  "errorCode": "ACCESS_DENIED",
  "message": "You do not have access to this contract"
}
```

---

## 📊 **BUSINESS RULES FOR CONTRACT MANAGEMENT**

### **Contract Creation Rules**
- **Consultant Only**: Only consultants can create contract drafts
- **Status Check**: Contracts can only be created when consultation status is `SURVEY_SELESAI`
- **Single Contract**: Only one active contract per consultation
- **File Upload Options**:
  - Direct multipart upload in createContractDraft endpoint
  - Manual file upload via FileController + fileUrl reference
  - Backward compatibility with JSON requests
- **File Storage**: Contract files stored in `contracts/{consultationId}/draft/` path

### **Approval Workflow Rules**
- **Home Owner Only**: Only home owners can approve/reject contracts
- **Status Check**: Contracts must be in `REQUEST_FOR_APPROVAL` status
- **Deadline**: 7-day approval deadline from creation
- **Revision Process**: Home owner can request revisions, creating new draft

### **File Access Rules**
- **Upload**: Only consultants can upload contract files during draft phase
- **Download**: Both parties can download contract files at any time
- **File Types**: PDF, DOC, DOCX only, max 10MB per file
- **File Retention**: Contract files remain accessible after signing

### **Signing Rules**
- **Both Parties**: Either home owner or consultant can sign approved contracts
- **Status Check**: Contract must be in `APPROVED` status to sign
- **Single Sign**: Contract status changes to `SIGNED` after either party signs
- **Consultation Impact**: Signing contract changes consultation status to `AKTIF`

---

**Dokumentasi ini telah lengkap dengan proses download dan upload file pada setiap tahap contract lifecycle berdasarkan kode existing yang telah diperbarui. Sistem contract management siap untuk integrasi frontend! 🚀📄**