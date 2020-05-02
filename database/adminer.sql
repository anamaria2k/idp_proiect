-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DELIMITER ;;

DROP FUNCTION IF EXISTS `numberOfMails`;;
CREATE DEFINER=`root`@`localhost` FUNCTION `numberOfMails`(mail varchar(200)) RETURNS int(11)
BEGIN
    DECLARE counter int;
    SELECT count(*) into counter from user where email=mail;
    return counter;
END;;

DROP PROCEDURE IF EXISTS `addCategory`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCategory`()
BEGIN
    INSERT INTO category (name) VALUES ("Face creams");   
    INSERT INTO category (name) VALUES ("Foundation");
    INSERT INTO category (name) VALUES ("Eye palettes");
    INSERT INTO category (name) VALUES ("Mascara");
    INSERT INTO category (name) VALUES ("Lipsticks");
    INSERT INTO category (name) VALUES ("Fragrance");
END;;

DROP PROCEDURE IF EXISTS `addNewCategory`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewCategory`(IN name1 varchar(200))
BEGIN
    INSERT INTO category (name) VALUES (name1);
END;;

DROP PROCEDURE IF EXISTS `addNewProduct`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewProduct`(IN categ int, IN prodname varchar(200), IN brand1 varchar(200), IN descr text, IN pict varchar(1000), IN price1 int, IN stock1 int)
BEGIN
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock)
    VALUES (categ, prodname, brand1, descr, pict, price1, stock1);
END;;

DROP PROCEDURE IF EXISTS `addProduct`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addProduct`()
BEGIN
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Creme Ancienne Soft Cream", "Fresh", "A weightless moisturizer that delivers the supreme nourishment of the original CrÃ¨me Ancienne with a new velvety whipped texture.", "https://a.cdnsbn.com/images/products/18246499901-1.jpg", 148, 250);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Confidence in a Cream Hydrating Moisturizer", "IT Cosmetics", "An ultra-hydrating, anti-aging face moisturizer that's clinically tested to give your skin a supple, healthier, younger-looking appearance.", "https://i.pinimg.com/736x/3b/be/ed/3bbeedfccc25f61760509e3ea2471cbf.jpg", 48, 300);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "The Silk Cream", "Tatcha", "A rich, weightless gel-cream moisturizer for soft, smooth, lustrous skin.", "https://images-na.ssl-images-amazon.com/images/I/51lpGbkzofL._SL1200_.jpg", 120, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Whipped Argan Oil Face Butter", "Josie Maran", "A lightweight yet luxuriously rich and buttery face cream for instant and abundant hydration.", "https://images-na.ssl-images-amazon.com/images/I/61I2oIztYOL._SY450_.jpg", 42, 500);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "The True Cream Aqua Bomb","Belif","An ultra-lightweight, oil-free gel cream that instantly cools and refreshes skin while providing intensive hydration.", "https://cdn1.sephora.ro/slir/w400//sephora.ro/cs-content/cs-photos/products/original/the-true-cream-aqua-bomb_14137_1_1520007794.jpg", 22, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "GinZing Refreshing Eye Cream to Brighten and Depuff", "Origins", "A refreshing eye cream that visibly brightens the eye area by diminishing the appearance of dark circles and puffiness.", "https://cdn.shopify.com/s/files/1/0124/7789/0619/products/OGX0100086-000-00.jpg?v=1552094062", 32, 280);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Benefiance Wrinkle Smoothing Day Cream SPF 23", "Shiseido", "An anti-aging moisturizer with SPF 23 that hydrates and visibly corrects wrinkles.", "https://an.cwa.sellercloud.com/images/products/11287411.jpg", 70, 300);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Water Bank Moisture Cream", "Laneige", " A rich moisturizing cream formulated with mineral-rich vegetable extracts to help strengthen skin's moisture barrier for a hydrated, balanced complexion.", "https://m.sephora.com/productimages/sku/s2258770-main-hero.jpg", 38, 310);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Lotus Youth Preserve Dream Night Cream", "Fresh", "A lightweight night cream powered by the highly potent antioxidant super lotus that supports the skinâ€™s natural barrier and minimize the look of fine lines.", "https://cdn.shopify.com/s/files/1/1265/7867/products/keuosejw0wwg9cha59l4_400x400.jpg?v=1564539484", 48, 270);


    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Double Wear Stay-in-Place Foundation", "Estee Lauder", "A 24-hour liquid foundation with a flawless, natural, matte finish that unifies uneven skin tone and covers imperfections with buildable coverage.", "https://images-na.ssl-images-amazon.com/images/I/611Gh8I7KjL._SY355_.jpg", 43, 400);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Pro Filt'r Soft Matte Longwear Foundation", "FENTY BEAUTY by Rihanna", " A soft matte, long-wear foundation with buildable, medium-to-full coverage, in a boundary-breaking range of 50 shades.", "https://images-na.ssl-images-amazon.com/images/I/61W-Rs7vQjL._SY355_.jpg", 35, 260);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Born This Way Foundation", "Too Faced", "An oil-free foundation that masterfully diffuses the line between makeup and skin with coverage so undetectable, theyâ€™ll think you were born this way.", "https://cdn1.sephora.ro/slir/w600//sephora.ro/cs-content/cs-photos/products/original/born-this-way-foundation-fond-de-ten-butter-pecan-30-ml_27081_1_1560936997.jpg", 39, 370);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Luminous Silk Foundation", "Armani Beauty", "An award-winning oil-free foundation that delivers medium buildable coverage and a luminous finish that leaves skin looking naturally flawless.", "https://m.sephora.com/productimages/sku/s2079168-main-Lhero.jpg", 64, 460);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Teint Idole Ultra Long Wear Foundation", "Lancome", "An oil-free, long-wearing, liquid foundation that delivers buildable coverage and leaves a natural-looking, velvety-matte finish for up to 24 hours.", "https://www.sephora.com/productimages/sku/s2169845-main-Lhero.jpg", 47, 540);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Dior Airflash Spray Foundation", "Dior", "An ultra-fluid, water-resistant foundation that blends full coverage with a lightweight formula, providing airbrushed perfection for up to 12 hours.", "https://images-na.ssl-images-amazon.com/images/I/515YvdjYcyL._SY550_.jpg", 62, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Ultra HD Invisible Cover Foundation", "Make up For ever", "An iconic foundation that provides undetectable medium coverage and a blurred, second-skin finish for up to 24 hours, now in 50 shades to match your skin.", "https://images-na.ssl-images-amazon.com/images/I/3104kTwVE8L._SY355_.jpg", 43, 320);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Stay Naked Weightless Foundation", "Urban Decay", "A vegan, buildable, medium-coverage liquid foundation with a real-skin, matte finish that lasts up to 24 hours.", "https://www.sephora.com/productimages/sku/s2247203-main-Lhero.jpg", 39, 320);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "#FauxFilter Foundation", "Huda Beauty", "A full-coverage cream foundation in 30 shades that visibly conceals blemishes and imperfections to create a flawless, airbrushed finish.", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkra21HjXaBs_ox0j4a9oqUpS6Eg5c8JbZy7RaarveFJgPb1Gv&usqp=CAU", 40, 400);


    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "The New Nude Eyeshadow Palette", "Huda Beauty", "A game-changing palette that reinvents nude with revolutionary textures and colors.", "https://images-na.ssl-images-amazon.com/images/I/71J5QgyHlRL._SY355_.jpg", 65, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Obsessions Eyeshadow Palette", "Huda Beauty", "A range of compact eyeshadow palettes, expertly curated by Huda herself, offering beauty lovers a complete day-to-night eye color wardrobe.", "https://m.sephora.com/productimages/sku/s2137230-main-zoom.jpg", 27, 250);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Moroccan Spice Eyeshadow Palette", "FENTY BEAUTY by Rihanna", "A palette of 16 long-wearing Moroccan-inspired shades ranging from matte to shimmer finishesâ€”perfect for spicing up your look in limitless ways.", "https://www.temptalia.com/wp-content/uploads/2018/07/fenty-beauty_moroccan-spice_001_palette-760x760.jpg", 27, 250);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Natural Eyes Eyeshadow Palette", "Too Faced", "A bestselling collection of nine naturally gorgeous matte and shimmer shadows.", "https://images-na.ssl-images-amazon.com/images/I/81nkyzveojL._SX466_.jpg", 38, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Naked Heat Eyeshadow Palette", "Urban Decay", "An eyeshadow palette with amber neutrals, featuring silky mattes, smooth shimmers, and sparkling metallics for smoldering beauty looks.", "https://www.temptalia.com/wp-content/uploads/2017/06/urban-decay_naked-heat_001_palette-760x625.jpg", 27, 300);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Eye Color Quad Eyeshadow Palette", "Tom Ford", "A palette with four coordinated eyeshadows in sparkling to matte finishes designed to create soft to bold iconic TOM FORD eye looks.", "https://i.pinimg.com/originals/08/91/05/0891058cf5127df08368b56a89d9064e.jpg", 88, 50);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Just Peachy Mattes Eyeshadow Palette - Peaches", "Too Faced", "A long-wearing eyeshadow palette with 12 highly-pigmented, matte hues for endless eye looks.", "https://m.toofaced.com/media/export/cms/products/1000x1000/2f_sku_94044_1000x1000_0.jpg", 45, 140);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Chocolate Bar Eyeshadow Palette", "Too Faced", "A sweetly tempting array of 16 matte and shimmer shadows scented with real chocolate.", "https://images.ulta.com/is/image/Ulta/2268374?op_sharpen=1&resMode=bilin&qlt=85&wid=800&hei=800&fmt=jpg", 49, 130);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Grande Pro Volume 3 Palette", "Viseart", "A palette that includes 30 matte shades ideal for accenting, highlighting, and creating striking, reflective beauty.", "https://dy6g3i6a1660s.cloudfront.net/DOlYbR0ifxSzxVKJb8brTAR-BH4/p_550x550.jpg", 175, 50);



    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Roller Lash Curling & Lifting Mascara", "Benefit Cosmetics", "A mascara inspired by hair rollers, this super-curling and lifting mascara gives a sexy, wide-eyed look. Its patent-pending Hook â€˜nâ€™ Rollâ„¢ brush features tiny custom-designed hooks to catch, lift, and curl even short and straight lashes.", "https://images.ulta.com/is/image/Ulta/2285068?op_sharpen=1&resMode=bilin&qlt=85&wid=800&hei=800&fmt=jpg", 25, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "They're Real! Lengthening & Volumizing Mascara", "Benefit Cosmetics", "A lengthening mascara that curls, volumizes, lifts, and separates lashes for an out-of-here look.", "https://images-na.ssl-images-amazon.com/images/I/61aaKQVodeL._SX425_.jpg", 25, 240);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Damn Girl! 24-Hour Mascara", "Too Faced", "A high-intensity mascara for maximum drama and lift with revolutionary, creamy-mousse formula for extreme volume without a heavy feel.", "https://www.sephora.com/productimages/sku/s2234649-main-Lhero.jpg", 25, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Diorshow Iconic Overcurl Mascara", "Dior", "A revolutionary mascara with a curved brush that offers spectacular volume and curling power.", "https://www.sephora.com/productimages/sku/s1497940-main-Lhero.jpg", 29, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Go Big or Go Home Mascara", "Kat Von D", "An extreme-volume, vegan mascara thatâ€™s smudge-resistant, long-wearing, and powered by plant-based fats.", "https://images-na.ssl-images-amazon.com/images/I/71-5vswhyGL._SY355_.jpg", 23, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Smokey Eye Mascara", "Bobby Brown", "A kohl-pigmented mascara that delivers instant volume and super-saturated length for dramatically dark, stretched-out lashes.", "https://s1.thcdn.com/productimg/1600/1600/11512176-9334503175086087.jpg", 31, 80);


    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Lip Maestro Liquid Lipstick", "Armani Beauty", "A hydrating matte liquid lipstick that delivers intense, velvety color with a rich and creamy texture, for lips that feel as luxurious as they look.","https://www.giorgioarmanibeauty-usa.com/on/demandware.static/-/Sites-armani-us-Library/default/dw20b34659/geography-mapping/3614272742536.jpg", 38, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Everlasting Liquid Lipstick", "Kat Von D", "A long-wear, high-pigment liquid lipstick with a smooth, matte finish and all-day, lightweight comfort.", "https://s12emagst.akamaized.net/products/25977/25976684/images/res_4214c9259471158d45d75472fbe537ee_full.jpg", 20, 150);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Le Rouge Lipstick", "Givenchy", "A full-coverage, long-wearing, matte-to-semi-matte lipstick encased in genuine leather.", "https://cdn2.jomashop.com/media/catalog/product/g/i/givenchy---le-rouge-lipstick-_304_-mandarine-bolero-.12-oz-_3.4-ml_-givels11.jpg", 38, 80);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Liquid Matte Lipstick", "Huda Beauty", "A highly comfortable, long wear liquid lipstick that dries matte with intense color pay-off and transfer-proof properties.", "https://images-static.nykaa.com/media/catalog/product/tr:h-800,w-800,cm-pad_resize/6/2/6291106030778.jpg", 20, 130);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Mattemoiselle Plush Matte Lipstick", "FENTY BEAUTY by Rihanna", "An ultra-slim lipstick with a long-wearing, petal-soft matte finish, created in a rainbow of weightless, color-intense shades designed to flatter all skin tones.", "https://images-na.ssl-images-amazon.com/images/I/61i8MhtJZ4L._SY355_.jpg", 18, 170);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Vinyl Cream Lip Stain", "Yves Saint Laurent", "A high-impact lip stain that gives up to 10 hours of rich, creamy color, superior comfort, and ultimate shine that wonâ€™t feather or fade.", "https://cosbar-ecomitizellc.netdna-ssl.com/media/catalog/product/cache/1/image/480x480/9df78eab33525d08d6e5fb8d27136e95/webp00152003-w.jpg", 37, 60);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Extreme Lip Spark Lipstick", "Tom Ford", "An ultra-gliding, metallic, sequin-like lipstick that imparts explosive color with the look of loose glitter on lips.", "https://i.pinimg.com/originals/43/d6/18/43d6181bc7e1f32c384694efd0ad80fa.jpg", 55, 50);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Power Bullet Matte Lipstick - Throwback Collection", "Huda Beauty", "A lipstick that combines unrivalled pigmentation with superior comfort and smooth, full-coverage payoff in just one swipe.", "https://m.sephora.com/productimages/sku/s2198661-main-Lhero.jpg", 25, 170);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Crushed Liquid Lipstick", "Bobby Brown", "A lip color with the look of a liquid lipstick, the comfortable feel of a balm, and the plumped-up sheen of a gloss.", "https://images-na.ssl-images-amazon.com/images/I/71u5SEI7RBL._SX466_.jpg", 27, 90);

    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Black Orchid", "Tom Ford", "Bottled in fluted, black-glass, Black Orchid makes an unforgettable statement of iconic style and worldly glamour.", "https://s12emagst.akamaized.net/products/3665/3664071/images/res_ddca35489a6a3c05058b708d3f88462e_full.jpg", 128, 70);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "CANDY Eau de Parfum", "Prada", "Prada Candy is a fragrance with a novel olfactory balance combining exceptionally high-quality ingredients in excessive proportions. Magnified by white musks, noble benzoin comes together with a modern caramel accord to give the fragrance a truly unique signature.", "https://www.fragrancedirect.co.uk/dw/image/v2/BBNB_PRD/on/demandware.static/-/Sites-fragrance-master-catalog/default/dwb1d03f1d/images/large/0036201.jpg?sw=340&sh=340&sm=fit", 126, 90);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Mon Paris Eau de Parfum", "Yves Saint Laurent", "Yves Saint Laurent introduces a new sparkling fragrance inspired by Paris, the city of intense love. Red berries and pear immediately exude sensuality and femininity. The exotic white datura flower, the soul of the fragrance, embodies desire and seduces the senses.", "https://fimgs.net/mdimg/perfume/375x500.38914.jpg", 97, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "J'adore Eau de Parfum", "Dior", "The ultimate expression of femininity and luxury. This eau de parfum opens with the exotic, floral-fruity notes of ylang-ylang. Damascus Rose and a duo of jasminesâ€”jasmine grandiflorum and Indian jasmine sambacâ€”exude a seductive warmth. It is sensual without being too heavy, floral yet mysterious. A confident signature to celebrate your feminine allure.", "https://media.douglas.ro/media/image/08/e4/4b/DIOR-J-E2-80-99adoreRjM2oRR2Bpghf_600x600.jpg", 105, 70);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Flora By Gucci - Gorgeous Gardenia", "Gucci", "A sumptuous white floral Gorgeous Gardenia is Gucciâ€™s faithful creation of the perfect gardenia. The Gorgeous Gardenia woman exudes a sultry sensuality that is lushly enticing. Men are drawn to her as bees are to a blossoming flower.", "https://testershop.ro/2425-large_default/tester-gucci-flora-by-gucci-gorgeous-gardenia-eau-de-toilette-pentru-femei-100-ml.jpg", 80, 50);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Light Blue Eau Intense", "Dolce&Gabbana", "The fragrance opens with a sharp, addictive duo of scents: luminous lemon and crisp Granny Smith apple. With its fruity and floral facets, elegant marigold blends this accord into the heart notesâ€”a wave of glowing, heady jasmine petals. The signature trail of lustrous amber woods and precious musk melts into sunkissed skin and unfurls into a vibrant, sensuously scented wake.", "https://fimgs.net/mdimg/perfume/375x500.44034.jpg", 110, 60);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Daisy Love Eau So Sweet", "Marc Jacobs Fragrances", "This fragrance boasts notes of sparkling white raspberries to reveal a lustrous personality, while a soft floral airiness and delicate musk immerse you in the sweetness of the moment.", "https://a.cdnsbn.com/images/products/23787178406.jpg", 86, 80);




