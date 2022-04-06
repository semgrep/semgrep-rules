// ruleid: jsx-label-not-i18n
return <TextField
    id="outlined-basic"
    label="Add extra amount"
    variant="outlined"
    sx={{ width: '100%' }}
    value={text}
    onChange={e => setText(e.target.value)}
    />;

// ruleid: jsx-label-not-i18n
return <Tab label="Organization" value="1" />;

// ok: jsx-label-not-i18n
return <TextField
    id="outlined-basic"
    label={t('extra-amount')}
    variant="outlined"
    sx={{ width: '100%' }}
    value={text}
    onChange={e => setText(e.target.value)}
    />;
// ok: jsx-label-not-i18n
return <TextField
    id="outlined-basic"
    label=""
    variant="outlined"
    sx={{ width: '100%' }}
    value={text}
    onChange={e => setText(e.target.value)}
    />;
// ok: jsx-label-not-i18n
return <TextField
    id="outlined-basic"
    label="13"
    variant="outlined"
    sx={{ width: '100%' }}
    value={text}
    onChange={e => setText(e.target.value)}
    />;
// ok: jsx-label-not-i18n
return <TextField
    id="outlined-basic"
    label="13200.34"
    variant="outlined"
    sx={{ width: '100%' }}
    value={text}
    onChange={e => setText(e.target.value)}
    />;
// ok
return <TextField
    id="outlined-basic"
    label="13200,34"
    variant="outlined"
    sx={{ width: '100%' }}
    value={text}
    onChange={e => setText(e.target.value)}
    />;
// ok
return <TextField
    id="outlined-basic"
    label="13200-34"
    variant="outlined"
    sx={{ width: '100%' }}
    value={text}
    onChange={e => setText(e.target.value)}
    />;
// ok: jsx-label-not-i18n
return <TextField
    id="outlined-basic"
    label="14%"
    variant="outlined"
    sx={{ width: '100%' }}
    value={text}
    onChange={e => setText(e.target.value)}
    />;

// ok: jsx-label-not-i18n
return <Tab label={t('fundraising.organization')} value="1" />;
// ok: jsx-label-not-i18n
return <Tab label="" value="1" />;
// ok: jsx-label-not-i18n
return <Tab label="123" value="1" />;
// ok: jsx-label-not-i18n
return <Tab label="123.50" value="1" />;
// ok: jsx-label-not-i18n
return <Tab label="123,50" value="1" />;
// ok: jsx-label-not-i18n
return <Tab label="123-50" value="1" />;
// ok: jsx-label-not-i18n
return <Tab label="123%" value="1" />;