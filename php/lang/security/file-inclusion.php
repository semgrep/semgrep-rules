<?php

// ruleid: file-inclusion
include($user_input);

// ok: file-inclusion
include('constant.php');

// ruleid: file-inclusion
include_once($user_input);

// ok: file-inclusion
include_once('constant.php');

// ruleid: file-inclusion
require($user_input);

// ok: file-inclusion
require('constant.php');

// ruleid: file-inclusion
require_once($user_input);

// ok: file-inclusion
require_once('constant.php');