END;;

DROP PROCEDURE IF EXISTS `addToCart`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addToCart`(IN productId1 int, IN noPieces1 int, IN sessionId1 varchar(200))
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
   
END;;

DROP PROCEDURE IF EXISTS `deleteCategory`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteCategory`(IN id int)
BEGIN
    DELETE from category where categoryId = id;
END;;

DROP PROCEDURE IF EXISTS `deleteItemCart`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteItemCart`(IN itemId1 int)
BEGIN

    DELETE FROM cart_details where itemId = itemId1;

END;;

DROP PROCEDURE IF EXISTS `deleteProduct`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteProduct`(IN id int)
BEGIN
    DELETE from product where productId = id;
END;;

DROP PROCEDURE IF EXISTS `findEmail`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findEmail`(IN mail varchar(200), OUT counter int)
BEGIN
    SET counter = numberOfMails(mail);
END;;

DROP PROCEDURE IF EXISTS `findProducts`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findProducts`(IN id int(11))
BEGIN
    SELECT * FROM product WHERE categoryId = id order by price;
END;;

DROP PROCEDURE IF EXISTS `finishOrder`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `finishOrder`(IN userId1 int, IN sessionId1 varchar(200))
BEGIN
    DECLARE orderId1 int;


    CALL getTotalPriceCart(sessionId1,@total1);
    INSERT INTO order_details (userId, sessionId, total, orderDate) VALUES (userId1, sessionId1, @total1, NOW());
    SELECT orderId into orderId1 FROM order_details WHERE sessionId = sessionId1;
    UPDATE cart_details SET orderId = orderId1 WHERE sessionId = sessionId1;

