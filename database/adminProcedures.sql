USE makeupShop;
	
DELIMITER //


DROP PROCEDURE IF EXISTS addCategory;
CREATE PROCEDURE addCategory()
BEGIN
    INSERT INTO category (name) VALUES ("Face creams");   
    INSERT INTO category (name) VALUES ("Foundation");
    INSERT INTO category (name) VALUES ("Eye palettes");
    INSERT INTO category (name) VALUES ("Mascara");
    INSERT INTO category (name) VALUES ("Lipsticks");
    INSERT INTO category (name) VALUES ("Fragrance");
END//

DROP PROCEDURE IF EXISTS addProduct;
CREATE PROCEDURE addProduct()
BEGIN
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Creme Ancienne Soft Cream", "Fresh", "A weightless moisturizer that delivers the supreme nourishment of the original Crème Ancienne with a new velvety whipped texture.", "https://a.cdnsbn.com/images/products/18246499901-1.jpg", 148, 250);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Confidence in a Cream Hydrating Moisturizer", "IT Cosmetics", "An ultra-hydrating, anti-aging face moisturizer that's clinically tested to give your skin a supple, healthier, younger-looking appearance.", "https://i.pinimg.com/736x/3b/be/ed/3bbeedfccc25f61760509e3ea2471cbf.jpg", 48, 300);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "The Silk Cream", "Tatcha", "A rich, weightless gel-cream moisturizer for soft, smooth, lustrous skin.", "https://images-na.ssl-images-amazon.com/images/I/51lpGbkzofL._SL1200_.jpg", 120, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Whipped Argan Oil Face Butter", "Josie Maran", "A lightweight yet luxuriously rich and buttery face cream for instant and abundant hydration.", "https://images-na.ssl-images-amazon.com/images/I/61I2oIztYOL._SY450_.jpg", 42, 500);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "The True Cream Aqua Bomb","Belif","An ultra-lightweight, oil-free gel cream that instantly cools and refreshes skin while providing intensive hydration.", "https://cdn1.sephora.ro/slir/w400//sephora.ro/cs-content/cs-photos/products/original/the-true-cream-aqua-bomb_14137_1_1520007794.jpg", 22, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "GinZing Refreshing Eye Cream to Brighten and Depuff", "Origins", "A refreshing eye cream that visibly brightens the eye area by diminishing the appearance of dark circles and puffiness.", "https://www.b-glowing.com/media/catalog/product/cache/1/thumbnail/600x/17f82f742ffe127f42dca9de82fb58b1/b/g/bg0000000909_1.jpg", 32, 280);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Benefiance Wrinkle Smoothing Day Cream SPF 23", "Shiseido", "An anti-aging moisturizer with SPF 23 that hydrates and visibly corrects wrinkles.", "https://an.cwa.sellercloud.com/images/products/11287411.jpg", 70, 300);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Water Bank Moisture Cream", "Laneige", " A rich moisturizing cream formulated with mineral-rich vegetable extracts to help strengthen skin's moisture barrier for a hydrated, balanced complexion.", "https://m.sephora.com/productimages/sku/s2258770-main-hero.jpg", 38, 310);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (1, "Lotus Youth Preserve Dream Night Cream", "Fresh", "A lightweight night cream powered by the highly potent antioxidant super lotus that supports the skin’s natural barrier and minimize the look of fine lines.", "https://cdn.shopify.com/s/files/1/1265/7867/products/keuosejw0wwg9cha59l4_400x400.jpg?v=1564539484", 48, 270);


    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Double Wear Stay-in-Place Foundation", "Estee Lauder", "A 24-hour liquid foundation with a flawless, natural, matte finish that unifies uneven skin tone and covers imperfections with buildable coverage.", "https://images-na.ssl-images-amazon.com/images/I/611Gh8I7KjL._SY355_.jpg", 43, 400);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Pro Filt'r Soft Matte Longwear Foundation", "FENTY BEAUTY by Rihanna", " A soft matte, long-wear foundation with buildable, medium-to-full coverage, in a boundary-breaking range of 50 shades.", "https://images-na.ssl-images-amazon.com/images/I/61W-Rs7vQjL._SY355_.jpg", 35, 260);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Born This Way Foundation", "Too Faced", "An oil-free foundation that masterfully diffuses the line between makeup and skin with coverage so undetectable, they’ll think you were born this way.", "https://cdn1.sephora.ro/slir/w600//sephora.ro/cs-content/cs-photos/products/original/born-this-way-foundation-fond-de-ten-butter-pecan-30-ml_27081_1_1560936997.jpg", 39, 370);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Luminous Silk Foundation", "Armani Beauty", "An award-winning oil-free foundation that delivers medium buildable coverage and a luminous finish that leaves skin looking naturally flawless.", "https://m.sephora.com/productimages/sku/s2079168-main-Lhero.jpg", 64, 460);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Teint Idole Ultra Long Wear Foundation", "Lancome", "An oil-free, long-wearing, liquid foundation that delivers buildable coverage and leaves a natural-looking, velvety-matte finish for up to 24 hours.", "https://www.sephora.com/productimages/sku/s2169845-main-Lhero.jpg", 47, 540);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Dior Airflash Spray Foundation", "Dior", "An ultra-fluid, water-resistant foundation that blends full coverage with a lightweight formula, providing airbrushed perfection for up to 12 hours.", "https://images-na.ssl-images-amazon.com/images/I/515YvdjYcyL._SY550_.jpg", 62, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Ultra HD Invisible Cover Foundation", "Make up For ever", "An iconic foundation that provides undetectable medium coverage and a blurred, second-skin finish for up to 24 hours, now in 50 shades to match your skin.", "https://images-na.ssl-images-amazon.com/images/I/3104kTwVE8L._SY355_.jpg", 43, 320);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "Stay Naked Weightless Foundation", "Urban Decay", "A vegan, buildable, medium-coverage liquid foundation with a real-skin, matte finish that lasts up to 24 hours.", "https://www.sephora.com/productimages/sku/s2247203-main-Lhero.jpg", 39, 320);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (2, "#FauxFilter Foundation", "Huda Beauty", "A full-coverage cream foundation in 30 shades that visibly conceals blemishes and imperfections to create a flawless, airbrushed finish.", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkra21HjXaBs_ox0j4a9oqUpS6Eg5c8JbZy7RaarveFJgPb1Gv&usqp=CAU", 40, 400);


    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "The New Nude Eyeshadow Palette", "Huda Beauty", "A game-changing palette that reinvents nude with revolutionary textures and colors.", "https://images-na.ssl-images-amazon.com/images/I/71J5QgyHlRL._SY355_.jpg", 65, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Obsessions Eyeshadow Palette", "Huda Beauty", "A range of compact eyeshadow palettes, expertly curated by Huda herself, offering beauty lovers a complete day-to-night eye color wardrobe.", "https://m.sephora.com/productimages/sku/s2137230-main-zoom.jpg", 27, 250);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Moroccan Spice Eyeshadow Palette", "FENTY BEAUTY by Rihanna", "A palette of 16 long-wearing Moroccan-inspired shades ranging from matte to shimmer finishes—perfect for spicing up your look in limitless ways.", "https://www.temptalia.com/wp-content/uploads/2018/07/fenty-beauty_moroccan-spice_001_palette-760x760.jpg", 27, 250);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Natural Eyes Eyeshadow Palette", "Too Faced", "A bestselling collection of nine naturally gorgeous matte and shimmer shadows.", "https://images-na.ssl-images-amazon.com/images/I/81nkyzveojL._SX466_.jpg", 38, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Naked Heat Eyeshadow Palette", "Urban Decay", "An eyeshadow palette with amber neutrals, featuring silky mattes, smooth shimmers, and sparkling metallics for smoldering beauty looks.", "https://www.temptalia.com/wp-content/uploads/2017/06/urban-decay_naked-heat_001_palette-760x625.jpg", 27, 300);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Eye Color Quad Eyeshadow Palette", "Tom Ford", "A palette with four coordinated eyeshadows in sparkling to matte finishes designed to create soft to bold iconic TOM FORD eye looks.", "https://i.pinimg.com/originals/08/91/05/0891058cf5127df08368b56a89d9064e.jpg", 88, 50);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Just Peachy Mattes Eyeshadow Palette - Peaches", "Too Faced", "A long-wearing eyeshadow palette with 12 highly-pigmented, matte hues for endless eye looks.", "https://m.toofaced.com/media/export/cms/products/1000x1000/2f_sku_94044_1000x1000_0.jpg", 45, 140);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Chocolate Bar Eyeshadow Palette", "Too Faced", "A sweetly tempting array of 16 matte and shimmer shadows scented with real chocolate.", "https://images.ulta.com/is/image/Ulta/2268374?op_sharpen=1&resMode=bilin&qlt=85&wid=800&hei=800&fmt=jpg", 49, 130);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (3, "Grande Pro Volume 3 Palette", "Viseart", "A palette that includes 30 matte shades ideal for accenting, highlighting, and creating striking, reflective beauty.", "https://dy6g3i6a1660s.cloudfront.net/DOlYbR0ifxSzxVKJb8brTAR-BH4/p_550x550.jpg", 175, 50);



    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Roller Lash Curling & Lifting Mascara", "Benefit Cosmetics", "A mascara inspired by hair rollers, this super-curling and lifting mascara gives a sexy, wide-eyed look. Its patent-pending Hook ‘n’ Roll™ brush features tiny custom-designed hooks to catch, lift, and curl even short and straight lashes.", "https://images.ulta.com/is/image/Ulta/2285068?op_sharpen=1&resMode=bilin&qlt=85&wid=800&hei=800&fmt=jpg", 25, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "They're Real! Lengthening & Volumizing Mascara", "Benefit Cosmetics", "A lengthening mascara that curls, volumizes, lifts, and separates lashes for an out-of-here look.", "https://images-na.ssl-images-amazon.com/images/I/61aaKQVodeL._SX425_.jpg", 25, 240);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Damn Girl! 24-Hour Mascara", "Too Faced", "A high-intensity mascara for maximum drama and lift with revolutionary, creamy-mousse formula for extreme volume without a heavy feel.", "https://www.sephora.com/productimages/sku/s2234649-main-Lhero.jpg", 25, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Diorshow Iconic Overcurl Mascara", "Dior", "A revolutionary mascara with a curved brush that offers spectacular volume and curling power.", "https://www.sephora.com/productimages/sku/s1497940-main-Lhero.jpg", 29, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Go Big or Go Home Mascara", "Kat Von D", "An extreme-volume, vegan mascara that’s smudge-resistant, long-wearing, and powered by plant-based fats.", "https://images-na.ssl-images-amazon.com/images/I/71-5vswhyGL._SY355_.jpg", 23, 200);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (4, "Smokey Eye Mascara", "Bobby Brown", "A kohl-pigmented mascara that delivers instant volume and super-saturated length for dramatically dark, stretched-out lashes.", "https://s1.thcdn.com/productimg/1600/1600/11512176-9334503175086087.jpg", 31, 80);


    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Lip Maestro Liquid Lipstick", "Armani Beauty", "A hydrating matte liquid lipstick that delivers intense, velvety color with a rich and creamy texture, for lips that feel as luxurious as they look.","https://www.giorgioarmanibeauty-usa.com/on/demandware.static/-/Sites-armani-us-Library/default/dw20b34659/geography-mapping/3614272742536.jpg", 38, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Everlasting Liquid Lipstick", "Kat Von D", "A long-wear, high-pigment liquid lipstick with a smooth, matte finish and all-day, lightweight comfort.", "https://s12emagst.akamaized.net/products/25977/25976684/images/res_4214c9259471158d45d75472fbe537ee_full.jpg", 20, 150);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Le Rouge Lipstick", "Givenchy", "A full-coverage, long-wearing, matte-to-semi-matte lipstick encased in genuine leather.", "https://cdn2.jomashop.com/media/catalog/product/g/i/givenchy---le-rouge-lipstick-_304_-mandarine-bolero-.12-oz-_3.4-ml_-givels11.jpg", 38, 80);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Liquid Matte Lipstick", "Huda Beauty", "A highly comfortable, long wear liquid lipstick that dries matte with intense color pay-off and transfer-proof properties.", "https://images-static.nykaa.com/media/catalog/product/tr:h-800,w-800,cm-pad_resize/6/2/6291106030778.jpg", 20, 130);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Mattemoiselle Plush Matte Lipstick", "FENTY BEAUTY by Rihanna", "An ultra-slim lipstick with a long-wearing, petal-soft matte finish, created in a rainbow of weightless, color-intense shades designed to flatter all skin tones.", "https://images-na.ssl-images-amazon.com/images/I/61i8MhtJZ4L._SY355_.jpg", 18, 170);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Vinyl Cream Lip Stain", "Yves Saint Laurent", "A high-impact lip stain that gives up to 10 hours of rich, creamy color, superior comfort, and ultimate shine that won’t feather or fade.", "https://cosbar-ecomitizellc.netdna-ssl.com/media/catalog/product/cache/1/image/480x480/9df78eab33525d08d6e5fb8d27136e95/webp00152003-w.jpg", 37, 60);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Extreme Lip Spark Lipstick", "Tom Ford", "An ultra-gliding, metallic, sequin-like lipstick that imparts explosive color with the look of loose glitter on lips.", "https://i.pinimg.com/originals/43/d6/18/43d6181bc7e1f32c384694efd0ad80fa.jpg", 55, 50);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Power Bullet Matte Lipstick - Throwback Collection", "Huda Beauty", "A lipstick that combines unrivalled pigmentation with superior comfort and smooth, full-coverage payoff in just one swipe.", "https://m.sephora.com/productimages/sku/s2198661-main-Lhero.jpg", 25, 170);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (5, "Crushed Liquid Lipstick", "Bobby Brown", "A lip color with the look of a liquid lipstick, the comfortable feel of a balm, and the plumped-up sheen of a gloss.", "https://images-na.ssl-images-amazon.com/images/I/71u5SEI7RBL._SX466_.jpg", 27, 90);

    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Black Orchid", "Tom Ford", "Bottled in fluted, black-glass, Black Orchid makes an unforgettable statement of iconic style and worldly glamour.", "https://s12emagst.akamaized.net/products/3665/3664071/images/res_ddca35489a6a3c05058b708d3f88462e_full.jpg", 128, 70);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "CANDY Eau de Parfum", "Prada", "Prada Candy is a fragrance with a novel olfactory balance combining exceptionally high-quality ingredients in excessive proportions. Magnified by white musks, noble benzoin comes together with a modern caramel accord to give the fragrance a truly unique signature.", "https://www.fragrancedirect.co.uk/dw/image/v2/BBNB_PRD/on/demandware.static/-/Sites-fragrance-master-catalog/default/dwb1d03f1d/images/large/0036201.jpg?sw=340&sh=340&sm=fit", 126, 90);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Mon Paris Eau de Parfum", "Yves Saint Laurent", "Yves Saint Laurent introduces a new sparkling fragrance inspired by Paris, the city of intense love. Red berries and pear immediately exude sensuality and femininity. The exotic white datura flower, the soul of the fragrance, embodies desire and seduces the senses.", "https://fimgs.net/mdimg/perfume/375x500.38914.jpg", 97, 100);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "J'adore Eau de Parfum", "Dior", "The ultimate expression of femininity and luxury. This eau de parfum opens with the exotic, floral-fruity notes of ylang-ylang. Damascus Rose and a duo of jasmines—jasmine grandiflorum and Indian jasmine sambac—exude a seductive warmth. It is sensual without being too heavy, floral yet mysterious. A confident signature to celebrate your feminine allure.", "https://media.douglas.ro/media/image/08/e4/4b/DIOR-J-E2-80-99adoreRjM2oRR2Bpghf_600x600.jpg", 105, 70);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Flora By Gucci - Gorgeous Gardenia", "Gucci", "A sumptuous white floral Gorgeous Gardenia is Gucci’s faithful creation of the perfect gardenia. The Gorgeous Gardenia woman exudes a sultry sensuality that is lushly enticing. Men are drawn to her as bees are to a blossoming flower.", "http://demo.summercart.ro/userfiles/productlargeimages/product_2259.jpg", 80, 50);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Light Blue Eau Intense", "Dolce&Gabbana", "The fragrance opens with a sharp, addictive duo of scents: luminous lemon and crisp Granny Smith apple. With its fruity and floral facets, elegant marigold blends this accord into the heart notes—a wave of glowing, heady jasmine petals. The signature trail of lustrous amber woods and precious musk melts into sunkissed skin and unfurls into a vibrant, sensuously scented wake.", "https://fimgs.net/mdimg/perfume/375x500.44034.jpg", 110, 60);
    INSERT INTO product (categoryId, name, brand, description, picture, price, stock) VALUES (6, "Daisy Love Eau So Sweet", "Marc Jacobs Fragrances", "This fragrance boasts notes of sparkling white raspberries to reveal a lustrous personality, while a soft floral airiness and delicate musk immerse you in the sweetness of the moment.", "https://a.cdnsbn.com/images/products/23787178406.jpg", 86, 80);




END//

