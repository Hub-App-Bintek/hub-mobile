# Location API Documentation

## Location API

### Overview
The Location API provides endpoints to retrieve Indonesian administrative location data including provinces, regencies (kabupaten/kota), districts (kecamatan), and villages (desa/kelurahan). This API is used to populate location dropdowns and provide geographical data for the application.

### Authentication
No authentication required - all endpoints are public.

### Endpoints

#### 1. Get All Provinces
**GET** `/api/locations/province`

Retrieve all provinces in Indonesia.

**Request Example:**
```bash
curl -X GET "http://localhost:8080/api/locations/province"
```

**Response (200 OK):**
```json
[
  {
    "id": 1,
    "nama": "DKI Jakarta",
    "latitude": -6.2087634,
    "longitude": 106.845599,
    "geojson": "{\"type\":\"MultiPolygon\",\"coordinates\":[[[...]]]}",
    "zoom": 10,
    "kodeDagri": "31",
    "kodeBps": "31",
    "kodeRkakl": "31",
    "createdAt": "2024-01-01T00:00:00",
    "updatedAt": "2024-01-01T00:00:00"
  }
]
```

#### 2. Get Regencies by Province
**GET** `/api/locations/regency/{provinceId}`

Retrieve all regencies (kabupaten/kota) within a specific province.

**Parameters:**
- `provinceId` (path): Province ID

**Request Example:**
```bash
curl -X GET "http://localhost:8080/api/locations/regency/1"
```

**Response (200 OK):**
```json
[
  {
    "id": 1,
    "kodeDagri": "3171",
    "kodeBps": "3171",
    "kodeRkakl": "3171",
    "nama": "Kepulauan Seribu",
    "latitude": -5.7438,
    "longitude": 106.5737,
    "geojson": "{\"type\":\"MultiPolygon\",\"coordinates\":[[[...]]]}",
    "zoom": 12,
    "provinceId": 1,
    "createdAt": "2024-01-01T00:00:00",
    "updatedAt": "2024-01-01T00:00:00",
    "backlog": 0,
    "rtlh": 0
  }
]
```

#### 3. Get Districts by Regency
**GET** `/api/locations/district/{regencyId}`

Retrieve all districts (kecamatan) within a specific regency.

**Parameters:**
- `regencyId` (path): Regency ID

**Request Example:**
```bash
curl -X GET "http://localhost:8080/api/locations/district/1"
```

**Response (200 OK):**
```json
[
  {
    "id": 1,
    "nama": "Pulau Panggang",
    "cityId": 1,
    "kodeDagri": "3171010",
    "kodeBps": "3171010",
    "kodeRkakl": "3171010",
    "latitude": -5.7438,
    "longitude": 106.5737,
    "geojson": "{\"type\":\"MultiPolygon\",\"coordinates\":[[[...]]]}",
    "zoom": 14,
    "createdAt": "2024-01-01T00:00:00",
    "updatedAt": "2024-01-01T00:00:00"
  }
]
```

#### 4. Get Villages by District
**GET** `/api/locations/village/{districtId}`

Retrieve all villages (desa/kelurahan) within a specific district.

**Parameters:**
- `districtId` (path): District ID

**Request Example:**
```bash
curl -X GET "http://localhost:8080/api/locations/village/1"
```

**Response (200 OK):**
```json
[
  {
    "id": 1,
    "nama": "Pulau Panggang",
    "districtId": 1,
    "kodeDagri": "3171010001",
    "kodeBps": "3171010001",
    "kodeRkakl": "3171010001",
    "latitude": -5.7438,
    "longitude": 106.5737,
    "geojson": "{\"type\":\"MultiPolygon\",\"coordinates\":[[[...]]]}",
    "zoom": 16,
    "createdAt": "2024-01-01T00:00:00",
    "updatedAt": "2024-01-01T00:00:00"
  }
]
```

### Error Responses

**404 Not Found:**
```json
{
  "timestamp": "2024-01-15T10:00:00.000+00:00",
  "status": 404,
  "error": "Not Found",
  "message": "No regencies found for province ID: 999",
  "path": "/api/locations/regency/999"
}
```

### Data Models

#### Province
```json
{
  "id": "Long",
  "nama": "String",
  "latitude": "BigDecimal",
  "longitude": "BigDecimal",
  "geojson": "String (JSON)",
  "zoom": "Integer",
  "kodeDagri": "String",
  "kodeBps": "String",
  "kodeRkakl": "String",
  "createdAt": "LocalDateTime",
  "updatedAt": "LocalDateTime"
}
```

#### Regency
```json
{
  "id": "Long",
  "kodeDagri": "String",
  "kodeBps": "String",
  "kodeRkakl": "String",
  "nama": "String",
  "latitude": "BigDecimal",
  "longitude": "BigDecimal",
  "geojson": "String (JSON)",
  "zoom": "Integer",
  "provinceId": "Long",
  "createdAt": "LocalDateTime",
  "updatedAt": "LocalDateTime",
  "backlog": "Integer",
  "rtlh": "Integer"
}
```

#### District
```json
{
  "id": "Long",
  "nama": "String",
  "cityId": "Long",
  "kodeDagri": "String",
  "kodeBps": "String",
  "kodeRkakl": "String",
  "latitude": "BigDecimal",
  "longitude": "BigDecimal",
  "geojson": "String (JSON)",
  "zoom": "Integer",
  "createdAt": "LocalDateTime",
  "updatedAt": "LocalDateTime"
}
```

#### Village
```json
{
  "id": "Long",
  "nama": "String",
  "districtId": "Long",
  "kodeDagri": "String",
  "kodeBps": "String",
  "kodeRkakl": "String",
  "latitude": "BigDecimal",
  "longitude": "BigDecimal",
  "geojson": "String (JSON)",
  "zoom": "Integer",
  "createdAt": "LocalDateTime",
  "updatedAt": "LocalDateTime"
}
```

### Usage Notes

1. **Hierarchical Structure**: Locations follow a hierarchical structure: Province → Regency → District → Village
2. **Geographical Data**: Each location includes latitude, longitude, and GeoJSON data for mapping
3. **Codes**: Multiple coding systems are supported (DAGRI, BPS, RKAKL) for different administrative purposes
4. **Caching**: Consider implementing client-side caching for location data as it changes infrequently