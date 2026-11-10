def contributor_count(deployment, deployment_id, org):
    # ruleid: guardian-hardcoded-tenant-id-special-case
    if deployment.id == 1234:
        return 50
    # ruleid: guardian-hardcoded-tenant-id-special-case
    if deployment_id in (1234, 5678):
        return 75
    # ruleid: guardian-hardcoded-tenant-id-special-case
    if org.org_id != "a1b2c3d4":
        return 0
    # ok: guardian-hardcoded-tenant-id-special-case
    if deployment_id == deployment.id:
        return 1
    # ok: guardian-hardcoded-tenant-id-special-case
    if deployment.id is None:
        return 0
    # ok: guardian-hardcoded-tenant-id-special-case
    if deployment.count == 1234:
        return 2
    return 10
