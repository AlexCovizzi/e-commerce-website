-- MySQL Script generated by MySQL Workbench
-- 06/20/17 17:12:22
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `is_admin` TINYINT(1) NOT NULL DEFAULT 0,
  `is_blocked` TINYINT(1) NOT NULL DEFAULT 0,
  `fl_active` VARCHAR(1) NOT NULL DEFAULT 'S',
  `timestamp_c` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp alla creazione',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Publisher` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `fl_active` VARCHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Book` (
  `isbn` VARCHAR(13) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NULL,
  `pages` INT UNSIGNED NULL,
  `price` DECIMAL(6,2) UNSIGNED NOT NULL,
  `publication_date` DATE NULL,
  `language` VARCHAR(45) NOT NULL,
  `stock` INT UNSIGNED NOT NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp alla creazione',
  `coverURI` VARCHAR(100) NULL,
  `fl_active` VARCHAR(1) NOT NULL DEFAULT 'S',
  `publisher_id` INT NULL,
  PRIMARY KEY (`isbn`, `publisher_id`),
  INDEX `fk_Book_Publisher1_idx` (`publisher_id` ASC),
  CONSTRAINT `fk_Book_Publisher1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `mydb`.`Publisher` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genre` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `fl_active` VARCHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Author` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `fl_active` VARCHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Coupon` (
  `code` CHAR(15) NOT NULL,
  `valid` TINYINT(1) NOT NULL DEFAULT 1,
  `discount` INT NOT NULL DEFAULT 0,
  `timestamp_c` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp alla creazione',
  `fl_active` VARCHAR(1) NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tot_price` DECIMAL(6,2) UNSIGNED NOT NULL,
  `shipping_cost` DECIMAL(6,2) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `coupon_code` CHAR(15) NULL,
  `receiver_name` VARCHAR(45) NOT NULL,
  `add1` VARCHAR(45) NOT NULL,
  `add2` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `cap` VARCHAR(45) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp alla creazione',
  `fl_active` VARCHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`),
  INDEX `fk_Order_User1_idx` (`user_id` ASC),
  INDEX `fk_Order_Coupon1_idx` (`coupon_code` ASC),
  CONSTRAINT `fk_Order_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Coupon1`
    FOREIGN KEY (`coupon_code`)
    REFERENCES `mydb`.`Coupon` (`code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order_has_Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order_has_Book` (
  `book_isbn` VARCHAR(13) NOT NULL,
  `order_id` INT NOT NULL,
  `quantity` INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`book_isbn`, `order_id`),
  INDEX `fk_Order_Book1_idx` (`book_isbn` ASC),
  INDEX `fk_OrderBook_Order1_idx` (`order_id` ASC),
  CONSTRAINT `fk_Order_Book1`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `mydb`.`Book` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_OrderBook_Order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`Order` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book_has_Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Book_has_Genre` (
  `book_isbn` VARCHAR(13) NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`book_isbn`, `genre_id`),
  INDEX `fk_Book_has_Genre_Genre1_idx` (`genre_id` ASC),
  INDEX `fk_Book_has_Genre_Book1_idx` (`book_isbn` ASC),
  CONSTRAINT `fk_Book_has_Genre_Book1`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `mydb`.`Book` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Book_has_Genre_Genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `mydb`.`Genre` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book_has_Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Book_has_Author` (
  `book_isbn` VARCHAR(13) NOT NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`book_isbn`, `author_id`),
  INDEX `fk_Book_has_Author_Author1_idx` (`author_id` ASC),
  INDEX `fk_Book_has_Author_Book1_idx` (`book_isbn` ASC),
  CONSTRAINT `fk_Book_has_Author_Book1`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `mydb`.`Book` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Book_has_Author_Author1`
    FOREIGN KEY (`author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Wishlist_Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Wishlist_Book` (
  `user_id` INT NOT NULL,
  `book_isbn` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`user_id`, `book_isbn`),
  INDEX `fk_User_has_Book_Book1_idx` (`book_isbn` ASC),
  INDEX `fk_User_has_Book_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_User_has_Book_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_User_has_Book_Book1`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `mydb`.`Book` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BookHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BookHistory` (
  `user_id` INT NOT NULL,
  `book_isbn` VARCHAR(13) NOT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `book_isbn`),
  INDEX `fk_User_has_Book_Book2_idx` (`book_isbn` ASC),
  INDEX `fk_User_has_Book_User2_idx` (`user_id` ASC),
  CONSTRAINT `fk_User_has_Book_User2`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_User_has_Book_Book2`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `mydb`.`Book` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ShoppingCart_Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ShoppingCart_Book` (
  `user_id` INT NOT NULL,
  `book_isbn` VARCHAR(13) NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`, `book_isbn`),
  INDEX `fk_ShoppingCart_has_Book_Book1_idx` (`book_isbn` ASC),
  INDEX `fk_ShoppingCart_has_Book_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_ShoppingCart_has_Book_Book1`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `mydb`.`Book` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ShoppingCart_has_Book_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vote` (
  `user_id` INT NOT NULL,
  `book_isbn` VARCHAR(13) NOT NULL,
  `thumb_up` TINYINT(1) NOT NULL,
  `comment` VARCHAR(500) NULL,
  `timestamp_c` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fl_active` VARCHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`user_id`, `book_isbn`),
  INDEX `fk_User_has_Book_Book3_idx` (`book_isbn` ASC),
  INDEX `fk_User_has_Book_User3_idx` (`user_id` ASC),
  CONSTRAINT `fk_User_has_Book_User3`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_User_has_Book_Book3`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `mydb`.`Book` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`BookView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BookView` (`isbn` INT, `title` INT, `description` INT, `pages` INT, `price` INT, `publication_date` INT, `language` INT, `name` INT, `stock` INT, `vote` INT, `n_votes` INT, `coverUri` INT, `timestamp` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`BookVote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BookVote` (`book_isbn` INT, `thumbs_up` INT, `thumbs_down` INT, `total` INT, `vote` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`BookAuthor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BookAuthor` (`book_isbn` INT, `a_name` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`BookGenre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BookGenre` (`book_isbn` INT, `g_name` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`BookPublisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BookPublisher` (`book_isbn` INT, `p_name` INT);

-- -----------------------------------------------------
-- View `mydb`.`BookView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BookView`;
USE `mydb`;
CREATE  OR REPLACE VIEW `BookView` AS
SELECT B.isbn, B.title, B.description, B.pages, B.price, B.publication_date, B.language, P.name as publisher_name, B.stock, BV.vote, BV.total as n_votes, B.coverUri, B.timestamp
FROM Book as B
LEFT JOIN BookVote as BV ON BV.book_isbn = B.isbn 
JOIN Publisher as P ON B.publisher_id = P.id
WHERE B.fl_active = 'S' AND P.fl_active = 'S';

-- -----------------------------------------------------
-- View `mydb`.`BookVote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BookVote`;
USE `mydb`;
CREATE  OR REPLACE VIEW `BookVote` AS
SELECT book_isbn, SUM(thumb_up = 1) as thumbs_up, SUM(thumb_up = 0) as thumbs_down, COUNT(*) as total, AVG(thumb_up=0) as vote
FROM Vote
GROUP BY book_isbn;

-- -----------------------------------------------------
-- View `mydb`.`BookAuthor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BookAuthor`;
USE `mydb`;
CREATE  OR REPLACE VIEW `BookAuthor` AS
SELECT book_isbn, name as a_name FROM Book_has_Author, Author
WHERE id = author_id AND fl_active = 'S';

-- -----------------------------------------------------
-- View `mydb`.`BookGenre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BookGenre`;
USE `mydb`;
CREATE  OR REPLACE VIEW `BookGenre` AS
SELECT book_isbn, name as g_name FROM Book_has_Genre, Genre
WHERE id = genre_id AND fl_active = 'S';

-- -----------------------------------------------------
-- View `mydb`.`BookPublisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BookPublisher`;
USE `mydb`;
CREATE  OR REPLACE VIEW `BookPublisher` AS
SELECT B.isbn as book_isbn, P.name as p_name FROM Book as B, Publisher as P
WHERE B.publisher_id = P.id AND P.fl_active = 'S' AND B.fl_active = 'S';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
