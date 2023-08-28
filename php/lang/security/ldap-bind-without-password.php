<?php

$ldapconn = ldap_connect("foo.com");

// ruleid: ldap-bind-without-password
$ldapbind = ldap_bind($ldapconn);

// ruleid: ldap-bind-without-password
LDAP_BIND($ldapconn, "username");

// ruleid: ldap-bind-without-password
ldap_bind($ldapconn, NULL, NULL);

// ruleid: ldap-bind-without-password
ldap_bind($ldapconn, "username", "");

$a = "";
$b = "";
// ruleid: ldap-bind-without-password
ldap_bind($ldapconn, $a, $b);

$c = "username";
$d = "";
// ruleid: ldap-bind-without-password
ldap_bind($ldapconn, $c, $d);

$e = "user";
$f = "pass";
// ok: ldap-bind-without-password
ldap_bind($ldapconn, $e, $f);

// ok: ldap-bind-without-password
ldap_bind($ldapconn, "username", "password");

// ok: ldap-bind-without-password
ldap_bind($ldapconn, $username, $password);