END;;

DROP PROCEDURE IF EXISTS `getAllOrders`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllOrders`()
BEGIN
    select u.firstName, u.lastName, u.email, u.address, u.mobile, o.orderId, o.total, o.orderDate
    from user u, order_details o
    where u.userId = o.userId
    order by o.orderId desc;
END;;

DROP PROCEDURE IF EXISTS `getCartDetails`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCartDetails`(IN sessionId1 varchar(200))
BEGIN

    SELECT * FROM cart_details WHERE sessionId = sessionId1;
   

END;;

DROP PROCEDURE IF EXISTS `getCategoryById`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCategoryById`(IN id int)
BEGIN
    SELECT * from category where categoryId = id;
END;;

DROP PROCEDURE IF EXISTS `getCategoryName`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCategoryName`()
BEGIN
    SELECT * FROM category order by name;
END;;

DROP PROCEDURE IF EXISTS `getProductById`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductById`(IN id int)
BEGIN
    SELECT * from product where productId = id;
END;;

DROP PROCEDURE IF EXISTS `getProducts`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProducts`()
BEGIN
    select c.name, p.productId, p.categoryId, p.name, p.brand, p.description, p.picture, p.price, p.stock
    from category c, product p
    where c.categoryId = p.categoryId;
END;;

DROP PROCEDURE IF EXISTS `getTotalPriceCart`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTotalPriceCart`(IN sessionId1 varchar(200), OUT totalSum decimal(10,2))
BEGIN

    SELECT sum(price * noPieces) into totalSum FROM cart_details WHERE sessionId = sessionId1;
   

END;;

DROP PROCEDURE IF EXISTS `getUserDetails`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserDetails`(IN id int)
BEGIN
    SELECT firstName, lastName FROM user WHERE userId = id;
