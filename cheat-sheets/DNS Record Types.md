# Networking & Web Cheat Sheet


## DNS Record Types

| Record | Purpose |
|--------|---------|
| **A** | Maps a hostname to an IPv4 address |
| **AAAA** | Maps a hostname to an IPv6 address |
| **CNAME** | Alias — points one hostname to another hostname |
| **MX** | Mail exchange — specifies mail servers for a domain (with priority) |
| **NS** | Nameserver — delegates a domain/subdomain to authoritative DNS servers |
| **TXT** | Arbitrary text — used for SPF, DKIM, DMARC, domain verification |
| **SOA** | Start of Authority — admin info, refresh/retry timers for the zone |
| **PTR** | Reverse DNS — maps an IP address back to a hostname |
| **SRV** | Service locator — host/port for specific services (e.g., SIP, XMPP) |
| **CAA** | Certificate Authority Authorization — restricts which CAs can issue certs |
| **NAPTR** | Naming Authority Pointer — used in VoIP/telecom routing |

---

### Pentest/Recon Quick Notes
- **TXT records** are worth checking during recon — they can leak info about mail providers, verification tokens, or third-party integrations.
