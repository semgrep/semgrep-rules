<?php

// ruleid: ini-set-session-upload-progress
ini_set('session.upload_progress.enabled', '0');

// ruleid: ini-set-session-upload-progress
ini_set("session.upload_progress.enabled", 0);

// ruleid: ini-set-session-upload-progress
ini_alter('session.upload_progress.enabled', 'Off');

// ok: ini-set-session-upload-progress
ini_set('session.use_strict_mode', '1');

// ok: ini-set-session-upload-progress
ini_get('session.upload_progress.enabled');

// ok: ini-set-session-upload-progress
ini_set('session.upload_progress.cleanup', '1');
