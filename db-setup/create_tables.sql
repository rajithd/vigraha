DROP TABLE IF EXISTS `voice_call`;

CREATE TABLE IF NOT EXISTS `voice_call` (
`record_id` INT NOT NULL ,
`number_make_call` VARCHAR(11) NOT NULL ,
`number_receive_call` VARCHAR (11) NOT NULL ,
`call_start_time` VARCHAR (100) NOT NULL ,
`duration` VARCHAR (100) NOT NULL ,
`number_charged_call` VARCHAR (11) NOT NULL ,
`call_result` VARCHAR (50) NOT NULL ,
`call_type` VARCHAR (100) NOT NULL,
PRIMARY KEY (record_id)
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `sms` (
`record_id` INT NOT NULL ,
`number_making_sms` VARCHAR(11) NOT NULL ,
`number_receive_sms` VARCHAR (11) NOT NULL ,
`sms_send_date` VARCHAR (100) NOT NULL ,
`duration` VARCHAR (100) NOT NULL ,
`number_charged_sms` VARCHAR (11) NOT NULL ,
`result_of_sms` VARCHAR (50) NOT NULL ,
`sms_type` VARCHAR (100) NOT NULL,
PRIMARY KEY (record_id)
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `gprs` (
`record_id` INT NOT NULL ,
`number` VARCHAR(11) NOT NULL ,
`navigation` TEXT NOT NULL ,
`navigation_time` VARCHAR (100) NOT NULL ,
`navigation_duration` VARCHAR (100) NOT NULL ,
PRIMARY KEY (record_id)
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `lbs` (
`record_id` INT NOT NULL ,
`number` VARCHAR(11) NOT NULL ,
`location` VARCHAR (100) NOT NULL ,
`start_time` VARCHAR (100) NOT NULL ,
`duration` VARCHAR (100) NOT NULL ,
PRIMARY KEY (record_id)
)
ENGINE= InnoDB;

-- temporary  hold
CREATE TABLE IF NOT EXISTS `ussd` (
`record_id` INT NOT NULL ,
`number_make_call` VARCHAR(11) NOT NULL ,
`number_receive_call` VARCHAR (11) NOT NULL ,
`call_start_time` VARCHAR (100) NOT NULL ,
`duration` VARCHAR (100) NOT NULL ,
`number_charged_call` VARCHAR (11) NOT NULL ,
`call_result` VARCHAR (50) NOT NULL ,
`call_type` VARCHAR (100) NOT NULL,
PRIMARY KEY (record_id)
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `admin` (
`full_name` VARCHAR(50) NOT NULL ,
`mobile_no` VARCHAR(11) NOT NULL ,
`id` VARCHAR (20) NOT NULL ,
`username` VARCHAR (20) NOT NULL ,
`password` VARCHAR (20) NOT NULL ,
PRIMARY KEY (id)
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `promotion` (
`promotion_id` INT NOT NULL AUTO_INCREMENT ,
`company_code` VARCHAR(50) NOT NULL ,
`promotion_name` VARCHAR(30) NOT NULL ,
`start_date_time` DATETIME NOT NULL ,
`end_date_time` DATETIME NOT NULL ,
`based_on` VARCHAR(50) NOT NULL ,
`promotion_number` VARCHAR(10) NOT NULL ,
`cycle_type` VARCHAR(50) NOT NULL ,
`cycle_time` VARCHAR(50) NOT NULL ,
`restriction` VARCHAR(50) NOT NULL ,
`selection_type` VARCHAR (50) NOT NULL ,
`selection_value` VARCHAR(50) NOT NULL ,
`age_restriction` VARCHAR(20) ,
`sms_message` VARCHAR (200) NOT NULL,
`program_owner` VARCHAR (30) NOT NULL ,
PRIMARY KEY (promotion_id)
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `company` (
`company_name` VARCHAR(50) NOT NULL ,
`company_reg_no` VARCHAR(11) NOT NULL ,
`company_tele_1` VARCHAR (20) NOT NULL ,
`company_tele_2` VARCHAR (20),
`company_address` VARCHAR (20) NOT NULL ,
`email` VARCHAR (20) NOT NULL ,
`username` VARCHAR (20) NOT NULL ,
`password` VARCHAR (20) NOT NULL ,
PRIMARY KEY (company_reg_no)
)
ENGINE= InnoDB;

DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `promotion`;
DROP TABLE IF EXISTS `company`;

insert into `admin` values("admin","mobileno","id","admin","123");

CREATE TABLE IF NOT EXISTS `PROMOTION_RULE_EXECUTOR` (
  `rule_id` INT NOT NULL AUTO_INCREMENT,
  `promotion_rule_id` INT NOT NULL ,
  `start_date` DATETIME NOT NULL ,
  `end_date` DATETIME NOT NULL ,
  `execute_time` DATETIME NOT NULL ,
  `promotion_number` VARCHAR (20) NOT NULL ,
  `status` VARCHAR (10) NOT NULL ,
  PRIMARY KEY (rule_id)
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `PROMOTION_SEND_MSISDN`(
  `rule_id` INT,
  `promotion_rule_id` INT,
  `msisdn` VARCHAR
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `report_promotion_db_summery`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `promotion_rule_id` INT NOT NULL,
  `rule_id` INT NOT NULL,
  `company_code` VARCHAR(100) NOT NULL,
  `company_name` VARCHAR(100) NOT NULL,
  `programme_owner` VARCHAR(100),
  `promotion_name` VARCHAR(100) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `promotion_number1` VARCHAR(20) NOT NULL,
  `sms_message` TEXT NOT NULL,
  `execution_type` VARCHAR(30) NOT NULL,
  `execution_time` VARCHAR(30) NOT NULL,
  `status` VARCHAR(30) NOT NULL,
  `msisdn` VARCHAR(30) NOT NULL,
  `based_on` VARCHAR(10) NOT NULL,
   PRIMARY KEY (id)
)
ENGINE= InnoDB;

DELIMITER //
 CREATE PROCEDURE InsertToSummery()
    BEGIN
        INSERT INTO `report_promotion_db_summery` (
        `promotion_rule_id`,
        `rule_id`,
        `company_code`,
        `company_name`,
        `programme_owner`,
        `promotion_name`,
        `start_date`,
        `end_date`,
        `promotion_number1`,
        `sms_message`,
        `execution_type`,
        `execution_time`,
        `status`,
        `msisdn`,
        `based_on`)

        SELECT
          p.`promotion_id`,
          r.`rule_id`,
          p.`company_code`,
          cm.`company_name`,
          p.`program_owner`,
          p.`promotion_name`,
          p.`start_date_time`,
          p.`end_date_time`,
          p.`promotion_number`,
          p.`sms_message`,
          p.`cycle_type`,
          p.`cycle_time`,
          r.`status`,
          sm.`msisdn`,
          p.`based_on`
        FROM `promotion` p, `PROMOTION_RULE_EXECUTOR` r, `company` cm, `PROMOTION_SEND_MSISDN` sm
        WHERE
            cm.`company_reg_no`=p.`company_code` AND
            p.`promotion_id`=r.`promotion_rule_id` AND
            p.`promotion_id`=sm.`promotion_rule_id`AND
            (p.`promotion_id`>(
                SELECT MAX(`promotion_rule_id`)
                FROM `report_promotion_db_summery`
            ) OR
            (SELECT MAX(`promotion_rule_id`)
            FROM `report_promotion_db_summery`) IS NULL);
    END //
 DELIMITER ;

