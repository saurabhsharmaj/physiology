CREATE TABLE IF NOT EXISTS `physiologydb`.`user_detail` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(255) NULL COMMENT '',
  `fname` VARCHAR(255) NULL COMMENT '',
  `age` INT NULL COMMENT '',
  `sex` INT NULL COMMENT '',
  `educationType` VARCHAR(255) NULL COMMENT '',
  `educationMedium` VARCHAR(255) NULL COMMENT '',
  `domicile` VARCHAR(255) NULL COMMENT '',
  `maritialStatus` INT NULL COMMENT '',
  `monthlyIncome` VARCHAR(45) NULL COMMENT '',
  `religion` VARCHAR(255) NULL COMMENT '',
  `familyType` INT NULL COMMENT '',
  `birthorder` INT NULL COMMENT '',
  `locality` VARCHAR(255) NULL COMMENT '',
  `address` VARCHAR(255) NULL COMMENT '',
  `mobileno` VARCHAR(15) NULL COMMENT '',
  `phno` VARCHAR(15) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '');


CREATE TABLE IF NOT EXISTS `physiologydb`.`login` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `userId` INT NULL COMMENT '',
  `username` VARCHAR(255) NULL COMMENT '',
  `password` VARCHAR(255) NULL COMMENT '',
  `status` INT NULL COMMENT '',
  `updatedOn` DATE NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '', 
  CONSTRAINT `fk_user_id_login1`
    FOREIGN KEY (`userId`)
    REFERENCES `physiologydb`.`user_detail` (`id`));
    

CREATE TABLE IF NOT EXISTS `physiologydb`.`TestType` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `testName` VARCHAR(255) NULL COMMENT '',
  `description` VARCHAR(255) NULL COMMENT '',
  `status` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '');


CREATE TABLE IF NOT EXISTS `physiologydb`.`questionType` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `type` INT NULL COMMENT '',
  `description` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '');
  
CREATE TABLE IF NOT EXISTS `physiologydb`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `testType` INT NULL COMMENT '',
  `question` VARCHAR(255) NULL COMMENT '',
  `optionType_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `optionType_id`)  COMMENT '',
  INDEX `fk_question_optionType_idx` (`optionType_id` ASC)  COMMENT '',
  CONSTRAINT `fk_question_optionType`
    FOREIGN KEY (`optionType_id`)
    REFERENCES `physiologydb`.`questionType` (`id`));

CREATE TABLE IF NOT EXISTS `physiologydb`.`TestType_has_question` (
  `TestType_id` INT NOT NULL COMMENT '',
  `question_id` INT NOT NULL COMMENT '',
  `question_optionType_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`TestType_id`, `question_id`, `question_optionType_id`)  COMMENT '',
  CONSTRAINT `fk_TestType_has_question_TestType1`
    FOREIGN KEY (`TestType_id`)
    REFERENCES `physiologydb`.`TestType` (`id`),
  CONSTRAINT `fk_TestType_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `physiologydb`.`question` (`id`));
    

CREATE TABLE IF NOT EXISTS `physiologydb`.`answers` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `questionid` INT NULL COMMENT '',
  `description` VARCHAR(255) NULL COMMENT '',
  `score` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_answers_question1_idx` (`questionid` ASC)  COMMENT '',
  CONSTRAINT `fk_answers_question1`
    FOREIGN KEY (`questionid`)
    REFERENCES `physiologydb`.`question` (`id`));


CREATE TABLE IF NOT EXISTS `physiologydb`.`testdetail` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `userid` INT NULL COMMENT '',
  `testtypeid` INT NULL COMMENT '',
  `score` INT NULL COMMENT '',
  `updatedOn` DATE NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_testdetail_TestType1_idx` (`testtypeid` ASC)  COMMENT '',
  CONSTRAINT `fk_testdetail_TestType1`
    FOREIGN KEY (`testtypeid`)
    REFERENCES `physiologydb`.`TestType` (`id`),
  CONSTRAINT `fk_testdetail_userid`
    FOREIGN KEY (`userid`)
    REFERENCES `physiologydb`.`user_detail` (`id`));
    

CREATE TABLE IF NOT EXISTS `physiologydb`.`testHistory` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `testdetail_id` INT NOT NULL COMMENT '',
  `userid` INT NULL COMMENT '',
  `questionId` INT NULL COMMENT '',
  `testTypeId` INT NULL COMMENT '',
  `questionTypeId` INT NULL COMMENT '',
  `selectedTypeId` INT NULL COMMENT '',
  `selectedOptionValue` VARCHAR(255) NULL COMMENT '',
  `optionscore` INT NULL COMMENT '',
  `updatedOn` DATE NULL COMMENT '',
  PRIMARY KEY (`id`, `testdetail_id`)  COMMENT '',
  INDEX `fk_testHistory_testdetail1_idx` (`testdetail_id` ASC)  COMMENT '',
  CONSTRAINT `fk_testHistory_testdetail1`
    FOREIGN KEY (`testdetail_id`)
    REFERENCES `physiologydb`.`testdetail` (`id`),
  CONSTRAINT `fk_testHistory_userdetail`
    FOREIGN KEY (`userid`)
    REFERENCES `physiologydb`.`user_detail` (`id`),
   CONSTRAINT `fk_testHistory_test_type`
    FOREIGN KEY (`testTypeid`)
    REFERENCES `physiologydb`.`TestType` (`id`),
  CONSTRAINT `fk_testHistory_question_type`
    FOREIGN KEY (`questionTypeId`)
    REFERENCES `physiologydb`.`questionType` (`id`)
    );