# Networking & Web Cheat Sheet


## HTTP Status Codes

### 1xx — Informational
- **100** Continue — initial part of request received, client should continue

### 2xx — Success
- **200** OK — request succeeded
- **201** Created — resource successfully created
- **204** No Content — success, but no body returned

### 3xx — Redirection
- **301** Moved Permanently — resource has a new permanent URL
- **302** Found — temporary redirect
- **304** Not Modified — cached version is still valid

### 4xx — Client Error
- **400** Bad Request — malformed syntax/invalid request
- **401** Unauthorized — authentication required/failed
- **403** Forbidden — authenticated but not permitted (access denied)
- **404** Not Found — resource doesn't exist
- **405** Method Not Allowed — HTTP method not supported for this resource
- **429** Too Many Requests — rate limit exceeded

### 5xx — Server Error
- **500** Internal Server Error — generic server failure
- **502** Bad Gateway — invalid response from upstream server
- **503** Service Unavailable — server overloaded or down for maintenance
- **504** Gateway Timeout — upstream server didn't respond in time

---

### Pentest/Recon Quick Notes
- **401 vs 403**: 401 = "prove who you are," 403 = "I know who you are, still no."