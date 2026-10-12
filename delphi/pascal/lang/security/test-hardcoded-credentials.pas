// Test file for delphi-hardcoded-credentials rule
// ruleid: delphi-hardcoded-credentials
const DB_PASSWORD = 'admin123';

// ok: delphi-hardcoded-credentials
const MAX_RETRIES = 5;

procedure TestCredentials;
var
  // ruleid: delphi-hardcoded-credentials
  password: string = 'secret';
  
  // ok: delphi-hardcoded-credentials
  counter: integer;
begin
  // ruleid: delphi-hardcoded-credentials
  user := 'admin';
  
  // ruleid: delphi-hardcoded-credentials
  pass := 'pass123';
  
  // ok: delphi-hardcoded-credentials
  count := 10;
end;
