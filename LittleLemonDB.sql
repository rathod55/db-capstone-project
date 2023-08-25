-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customer` (
  `CUSTOMER_ID` INT NOT NULL,
  `FNAME` VARCHAR(45) NULL,
  `LNAME` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `GENDER` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `TABLE_ID` INT NOT NULL,
  `DATETIME` DATETIME NOT NULL,
  `NO_OF_GUESTS` INT NULL,
  `Customer_CUSTOMER_ID` INT NOT NULL,
  PRIMARY KEY (`TABLE_ID`),
  INDEX `fk_Bookings_Customer_idx` (`Customer_CUSTOMER_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customer`
    FOREIGN KEY (`Customer_CUSTOMER_ID`)
    REFERENCES `LittleLemonDB`.`Customer` (`CUSTOMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `STAFF_ID` INT NOT NULL,
  `STAFF_ROLE` VARCHAR(45) NOT NULL,
  `STAFF_SALARY` FLOAT NOT NULL,
  `STAFF_NAME` VARCHAR(45) NULL,
  `STAFF_EMAIL` VARCHAR(45) NULL,
  `STAFF_GENDER` VARCHAR(45) NULL,
  PRIMARY KEY (`STAFF_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MENU_ID` INT NOT NULL,
  `Staff_STAFF_ID` INT NOT NULL,
  PRIMARY KEY (`MENU_ID`),
  INDEX `fk_Menu_Staff1_idx` (`Staff_STAFF_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Staff1`
    FOREIGN KEY (`Staff_STAFF_ID`)
    REFERENCES `LittleLemonDB`.`Staff` (`STAFF_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `ORDERS_ID` INT NOT NULL,
  `DATETIME` DATETIME NULL,
  `QUANTITY` INT NULL,
  `UNIT_PRICE` FLOAT NULL,
  `TOTAL_PRICE` FLOAT NULL,
  `Customer_CUSTOMER_ID` INT NOT NULL,
  `Menu_MENU_ID` INT NOT NULL,
  PRIMARY KEY (`ORDERS_ID`),
  INDEX `fk_Orders_Customer1_idx` (`Customer_CUSTOMER_ID` ASC) VISIBLE,
  INDEX `fk_Orders_Menu1_idx` (`Menu_MENU_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customer1`
    FOREIGN KEY (`Customer_CUSTOMER_ID`)
    REFERENCES `LittleLemonDB`.`Customer` (`CUSTOMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Menu1`
    FOREIGN KEY (`Menu_MENU_ID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MENU_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Order_Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Order_Delivery_Status` (
  `DELIVERY_ID` INT NOT NULL,
  `STATUS` VARCHAR(45) NOT NULL,
  `ADDRESS` VARCHAR(45) NULL,
  `Orders_ORDERS_ID` INT NOT NULL,
  PRIMARY KEY (`DELIVERY_ID`, `Orders_ORDERS_ID`),
  INDEX `fk_Order_Delivery_Status_Orders1_idx` (`Orders_ORDERS_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Delivery_Status_Orders1`
    FOREIGN KEY (`Orders_ORDERS_ID`)
    REFERENCES `LittleLemonDB`.`Orders` (`ORDERS_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Food_Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Food_Item` (
  `FOOD_ID` INT NOT NULL,
  `FOOD_NAME` VARCHAR(45) NOT NULL,
  `FOOD_COST` VARCHAR(45) NOT NULL,
  `Menu_MENU_ID` INT NOT NULL,
  PRIMARY KEY (`FOOD_ID`, `Menu_MENU_ID`),
  INDEX `fk_Food_Item_Menu1_idx` (`Menu_MENU_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Food_Item_Menu1`
    FOREIGN KEY (`Menu_MENU_ID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MENU_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
