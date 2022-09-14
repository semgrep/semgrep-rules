// ok: secure-parameter-for-secrets
@secure()
param demoPassword string

// ok: secure-parameter-for-secrets
param normalParam string

// ruleid: secure-parameter-for-secrets
param somethingPassword string

// ruleid: secure-parameter-for-secrets
param somethingSecret string
