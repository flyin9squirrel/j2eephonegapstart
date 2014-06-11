SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `source_farms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `source_farms` (
  `id_source_farms` INT NOT NULL AUTO_INCREMENT,
  `farm_name` VARCHAR(90) NULL,
  PRIMARY KEY (`id_source_farms`))
  ENGINE = InnoDB;
INSERT IGNORE INTO source_farms(id_source_farms, farm_name) VALUES
(1, 'Wingfield Farms'),
(2, 'Glendale Farms'),
(3, 'Van Egland Farms'),
(4, 'Luigi Family Farm'),
(5, 'Avonlea Farms');

-- -----------------------------------------------------
-- Table `products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products` (
  `id_products` INT NOT NULL AUTO_INCREMENT,
  `id_source_farms` INT NOT NULL,
  `item_name` VARCHAR(45) NULL,
  `quantity_on_hand` INT NULL,
  `in_season` TINYINT(1) NULL,
  `product_image` VARCHAR(255) NULL,
  `alt_tag` VARCHAR(255) NULL,
  `paypal` VARCHAR(255) NULL,
  PRIMARY KEY (`id_products`),
  INDEX `fk_products_source_farms_idx` (`id_source_farms` ASC),
  CONSTRAINT `fk_products_source_farms`
    FOREIGN KEY (`id_source_farms`)
    REFERENCES `source_farms` (`id_source_farms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT IGNORE INTO products(id_products, id_source_farms, item_name, quantity_on_hand, in_season, product_image, alt_tag, paypal) VALUES
(1, 1, 'Tomato', 300, true, 'img/flickr_Ross_Elliott_tomato.jpg', 'Tomato (Photo by Ross Elliott of Flickr)', 'paypal/tomato.html'),
(2, 2, 'Corn', 400, true, 'img/flickr_Michael_Dorausch_corn.jpg', 'Corn (Photo by Michael Dorausch of Flickr)', 'paypal/corn.html'),
(3, 3, 'Broccoli', 250, true, 'img/flickr_arbyreed_broccoli.jpg', 'Broccoli (Photo by arbyreed of Flickr)', 'paypal/broccoli.html'),
(4, 4, 'Carrot', 100, true, 'img/flickr_Jeremy_Keith_carrot.jpg', 'Carrot (Photo by Jeremy Keith of Flickr)', 'paypal/carrot.html'),
(5, 3, 'Cauliflower', 75, true, 'img/flickr_liz_west_cauliflower.jpg', 'Cauliflower (Photo by liz west of Flickr)', 'paypal/cauliflower.html'),
(6, 1, 'Peppers', 50, true, 'img/flickr_torbakhopper_pepper.jpg', 'Peppers (Photo by torbakhopper of Flickr)', 'paypal/pepper.html'),
(7, 5, 'Onion', 80, true, 'img/flickr_Alexandre_Dulaunoy_onion.jpg', 'Onion (Photo by Alexandre Dulaunoy of Flickr)', 'paypal/onion.html'),
(8, 4, 'Radish', 120, true, 'img/flickr_Travis_Truman_radish.jpg', 'Radish (Photo by Travis Truman of Flickr)', 'paypal/radish.html');

-- -----------------------------------------------------
-- Table `quantity_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quantity_price` (
  `id_quantity_price` INT NOT NULL AUTO_INCREMENT,
  `id_products` INT NOT NULL,
  `quantity_desc` VARCHAR(45) NOT NULL,
  `price` DECIMAL(3,2) NOT NULL,
  `list_order` INT NOT NULL,
  PRIMARY KEY (`id_quantity_price`),
  INDEX `fk_quantity_price_products1_idx` (`id_products` ASC),
  CONSTRAINT `fk_quantity_price_products1`
    FOREIGN KEY (`id_products`)
    REFERENCES `products` (`id_products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT IGNORE INTO quantity_price(id_quantity_price, id_products, quantity_desc, price, list_order) VALUES
(1, 1, '1 lb', 1.79, 1),
(2, 1, '2 lbs', 2.99, 2),
(3, 2, '6 ears', 6.50, 1),
(4, 2, '12 ears', 10.00, 2),
(5, 2, '18 ears', 15.00, 3),
(6, 3, '1 ea', 2.99, 1),
(7, 3, '2 ea', 5.49, 2),
(8, 4, '1 lb', 1.69, 1),
(9, 4, '2 lbs', 2.99, 2),
(10, 5, '1 ea', 2.99, 1),
(11, 5, '2 ea', 5.49, 2),
(12, 6, 'Green, 1 lb', 1.79, 1),
(13, 6, 'Red, 1 lb', 3.99, 2),
(14, 6, 'Mixed, 1 lb', 2.99, 3),
(15, 7, '3 lb bag', 3.99, 1),
(16, 7, '6 lb bag', 7.39, 2),
(17, 8, '1 lb', 2.99, 1),
(18, 8, '2 lb', 4.59, 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
