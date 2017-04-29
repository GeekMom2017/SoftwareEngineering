-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: mysql2
-- Source Schemata: mysql
-- Created: Thu Mar 30 13:28:43 2017
-- Workbench Version: 6.3.9
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema mysql2
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `mysql2` ;
CREATE SCHEMA IF NOT EXISTS `mysql2` ;

-- ----------------------------------------------------------------------------
-- Table mysql2.columns_priv
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`columns_priv` (
  `Host` CHAR(60) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Db` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `User` CHAR(32) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Table_name` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Column_name` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` SET('Select', 'Insert', 'Update', 'References') NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`, `Column_name`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Column privileges';

-- ----------------------------------------------------------------------------
-- Table mysql2.db
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`db` (
  `Host` CHAR(60) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Db` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `User` CHAR(32) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Select_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Insert_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Update_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Delete_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Drop_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Grant_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `References_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Index_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Alter_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Lock_tables_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_view_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Show_view_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_routine_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Alter_routine_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Execute_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Event_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Trigger_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`, `Db`, `User`),
  INDEX `User` (`User` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Database privileges';

-- ----------------------------------------------------------------------------
-- Table mysql2.engine_cost
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`engine_cost` (
  `engine_name` VARCHAR(64) NOT NULL,
  `device_type` INT(11) NOT NULL,
  `cost_name` VARCHAR(64) NOT NULL,
  `cost_value` FLOAT NULL DEFAULT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` VARCHAR(1024) NULL DEFAULT NULL,
  PRIMARY KEY (`cost_name`, `engine_name`, `device_type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table mysql2.event
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`event` (
  `db` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `name` CHAR(64) NOT NULL DEFAULT '',
  `body` LONGBLOB NOT NULL,
  `definer` CHAR(93) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `execute_at` DATETIME NULL DEFAULT NULL,
  `interval_value` INT(11) NULL DEFAULT NULL,
  `interval_field` ENUM('YEAR', 'QUARTER', 'MONTH', 'DAY', 'HOUR', 'MINUTE', 'WEEK', 'SECOND', 'MICROSECOND', 'YEAR_MONTH', 'DAY_HOUR', 'DAY_MINUTE', 'DAY_SECOND', 'HOUR_MINUTE', 'HOUR_SECOND', 'MINUTE_SECOND', 'DAY_MICROSECOND', 'HOUR_MICROSECOND', 'MINUTE_MICROSECOND', 'SECOND_MICROSECOND') NULL DEFAULT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` DATETIME NULL DEFAULT NULL,
  `starts` DATETIME NULL DEFAULT NULL,
  `ends` DATETIME NULL DEFAULT NULL,
  `status` ENUM('ENABLED', 'DISABLED', 'SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` ENUM('DROP', 'PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` SET('REAL_AS_FLOAT', 'PIPES_AS_CONCAT', 'ANSI_QUOTES', 'IGNORE_SPACE', 'NOT_USED', 'ONLY_FULL_GROUP_BY', 'NO_UNSIGNED_SUBTRACTION', 'NO_DIR_IN_CREATE', 'POSTGRESQL', 'ORACLE', 'MSSQL', 'DB2', 'MAXDB', 'NO_KEY_OPTIONS', 'NO_TABLE_OPTIONS', 'NO_FIELD_OPTIONS', 'MYSQL323', 'MYSQL40', 'ANSI', 'NO_AUTO_VALUE_ON_ZERO', 'NO_BACKSLASH_ESCAPES', 'STRICT_TRANS_TABLES', 'STRICT_ALL_TABLES', 'NO_ZERO_IN_DATE', 'NO_ZERO_DATE', 'INVALID_DATES', 'ERROR_FOR_DIVISION_BY_ZERO', 'TRADITIONAL', 'NO_AUTO_CREATE_USER', 'HIGH_NOT_PRECEDENCE', 'NO_ENGINE_SUBSTITUTION', 'PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `originator` INT(10) UNSIGNED NOT NULL,
  `time_zone` CHAR(64) CHARACTER SET 'latin1' NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` CHAR(32) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `collation_connection` CHAR(32) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `db_collation` CHAR(32) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `body_utf8` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`db`, `name`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'Events';

-- ----------------------------------------------------------------------------
-- Table mysql2.func
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`func` (
  `name` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `ret` TINYINT(1) NOT NULL DEFAULT '0',
  `dl` CHAR(128) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `type` ENUM('function', 'aggregate') CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'User defined functions';

-- ----------------------------------------------------------------------------
-- Table mysql2.general_log
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`general_log` (
  `event_time` TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP());

-- ----------------------------------------------------------------------------
-- Table mysql2.gtid_executed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`gtid_executed` (
  `source_uuid` CHAR(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` BIGINT(20) NOT NULL COMMENT 'First number of interval.',
  `interval_end` BIGINT(20) NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`, `interval_start`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table mysql2.help_category
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`help_category` (
  `help_category_id` SMALLINT(5) UNSIGNED NOT NULL,
  `name` CHAR(64) NOT NULL,
  `parent_category_id` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `url` TEXT NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'help categories';

-- ----------------------------------------------------------------------------
-- Table mysql2.help_keyword
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`help_keyword` (
  `help_keyword_id` INT(10) UNSIGNED NOT NULL,
  `name` CHAR(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'help keywords';

-- ----------------------------------------------------------------------------
-- Table mysql2.help_relation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`help_relation` (
  `help_topic_id` INT(10) UNSIGNED NOT NULL,
  `help_keyword_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`help_keyword_id`, `help_topic_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'keyword-topic relation';

-- ----------------------------------------------------------------------------
-- Table mysql2.help_topic
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`help_topic` (
  `help_topic_id` INT(10) UNSIGNED NOT NULL,
  `name` CHAR(64) NOT NULL,
  `help_category_id` SMALLINT(5) UNSIGNED NOT NULL,
  `description` TEXT NOT NULL,
  `example` TEXT NOT NULL,
  `url` TEXT NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'help topics';

-- ----------------------------------------------------------------------------
-- Table mysql2.innodb_index_stats
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`innodb_index_stats` (
  `database_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `table_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `index_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `stat_value` BIGINT(20) UNSIGNED NOT NULL,
  `sample_size` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `stat_description` VARCHAR(1024) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`database_name`, `table_name`, `index_name`, `stat_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table mysql2.innodb_table_stats
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`innodb_table_stats` (
  `database_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `table_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `n_rows` BIGINT(20) UNSIGNED NOT NULL,
  `clustered_index_size` BIGINT(20) UNSIGNED NOT NULL,
  `sum_of_other_index_sizes` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`database_name`, `table_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table mysql2.ndb_binlog_index
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`ndb_binlog_index` (
  `Position` BIGINT(20) UNSIGNED NOT NULL,
  `File` VARCHAR(255) NOT NULL,
  `epoch` BIGINT(20) UNSIGNED NOT NULL,
  `inserts` INT(10) UNSIGNED NOT NULL,
  `updates` INT(10) UNSIGNED NOT NULL,
  `deletes` INT(10) UNSIGNED NOT NULL,
  `schemaops` INT(10) UNSIGNED NOT NULL,
  `orig_server_id` INT(10) UNSIGNED NOT NULL,
  `orig_epoch` BIGINT(20) UNSIGNED NOT NULL,
  `gci` INT(10) UNSIGNED NOT NULL,
  `next_position` BIGINT(20) UNSIGNED NOT NULL,
  `next_file` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`epoch`, `orig_server_id`, `orig_epoch`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table mysql2.plugin
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`plugin` (
  `name` VARCHAR(64) NOT NULL DEFAULT '',
  `dl` VARCHAR(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'MySQL plugins';

-- ----------------------------------------------------------------------------
-- Table mysql2.proc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`proc` (
  `db` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `name` CHAR(64) NOT NULL DEFAULT '',
  `type` ENUM('FUNCTION', 'PROCEDURE') NOT NULL,
  `specific_name` CHAR(64) NOT NULL DEFAULT '',
  `language` ENUM('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` ENUM('CONTAINS_SQL', 'NO_SQL', 'READS_SQL_DATA', 'MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` ENUM('YES', 'NO') NOT NULL DEFAULT 'NO',
  `security_type` ENUM('INVOKER', 'DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` BLOB NOT NULL,
  `returns` LONGBLOB NOT NULL,
  `body` LONGBLOB NOT NULL,
  `definer` CHAR(93) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` SET('REAL_AS_FLOAT', 'PIPES_AS_CONCAT', 'ANSI_QUOTES', 'IGNORE_SPACE', 'NOT_USED', 'ONLY_FULL_GROUP_BY', 'NO_UNSIGNED_SUBTRACTION', 'NO_DIR_IN_CREATE', 'POSTGRESQL', 'ORACLE', 'MSSQL', 'DB2', 'MAXDB', 'NO_KEY_OPTIONS', 'NO_TABLE_OPTIONS', 'NO_FIELD_OPTIONS', 'MYSQL323', 'MYSQL40', 'ANSI', 'NO_AUTO_VALUE_ON_ZERO', 'NO_BACKSLASH_ESCAPES', 'STRICT_TRANS_TABLES', 'STRICT_ALL_TABLES', 'NO_ZERO_IN_DATE', 'NO_ZERO_DATE', 'INVALID_DATES', 'ERROR_FOR_DIVISION_BY_ZERO', 'TRADITIONAL', 'NO_AUTO_CREATE_USER', 'HIGH_NOT_PRECEDENCE', 'NO_ENGINE_SUBSTITUTION', 'PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` TEXT CHARACTER SET 'utf8' NOT NULL,
  `character_set_client` CHAR(32) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `collation_connection` CHAR(32) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `db_collation` CHAR(32) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `body_utf8` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`db`, `name`, `type`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stored Procedures';

-- ----------------------------------------------------------------------------
-- Table mysql2.procs_priv
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`procs_priv` (
  `Host` CHAR(60) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Db` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `User` CHAR(32) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Routine_name` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Routine_type` ENUM('FUNCTION', 'PROCEDURE') CHARACTER SET 'utf8' NOT NULL,
  `Grantor` CHAR(93) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Proc_priv` SET('Execute', 'Alter Routine', 'Grant') NOT NULL DEFAULT '',
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`, `Db`, `User`, `Routine_name`, `Routine_type`),
  INDEX `Grantor` (`Grantor` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Procedure privileges';

-- ----------------------------------------------------------------------------
-- Table mysql2.proxies_priv
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`proxies_priv` (
  `Host` CHAR(60) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `User` CHAR(32) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Proxied_host` CHAR(60) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Proxied_user` CHAR(32) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `With_grant` TINYINT(1) NOT NULL DEFAULT '0',
  `Grantor` CHAR(93) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`, `User`, `Proxied_host`, `Proxied_user`),
  INDEX `Grantor` (`Grantor` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'User proxy privileges';

-- ----------------------------------------------------------------------------
-- Table mysql2.server_cost
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`server_cost` (
  `cost_name` VARCHAR(64) NOT NULL,
  `cost_value` FLOAT NULL DEFAULT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` VARCHAR(1024) NULL DEFAULT NULL,
  PRIMARY KEY (`cost_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table mysql2.servers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`servers` (
  `Server_name` CHAR(64) NOT NULL DEFAULT '',
  `Host` CHAR(64) NOT NULL DEFAULT '',
  `Db` CHAR(64) NOT NULL DEFAULT '',
  `Username` CHAR(64) NOT NULL DEFAULT '',
  `Password` CHAR(64) NOT NULL DEFAULT '',
  `Port` INT(4) NOT NULL DEFAULT '0',
  `Socket` CHAR(64) NOT NULL DEFAULT '',
  `Wrapper` CHAR(64) NOT NULL DEFAULT '',
  `Owner` CHAR(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'MySQL Foreign Servers table';

-- ----------------------------------------------------------------------------
-- Table mysql2.slave_master_info
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`slave_master_info` (
  `Number_of_lines` INT(10) UNSIGNED NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` TEXT CHARACTER SET 'utf8' NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` BIGINT(20) UNSIGNED NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` CHAR(64) CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The host name of the master.',
  `User_name` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The user name used to connect to the master.',
  `User_password` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The password used to connect to the master.',
  `Port` INT(10) UNSIGNED NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` INT(10) UNSIGNED NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` TINYINT(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` TINYINT(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` FLOAT NOT NULL,
  `Bind` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The master server uuid.',
  `Retry_count` BIGINT(20) UNSIGNED NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` TINYINT(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` CHAR(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Tls_version` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'Tls version',
  PRIMARY KEY (`Channel_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Master Information';

-- ----------------------------------------------------------------------------
-- Table mysql2.slave_relay_log_info
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`slave_relay_log_info` (
  `Number_of_lines` INT(10) UNSIGNED NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` TEXT CHARACTER SET 'utf8' NOT NULL COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` BIGINT(20) UNSIGNED NOT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` TEXT CHARACTER SET 'utf8' NOT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` BIGINT(20) UNSIGNED NOT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` INT(11) NOT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` INT(10) UNSIGNED NOT NULL,
  `Id` INT(10) UNSIGNED NOT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` CHAR(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Relay Log Information';

-- ----------------------------------------------------------------------------
-- Table mysql2.slave_worker_info
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`slave_worker_info` (
  `Id` INT(10) UNSIGNED NOT NULL,
  `Relay_log_name` TEXT CHARACTER SET 'utf8' NOT NULL,
  `Relay_log_pos` BIGINT(20) UNSIGNED NOT NULL,
  `Master_log_name` TEXT CHARACTER SET 'utf8' NOT NULL,
  `Master_log_pos` BIGINT(20) UNSIGNED NOT NULL,
  `Checkpoint_relay_log_name` TEXT CHARACTER SET 'utf8' NOT NULL,
  `Checkpoint_relay_log_pos` BIGINT(20) UNSIGNED NOT NULL,
  `Checkpoint_master_log_name` TEXT CHARACTER SET 'utf8' NOT NULL,
  `Checkpoint_master_log_pos` BIGINT(20) UNSIGNED NOT NULL,
  `Checkpoint_seqno` INT(10) UNSIGNED NOT NULL,
  `Checkpoint_group_size` INT(10) UNSIGNED NOT NULL,
  `Checkpoint_group_bitmap` BLOB NOT NULL,
  `Channel_name` CHAR(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`, `Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Worker Information';

-- ----------------------------------------------------------------------------
-- Table mysql2.slow_log
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`slow_log` (
  `start_time` TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP());

-- ----------------------------------------------------------------------------
-- Table mysql2.tables_priv
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`tables_priv` (
  `Host` CHAR(60) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Db` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `User` CHAR(32) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Table_name` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Grantor` CHAR(93) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` SET('Select', 'Insert', 'Update', 'Delete', 'Create', 'Drop', 'Grant', 'References', 'Index', 'Alter', 'Create View', 'Show view', 'Trigger') NOT NULL DEFAULT '',
  `Column_priv` SET('Select', 'Insert', 'Update', 'References') NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`, `Db`, `User`, `Table_name`),
  INDEX `Grantor` (`Grantor` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Table privileges';

-- ----------------------------------------------------------------------------
-- Table mysql2.time_zone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`time_zone` (
  `Time_zone_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Time zones';

-- ----------------------------------------------------------------------------
-- Table mysql2.time_zone_leap_second
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`time_zone_leap_second` (
  `Transition_time` BIGINT(20) NOT NULL,
  `Correction` INT(11) NOT NULL,
  PRIMARY KEY (`Transition_time`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Leap seconds information for time zones';

-- ----------------------------------------------------------------------------
-- Table mysql2.time_zone_name
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`time_zone_name` (
  `Name` CHAR(64) NOT NULL,
  `Time_zone_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Time zone names';

-- ----------------------------------------------------------------------------
-- Table mysql2.time_zone_transition
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`time_zone_transition` (
  `Time_zone_id` INT(10) UNSIGNED NOT NULL,
  `Transition_time` BIGINT(20) NOT NULL,
  `Transition_type_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Time_zone_id`, `Transition_time`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Time zone transitions';

-- ----------------------------------------------------------------------------
-- Table mysql2.time_zone_transition_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`time_zone_transition_type` (
  `Time_zone_id` INT(10) UNSIGNED NOT NULL,
  `Transition_type_id` INT(10) UNSIGNED NOT NULL,
  `Offset` INT(11) NOT NULL DEFAULT '0',
  `Is_DST` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `Abbreviation` CHAR(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`, `Transition_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Time zone transition types';

-- ----------------------------------------------------------------------------
-- Table mysql2.user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql2`.`user` (
  `Host` CHAR(60) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `User` CHAR(32) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `Select_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Insert_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Update_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Delete_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Drop_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Reload_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Shutdown_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Process_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `File_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Grant_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `References_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Index_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Alter_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Show_db_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Super_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Lock_tables_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Execute_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Repl_slave_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Repl_client_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_view_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Show_view_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_routine_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Alter_routine_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_user_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Event_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Trigger_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `ssl_type` ENUM('', 'ANY', 'X509', 'SPECIFIED') CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `ssl_cipher` BLOB NOT NULL,
  `x509_issuer` BLOB NOT NULL,
  `x509_subject` BLOB NOT NULL,
  `max_questions` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `max_updates` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `max_connections` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `max_user_connections` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `plugin` CHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT 'mysql_native_password',
  `authentication_string` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `password_expired` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  `password_last_changed` TIMESTAMP NULL DEFAULT NULL,
  `password_lifetime` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `account_locked` ENUM('N', 'Y') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`, `User`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Users and global privileges';
SET FOREIGN_KEY_CHECKS = 1;
