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
`firstname` VARCHAR(15) NOT NULL ,
`lastname` VARCHAR(20) NOT NULL ,
`mobilenumber` VARCHAR (11) NOT NULL ,
`yearofbirth` VARCHAR (15) NOT NULL ,
`profession` VARCHAR (15) NOT NULL ,
`username` VARCHAR (20) NOT NULL ,
`password` VARCHAR (20) NOT NULL ,
`securityquestion` VARCHAR (100) NOT NULL,
`idnumber` VARCHAR (10) NOT NULL,
`address` VARCHAR (100) NOT NULL,
`country` VARCHAR (20) NOT NULL,
`province` VARCHAR (20) NOT NULL,
`city` VARCHAR (20) NOT NULL,
`role` VARCHAR (20) NOT NULL,
PRIMARY KEY (idnumber)
)
ENGINE= InnoDB;

CREATE TABLE IF NOT EXISTS `promotion` (
`programname` VARCHAR(30) NOT NULL ,
`startdate` VARCHAR(20) NOT NULL ,
`enddate` VARCHAR (20) NOT NULL ,
smstype VARCHAR(10) NOT NULL ,
voicecalltype VARCHAR(10) NOT NULL ,
smspromotion VARCHAR(10) NOT NULL ,
lbspromotion VARCHAR(10) NOT NULL ,
voicecallpromotion VARCHAR(10) NOT NULL ,
gprspromotion VARCHAR(10) NOT NULL ,
ussdpromotion VARCHAR(10) NOT NULL ,
`promotionnumber` INT NOT NULL ,
`executetime` VARCHAR (15) NOT NULL ,
`randomlyselect` VARCHAR (20) NOT NULL ,
`numberoffirstsubscribers` INT NOT NULL ,
`numberofsubscribers` INT NOT NULL ,
`whomade` VARCHAR (20) NOT NULL,
`calls` VARCHAR (15) NOT NULL,
`smsmessage` VARCHAR (200) NOT NULL,
PRIMARY KEY (promotionnumber)
)
ENGINE= InnoDB;

