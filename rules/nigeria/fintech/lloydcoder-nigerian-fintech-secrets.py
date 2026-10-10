# Synthetic positive and negative fixtures for generic-language secret rules.
# Values are intentionally non-functional test data.

# ok: lloydcoder-hardcoded-paystack-secret-key
PAYSTACK_SECRET_KEY = os.environ["PAYSTACK_SECRET_KEY"]

# ruleid: lloydcoder-hardcoded-flutterwave-secret-key
FLUTTERWAVE_SECRET_KEY = "FLWSECK_TEST-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-X"

# ok: lloydcoder-hardcoded-flutterwave-secret-key
FLUTTERWAVE_SECRET_KEY = os.environ["FLUTTERWAVE_SECRET_KEY"]

# ruleid: lloydcoder-hardcoded-remita-credentials
REMITA_API_KEY = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"

# ok: lloydcoder-hardcoded-remita-credentials
REMITA_MERCHANT_ID = "123456789012"

# ruleid: lloydcoder-hardcoded-interswitch-mac-key
macKey = "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"

# ok: lloydcoder-hardcoded-interswitch-mac-key
macKey = os.environ["INTERSWITCH_MAC_KEY"]

# ruleid: lloydcoder-hardcoded-sportybet-betking-jwt
sportybet_token = "eyJAAAAAAAAAAAAAAAA.ABBBBBBBBBBBBBBB.CCCCCCCCCCCCCCCC"

# ok: lloydcoder-hardcoded-sportybet-betking-jwt
unrelated_service_token = "eyJAAAAAAAAAAAAAAAA.ABBBBBBBBBBBBBBB.CCCCCCCCCCCCCCCC"
