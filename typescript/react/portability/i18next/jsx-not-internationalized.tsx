return (
    <HeroContentStyle>
        <motion.div variants={varFadeInRight}>
            // ruleid: jsx-not-internationalized
            <Typography
                variant="h4"
                sx={{
                mt: 5,
                color: 'common.white',
                fontWeight: 'fontWeightMedium',
                }}
            >
                Organizations who have trusted us
            </Typography>
        </motion.div>

        <motion.div variants={varFadeInRight}>
            // ok: jsx-not-internationalized
            <Typography
                variant="h1"
                sx={{
                color: 'primary.main',
                fontWeight: 'fontWeightMedium',
                }}
            >
                {t('menu.customers')}
            </Typography>
            // ok: jsx-not-internationalized
            <Typography
                variant="h1"
                sx={{
                color: 'primary.main',
                fontWeight: 'fontWeightMedium',
                }}
            >
                {t('menu.customers', {context: 'male'})}
            </Typography>
            // ok: jsx-not-internationalized
            <Typography
                variant="h1"
                sx={{
                color: 'primary.main',
                fontWeight: 'fontWeightMedium',
                }}
            >
                {i18next.t('menu.customers')}
            </Typography>
            // ok
            <Typography
                variant="h1"
                sx={{
                color: 'primary.main',
                fontWeight: 'fontWeightMedium',
                }}
            >
            </Typography>
            // ok
            <Typography
                variant="h1"
                sx={{
                color: 'primary.main',
                fontWeight: 'fontWeightMedium',
                }}
            >
                123
            </Typography>
            // ok
            <Typography
                variant="h1"
                sx={{
                color: 'primary.main',
                fontWeight: 'fontWeightMedium',
                }}
            >
                45.53
            </Typography>
            // ok
            <Typography
                variant="h1"
                sx={{
                color: 'primary.main',
                fontWeight: 'fontWeightMedium',
                }}
            >
                144,90
            </Typography>
            // ok
            <Typography
                variant="h1"
                sx={{
                color: 'primary.main',
                fontWeight: 'fontWeightMedium',
                }}
            >
                12-12-1220
            </Typography>
            // ok
            <Typography
                variant="h1"
                sx={{
                color: 'primary.main',
                fontWeight: 'fontWeightMedium',
                }}
            >
                12.50%
            </Typography>
        </motion.div>
    </HeroContentStyle>);
