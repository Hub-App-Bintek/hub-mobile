## **CANCELLATION FLOW**

Konsultasi dapat dibatalkan oleh **HOMEOWNER** atau **CONSULTANT** sebelum kontrak ditandatangani:

### **API Endpoint:**
```
POST /api/consultations/{id}/cancel
Authorization: Bearer token (HOMEOWNER or CONSULTANT)
Content-Type: application/json

{
  "reason": "string (required, max 500 chars)"
}
```

### **Business Rules:**
- ❌ **Cannot cancel** after contract status = `SIGNED`
- ✅ **Can cancel** at any status before contract signing
- 📝 **Stores cancellation reason** for audit purposes
- 🔄 **Updates status** to `CANCELLED` for consultation, contract, and project
- 📧 **Sends notification** to the other party
- 📊 **Publishes event** for history tracking

### **Cancellation Status:**
- **Consultation Status**: `CANCELLED`
- **Contract Status**: `CANCELLED` (if exists)
- **Project Status**: `CANCELLED`
