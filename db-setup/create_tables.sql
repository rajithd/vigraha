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
`first_name` VARCHAR(15) NOT NULL ,
`last_name` VARCHAR(20) NOT NULL ,
`mobile_number` VARCHAR (11) NOT NULL ,
`year_of_birth` VARCHAR (15) NOT NULL ,
`profession` VARCHAR (15) NOT NULL ,
`user_name` VARCHAR (20) NOT NULL ,
`pass_word` VARCHAR (20) NOT NULL ,
`confirm_pass_word` VARCHAR (20) NOT NULL ,
`security_question` VARCHAR (100) NOT NULL,
`id_number` VARCHAR (10) NOT NULL,
`address` VARCHAR (100) NOT NULL,
`country` VARCHAR (20) NOT NULL,
`province` VARCHAR (20) NOT NULL,
`city` VARCHAR (20) NOT NULL,
`role` VARCHAR (20) NOT NULL,
PRIMARY KEY (id_number)
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `promotion` (
`program_name` VARCHAR(30) NOT NULL ,
`start_date` VARCHAR(20) NOT NULL ,
`end_date` VARCHAR (20) NOT NULL ,
---------------------------------------------
`promotion_number` INT NOT NULL ,
`execute_time` VARCHAR (15) NOT NULL ,
---------------------------------------------
`randomly_select` VARCHAR (20) NOT NULL ,
`number_of_first_subscribers` INT NOT NULL ,
`number_of_subscribers` INT NOT NULL ,
`who_made` VARCHAR (20) NOT NULL,
`calls` VARCHAR (15) NOT NULL,
`sms_message` VARCHAR (200) NOT NULL,
PRIMARY KEY (promotion_number)
)
ENGINE= InnoDB;


