# Prototype API Documentation

This document describes the Prototype REST endpoints implemented in this service (package `com.hub.app.prototype.controller`). It includes endpoint paths, HTTP methods, parameters, request/response shapes (based on DTOs), example requests, common status codes, and notes about authentication.

> Generated: 2025-11-29

## Overview

The prototype module exposes endpoints for:

- listing all prototypes (filtered by status DRAFT)
- retrieving a specific prototype by ID
- downloading prototype design files as a ZIP archive
- generating SIMBG integration links (placeholder)
- serving prototype thumbnail images

Data shapes shown below are derived from project DTOs and models (see `src/main/java/com/hub/app/prototype/dto` and `src/main/java/com/hub/app/prototype/model`).

## Authentication

This repository is configured with Spring Security. At runtime some endpoints may require authentication (Bearer JWT or cookies) depending on application configuration. In tests, endpoints were exercised with test authentication helpers. If your environment enforces auth, include an Authorization header in examples below.

## Common HTTP Status Codes

- 200 OK — Successful GET returning data
- 404 Not Found — Prototype not found (service throws `DomainException` with `ErrorCode.DESIGN_NOT_FOUND`)
- 429 Too Many Requests — Rate limit exceeded for download endpoint
- 500 Internal Server Error — Server errors (MinIO issues, streaming errors, etc.)
- 401 / 403 — Authentication/authorization errors (when security is enabled)

---

## Endpoints

### List All Prototypes

- URL: `GET /api/prototypes`
- Query parameters:
  - `type` (string, optional) — filter by prototype type (currently not implemented in service, parameter is accepted but ignored)
- Response (200): List<PrototypeResponse>

PrototypeResponse fields:

- `id` (UUID) — unique prototype identifier
- `name` (String) — prototype name
- `category` (PrototypeCategory enum) — SEDERHANA or NON_SEDERHANA
- `description` (String) — detailed description
- `thumbnailUrls` (List<String>) — list of thumbnail image URLs
- `fileDedUrl` (String) — DED file URL
- `fileRabUrl` (String) — RAB file URL
- `fileSpektekUrl` (String) — SPEKTEK file URL
- `type` (String) — prototype type (e.g., "22/72")
- `buildingArea` (Double) — building area in m²
- `landArea` (Double) — land area in m²
- `bedrooms` (Integer) — number of bedrooms
- `bathrooms` (Integer) — number of bathrooms
- `features` (String) — JSON string of features
- `specifications` (String) — JSON string of specifications
- `imageUrl` (String) — main image URL
- `folderPath` (String) — MinIO folder path containing design files
- `status` (PrototypeStatus enum) — DRAFT, DIPILIH, etc.
- `createdAt` (Instant) — creation timestamp
- `updatedAt` (Instant) — last update timestamp

Example request:

```bash
curl -X GET "https://your-host/api/prototypes" \
  -H "Accept: application/json" \
  -H "Authorization: Bearer <your-jwt-token>"
```

Example response:

```json
[
  {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "name": "Rumah Minimalis 22/72",
    "category": "SEDERHANA",
    "description": "Desain rumah minimalis untuk lahan terbatas. Cocok untuk pasangan muda atau single yang menginginkan hunian efisien dengan budget terjangkau.",
    "thumbnailUrls": [
      "https://minio.example.com/thumbnails/thumb1.jpg",
      "https://minio.example.com/thumbnails/thumb2.jpg"
    ],
    "fileDedUrl": "https://minio.example.com/files/ded-123.pdf",
    "fileRabUrl": "https://minio.example.com/files/rab-123.pdf",
    "fileSpektekUrl": "https://minio.example.com/files/spektek-123.pdf",
    "type": "22/72",
    "buildingArea": 22.0,
    "landArea": 72.0,
    "bedrooms": 1,
    "bathrooms": 1,
    "features": "{\"features\": [\"Ruang tamu minimalis\", \"Kamar tidur dengan lemari built-in\", \"Dapur compact dengan area penyimpanan\", \"Kamar mandi standar\", \"Teras kecil\"]}",
    "specifications": "{\"land_area\": \"6m x 12m (72m²)\", \"building_area\": \"22m²\", \"bedrooms\": 1, \"bathrooms\": 1, \"carport\": \"1 mobil\"}",
    "imageUrl": "https://minio.example.com/images/prototype-123.jpg",
    "folderPath": "prototypes/550e8400-e29b-41d4-a716-446655440000/",
    "status": "DRAFT",
    "createdAt": "2025-11-24T02:30:00Z",
    "updatedAt": "2025-11-24T02:30:00Z"
  }
]
```

---

### Get Prototype by ID

- URL: `GET /api/prototypes/{id}`
- Path parameters:
  - `id` (UUID) — prototype unique identifier
- Response (200): PrototypeResponse

Example request:

```bash
curl -X GET "https://your-host/api/prototypes/550e8400-e29b-41d4-a716-446655440000" \
  -H "Accept: application/json" \
  -H "Authorization: Bearer <your-jwt-token>"
```

