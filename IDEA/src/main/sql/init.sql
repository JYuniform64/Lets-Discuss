CREATE DATABASE mydb;
USE mydb;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
                                              `id` INT NOT NULL ,
                                              `name` VARCHAR (50) CHARACTER SET 'utf8' NOT NULL,
                                              `email` VARCHAR (100) CHARACTER SET 'utf8' NOT NULL,
                                              `password` CHAR (44) NOT NULL,
                                              `type` INT NOT NULL,
                                              PRIMARY KEY (`id`),
                                              UNIQUE (`email`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`class` (
                                              `id` INT NOT NULL,
                                              `name` VARCHAR(100) NOT NULL,
                                              `description` TEXT(65535) NULL,
                                              `date_begin` DATE NULL,
                                              `date_end` DATE NULL,
                                              `teacher_id` INT NULL,
                                              PRIMARY KEY (`id`),
                                              FOREIGN KEY (`teacher_id`) REFERENCES users (id))
    ENGINE = InnoDB;

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
                                                 `teacher_ask` BIT NULL,
                                                 `teacher_answer` BIT NULL,
                                                 PRIMARY KEY (`id`),
                                                 FOREIGN KEY (`class_id`) REFERENCES class(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`answer` (
                                               `id` INT NOT NULL,
                                               `question_id` INT NOT NULL,
                                               `date` DATE NOT NULL,
                                               `user_id` INT NULL,
                                               `content` TEXT(65535) NULL,
                                               PRIMARY KEY (`id`),
                                               FOREIGN KEY (`question_id`) REFERENCES question (id)
) ENGINE = InnoDB;

INSERT INTO users VALUE (1232312, 'LI', 'aa@g.com', 'T58QswTP6bKxH8sTh/aU4Y8I6jWMfp9WdDTTrWy9f8Q=', 1);
INSERT INTO users VALUE (12312, 'LIM', 'a@g.com', 'T58QswTP6bKxH8sTh/aU4Y8I6jWMfp9WdDTTrWy9f8Q=', 0);
INSERT INTO class VALUE (12313, 'MYCLASS', 'SOMETHING', '2020-01-02', '2020-01-03', 12312);

INSERT INTO question VALUE (23948238, 12313, 'SICP', '(define a 10)', 'programming', 0, '2021-02-03', '2021-03-02', 0, 10, 1, false, false);

INSERT INTO answer VALUE (1238321, 23948238, '2021-03-02', 12313, 'sdfasdfjkasfsalfdjdsirencs');