END;;

DROP PROCEDURE IF EXISTS `getUserId`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserId`(IN mail varchar(200))
BEGIN
    SELECT userId FROM user WHERE email = mail;
END;;

DROP PROCEDURE IF EXISTS `insertUser`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser`(IN fN varchar(200), IN lN varchar(200), IN mail varchar(200), IN addr text, IN mob varchar(200), IN psw varchar(200))
BEGIN
    INSERT INTO user (firstName, lastName, email, address, mobile, password) VALUES (fN, lN, mail, addr, mob, psw); 
END;;

DROP PROCEDURE IF EXISTS `updateCategory`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCategory`(IN id int, IN name1 varchar(200))
BEGIN
    UPDATE category SET name = name1 WHERE categoryId = id;
END;;

DROP PROCEDURE IF EXISTS `updateProduct`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProduct`(IN id int, IN categ int, IN prodname varchar(200), IN brand1 varchar(200), IN descr text, IN pict varchar(1000), IN price1 int, IN stock1 int)
BEGIN
    UPDATE product
    SET categoryId = categ, name = prodname, brand = brand1,
        description = descr, picture = pict, price = price1, stock = stock1
    WHERE productId = id;
END;;

DROP PROCEDURE IF EXISTS `verifyAccount`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verifyAccount`(IN mail varchar(200), IN pass varchar(200), OUT counter int)
BEGIN
    SELECT count(*) into counter FROM user WHERE email = mail and password = pass;
END;;

DELIMITER ;

DROP TABLE IF EXISTS `cart_details`;
CREATE TABLE `cart_details` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `picture` varchar(1000) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `noPieces` int(11) DEFAULT NULL,
  `sessionId` varchar(100) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `cart_details_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order_details` (`orderId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `category` (`categoryId`, `name`) VALUES
