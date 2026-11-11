# Synthetic regression fixtures for the Nigerian fintech secret rules.
# Values are fake; live Paystack token strings are intentionally omitted to respect push protection.

# ruleid: lloydcoder-hardcoded-paystack-secret-key
PAYSTACK_TEST = "sk_test_ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"

# ok: lloydcoder-hardcoded-paystack-secret-key
PAYSTACK_BAD_LENGTH = "sk_test_ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"

# ruleid: lloydcoder-hardcoded-flutterwave-secret-key
FLUTTERWAVE_LIVE = "FLWSECK-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-X"

# ruleid: lloydcoder-hardcoded-flutterwave-secret-key
FLUTTERWAVE_TEST = "FLWSECK_TEST-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-X"

# ok: lloydcoder-hardcoded-flutterwave-secret-key
FLUTTERWAVE_PUBLIC = "FLWPUBK_TEST-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-X"

# ok: lloydcoder-hardcoded-flutterwave-secret-key
FLUTTERWAVE_UNSUPPORTED_LABEL = "FLWSECK_LIVE-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-X"

# ruleid: lloydcoder-hardcoded-remita-credentials
REMITA_API_KEY = "remita_api_key=RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR"

# ok: lloydcoder-hardcoded-remita-credentials
REMITA_PUBLIC_MERCHANT_ID = "merchantId=1234567890123"

# ruleid: lloydcoder-hardcoded-interswitch-mac-key
INTERSWITCH_MAC = "macKey=AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"

# ok: lloydcoder-hardcoded-interswitch-mac-key
INTERSWITCH_BAD_LENGTH = "macKey=AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"

# ruleid: lloydcoder-hardcoded-sportybet-betking-jwt
SPORTYBET_TOKEN = "sportybet token eyJabcdefghijk.abcdefghijklmnop.abcdefghijklmnop"

# ruleid: lloydcoder-hardcoded-sportybet-betking-jwt
BETKING_TOKEN = "betking token eyJabcdefghijk.abcdefghijklmnop.abcdefghijklmnop"

# ok: lloydcoder-hardcoded-sportybet-betking-jwt
UNRELATED_JWT = "eyJabcdefghijk.abcdefghijklmnop.abcdefghijklmnop"
