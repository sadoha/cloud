<?php
// Zabbix GUI configuration file.
global $DB;

$DB['TYPE']     = '{{ zb_db_type }}';
$DB['SERVER']   = '{{ zb_db_server }}';
$DB['PORT']     = '{{ zb_db_port }}';
$DB['DATABASE'] = '{{ zb_db_name }}';
$DB['USER']     = '{{ zb_db_user }}';
$DB['PASSWORD'] = '{{ zb_db_password }}';

// Schema name. Used for IBM DB2 and PostgreSQL.
$DB['SCHEMA'] = '';

$ZBX_SERVER      = '127.0.0.1';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = '';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
