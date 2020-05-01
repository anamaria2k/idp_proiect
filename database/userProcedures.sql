USE makeupShop;
	
DELIMITER //

DROP PROCEDURE IF EXISTS getCategoryName//
CREATE PROCEDURE getCategoryName()
BEGIN
    SELECT * FROM category order by name;
END//

DROP PROCEDURE IF EXISTS findProducts//
CREATE PROCEDURE findProducts(IN id int(11))
BEGIN
    SELECT * FROM product WHERE categoryId = id order by price;
END//

DROP PROCEDURE IF EXISTS findEmail//
CREATE PROCEDURE findEmail(IN mail varchar(200), OUT counter int)
BEGIN
    SET counter = numberOfMails(mail);
END//

DROP PROCEDURE IF EXISTS verifyAccount//
CREATE PROCEDURE verifyAccount(IN mail varchar(200), IN pass varchar(200), OUT counter int)
BEGIN
    SELECT count(*) into counter FROM user WHERE email = mail and password = pass;
END//

DROP PROCEDURE IF EXISTS getUserId//
CREATE PROCEDURE getUserId(IN mail varchar(200))
BEGIN
    SELECT userId FROM user WHERE email = mail;
END//

DROP PROCEDURE IF EXISTS getUserDetails//
CREATE PROCEDURE getUserDetails(IN id int)
BEGIN
    SELECT firstName, lastName FROM user WHERE userId = id;
END//

DROP PROCEDURE IF EXISTS insertUser//
CREATE PROCEDURE insertUser(IN fN varchar(200), IN lN varchar(200), IN mail varchar(200), IN addr text, IN mob varchar(200), IN psw varchar(200))
BEGIN
    INSERT INTO user (firstName, lastName, email, address, mobile, password) VALUES (fN, lN, mail, addr, mob, psw); 
END//

DROP PROCEDURE IF EXISTS addToCart//
CREATE PROCEDURE addToCart(IN productId1 int, IN noPieces1 int, IN sessionId1 varchar(200))
BEGIN
	DECLARE name1 varchar(200);
	DECLARE brand1 varchar(200);
	DECLARE picture1 varchar(1000);
	DECLARE price1 decimal(10,2);
	DECLARE counter int;
	set counter = 0;

	SELECT count(*) into counter FROM cart_details WHERE productId = productId1 and sessionId = sessionId1;

	IF  counter = 0 THEN 	
		SELECT name, brand, picture, price into name1, brand1, picture1, price1 FROM product WHERE productId=productId1 limit 1;
		INSERT INTO cart_details (productId, name, brand, picture, price, noPieces, sessionId) VALUES (productId1, name1, brand1, picture1, price1, noPieces1, sessionId1);
	ELSE
		UPDATE cart_details SET noPieces = noPieces1 WHERE productId = productId1 and sessionId = sessionId1;
	END IF;
   
END//

DROP PROCEDURE IF EXISTS getCartDetails//
CREATE PROCEDURE getCartDetails(IN sessionId1 varchar(200))
BEGIN

	SELECT * FROM cart_details WHERE sessionId = sessionId1;
   

END//

DROP PROCEDURE IF EXISTS getTotalPriceCart//
CREATE PROCEDURE getTotalPriceCart(IN sessionId1 varchar(200), OUT totalSum decimal(10,2))
BEGIN

	SELECT sum(price * noPieces) into totalSum FROM cart_details WHERE sessionId = sessionId1;
   

END//


DROP PROCEDURE IF EXISTS finishOrder//
CREATE PROCEDURE finishOrder(IN userId1 int, IN sessionId1 varchar(200))
BEGIN
	DECLARE orderId1 int;


	CALL getTotalPriceCart(sessionId1,@total1);
	INSERT INTO order_details (userId, sessionId, total, orderDate) VALUES (userId1, sessionId1, @total1, NOW());
	SELECT orderId into orderId1 FROM order_details WHERE sessionId = sessionId1;
	UPDATE cart_details SET orderId = orderId1 WHERE sessionId = sessionId1;

END//

DROP PROCEDURE IF EXISTS deleteItemCart//
CREATE PROCEDURE deleteItemCart(IN itemId1 int)
BEGIN

	DELETE FROM cart_details where itemId = itemId1;

END//

DROP FUNCTION IF EXISTS numberOfMails//
CREATE FUNCTION numberOfMails (mail varchar(200)) RETURNS int
BEGIN
	DECLARE counter int;
	SELECT count(*) into counter from user where email=mail;
	return counter;
END//

DROP TRIGGER IF EXISTS updateStock//
CREATE TRIGGER updateStock AFTER INSERT ON order_details
FOR EACH ROW
BEGIN

	DECLARE lastSession varchar(200);

	SET @lastSession = (SELECT sessionID FROM order_details ORDER BY orderId DESC LIMIT 1);
	update product,cart_details set product.stock = product.stock - cart_details.noPieces where product.productId = cart_details.productId and cart_details.sessionId = @lastSession;
END//