Example response:

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "name": "Rumah Minimalis 22/72",
  "category": "SEDERHANA",
  "description": "Desain rumah minimalis untuk lahan terbatas. Cocok untuk pasangan muda atau single yang menginginkan hunian efisien dengan budget terjangkau.",
  "thumbnailUrls": [
    "https://minio.example.com/thumbnails/thumb1.jpg",
    "https://minio.example.com/thumbnails/thumb2.jpg"
  ],
  "fileDedUrl": "https://minio.example.com/files/ded-123.pdf",
  "fileRabUrl": "https://minio.example.com/files/rab-123.pdf",
  "fileSpektekUrl": "https://minio.example.com/files/spektek-123.pdf",
  "type": "22/72",
  "buildingArea": 22.0,
  "landArea": 72.0,
  "bedrooms": 1,
  "bathrooms": 1,
  "features": "{\"features\": [\"Ruang tamu minimalis\", \"Kamar tidur dengan lemari built-in\", \"Dapur compact dengan area penyimpanan\", \"Kamar mandi standar\", \"Teras kecil\"]}",
  "specifications": "{\"land_area\": \"6m x 12m (72m²)\", \"building_area\": \"22m²\", \"bedrooms\": 1, \"bathrooms\": 1, \"carport\": \"1 mobil\"}",
  "imageUrl": "https://minio.example.com/images/prototype-123.jpg",
  "folderPath": "prototypes/550e8400-e29b-41d4-a716-446655440000/",
  "status": "DRAFT",
  "createdAt": "2025-11-24T02:30:00Z",
  "updatedAt": "2025-11-24T02:30:00Z"
}
```

Error cases:

- 404 Not Found — when prototype id does not exist (service throws `DomainException` with `ErrorCode.DESIGN_NOT_FOUND`)

---

### Download Prototype Files

- URL: `GET /api/prototypes/{id}/download`
- Path parameters:
  - `id` (UUID) — prototype unique identifier
- Rate Limiting: 2 downloads per 5 minutes per IP address
- Response (200): Binary ZIP file stream

Response headers:

- `Content-Type: application/octet-stream`
- `Content-Disposition: attachment; filename="prototype-{id}.zip"`

Description: Downloads all design files associated with the prototype as a ZIP archive. Files are retrieved from the MinIO folder specified in `folderPath`. The ZIP contains all files in that folder (excluding subdirectories).

Example request:

```bash
curl -X GET "https://your-host/api/prototypes/550e8400-e29b-41d4-a716-446655440000/download" \
  -H "Authorization: Bearer <your-jwt-token>" \
  --output prototype-550e8400-e29b-41d4-a716-446655440000.zip
```

Example response: Binary ZIP file containing all design files from the prototype's folder.

Error cases:

- 404 Not Found — prototype not found
- 429 Too Many Requests — rate limit exceeded (2 downloads per 5 minutes)
- 500 Internal Server Error — MinIO access issues or streaming errors

Notes:

- Files are streamed directly from MinIO to avoid memory issues with large files (100MB-300MB total)
- If the prototype's `folderPath` is null/empty or contains no files, an empty ZIP is returned
- Rate limiting prevents abuse and protects server resources

---

### Get Prototype Thumbnail

- URL: `GET /api/prototypes/{id}/thumbnails/{index}`
- Path parameters:
  - `id` (UUID) — prototype unique identifier
  - `index` (integer) — thumbnail index (currently only index 0 is supported)
- Response (200): Binary image stream (JPEG)

Response headers:

- `Content-Type: image/jpeg`

Description: Serves the thumbnail image for the prototype. Currently supports only index 0, which corresponds to the main image. If the prototype has no image or invalid index, returns 404.

Example request:

```bash
curl -X GET "https://your-host/api/prototypes/550e8400-e29b-41d4-a716-446655440000/thumbnails/0" \
  -H "Authorization: Bearer <your-jwt-token>" \
  --output thumbnail.jpg
```

Example response: Binary JPEG image data.

Error cases:

- 404 Not Found — prototype not found or no image available for the given index
- 500 Internal Server Error — MinIO access issues

---

## Data Models

### PrototypeCategory Enum

```java
public enum PrototypeCategory {
    SEDERHANA,
    NON_SEDERHANA
}
```

### PrototypeStatus Enum

```java
public enum PrototypeStatus {
    DRAFT,
    DIPILIH,
    // other statuses as needed
}
```

### ErrorCode Enum (for exceptions)

```java
public enum ErrorCode {
    DESIGN_NOT_FOUND,
    INTERNAL_ERROR,
    // other error codes
}
```

## Notes & Implementation Details

- **Streaming Downloads**: The download endpoint uses `StreamingResponseBody` for memory-efficient handling of large files (100MB-300MB). Files are streamed directly from MinIO without loading into application memory.

- **Rate Limiting**: Implemented using AOP with `@RateLimited` annotation. Limits are configurable and applied per IP address.

- **File Storage**: Design files are stored in MinIO buckets. The `folderPath` field contains the MinIO prefix (folder path) where all related files are stored.

- **JSON Fields**: `features` and `specifications` are stored as JSON strings in the database for flexibility.

- **Error Handling**: Uses `DomainException` with specific error codes. Controllers catch exceptions and return appropriate HTTP status codes with error details.

- **Authentication**: Endpoints may require authentication depending on Spring Security configuration. Include Bearer JWT tokens in requests when required.

- **Performance**: List endpoints return all DRAFT prototypes. Consider pagination for production use with large datasets.

- **File Organization**: Each prototype has its own folder in MinIO (e.g., `prototypes/{uuid}/`) containing all related design files, blueprints, specifications, etc.

- **Thumbnail Images**: Thumbnails are served dynamically from the prototype's `imageUrl` field. Currently only one thumbnail (index 0) is supported per prototype.