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
