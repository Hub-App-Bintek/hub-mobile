# 📋 **DOKUMENTASI API CONTRACT PAYMENT MANAGEMENT**

## 🔗 **API ENDPOINTS LENGKAP DENGAN RESPONSE BODY**

### 💰 **1. PAYMENT CREATION & MANAGEMENT**

#### **Create Payment** (Home Owner - MEMBUAT_PEMBAYARAN)
```http
POST /api/payments?consultationId={consultationId}
Authorization: Bearer {homeowner-token}
Content-Type: application/json

{
  "type": "KONSULTASI",
  "termin": 1,
  "amount": 5000000.00,
  "method": "BANK_TRANSFER",
  "referenceId": "contract-uuid"
}
```

**Response (201 Created):**
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "consultationId": "550e8400-e29b-41d4-a716-446655440001",
  "type": "KONSULTASI",
  "termin": 1,
  "amount": 5000000.00,
  "method": "BANK_TRANSFER",
  "description": "Pembayaran konsultasi desain termin 1",
  "status": "MENUNGGU",
  "paymentGatewayRef": null,
  "dueDate": "2024-12-15T00:00:00",
  "referenceId": "contract-uuid",
  "createdAt": "2024-12-01T00:00:00Z",
  "updatedAt": "2024-12-01T00:00:00Z"
}
```

#### **Get Payments by Consultation** (Home Owner/Consultant - MELIHAT_PEMBAYARAN)
```http
GET /api/payments?consultationId={consultationId}
Authorization: Bearer {token}
```

**Response (200 OK):**
```json
[
  {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "consultationId": "550e8400-e29b-41d4-a716-446655440001",
    "type": "KONSULTASI",
    "termin": 1,
    "amount": 5000000.00,
    "method": "BANK_TRANSFER",
    "description": "Pembayaran konsultasi desain termin 1",
    "status": "ESCROW_HOLD",
    "paymentGatewayRef": "PG-123456789",
    "dueDate": "2024-12-15T00:00:00",
    "referenceId": "contract-uuid",
    "createdAt": "2024-12-01T00:00:00Z",
    "updatedAt": "2024-12-01T00:00:00Z"
  },
  {
    "id": "550e8400-e29b-41d4-a716-446655440002",
    "consultationId": "550e8400-e29b-41d4-a716-446655440001",
    "type": "KONSULTASI",
    "termin": 2,
    "amount": 5000000.00,
    "method": "BANK_TRANSFER",
    "description": "Pembayaran konsultasi desain termin 2",
    "status": "MENUNGGU",
    "paymentGatewayRef": null,
    "dueDate": "2025-01-15T00:00:00",
    "referenceId": "contract-uuid",
    "createdAt": "2024-12-01T00:00:00Z",
    "updatedAt": "2024-12-01T00:00:00Z"
  }
]
```