(1, 'Face creams'),
(2, 'Foundation'),
(3, 'Eye palettes'),
(4, 'Mascara'),
(5, 'Lipsticks'),
(6, 'Fragrance');

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `sessionId` varchar(100) DEFAULT NULL,
  `total` int(10) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DELIMITER ;;

CREATE TRIGGER `updateStock` AFTER INSERT ON `order_details` FOR EACH ROW
BEGIN

    DECLARE lastSession varchar(200);

    SET @lastSession = (SELECT sessionID FROM order_details ORDER BY orderId DESC LIMIT 1);
    update product,cart_details set product.stock = product.stock - cart_details.noPieces where product.productId = cart_details.productId and cart_details.sessionId = @lastSession;
END;;

DELIMITER ;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `description` text,
  `picture` varchar(1000) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `product` (`productId`, `categoryId`, `name`, `brand`, `description`, `picture`, `price`, `stock`) VALUES
(1, 1,  'Creme Ancienne Soft Cream',    'Fresh',    'A weightless moisturizer that delivers the supreme nourishment of the original CrÃ¨me Ancienne with a new velvety whipped texture.',   'https://a.cdnsbn.com/images/products/18246499901-1.jpg',   148,    250),
(2, 1,  'Confidence in a Cream Hydrating Moisturizer',  'IT Cosmetics', 'An ultra-hydrating, anti-aging face moisturizer that\'s clinically tested to give your skin a supple, healthier, younger-looking appearance.', 'https://i.pinimg.com/736x/3b/be/ed/3bbeedfccc25f61760509e3ea2471cbf.jpg',  48, 300),
(3, 1,  'The Silk Cream',   'Tatcha',   'A rich, weightless gel-cream moisturizer for soft, smooth, lustrous skin.',    'https://images-na.ssl-images-amazon.com/images/I/51lpGbkzofL._SL1200_.jpg',    120,    100),
(4, 1,  'Whipped Argan Oil Face Butter',    'Josie Maran',  'A lightweight yet luxuriously rich and buttery face cream for instant and abundant hydration.',    'https://images-na.ssl-images-amazon.com/images/I/61I2oIztYOL._SY450_.jpg', 42, 500),
(5, 1,  'The True Cream Aqua Bomb', 'Belif',    'An ultra-lightweight, oil-free gel cream that instantly cools and refreshes skin while providing intensive hydration.',    'https://cdn1.sephora.ro/slir/w400//sephora.ro/cs-content/cs-photos/products/original/the-true-cream-aqua-bomb_14137_1_1520007794.jpg', 22, 200),
(6, 1,  'GinZing Refreshing Eye Cream to Brighten and Depuff',  'Origins',  'A refreshing eye cream that visibly brightens the eye area by diminishing the appearance of dark circles and puffiness.',  'https://cdn.shopify.com/s/files/1/0124/7789/0619/products/OGX0100086-000-00.jpg?v=1552094062', 32, 280),
(7, 1,  'Benefiance Wrinkle Smoothing Day Cream SPF 23',    'Shiseido', 'An anti-aging moisturizer with SPF 23 that hydrates and visibly corrects wrinkles.',   'https://an.cwa.sellercloud.com/images/products/11287411.jpg',  70, 300),
(8, 1,  'Water Bank Moisture Cream',    'Laneige',  ' A rich moisturizing cream formulated with mineral-rich vegetable extracts to help strengthen skin\'s moisture barrier for a hydrated, balanced complexion.',  'https://m.sephora.com/productimages/sku/s2258770-main-hero.jpg',   38, 310),
(9, 1,  'Lotus Youth Preserve Dream Night Cream',   'Fresh',    'A lightweight night cream powered by the highly potent antioxidant super lotus that supports the skinâ€™s natural barrier and minimize the look of fine lines.',   'https://cdn.shopify.com/s/files/1/1265/7867/products/keuosejw0wwg9cha59l4_400x400.jpg?v=1564539484',   48, 270),
(10,    2,  'Double Wear Stay-in-Place Foundation', 'Estee Lauder', 'A 24-hour liquid foundation with a flawless, natural, matte finish that unifies uneven skin tone and covers imperfections with buildable coverage.',   'https://images-na.ssl-images-amazon.com/images/I/611Gh8I7KjL._SY355_.jpg', 43, 400),
(11,    2,  'Pro Filt\'r Soft Matte Longwear Foundation',   'FENTY BEAUTY by Rihanna',  ' A soft matte, long-wear foundation with buildable, medium-to-full coverage, in a boundary-breaking range of 50 shades.',  'https://images-na.ssl-images-amazon.com/images/I/61W-Rs7vQjL._SY355_.jpg', 35, 260),
(12,    2,  'Born This Way Foundation', 'Too Faced',    'An oil-free foundation that masterfully diffuses the line between makeup and skin with coverage so undetectable, theyâ€™ll think you were born this way.', 'https://cdn1.sephora.ro/slir/w600//sephora.ro/cs-content/cs-photos/products/original/born-this-way-foundation-fond-de-ten-butter-pecan-30-ml_27081_1_1560936997.jpg',  39, 370),
(13,    2,  'Luminous Silk Foundation', 'Armani Beauty',    'An award-winning oil-free foundation that delivers medium buildable coverage and a luminous finish that leaves skin looking naturally flawless.',  'https://m.sephora.com/productimages/sku/s2079168-main-Lhero.jpg',  64, 460),
(14,    2,  'Teint Idole Ultra Long Wear Foundation',   'Lancome',  'An oil-free, long-wearing, liquid foundation that delivers buildable coverage and leaves a natural-looking, velvety-matte finish for up to 24 hours.', 'https://www.sephora.com/productimages/sku/s2169845-main-Lhero.jpg',    47, 540),
(15,    2,  'Dior Airflash Spray Foundation',   'Dior', 'An ultra-fluid, water-resistant foundation that blends full coverage with a lightweight formula, providing airbrushed perfection for up to 12 hours.', 'https://images-na.ssl-images-amazon.com/images/I/515YvdjYcyL._SY550_.jpg', 62, 200),
(16,    2,  'Ultra HD Invisible Cover Foundation',  'Make up For ever', 'An iconic foundation that provides undetectable medium coverage and a blurred, second-skin finish for up to 24 hours, now in 50 shades to match your skin.',   'https://images-na.ssl-images-amazon.com/images/I/3104kTwVE8L._SY355_.jpg', 43, 320),
(17,    2,  'Stay Naked Weightless Foundation', 'Urban Decay',  'A vegan, buildable, medium-coverage liquid foundation with a real-skin, matte finish that lasts up to 24 hours.',  'https://www.sephora.com/productimages/sku/s2247203-main-Lhero.jpg',    39, 320),
(18,    2,  '#FauxFilter Foundation',   'Huda Beauty',  'A full-coverage cream foundation in 30 shades that visibly conceals blemishes and imperfections to create a flawless, airbrushed finish.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkra21HjXaBs_ox0j4a9oqUpS6Eg5c8JbZy7RaarveFJgPb1Gv&usqp=CAU',  40, 400),
(19,    3,  'The New Nude Eyeshadow Palette',   'Huda Beauty',  'A game-changing palette that reinvents nude with revolutionary textures and colors.',  'https://images-na.ssl-images-amazon.com/images/I/71J5QgyHlRL._SY355_.jpg', 65, 100),
(20,    3,  'Obsessions Eyeshadow Palette', 'Huda Beauty',  'A range of compact eyeshadow palettes, expertly curated by Huda herself, offering beauty lovers a complete day-to-night eye color wardrobe.',  'https://m.sephora.com/productimages/sku/s2137230-main-zoom.jpg',   27, 250),
(21,    3,  'Moroccan Spice Eyeshadow Palette', 'FENTY BEAUTY by Rihanna',  'A palette of 16 long-wearing Moroccan-inspired shades ranging from matte to shimmer finishesâ€”perfect for spicing up your look in limitless ways.',   'https://www.temptalia.com/wp-content/uploads/2018/07/fenty-beauty_moroccan-spice_001_palette-760x760.jpg', 27, 250),
(22,    3,  'Natural Eyes Eyeshadow Palette',   'Too Faced',    'A bestselling collection of nine naturally gorgeous matte and shimmer shadows.',   'https://images-na.ssl-images-amazon.com/images/I/81nkyzveojL._SX466_.jpg', 38, 200),
(23,    3,  'Naked Heat Eyeshadow Palette', 'Urban Decay',  'An eyeshadow palette with amber neutrals, featuring silky mattes, smooth shimmers, and sparkling metallics for smoldering beauty looks.',  'https://www.temptalia.com/wp-content/uploads/2017/06/urban-decay_naked-heat_001_palette-760x625.jpg',  27, 300),
(24,    3,  'Eye Color Quad Eyeshadow Palette', 'Tom Ford', 'A palette with four coordinated eyeshadows in sparkling to matte finishes designed to create soft to bold iconic TOM FORD eye looks.', 'https://i.pinimg.com/originals/08/91/05/0891058cf5127df08368b56a89d9064e.jpg', 88, 50),
(25,    3,  'Just Peachy Mattes Eyeshadow Palette - Peaches',   'Too Faced',    'A long-wearing eyeshadow palette with 12 highly-pigmented, matte hues for endless eye looks.', 'https://m.toofaced.com/media/export/cms/products/1000x1000/2f_sku_94044_1000x1000_0.jpg',  45, 140),
(26,    3,  'Chocolate Bar Eyeshadow Palette',  'Too Faced',    'A sweetly tempting array of 16 matte and shimmer shadows scented with real chocolate.',    'https://images.ulta.com/is/image/Ulta/2268374?op_sharpen=1&resMode=bilin&qlt=85&wid=800&hei=800&fmt=jpg',  49, 130),
(27,    3,  'Grande Pro Volume 3 Palette',  'Viseart',  'A palette that includes 30 matte shades ideal for accenting, highlighting, and creating striking, reflective beauty.', 'https://dy6g3i6a1660s.cloudfront.net/DOlYbR0ifxSzxVKJb8brTAR-BH4/p_550x550.jpg',   175,    50),
(28,    4,  'Roller Lash Curling & Lifting Mascara',    'Benefit Cosmetics',    'A mascara inspired by hair rollers, this super-curling and lifting mascara gives a sexy, wide-eyed look. Its patent-pending Hook â€˜nâ€™ Rollâ„¢ brush features tiny custom-designed hooks to catch, lift, and curl even short and straight lashes.',  'https://images.ulta.com/is/image/Ulta/2285068?op_sharpen=1&resMode=bilin&qlt=85&wid=800&hei=800&fmt=jpg',  25, 200),
(29,    4,  'They\'re Real! Lengthening & Volumizing Mascara',  'Benefit Cosmetics',    'A lengthening mascara that curls, volumizes, lifts, and separates lashes for an out-of-here look.',    'https://images-na.ssl-images-amazon.com/images/I/61aaKQVodeL._SX425_.jpg', 25, 240),
(30,    4,  'Damn Girl! 24-Hour Mascara',   'Too Faced',    'A high-intensity mascara for maximum drama and lift with revolutionary, creamy-mousse formula for extreme volume without a heavy feel.',   'https://www.sephora.com/productimages/sku/s2234649-main-Lhero.jpg',    25, 200),
(31,    4,  'Diorshow Iconic Overcurl Mascara', 'Dior', 'A revolutionary mascara with a curved brush that offers spectacular volume and curling power.',    'https://www.sephora.com/productimages/sku/s1497940-main-Lhero.jpg',    29, 100),
(32,    4,  'Go Big or Go Home Mascara',    'Kat Von D',    'An extreme-volume, vegan mascara thatâ€™s smudge-resistant, long-wearing, and powered by plant-based fats.',   'https://images-na.ssl-images-amazon.com/images/I/71-5vswhyGL._SY355_.jpg', 23, 200),
(33,    4,  'Smokey Eye Mascara',   'Bobby Brown',  'A kohl-pigmented mascara that delivers instant volume and super-saturated length for dramatically dark, stretched-out lashes.',    'https://s1.thcdn.com/productimg/1600/1600/11512176-9334503175086087.jpg',  31, 80),
(34,    5,  'Lip Maestro Liquid Lipstick',  'Armani Beauty',    'A hydrating matte liquid lipstick that delivers intense, velvety color with a rich and creamy texture, for lips that feel as luxurious as they look.', 'https://www.giorgioarmanibeauty-usa.com/on/demandware.static/-/Sites-armani-us-Library/default/dw20b34659/geography-mapping/3614272742536.jpg',    38, 100),
(35,    5,  'Everlasting Liquid Lipstick',  'Kat Von D',    'A long-wear, high-pigment liquid lipstick with a smooth, matte finish and all-day, lightweight comfort.',  'https://s12emagst.akamaized.net/products/25977/25976684/images/res_4214c9259471158d45d75472fbe537ee_full.jpg', 20, 150),
(36,    5,  'Le Rouge Lipstick',    'Givenchy', 'A full-coverage, long-wearing, matte-to-semi-matte lipstick encased in genuine leather.',  'https://cdn2.jomashop.com/media/catalog/product/g/i/givenchy---le-rouge-lipstick-_304_-mandarine-bolero-.12-oz-_3.4-ml_-givels11.jpg', 38, 80),
(37,    5,  'Liquid Matte Lipstick',    'Huda Beauty',  'A highly comfortable, long wear liquid lipstick that dries matte with intense color pay-off and transfer-proof properties.',   'https://images-static.nykaa.com/media/catalog/product/tr:h-800,w-800,cm-pad_resize/6/2/6291106030778.jpg', 20, 130),
(38,    5,  'Mattemoiselle Plush Matte Lipstick',   'FENTY BEAUTY by Rihanna',  'An ultra-slim lipstick with a long-wearing, petal-soft matte finish, created in a rainbow of weightless, color-intense shades designed to flatter all skin tones.',    'https://images-na.ssl-images-amazon.com/images/I/61i8MhtJZ4L._SY355_.jpg', 18, 170),
(39,    5,  'Vinyl Cream Lip Stain',    'Yves Saint Laurent',   'A high-impact lip stain that gives up to 10 hours of rich, creamy color, superior comfort, and ultimate shine that wonâ€™t feather or fade.',  'https://cosbar-ecomitizellc.netdna-ssl.com/media/catalog/product/cache/1/image/480x480/9df78eab33525d08d6e5fb8d27136e95/webp00152003-w.jpg',   37, 60),
(40,    5,  'Extreme Lip Spark Lipstick',   'Tom Ford', 'An ultra-gliding, metallic, sequin-like lipstick that imparts explosive color with the look of loose glitter on lips.',    'https://i.pinimg.com/originals/43/d6/18/43d6181bc7e1f32c384694efd0ad80fa.jpg', 55, 50),
(41,    5,  'Power Bullet Matte Lipstick - Throwback Collection',   'Huda Beauty',  'A lipstick that combines unrivalled pigmentation with superior comfort and smooth, full-coverage payoff in just one swipe.',   'https://m.sephora.com/productimages/sku/s2198661-main-Lhero.jpg',  25, 170),
(42,    5,  'Crushed Liquid Lipstick',  'Bobby Brown',  'A lip color with the look of a liquid lipstick, the comfortable feel of a balm, and the plumped-up sheen of a gloss.', 'https://images-na.ssl-images-amazon.com/images/I/71u5SEI7RBL._SX466_.jpg', 27, 90),
(43,    6,  'Black Orchid', 'Tom Ford', 'Bottled in fluted, black-glass, Black Orchid makes an unforgettable statement of iconic style and worldly glamour.',   'https://s12emagst.akamaized.net/products/3665/3664071/images/res_ddca35489a6a3c05058b708d3f88462e_full.jpg',   128,    70),
(44,    6,  'CANDY Eau de Parfum',  'Prada',    'Prada Candy is a fragrance with a novel olfactory balance combining exceptionally high-quality ingredients in excessive proportions. Magnified by white musks, noble benzoin comes together with a modern caramel accord to give the fragrance a truly unique signature.', 'https://www.fragrancedirect.co.uk/dw/image/v2/BBNB_PRD/on/demandware.static/-/Sites-fragrance-master-catalog/default/dwb1d03f1d/images/large/0036201.jpg?sw=340&sh=340&sm=fit',    126,    90),
(45,    6,  'Mon Paris Eau de Parfum',  'Yves Saint Laurent',   'Yves Saint Laurent introduces a new sparkling fragrance inspired by Paris, the city of intense love. Red berries and pear immediately exude sensuality and femininity. The exotic white datura flower, the soul of the fragrance, embodies desire and seduces the senses.',    'https://fimgs.net/mdimg/perfume/375x500.38914.jpg',    97, 100),
(46,    6,  'J\'adore Eau de Parfum',   'Dior', 'The ultimate expression of femininity and luxury. This eau de parfum opens with the exotic, floral-fruity notes of ylang-ylang. Damascus Rose and a duo of jasminesâ€”jasmine grandiflorum and Indian jasmine sambacâ€”exude a seductive warmth. It is sensual without being too heavy, floral yet mysterious. A confident signature to celebrate your feminine allure.',  'https://media.douglas.ro/media/image/08/e4/4b/DIOR-J-E2-80-99adoreRjM2oRR2Bpghf_600x600.jpg',  105,    70),
(47,    6,  'Flora By Gucci - Gorgeous Gardenia',   'Gucci',    'A sumptuous white floral Gorgeous Gardenia is Gucciâ€™s faithful creation of the perfect gardenia. The Gorgeous Gardenia woman exudes a sultry sensuality that is lushly enticing. Men are drawn to her as bees are to a blossoming flower.',  'https://testershop.ro/2425-large_default/tester-gucci-flora-by-gucci-gorgeous-gardenia-eau-de-toilette-pentru-femei-100-ml.jpg',   80, 50),
(48,    6,  'Light Blue Eau Intense',   'Dolce&Gabbana',    'The fragrance opens with a sharp, addictive duo of scents: luminous lemon and crisp Granny Smith apple. With its fruity and floral facets, elegant marigold blends this accord into the heart notesâ€”a wave of glowing, heady jasmine petals. The signature trail of lustrous amber woods and precious musk melts into sunkissed skin and unfurls into a vibrant, sensuously scented wake.',  'https://fimgs.net/mdimg/perfume/375x500.44034.jpg',    110,    60),
(49,    6,  'Daisy Love Eau So Sweet',  'Marc Jacobs Fragrances',   'This fragrance boasts notes of sparkling white raspberries to reveal a lustrous personality, while a soft floral airiness and delicate musk immerse you in the sweetness of the moment.',  'https://a.cdnsbn.com/images/products/23787178406.jpg', 86, 80);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` text,
  `mobile` varchar(200) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2020-05-02 10:02:23
