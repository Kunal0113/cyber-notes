# Networking & Web Cheat Sheet

## Common Ports

| Port | Protocol | Service |
|------|----------|---------|
| `20/21` | FTP | File Transfer Protocol (data/control) |
| `22` | SSH | Secure Shell (remote login, SCP, SFTP) |
| `23` | Telnet | Unencrypted remote login (legacy/insecure) |
| `25` | SMTP |(Simple Message Transfer Proocol) Mail sending (server-to-server) |
| `53` | DNS | Domain Name resolution |
| `67/68` | DHCP | Dynamic IP assignment |
| `69` | TFTP | Trivial File Transfer Protocol |
| `80` | HTTP | Unencrypted web traffic |
| `110` | POP3 | Mail retrieval (download & delete) |
| `111` | RPCbind | Remote procedure call mapper |
| `123` | NTP | Network Time Protocol |
| `135` | MSRPC | Windows RPC endpoint mapper |
| `137-139` | NetBIOS | Windows name resolution/sharing |
| `143` | IMAP | Mail retrieval (sync across devices) |
| `161/162` | SNMP | Network device monitoring |
| `389` | LDAP | Directory services |
| `443` | HTTPS | Encrypted web traffic (TLS/SSL) |
| `445` | SMB | Windows file/printer sharing |
| `465` | SMTPS | SMTP over TLS |
| `514` | Syslog | System logging |
| `587` | SMTP (submission) | Mail client sending (with auth) |
| `636` | LDAPS | LDAP over TLS |
| `993` | IMAPS | IMAP over TLS |
| `995` | POP3S | POP3 over TLS |
| `1433` | MSSQL | Microsoft SQL Server |
| `1521` | Oracle DB | Oracle database listener |
| `3306` | MySQL | MySQL database |
| `3389` | RDP | Windows Remote Desktop |
| `5432` | PostgreSQL | PostgreSQL database |
| `5900` | VNC | Remote desktop (Virtual Network Computing) |
| `6379` | Redis | Redis database |
| `8080` | HTTP-alt | Common alt web port / proxies |
| `8443` | HTTPS-alt | Common alt secure web port |
| `27017` | MongoDB | MongoDB database |

---

### Pentest/Recon Quick Notes
- Unexpected **open ports** (e.g., 3389, 5900, 23) on external-facing hosts are common recon red flags.