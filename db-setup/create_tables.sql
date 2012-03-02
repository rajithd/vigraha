DROP TABLE IF EXISTS `voice_call`;

CREATE TABLE IF NOT EXISTS `voice_call` (
`record_id` INT NOT NULL ,
`number_make_call` VARCHAR(10) NOT NULL ,
`number_receive_call` VARCHAR (10) NOT NULL ,
`call_start_time` VARCHAR (10) NOT NULL ,
`duration` VARCHAR (10) NOT NULL ,
`number_charged_call` VARCHAR (10) NOT NULL ,
`call_result` VARCHAR (10) NOT NULL ,
`call_type` VARCHAR (10) NOT NULL,
PRIMARY KEY (record_id)
)
ENGINE= InnoDB;