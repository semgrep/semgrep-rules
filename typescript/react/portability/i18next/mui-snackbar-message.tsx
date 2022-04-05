// ruleid: mui-snackbar-message
enqueueSnackbar('Registration success, Please verify your email', {
  variant: 'success',
  action: key => (
    <MIconButton size="small" onClick={() => closeSnackbar(key)}>
      <Icon icon={closeFill} />
    </MIconButton>
  ),
});

// ok: mui-snackbar-message
enqueueSnackbar(t('Registration success, Please verify your email'), {
  variant: 'success',
  action: key => (
    <MIconButton size="small" onClick={() => closeSnackbar(key)}>
      <Icon icon={closeFill} />
    </MIconButton>
  ),
});