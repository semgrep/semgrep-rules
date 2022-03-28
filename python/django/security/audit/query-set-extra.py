# ruleid:avoid-query-set-extra
Entry.objects.get().extra()

# ruleid:avoid-query-set-extra
Entry.objects.filter().extra()

# ruleid:avoid-query-set-extra
Entry.objects.update().extra()

# ruleid:avoid-query-set-extra
Entry.objects.filter().update().extra()

# ruleid:avoid-query-set-extra
Entry.objects.get({}).filter().update().extra()

# ok:avoid-query-set-extra
findings = Finding.objects.filter(verified=True,
                                      severity__in=('Critical', 'High', 'Medium', 'Low', 'Info')).prefetch_related(
        'test__engagement__product',
        'test__engagement__product__prod_type',
        'test__engagement__risk_acceptance',
        'risk_acceptance_set',
        'reporter').extra(
        select={
            'ra_count': 'SELECT COUNT(*) FROM dojo_risk_acceptance INNER JOIN '
                        'dojo_risk_acceptance_accepted_findings ON '
                        '( dojo_risk_acceptance.id = dojo_risk_acceptance_accepted_findings.risk_acceptance_id ) '
                        'WHERE dojo_risk_acceptance_accepted_findings.finding_id = dojo_finding.id',
        },
    )

example = 1
# ruleid:avoid-query-set-extra
active_findings = Finding.objects.filter(verified=True, active=True,
                                      severity__in=('Critical', 'High', 'Medium', 'Low', 'Info')).prefetch_related(
        'test__engagement__product',
        'test__engagement__product__prod_type',
        'test__engagement__risk_acceptance',
        'risk_acceptance_set',
        'reporter').extra(
        select={
            'ra_count': f'SELECT COUNT(*) FROM dojo_risk_acceptance INNER JOIN '
                        f'dojo_risk_acceptance_accepted_findings ON '
                        f'( dojo_risk_acceptance.id = dojo_risk_acceptance_accepted_findings.risk_acceptance_id ) '
                        f'WHERE dojo_risk_acceptance_accepted_findings.finding_id = {example}',
        },
    )
