<?php

// ruleid: ftp-use
$conn_id = ftp_connect($ftp_server);

// ruleid: ftp-use
$login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass);

// ok: ftp-use
ssh2_scp_send($connection, '/local/filename', '/remote/filename', 0644);
