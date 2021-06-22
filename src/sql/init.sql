CREATE DATABASE mydb;
USE mydb;

CREATE TABLE IF NOT EXISTS `mydb`.`question` (
    `id` INT NOT NULL,
    `class_id` INT NULL,
    `title` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
    `content` TEXT(65535) NULL,
    `tags` VARCHAR(255) NULL,
    `type` INT NOT NULL,
    `create_date` DATE NOT NULL,
    `modified_date` DATE NOT NULL,
    `response_count` INT UNSIGNED ZEROFILL NULL,
    `view_count` INT UNSIGNED ZEROFILL NULL,
    `good_question_count` INT NULL,
    `teacher_ask` CHAR(1) NULL,
    `teacher_answer` CHAR(1) NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
    `id` INT NOT NULL ,
    `name` VARCHAR (50) CHARACTER SET 'utf8' NOT NULL,
    `email` VARCHAR (100) CHARACTER SET 'utf8' NOT NULL,
    `password` CHAR (44) NOT NULL,
    `type` CHAR (1) NOT NULL
    PRIMARY KEY (`id`)
    UNIQUE (`email`)
) ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`answer` (
    `id` INT NOT NULL,
    `question_id` INT NOT NULL,
    `date` DATE NOT NULL,
    `user_id` INT NULL,
    `content` TEXT(65535) NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`class` (
    `id` INT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT(65535) NULL,
    `date_begin` DATE NULL,
    `date_end` DATE NULL,
    `teacher_id` INT NULL,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB
