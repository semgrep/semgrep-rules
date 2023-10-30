<?php

$username = $_COOKIE['username'];
//ruleid: tainted-exec
exec("wto -n \"$username\" -g", $ret);


$fullpath = $_POST['fullpath'];
//ok: tainted-exec
$filesize = trim(shell_exec('stat -c %s ' . escapeshellarg($fullpath)));


$jobName = $_REQUEST['jobName'];
$cmd = sprintf("rsyncmd -l \"$xmlPath\" -r %s >/dev/null", $jobName);
//ruleid: tainted-exec
system($cmd);


$errorCode = escapeshellarg($_POST['errorCode']);
$func = escapeshellarg($_POST['func']);
$uuid = str_replace(PHP_EOL, '', file_get_contents("/proc/sys/kernel/random/uuid"));
$logsCmd = sprintf('%s%s%s',
  "wdlog -l INFO -s 'adminUI' -m 'firmware_upload_page' function:string=$func ",
  "status:string='updateFail' errorCode:string=$errorCode ",
  "corid:string='AUI:$uuid' >/dev/null 2>&1"
);
//ok: tainted-exec
exec($logsCmd);


$arg = $_POST['arg'];
$cmd = "logwdweb --post_migration_onboarding -%s %s";
$cmd_logwdweb = "logwdweb --post_migration_onboarding --page %s %s";
$_arg = sprintf("--status %s", $arg);
$cmd = sprintf($cmd_logwdweb, "raidRoaming", $_arg);
//ruleid: tainted-exec
pclose(popen($cmd, 'r'));
?>
