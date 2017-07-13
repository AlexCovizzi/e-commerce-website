/* Parametri: oggi, meseScorso */

SELECT order_id, created, book_isbn, COUNT(*) AS n 
FROM OrderView 
JOIN Order_has_Book  ON ( order_id = id  )
WHERE ( created >= 'meseScorso'  )
	AND ( created < 'oggi'  )
GROUP BY book_isbn 
ORDER BY n  LIMIT 9  ;

-- -----------------------------------------------------
-- View `mydb`.`OrderView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OrderView`;
USE `mydb`;
CREATE  OR REPLACE VIEW `OrderView` AS
SELECT O.id, O.user_id, U.name AS user_name, U.surname AS user_surname, O.created, O.tot_price,
O.shipping_cost, O.state, O.coupon_code, O.receiver_name, O.add1, O.add2, O.city,
O.province, O.country,  O.cap
FROM Orders as O
JOIN User as U ON U.id = O.user_id
WHERE O.fl_active = 'S';