CREATE VIEW `supplier_list` AS
    select 
        `products`.`item_name` AS `item_name`,
        `products`.`product_image` AS `product_image`,
        `products`.`alt_tag` AS `alt_tag`,
        `products`.`paypal` AS `paypal`,
        `source_farms`.`farm_name` AS `farm_name`
    from
        `products`,`source_farms` WHERE `products`.`id_source_farms` = `source_farms`.`id_source_farms`