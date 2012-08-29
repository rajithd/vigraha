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

DROP PROCEDURE IF EXISTS InsertToSummery;

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
          p.`sms_message`,
          "pizza promotion",
          p.`promotion_name`,
          p.`start_date_time`,
          p.`based_on`,
          p.`age_restriction`,
          p.`promotion_number`,
          p.`cycle_type`,
          r.`status`,
          sm.`msisdn`,
          p.`end_date_time`
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


--  DELIMITER //
--  CREATE PROCEDURE InsertToSummery()
--     BEGIN
--         INSERT INTO `report_promotion_db_summery` (
--         `promotion_rule_id`,
--         `rule_id`,
--         `company_code`,
--         `company_name`,
--         `programme_owner`,
--         `promotion_name`,
--         `start_date`,
--         `end_date`,
--         `promotion_number1`,
--         `sms_message`,
--         `execution_type`,
--         `execution_time`,
--         `status`,
--         `msisdn`,
--         `based_on`)
--
--         SELECT
--           p.`promotion_id`,
--           r.`rule_id`,
--           p.`company_code`,
--           cm.`company_name`,
--           p.`program_owner`,
--           p.`promotion_name`,
--           p.`start_date_time`,
--           p.`end_date_time`,
--           p.`promotion_number`,
--           p.`sms_message`,
--           p.`cycle_type`,
--           p.`cycle_time`,
--           r.`status`,
--           sm.`msisdn`,
--           p.`based_on`
--         FROM `promotion` p, `PROMOTION_RULE_EXECUTOR` r, `company` cm, `PROMOTION_SEND_MSISDN` sm
--         WHERE
--             cm.`company_reg_no`=p.`company_code` AND
--             p.`promotion_id`=r.`promotion_rule_id` AND
--             p.`promotion_id`=sm.`promotion_rule_id`AND
--             (p.`promotion_id`>(
--                 SELECT MAX(`promotion_rule_id`)
--                 FROM `report_promotion_db_summery`
--             ) OR
--             (SELECT MAX(`promotion_rule_id`)
--             FROM `report_promotion_db_summery`) IS NULL);
--     END //
--  DELIMITER ;