-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: recettes-etudiants
-- ------------------------------------------------------
-- Server version	8.3.0
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!50503 SET NAMES utf8mb4 */
;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;

/*!40103 SET TIME_ZONE='+00:00' */
;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

--
-- Table structure for table `favorites`
--
DROP TABLE IF EXISTS `favorites`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `favorites` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint unsigned NOT NULL,
    `recipe_id` bigint unsigned NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `favorites_user_id_recipe_id_unique` (`user_id`, `recipe_id`),
    KEY `favorites_recipe_id_foreign` (`recipe_id`)
) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `favorites`
--
LOCK TABLES `favorites` WRITE;

/*!40000 ALTER TABLE `favorites` DISABLE KEYS */
;

/*!40000 ALTER TABLE `favorites` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `migrations`
--
DROP TABLE IF EXISTS `migrations`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `migrations` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `batch` int NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `migrations`
--
LOCK TABLES `migrations` WRITE;

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */
;

INSERT INTO
    `migrations`
VALUES
    (1, '2025_04_16_040126_create_recipes_table', 1),
(2, '2025_04_16_045533_create_sessions_table', 1),
(
        3,
        '2025_04_17_151352_add_details_to_recipes_table',
        1
    ),
(4, '2025_05_02_013205_create_users_table', 1),
(5, '2025_05_02_013628_create_favorites_table', 1),
(
        6,
        '2025_05_02_055142_add_spoonacular_id_to_recipes_table',
        2
    );

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `recipes`
--
DROP TABLE IF EXISTS `recipes`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `recipes` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `spoonacular_id` bigint DEFAULT NULL,
    `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `prep_time` int NOT NULL,
    `cost` decimal(8, 2) NOT NULL,
    `difficulty` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `ingredients` json NOT NULL,
    `steps` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_vegetarian` tinyint(1) NOT NULL DEFAULT '0',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `recipes_spoonacular_id_unique` (`spoonacular_id`)
) ENGINE = MyISAM AUTO_INCREMENT = 61 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `recipes`
--
LOCK TABLES `recipes` WRITE;

/*!40000 ALTER TABLE `recipes` DISABLE KEYS */
;

INSERT INTO
    `recipes`
VALUES
    (
        1,
        645419,
        'Green Beans With Roasted Walnuts and Sweet Cranberries',
        'Green Beans With Roasted Walnuts and Sweet Cranberries could be just the gluten free, dairy free, paleolithic, and primal recipe you\'ve been looking for. One serving contains 88 calories, 5g of protein, and 4g of fat. For 54 cents per serving, this recipe covers 7% of your daily requirements of vitamins and minerals. This recipe serves 8. 3 people have tried and liked this recipe. Christmas will be even more special with this recipe. Head to the store and pick up kosher salt and pepper, roasted,',
        45,
        0.54,
        'difficile',
        '[{\"id\": 1102047, \"name\": \"kosher salt and pepper\", \"unit\": \"servings\", \"amount\": 8, \"original\": \"kosher salt and pepper\"}, {\"id\": 11052, \"name\": \"green beans\", \"unit\": \"pounds\", \"amount\": 1.5, \"original\": \"1 1/2 pounds green beans, trimmed\"}, {\"id\": 1034053, \"name\": \"olive oil\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons extra-virgin olive oil\"}, {\"id\": 10010225, \"name\": \"roasted\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup roasted, unsalted mixed nuts, (I used walnuts)\"}, {\"id\": 9079, \"name\": \"cranberries\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup dried cranberries\"}]',
        'Étape 1: Bring a large pot of water to a boil.\n\nÉtape 2: Add 1 tablespoon salt and the green beans and\n\nÉtape 3: Cook until tender, 4 to 6 minutes.\n\nÉtape 4: Meanwhile, in a large bowl, combine the oil, nuts, and cranberries.\n\nÉtape 5: Drain the green beans and transfer them to the bowl.\n\nÉtape 6: Add 1/2 teaspoon salt and 1/4 teaspoon pepper and toss to coat.\n\nÉtape 7: Serve warm or at room temperature.',
        'https://img.spoonacular.com/recipes/645419-556x370.jpg',
        0,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        2,
        640990,
        'Cuban Flank Steak With Avocado and Tomato Salad',
        'The recipe Cuban Flank Steak With Avocado and Tomato Salad can be made in about 45 minutes. One portion of this dish contains approximately 57g of protein, 85g of fat, and a total of 1163 calories. For $11.27 per serving, this recipe covers 57% of your daily requirements of vitamins and minerals. This recipe serves 1. It is brought to you by Foodista. 2 people have made this recipe and would make it again. It is a good option if you\'re following a gluten free, dairy free, paleolithic, and primal',
        45,
        11.27,
        'difficile',
        '[{\"id\": 4053, \"name\": \"¼ olive oil\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"cup ¼ olive oil\"}, {\"id\": 9160, \"name\": \"¼ lime juice\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"cup ¼ fresh lime juice\"}, {\"id\": 9206, \"name\": \"orange juice\", \"unit\": \"Tbs\", \"amount\": 2, \"original\": \"2 tbs orange juice\"}, {\"id\": 10211215, \"name\": \"garlic cloves\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 garlic cloves\"}, {\"id\": 14412, \"name\": \"water\", \"unit\": \"Tbs\", \"amount\": 2, \"original\": \"2 tbs water\"}, {\"id\": 1002014, \"name\": \"½ cumin\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"teaspoon ½ cumin\"}, {\"id\": 2047, \"name\": \"½ salt\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"teaspoon ½ salt\"}, {\"id\": 1002030, \"name\": \"½ pepper\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"teaspoon ½ black pepper\"}, {\"id\": 2027, \"name\": \"½ oregano\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"teaspoon ½ dried oregano\"}, {\"id\": 11165, \"name\": \"hand full of cilantro\", \"unit\": \"serving\", \"amount\": 1, \"original\": \"Hand full of fresh cilantro\"}, {\"id\": 23657, \"name\": \"flank steak\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 flank steak\"}, {\"id\": 9037, \"name\": \"avocado\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 avocado, chopped\"}, {\"id\": 11529, \"name\": \"tomato\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 tomato, chopped\"}, {\"id\": 10011282, \"name\": \"onion\", \"unit\": \"Tbs\", \"amount\": 4, \"original\": \"4 tbs finely chopped red onion\"}]',
        'Étape 1: Place all of the Mojo Sauce ingredients in a small food processor, or blender.  I have a Bullet which I love and is perfect for making the mojo sauce.\n\nÉtape 2: Place the flank steak in a zip lock bag or shallow dish.\n\nÉtape 3: Add the sauce; l let marinate in refrigerator for 2 hour to overnight.\n\nÉtape 4: Remove the flank steak from the marinade; place remaining marinade in saucepan.\n\nÉtape 5: Let steak stand at room temperature for 30 minutes.\n\nÉtape 6: Grill the flank steak to your desired doneness.  As you can see from the picture, we like ours on the rare side.\n\nÉtape 7: Let the cooked steak stand for 10 minutes before thinly slicing across the grain.\n\nÉtape 8: Bring the marinade in the saucepan to a boil.\n\nÉtape 9: Let it cook for several minutes; it will begin to thicken.\n\nÉtape 10: Place the avocado, tomato and onion into a bowl.\n\nÉtape 11: Add the heated mojo sauce to the salad.\n\nÉtape 12: Serve on the side of the steak, or on top.  Your preference.',
        'https://img.spoonacular.com/recipes/640990-556x370.jpg',
        0,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        3,
        649062,
        'Korean Perilla Pesto',
        'Korean Perilla Pesto is a gluten free, dairy free, paleolithic, and lacto ovo vegetarian condiment. This recipe serves 8. One portion of this dish contains approximately 1g of protein, 10g of fat, and a total of 96 calories. For 74 cents per serving, this recipe covers 4% of your daily requirements of vitamins and minerals. From preparation to the plate, this recipe takes approximately 45 minutes. 5 people found this recipe to be tasty and satisfying. This recipe is typical of Korean cuisine. Th',
        45,
        0.74,
        'difficile',
        '[{\"id\": 12023, \"name\": \"pack of sesame leaves\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 pack of fresh sesame leaves, approximately 25 to 30 leaves.\"}, {\"id\": 12147, \"name\": \"pine nuts\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup of pine nuts, toasted in a dry pan until slightly brown\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons minced garlic,\"}, {\"id\": 1034053, \"name\": \"extra virgin olive oil—the best you can afford\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"3/4 cup of extra virgin olive oil—the best you can afford\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon of salt,\"}, {\"id\": 1002030, \"name\": \"pepper\", \"unit\": \"teaspoon\", \"amount\": 0.25, \"original\": \"1/4 teaspoon black pepper\"}]',
        'Étape 1: Put all the ingredients into a food processor and blend everything until it is a smooth paste.\n\nÉtape 2: Toss it in a bowl with some freshly cooked pasta of your choice and serve, garnishing with some leftover pine nuts.',
        'https://img.spoonacular.com/recipes/649062-556x370.jpg',
        1,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        4,
        649403,
        'Lebanese Kibbeh',
        'You can never have too many main course recipes, so give Lebanese Kibbeh a try. This recipe serves 6. One portion of this dish contains roughly 32g of protein, 41g of fat, and a total of 585 calories. For $2.99 per serving, this recipe covers 24% of your daily requirements of vitamins and minerals. From preparation to the plate, this recipe takes roughly 45 minutes. This recipe is typical of middl eastern cuisine. It is brought to you by Foodista. 3 people have made this recipe and would make it',
        45,
        2.99,
        'difficile',
        '[{\"id\": 20012, \"name\": \"bulgur wheat\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"3/4 cup Bulgur wheat\"}, {\"id\": 10017224, \"name\": \"lamb\", \"unit\": \"pound\", \"amount\": 1, \"original\": \"1 pound Finely minced lean lamb, (or beef)\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"large\", \"amount\": 1, \"original\": \"1 large Onion, grated\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon Melted butter\"}, {\"id\": 1002030, \"name\": \"salt & ground pepper\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Salt & fresh ground black pepper, to taste\"}, {\"id\": 2064, \"name\": \"sprg mint\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 sprg mint, for garnish\"}, {\"id\": 4582, \"name\": \"oil\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons Oil\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 Onion, finely chopped\"}, {\"id\": 17224, \"name\": \"lamb\", \"unit\": \"ounces\", \"amount\": 8, \"original\": \"8 ounces Minced lamb or veal\"}, {\"id\": 12147, \"name\": \"pine nuts\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup Pine nuts\"}, {\"id\": 1022001, \"name\": \"ground allspice\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon Ground allspice\"}, {\"id\": 1256, \"name\": \"greek yogurt\", \"unit\": \"cups\", \"amount\": 2.5, \"original\": \"2 1/2 cups Greek yogurt\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"Cloves\", \"amount\": 3, \"original\": \"3 Cloves garlic, crushed\"}, {\"id\": 2064, \"name\": \"mint\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon Chopped fresh mint\"}]',
        'Étape 1: Preheat the oven to 375F degrees. Rinse the bulgur wheat in a sieve and squeeze out the excess moisture.\n\nÉtape 2: Mix the lamb, onion and seasoning, kneading the mixture to make a thick paste.\n\nÉtape 3: Add the bulgur wheat and blend together.\n\nÉtape 4: To make the filling, heat the oil in a frying pan and fry the onion until golden.\n\nÉtape 5: Add the lamb or veal and cook, stirring, until evenly browned and then add the pine nuts, allspice and salt and pepper.\n\nÉtape 6: Oil a large baking dish and spread half of the meat and bulgur wheat mixture over the bottom. Spoon over the filling and top with a second layer of meat and bulgur wheat, pressing down firmly with the back of a spoon.\n\nÉtape 7: Pour the melted butter over the top and then bake on the oven for 40-45 minutes until browned on top.\n\nÉtape 8: Meanwhile make the yogurt dip: Blend together the yogurt and garlic, spoon into a serving bowl and sprinkle with the chopped mint.\n\nÉtape 9: Cut the cooked kibbeh into squares or rectangles and serve garnished with mint and accompanied by rice and the yogurt dip. NOTES The national dish of Syria and the Lebanon in Kibbeh, as kind of meatball made from minced lamp and bulgur wheat. Raw kibbeh is the most widely eaten type, but this version is very popular too.',
        'https://img.spoonacular.com/recipes/649403-556x370.jpg',
        0,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        5,
        650255,
        'Lobster Macaroni and Cheese',
        'Lobster Macaroni and Cheese is a pescatarian main course. One serving contains 800 calories, 34g of protein, and 49g of fat. This recipe serves 6. For $3.81 per serving, this recipe covers 25% of your daily requirements of vitamins and minerals. It is brought to you by Foodista. A mixture of elbow macaroni pasta, cups cheese, flour, and a handful of other ingredients are all it takes to make this recipe so tasty. This recipe is typical of American cuisine. 2 people have made this recipe and woul',
        45,
        3.81,
        'difficile',
        '[{\"id\": 20499, \"name\": \"elbow macaroni pasta\", \"unit\": \"cups\", \"amount\": 3, \"original\": \"3 cups uncooked elbow macaroni pasta\"}, {\"id\": 10015147, \"name\": \"lobster tail pieces\", \"unit\": \"ounces\", \"amount\": 12, \"original\": \"12 ounces lobster tail pieces, fully cooked\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup butter\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup flour\"}, {\"id\": 1077, \"name\": \"milk\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups milk, room temperature\"}, {\"id\": 1041009, \"name\": \"cups cheese\", \"unit\": \"cups\", \"amount\": 4, \"original\": \"4 cups + cups white cheese, shredded (For this recipe, I like to use a combination of w\"}, {\"id\": 1024053, \"name\": \"truffle oil\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup white truffle oil (optional - but why the hell not?)\"}, {\"id\": 18079, \"name\": \"bread crumbs\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup fresh bread crumbs\"}, {\"id\": 1032, \"name\": \"parmesan cheese\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup grated Parmesan cheese\"}]',
        'Étape 1: Cook the macaroni according to package directions; drain. Start the cheese sauce by making a roux: Melt the butter in a heavy-bottomed saucepan over medium-low heat. When melted and foamy, add the flour and whisk together to form a paste.\n\nÉtape 2: Add 1 cup of milk; continue to whisk until mixture is blended and creamy. Start adding the cheese 1 cup at a time, stirring constantly. As the cheese melts, continue to add remaining milk and cheese in 1-cup increments. If the cheese sauce seems too thick for your liking, you can add in more milk as desired - just use small increments and keep stirring.\n\nÉtape 3: Add the white truffle oil once all the cheese and milk have been incorporated. Once the cheese sauce is fully melted',
        'https://img.spoonacular.com/recipes/650255-556x370.jpg',
        0,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        6,
        640634,
        'Creamy Curry Chicken With Yellow Rice',
        'Creamy Curry Chicken With Yellow Rice might be just the Indian recipe you are searching for. Watching your figure? This gluten free, dairy free, lacto ovo vegetarian, and vegan recipe has 335 calories, 4g of protein, and 30g of fat per serving. This recipe serves 3. For $1.23 per serving, this recipe covers 10% of your daily requirements of vitamins and minerals. A couple people made this recipe, and 13 would say it hit the spot. This recipe from Foodista requires olive oil, coconut milk, garam ',
        45,
        1.23,
        'difficile',
        '[{\"id\": 1034053, \"name\": \"olive oil\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons extra-virgin olive oil\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"large\", \"amount\": 1, \"original\": \"1 large onion cut into pieces\"}, {\"id\": 10211215, \"name\": \"garlic cloves\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 garlic cloves minced\"}, {\"id\": 1012014, \"name\": \"ground cumin\", \"unit\": \"teaspoons\", \"amount\": 1.5, \"original\": \"1 1/2 teaspoons ground cumin\"}, {\"id\": 2043, \"name\": \"ground turmeric\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon ground turmeric\"}, {\"id\": 1002013, \"name\": \"ground coriander\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon ground coriander\"}, {\"id\": 93663, \"name\": \"garam masala\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon garam masala\"}, {\"id\": 2021, \"name\": \"ground ginger\", \"unit\": \"pinch\", \"amount\": 1, \"original\": \"1 pinch of ground ginger\"}, {\"id\": 12118, \"name\": \"coconut milk\", \"unit\": \"cups\", \"amount\": 1.25, \"original\": \"1 1/4 cups coconut milk\"}, {\"id\": 11531, \"name\": \"tomatoes\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup canned chopped tomatoes\"}, {\"id\": 9152, \"name\": \"lemon juice\", \"unit\": \"teaspoons\", \"amount\": 2, \"original\": \"2 teaspoons lemon juice\"}, {\"id\": 19334, \"name\": \"brown sugar\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon brown sugar\"}, {\"id\": 20027, \"name\": \"corn starch\", \"unit\": \"teaspoons\", \"amount\": 1.5, \"original\": \"1 1/2 teaspoons corn starch\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"servings\", \"amount\": 3, \"original\": \"salt\"}, {\"id\": 11165, \"name\": \"cilantro\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons chopped fresh cilantro\"}, {\"id\": -1, \"name\": \"wholes\", \"unit\": \"\", \"amount\": 2, \"original\": \"4 wholes (2 split) skinless, boneless chicken breasts cut into 1-inch/2.5cm pieces\"}, {\"id\": -1, \"name\": \"wholes\", \"unit\": \"\", \"amount\": 2, \"original\": \"4 wholes (2 split) skinless, boneless chicken breasts cut into 1-inch/2.5cm pieces\"}]',
        'Étape 1: Heat the olive oil in a large, heavy-bottom pan over medium heat.\n\nÉtape 2: Add the chicken and cook for 6 to 8 minutes, turning frequently, until lightly browned and cooked through.\n\nÉtape 3: Remove from the pan and set aside.\n\nÉtape 4: Add the onion and saut for a few minutes.\n\nÉtape 5: Add the garlic, cumin, turmeric, ground coriander, garam masala, ginger and cook for one minute.\n\nÉtape 6: Mix the corn starch with the coconut milk until smooth. Return the chicken to the pan and stir in the coconut milk, brown sugar and tomatoes. Cook over medium heat and stir for 1 to 2 minutes. Partially cover and cook for 15 more minutes until the sauce has reduced and thickened. Stir in the lemon juice and season with salt.\n\nÉtape 7: Serve the creamy chicken curry on a bed of yellow rice (I use brown rice cooked in water with salt and 1 teaspoon of turmeric) sprinkled with fresh cilantro.',
        'https://img.spoonacular.com/recipes/640634-556x370.jpg',
        1,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        7,
        655174,
        'Peach, Ham and Feta Salad with Fruity Olive Oil Dressing',
        'You can never have too many main course recipes, so give Peach, Ham and Feta Salad with Fruity Olive Oil Dressing a try. This recipe serves 4. One portion of this dish contains roughly 15g of protein, 22g of fat, and a total of 387 calories. For $3.08 per serving, this recipe covers 18% of your daily requirements of vitamins and minerals. From preparation to the plate, this recipe takes roughly 45 minutes. 3 people found this recipe to be flavorful and satisfying. It is a good option if you\'re f',
        45,
        3.08,
        'difficile',
        '[{\"id\": 2048, \"name\": \"cider apple vinegar\", \"unit\": \"tablespoon\", \"amount\": 2, \"original\": \"2 tablespoon cider apple vinegar\"}, {\"id\": 18242, \"name\": \"croûtons\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"croûtons\"}, {\"id\": 1019, \"name\": \"marinated feta\", \"unit\": \"ozs\", \"amount\": 6, \"original\": \"150 gram (6 ozs) marinated feta in oil (oil reserved)\"}, {\"id\": 10151, \"name\": \"parma ham\", \"unit\": \"slices\", \"amount\": 4, \"original\": \"4 thin slices parma ham, or ham\"}, {\"id\": 9236, \"name\": \"peach juice\", \"unit\": \"tablespoon\", \"amount\": 2, \"original\": \"2 tablespoon peach juice\"}, {\"id\": 21052, \"name\": \"mesclun leaves\", \"unit\": \"ozs\", \"amount\": 4, \"original\": \"100 gram (4 ozs) wild mesclun leaves\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"tablespoon\", \"amount\": 2, \"original\": \"2 tablespoon olive oil\"}, {\"id\": 9236, \"name\": \"peaches\", \"unit\": \"pounds\", \"amount\": 2.75, \"original\": \"2 3/4 pounds peaches, halved lengthwise, pitted, and cut into ¾-inch-thick wedges (about 8 cups)\"}, {\"id\": 1102047, \"name\": \"salt and pepper\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"salt and black pepper\"}]',
        'Étape 1: In a small bowl, place 2 tablespoons of the reserved oil from the marinated feta and combine with the olive oil, cider apple vinegar and peach juice. Season with salt and pepper, set aside.Tear the slices of ham into smaller pieces, and then toss them in a large bowl with the mesclun leaves and peaches.\n\nÉtape 2: Place in serving bowls or on plates and drizzle with the dressing, leaving some to one side in a jug if there is too much. Crumble over the feta and scatter the croutons over the top.\n\nÉtape 3: Serve with crusty bread to mop the juices up and chilled white wine.\n\nÉtape 4: Serve the extra dressing on the side if there is any.',
        'https://img.spoonacular.com/recipes/655174-556x370.jpg',
        0,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        8,
        660234,
        'Skirt Steak Fajitas',
        'Skirt Steak Fajitas takes about 45 minutes from beginning to end. This main course has 700 calories, 43g of protein, and 34g of fat per serving. For $4.51 per serving, this recipe covers 36% of your daily requirements of vitamins and minerals. This recipe serves 6. Not a lot of people made this recipe, and 2 would say it hit the spot. It can be enjoyed any time, but it is especially good for valentin day. A mixture of bell peppers, cream, squeezed lime juice, and a handful of other ingredients a',
        45,
        4.51,
        'difficile',
        '[{\"id\": 10211821, \"name\": \"bell peppers\", \"unit\": \"\", \"amount\": 2, \"original\": \"2-3 bell peppers, ends trimmed, cored and seeded, cut into a couple large pieces\"}, {\"id\": 19334, \"name\": \"brown sugar\", \"unit\": \"T\", \"amount\": 2, \"original\": \"2 T. brown sugar\"}, {\"id\": 1014582, \"name\": \"canola oil\", \"unit\": \"c\", \"amount\": 0.33333334, \"original\": \"1/3 c. canola oil\"}, {\"id\": 2009, \"name\": \"chile powder\", \"unit\": \"t\", \"amount\": 1, \"original\": \"1 t. chile powder\"}, {\"id\": 11165, \"name\": \"cilantro\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"cilantro\"}, {\"id\": 1002014, \"name\": \"cumin\", \"unit\": \"t\", \"amount\": 1, \"original\": \"1 t. cumin\"}, {\"id\": 10218364, \"name\": \"flour tortillas\", \"unit\": \"6-inch\", \"amount\": 18, \"original\": \"18 6-inch flour tortillas\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"clove\", \"amount\": 1, \"original\": \"1 clove of garlic, peeled and finely chopped\"}, {\"id\": 9160, \"name\": \"squeezed lime juice\", \"unit\": \"c\", \"amount\": 0.33333334, \"original\": \"1/3 c. fresh squeezed lime juice\"}, {\"id\": 1029159, \"name\": \"lime wedges\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"lime wedges\"}, {\"id\": 6164, \"name\": \"salsa\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"salsa\"}, {\"id\": 23167, \"name\": \"skirt steak\", \"unit\": \"lb\", \"amount\": 2, \"original\": \"about 2 lb. skirt steak\"}, {\"id\": 1056, \"name\": \"cream\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"sour cream\"}, {\"id\": 16124, \"name\": \"soy sauce\", \"unit\": \"c\", \"amount\": 0.33333334, \"original\": \"1/3 c. soy sauce\"}, {\"id\": 10611282, \"name\": \"onion\", \"unit\": \"large\", \"amount\": 1, \"original\": \"1 large white onion, peeled and cut into 1/2-3/4-inch slices (keep the slices intact)\"}]',
        'Étape 1: Whisk together the marinade ingredients in a small bowl. Reserve about 1/3 cup of marinade for the vegetables.\n\nÉtape 2: Place the steak in a gallon-sized ziplock bag.\n\nÉtape 3: Add the remaining marinade. Seal the bag, pressing out any excess air, massage the marinade into the meat a bit. Refrigerate anywhere from 3-10 hours.After meat has finished marinating, remove steak from marinade and wipe off excess marinade with paper towel. (I also cut the steak into a couple of more manageable sized pieces, for easier turning on the grill). brush the vegetables with reserved marinade.\n\nÉtape 4: Heat your grill to high. Scrape the grill grate clean and oil the grate.\n\nÉtape 5: Add the steak to the super hot grill and grill, covered about 2 1/2 minutes per side (for medium/medium-rare), or until steak reaches desired doneness.\n\nÉtape 6: Remove steak to a clean plate and cover with foil &amp; let rest for 10-15 minutes.\n\nÉtape 7: Add the peppers and onions to the grill and grill, turning occasionally until cooked, peppers should take about 5 minutes and onions will take about 1\n\nÉtape 8: Remove from grill. Briefly add the tortillas to the grill, a couple at a time and grill until warmed and lightly charred around the edges. Wrap the tortillas in foil to keep warm.Thinly slice the steak, against the grain. Slice the onions in half and separate the rings. Slice the peppers.\n\nÉtape 9: Serve with the tortillas, lime wedges and toppings of your choice.',
        'https://img.spoonacular.com/recipes/660234-556x370.jpg',
        0,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        9,
        1098357,
        'Three Ingredient Frozen Pina Colada',
        'Three Ingredient Frozen Pina Colada takes about 5 minutes from beginning to end. For $2.15 per serving, this recipe covers 12% of your daily requirements of vitamins and minerals. Watching your figure? This gluten free, dairy free, lacto ovo vegetarian, and vegan recipe has 320 calories, 2g of protein, and 8g of fat per serving. This recipe serves 3. This recipe from Foodista requires pineapple, pineapple juice, coconut milk, and coconut rum. It works well as a beverage. 6 people were glad they ',
        5,
        2.15,
        'facile',
        '[{\"id\": 10014412, \"name\": \"ice\", \"unit\": \"cups\", \"amount\": 3, \"original\": \"3 cups of ice\"}, {\"id\": 9273, \"name\": \"pineapple juice\", \"unit\": \"cups\", \"amount\": 2.5, \"original\": \"2 1/2 cups pineapple juice\"}, {\"id\": 12118, \"name\": \"coconut milk\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup coconut milk\"}, {\"id\": 10314037, \"name\": \"coconut rum\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup coconut rum\"}, {\"id\": 9266, \"name\": \"pineapple\", \"unit\": \"servings\", \"amount\": 3, \"original\": \"pineapple\"}, {\"id\": 9328, \"name\": \"maraschino cherries\", \"unit\": \"servings\", \"amount\": 3, \"original\": \"maraschino cherries for garnish\"}]',
        'Étape 1: Add ice, pineapple juice, coconut milk, and rum to the blender.Blend until smooth and creamy.\n\nÉtape 2: Serve with fresh pineapple wedges and cherry garnish.',
        'https://img.spoonacular.com/recipes/1098357-556x370.jpg',
        1,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        10,
        664080,
        'Turkey-Spinach Burgers With Sweet Soy-Ginger Sauce',
        'Need a gluten free and dairy free main course? Turkey-Spinach Burgers With Sweet Soy-Ginger Sauce could be a tremendous recipe to try. One serving contains 219 calories, 29g of protein, and 7g of fat. For $2.51 per serving, this recipe covers 23% of your daily requirements of vitamins and minerals. This recipe serves 4. This recipe from Foodista has 3 fans. A mixture of salt, ground turkey, canolan oil, and a handful of other ingredients are all it takes to make this recipe so delicious. Only a ',
        45,
        2.51,
        'difficile',
        '[{\"id\": 11457, \"name\": \"baby spinach\", \"unit\": \"ounce\", \"amount\": 5, \"original\": \"1 package (5-ounce) fresh baby spinach\"}, {\"id\": 1002030, \"name\": \"pepper\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"freshly ground black pepper\"}, {\"id\": 1014582, \"name\": \"canola oil\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon macadamia nut oil or canola oil\"}, {\"id\": 10019334, \"name\": \"brown sugar\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons dark brown sugar\"}, {\"id\": 10211216, \"name\": \"ginger\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon minced fresh ginger\"}, {\"id\": 5662, \"name\": \"ground turkey\", \"unit\": \"pound\", \"amount\": 1, \"original\": \"1 pound Ground turkey\"}, {\"id\": 93830, \"name\": \"mirin\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons mirin\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"Salt\"}, {\"id\": 11291, \"name\": \"scallions\", \"unit\": \"tablespoons\", \"amount\": 3, \"original\": \"3 tablespoons sliced scallions for garnish, optional\"}, {\"id\": 4058, \"name\": \"sesame oil\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon toasted sesame oil\"}, {\"id\": 16124, \"name\": \"soy sauce\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons soy sauce\"}]',
        'Étape 1: In small saucepan, combine soy sauce, mirin, brown sugar, and ginger; bring to boil over medium-high heat, whisking to dissolve sugar. Reduce until slightly syrupy, about 3 minutes. Adjust heat, if necessary, to prevent boil-over.\n\nÉtape 2: Remove from heat and allow to cool completely. (Sauce may be prepared up to 2 days in advance and refrigerated in a covered container.)Bring large pot of water to boil. Cook spinach for 1 minute.\n\nÉtape 3: Drain and transfer to cold water bath to stop the cooking.\n\nÉtape 4: Drain again. Dry thoroughly between layers of paper towels. (Spinach may be prepared up to 2 days in advance and refrigerated in covered container.)In large bowl, combine turkey, scallions, sesame oil, reserved spinach, and 1 tablespoon of reserved sauce. Season with salt and pepper and blend well without overworking.Form turkey-spinach mixture into 4 patties, about 3\" across and 1\" thick.\n\nÉtape 5: Heat oil in large nonstick skillet over medium-high heat. When hot, add patties and cook about 5 minutes per side, until nicely browned and cooked through. Lower heat if necessary to prevent burning.\n\nÉtape 6: Serve with some of the sauce spooned over.\n\nÉtape 7: Garnish with the sliced scallions, if desired.',
        'https://img.spoonacular.com/recipes/664080-556x370.jpg',
        0,
        '2025-05-02 06:01:30',
        '2025-05-02 06:01:30',
        NULL
    ),
(
        11,
        632660,
        'Apricot Glazed Apple Tart',
        'Apricot Glazed Apple Tart is a lacto ovo vegetarian dessert. One portion of this dish contains about 6g of protein, 35g of fat, and a total of 658 calories. For $1.59 per serving, this recipe covers 12% of your daily requirements of vitamins and minerals. This recipe serves 4. From preparation to the plate, this recipe takes around 45 minutes. 3 people found this recipe to be flavorful and satisfying. If you have apples, cinnamon, sugar, and a few other ingredients on hand, you can make it. It i',
        45,
        1.59,
        'difficile',
        '[{\"id\": 20081, \"name\": \"flour\", \"unit\": \"cups\", \"amount\": 1.5, \"original\": \"1 1/2 cups all-purpose flour, plus 1 tablespoon\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"pinch\", \"amount\": 1, \"original\": \"Pinch of salt\"}, {\"id\": 1145, \"name\": \"butter butter\", \"unit\": \"sticks\", \"amount\": 1.5, \"original\": \"1 1/2 sticks cold unsalted butter cold unsalted butter<\"}, {\"id\": 14412, \"name\": \"ice water\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"cup ice water\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"tablespoons\", \"amount\": 3.5, \"original\": \"3 1/2 tablespoons sugar\"}, {\"id\": 1079003, \"name\": \"apples\", \"unit\": \"large\", \"amount\": 4, \"original\": \"4 larges red apples, such as Golden Delicious, peeled, cored and cut into 1/4-inch-thick slices\"}, {\"id\": 2010, \"name\": \"cinnamon\", \"unit\": \"teaspoons\", \"amount\": 2, \"original\": \"2 teaspoons cinnamon\"}, {\"id\": 19719, \"name\": \"apricot preserves\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons apricot preserves, melted and strained\"}]',
        'Étape 1: In a food processor, pulse 1 1/2 cups of the flour with the salt.\n\nÉtape 2: Add the cold butter and process just until the butter is the size of peas, about 5 seconds.\n\nÉtape 3: Sprinkle the ice water over the mixture and process just until moistened, about 5 seconds.\n\nÉtape 4: Transfer the dough to a lightly floured work surface and knead 2 or 3 times, just until it comes together. Pat the dough into a disk. On a lightly floured work surface, roll out the dough into a 16- to 17-inch round about 1/4 inch thick.\n\nÉtape 5: Line a large baking sheet with parchment paper.\n\nÉtape 6: Roll the dough around the rolling pin and unroll it onto the prepared baking sheet.\n\nÉtape 7: In a small bowl, combine 2 tablespoons of the sugar with the remaining 1 tablespoon of flour and sprinkle over the dough. Arrange the apple slices on top in overlapping concentric circles to within 3 inches of the edge. Fold the dough over the apples in a free-form fashion.\n\nÉtape 8: Brush the apples with the melted butter and sprinkle with the remaining 1 1/2 tablespoons of sugar and cinnamon. Refrigerate the unbaked tart until slightly chilled, about 10 minutes.\n\nÉtape 9: Preheat the oven to 40\n\nÉtape 10: Bake the tart in the center of the oven for 1 hour, or until the apples are tender and golden and the crust is deep golden and cooked through.\n\nÉtape 11: Brush the apples with the melted preserves. Slide the parchment onto a wire rack and let the tart cool slightly before serving.',
        'https://img.spoonacular.com/recipes/632660-556x370.jpg',
        1,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        12,
        665642,
        'Zesty Lime Marinated Chicken with Homemade Watermelon Salsa',
        'Zesty Lime Marinated Chicken with Homemade Watermelon Salsa takes roughly 45 minutes from beginning to end. This gluten free and dairy free recipe serves 4 and costs $1.8 per serving. One serving contains 245 calories, 26g of protein, and 7g of fat. This recipe from Foodista has 3 fans. Only a few people really liked this main course. It is a rather cheap recipe for fans of Mexican food. A mixture of ground pepper, pepper flakes, extra virgin olive oil, and a handful of other ingredients are all',
        45,
        1.80,
        'difficile',
        '[{\"id\": 11206, \"name\": \"cucumber\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup cucumber, peeled and diced\"}, {\"id\": 11167, \"name\": \"ear corn\", \"unit\": \"small\", \"amount\": 1, \"original\": \"1 small ear fresh sweet corn, cut from the cob\"}, {\"id\": 1034053, \"name\": \"extra virgin olive oil\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon extra virgin olive oil\"}, {\"id\": 11165, \"name\": \"cilantro\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons fresh cilantro, chopped\"}, {\"id\": 1022020, \"name\": \"garlic powder\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon garlic powder\"}, {\"id\": 1002030, \"name\": \"ground pepper\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"Fresh ground pepper\"}, {\"id\": 19296, \"name\": \"honey\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons honey\"}, {\"id\": 9160, \"name\": \"lime juice\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons fresh lime juice\"}, {\"id\": 10011821, \"name\": \"orange pepper\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup yellow or orange sweet pepper, diced\"}, {\"id\": 10011282, \"name\": \"onion\", \"unit\": \"tablespoons\", \"amount\": 3, \"original\": \"3 tablespoons red onion, diced\"}, {\"id\": 1032009, \"name\": \"pepper flakes\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon crushed red pepper flakes, to taste\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon Salt\"}, {\"id\": 1055062, \"name\": \"chicken breasts\", \"unit\": \"ounces\", \"amount\": 16, \"original\": \"4 chicken breasts (4- 5 ounces each), boneless, skinless\"}, {\"id\": 1026168, \"name\": \"tabasco sauce\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon Tabasco Sauce\"}, {\"id\": 9326, \"name\": \"watermelon\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups watermelon, seeded and diced\"}]',
        'Étape 1: To Make Salsa: In a medium bowl, combine watermelon, cucumber, sweet pepper, corn, cilantro and onion. In a small bowl, mix together  cup lime juice, honey, red pepper flakes and salt. Refrigerate for at least 1 hour before serving, to blend flavors.To Make Chicken: In a shallow bowl add the chicken, 3 tablespoons lime juice and sprinkle with a little garlic powder, salt and pepper.  Marinate in the refrigerator for 30 minutes.  Coat a large nonstick pan or a grill pan with olive oil spray, add olive oil and heat.\n\nÉtape 2: Add chicken, cover, and saut over medium heat until browned on both sides and cooked through, about 10-12 minutes total.\n\nÉtape 3: Remove the chicken from the pan\n\nÉtape 4: To Make Honey Lime Glaze: In a small bowl, mix together  cup lime juice, 2 tablespoons honey and Tabasco.\n\nÉtape 5: Add the honey lime glaze to the same pan.  Cook for about 30 seconds until melted.  Return cooked chicken to pan, flipping the chicken once to coat with the glaze.\n\nÉtape 6: Remove from pan and plate each piece.  Spoon watermelon salsa on top of each piece of chicken and serve with more salsa on the side.\n\nÉtape 7: Serve with our recipe for Simple Garlic Toast, if desired.  Recipe follows.Recipe for Simple Garlic Toast\n\nÉtape 8: Start with 4 slices sourdough wheat bread. We bought ours at Trader Joes but most markets sell sourdough wheat bread or use regular sourdough slices.\n\nÉtape 9: Cut each slice in half and toast all of them.\n\nÉtape 10: Spread each half with 1 teaspoon reduced-fat butter or Smart Balance Light.\n\nÉtape 11: Sprinkle each with a little garlic powder.\n\nÉtape 12: Place all 8 halves on a plate and reheat in microwave for about 15 seconds.Our favorite garlic powder is Lawrys with parsley. Weve been buying it for years because it taste much better than most garlic powders.',
        'https://img.spoonacular.com/recipes/665642-556x370.jpg',
        0,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        13,
        660835,
        'Spaghetti With Pesto Trapanese',
        'Spaghetti With Pesto Trapanese is a lacto ovo vegetarian recipe with 6 servings. For $1.46 per serving, this recipe covers 19% of your daily requirements of vitamins and minerals. One serving contains 433 calories, 14g of protein, and 15g of fat. Not a lot of people made this recipe, and 4 would say it hit the spot. Head to the store and pick up spaghetti, almonds, pine nuts, and a few other things to make it today. It works best as a main course, and is done in around 45 minutes. It is brought ',
        45,
        1.46,
        'difficile',
        '[{\"id\": 11420420, \"name\": \"spaghetti\", \"unit\": \"pound\", \"amount\": 1, \"original\": \"1 pound spaghetti\"}, {\"id\": 12061, \"name\": \"almonds\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup (80 gr) almonds (if you can get the Sicilian ones from Noto they are wonderful)\"}, {\"id\": 12147, \"name\": \"pine nuts\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup (30 gr) pine nuts\"}, {\"id\": 1034053, \"name\": \"extra virgin olive oil\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup (100 gr) extra virgin olive oil\"}, {\"id\": 10211215, \"name\": \"garlic cloves\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 garlic cloves\"}, {\"id\": 11529, \"name\": \"tomatoes\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 tomatoes, peeled and seeded\"}, {\"id\": 2044, \"name\": \"basil\", \"unit\": \"cups\", \"amount\": 2.5, \"original\": \"2 1/2 cups (60 gr) basil\"}, {\"id\": 1102047, \"name\": \"salt and pepper\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Salt and pepper as needed\"}, {\"id\": 1001036, \"name\": \"pecorino\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Ricotta salata or pecorino, to be grated fresh over the past\"}]',
        'Étape 1: Place a large (this is key) pot of water to boil. Salt when it boils, not before.\n\nÉtape 2: Meanwhile, make the pesto: In a mortar (or use a food processor with a blade) pound together the oil, almonds and pine-nuts.\n\nÉtape 3: Add the garlic, 2 ice cubes and the rest of the ingredients, pounding quickly to make a paste.You want to leave a bit of a texture for crunch.\n\nÉtape 4: Cook the pasta al dente, as per directions, drain and reserve some of the boiling water. Toss the pasta with the pesto, using some of the reserved water to make it creamier. Grate some fresh pecorino or ricotta salata (or both) over and serve hot with a leaf of basil to garnish.',
        'https://img.spoonacular.com/recipes/660835-556x370.jpg',
        1,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        14,
        645384,
        'Greek Yogurt Chicken Salad',
        'Greek Yogurt Chicken Salad is a Mediterranean main course. This recipe serves 4 and costs $3.09 per serving. Watching your figure? This gluten free and primal recipe has 334 calories, 41g of protein, and 11g of fat per serving. This recipe from Foodista has 4 fans. Head to the store and pick up greek yogurt, chicken breasts, garlic powder, and a few other things to make it today. From preparation to the plate, this recipe takes approximately 30 minutes. Taking all factors into account, this reci',
        30,
        3.09,
        'moyen',
        '[{\"id\": 12087, \"name\": \"cashews\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"½ cup cashews, roughly chopped\"}, {\"id\": 5064, \"name\": \"chicken breasts\", \"unit\": \"pound\", \"amount\": 1, \"original\": \"1 pound chicken breasts, cooked and cubed into bite sized pieces\"}, {\"id\": 1009079, \"name\": \"craisins\", \"unit\": \"cup\", \"amount\": 0.33333334, \"original\": \"1/3 cup craisins (raisins work, too)\"}, {\"id\": 1032046, \"name\": \"dijon mustard\", \"unit\": \"teaspoon\", \"amount\": 2, \"original\": \"2 teaspoon Dijon mustard\"}, {\"id\": 1022020, \"name\": \"garlic powder\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"garlic powder\"}, {\"id\": 1001256, \"name\": \"greek yogurt\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"½ cup plain Greek yogurt\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"salt\"}]',
        'Étape 1: Start by cooking some chicken breasts. I like boiling them in chicken broth or stock, but feel free to boil in water, too. Boiling the chicken in broth, however, will give it significantly more flavor. Bring the chicken broth/stock to a boil and put in whole chicken breasts. Cook until no pink remains. Depending on the size of the chicken breasts, this could take anywhere from 15 - 20 minutes.While the chicken is boiling, put together your sauce.\n\nÉtape 2: Whisk together greek yogurt, dijon mustard, and garlic powder together until well mixed.\n\nÉtape 3: Add in salt and pepper, to taste.Next, stir in dried cranberries or raisins and cashews. If you\'re worried about the cashews getting too soft, you could add them right before serving!After the chicken is done boiling, I like to let it rest for about 5 minutes. This ensures that the juice stays in the chicken instead of spilling out when you cut it!Dice up the chicken and mix it into the sauce.\n\nÉtape 4: Serve.',
        'https://img.spoonacular.com/recipes/645384-556x370.jpg',
        0,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        15,
        634434,
        'Basil Marinated Grilled Chicken',
        'Basil Marinated Grilled Chicken is a gluten free, dairy free, paleolithic, and primal recipe with 8 servings. One serving contains 309 calories, 48g of protein, and 11g of fat. For $2.59 per serving, this recipe covers 25% of your daily requirements of vitamins and minerals. Head to the store and pick up garlic, chicken breasts, salt, and a few other things to make it today. 11 person have tried and liked this recipe. It will be a hit at your The Fourth Of July event. It works well as a rather c',
        45,
        2.59,
        'difficile',
        '[{\"id\": 11215, \"name\": \"garlic\", \"unit\": \"cloves\", \"amount\": 4, \"original\": \"4 cloves garlic\"}, {\"id\": 2044, \"name\": \"lightly basil leaves\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups lightly packed basil leaves\"}, {\"id\": 1034053, \"name\": \"extra virgin olive oil\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"cup extra virgin olive oil, about ½\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon salt\"}, {\"id\": 5062, \"name\": \"chicken breasts\", \"unit\": \"\", \"amount\": 8, \"original\": \"8 boneless chicken breasts, patted dry so the marinade wil\"}]',
        'Étape 1: Mince garlic in a food processor, then add basil and process until roughly chopped.\n\nÉtape 2: Drizzle in olive oil until a thin ketchup consistency is achieved.\n\nÉtape 3: Add salt and whirl for 5 seconds to combine.\n\nÉtape 4: Place chicken in a baking dish and pour marinade over chicken, turning pieces to coat evenly. Cover and refrigerate for 4 hours.\n\nÉtape 5: Grill over medium high heat until cooked through, about 8 minutes per side.',
        'https://img.spoonacular.com/recipes/634434-556x370.jpg',
        0,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        16,
        631823,
        '(Houston\'s) Spinach Dip',
        '(Houston\'s) Spinach Dip might be a good recipe to expand your hor d\'oeuvre recipe box. This recipe serves 8. One portion of this dish contains about 9g of protein, 26g of fat, and a total of 305 calories. For $1.42 per serving, this recipe covers 19% of your daily requirements of vitamins and minerals. 15 people found this recipe to be delicious and satisfying. It will be a hit at your The Super Bowl event. This recipe from Foodista requires onion, cheddar cheese, flour, and pecorino romano chee',
        45,
        1.42,
        'difficile',
        '[{\"id\": 99242, \"name\": \"artichoke hearts\", \"unit\": \"oz\", \"amount\": 12, \"original\": \"(12 oz) jar or can of artichoke hearts drained, coarsely chopped\"}, {\"id\": 6172, \"name\": \"chicken stock\", \"unit\": \"c\", \"amount\": 0.25, \"original\": \"1/4 c. chicken stock\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"c\", \"amount\": 0.25, \"original\": \"1/4 c. all-purpose flour\"}, {\"id\": 11463, \"name\": \"spinach\", \"unit\": \"oz\", \"amount\": 20, \"original\": \"2 (10 oz) boxes frozen spinach, thawed\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"T\", \"amount\": 1, \"original\": \"1 T minced fresh garlic\"}, {\"id\": 1053, \"name\": \"heavy cream\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup - Heavy Cream\"}, {\"id\": 6168, \"name\": \"hot sauce\", \"unit\": \"t\", \"amount\": 0.5, \"original\": \"1/2 t. hot sauce\"}, {\"id\": 9152, \"name\": \"lemon juice\", \"unit\": \"t\", \"amount\": 2, \"original\": \"2 t. fresh lemon juice\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"\", \"amount\": 0.5, \"original\": \"1/2 onion, chopped\"}, {\"id\": 1038, \"name\": \"pecorino romano cheese\", \"unit\": \"c\", \"amount\": 0.6666667, \"original\": \"2/3 c. fresh grated Pecorino Romano cheese\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon salt\"}, {\"id\": 1056, \"name\": \"cream\", \"unit\": \"c\", \"amount\": 0.25, \"original\": \"1/4 c. sour cream\"}, {\"id\": 1145, \"name\": \"butter\", \"unit\": \"Tbs\", \"amount\": 6, \"original\": \"6 Tbs. - Unsalted Butter\"}, {\"id\": 1001009, \"name\": \"cheddar cheese\", \"unit\": \"c\", \"amount\": 0.5, \"original\": \"1/2 c. shredded white cheddar cheese\"}]',
        'Étape 1: Strain spinach and squeeze through a cheesecloth to remove as much liquid as possible.In heavy saucepan over medium heat, saute garlic and onions in butter until golden, about 3-5 minutes. Stir in flour and cook for 1 minute.Slowly whisk in cream and stock and continue cooking until boiling.Once boiling, stir in lemon juice, hot sauce, salt and Romano cheese; stir until cheese has melted.\n\nÉtape 2: Remove from heat and allow to cool for 5 minutes.Stir in sour cream, then fold in dry spinach and artichoke hearts.\n\nÉtape 3: Pour in large ovenproof/microwave proof dish. Or smaller ramekins (as shown.)\n\nÉtape 4: Sprinkle cheddar evenly on top.\n\nÉtape 5: Heat in microwave or bake in oven until cheese on top is melted.\n\nÉtape 6: Serve hot with tortilla chips, sour cream and salsa for dipping.',
        'https://img.spoonacular.com/recipes/631823-556x370.png',
        0,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        17,
        641066,
        'Curried Chicken Roll-Ups',
        'Curried Chicken Roll-Ups requires around 45 minutes from start to finish. One portion of this dish contains about 13g of protein, 6g of fat, and a total of 180 calories. For $1.37 per serving, you get a hor d\'oeuvre that serves 4. This recipe is liked by 3 foodies and cooks. If you have chicken breast, curry paste, paprika, and a few other ingredients on hand, you can make it. It is brought to you by Foodista. It is a good option if you\'re following a gluten free and dairy free diet. Taking all ',
        45,
        1.37,
        'difficile',
        '[{\"id\": 99247, \"name\": \"chicken breast\", \"unit\": \"ounce\", \"amount\": 10, \"original\": \"10 ounce can chopped chicken breast, drained\"}, {\"id\": 11206, \"name\": \"cucumber\", \"unit\": \"medium\", \"amount\": 0.5, \"original\": \"1/2 medium cucumber, diced\"}, {\"id\": 11821, \"name\": \"bell pepper\", \"unit\": \"\", \"amount\": 0.25, \"original\": \"1/4 red bell pepper, diced\"}, {\"id\": 10111143, \"name\": \"celery stalk\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 celery stalk, diced\"}, {\"id\": 11291, \"name\": \"green onion\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 green onion, sliced\"}, {\"id\": 4641, \"name\": \"mayonnaise\", \"unit\": \"tablespoons\", \"amount\": 3, \"original\": \"3 tablespoons light mayonnaise or Vegenaise\"}, {\"id\": 9160, \"name\": \"lime juice\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon lime juice\"}, {\"id\": 93605, \"name\": \"curry paste\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon red curry paste\"}, {\"id\": 1022020, \"name\": \"garlic powder\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon garlic powder\"}, {\"id\": 2028, \"name\": \"paprika\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon paprika\"}, {\"id\": 2009, \"name\": \"chili powder\", \"unit\": \"Dash\", \"amount\": 1, \"original\": \"Dash of chili powder\"}, {\"id\": 1102047, \"name\": \"salt and pepper\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"Salt and pepper, to taste\"}, {\"id\": 18364, \"name\": \"grain tortillas\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 whole grain tortillas\"}, {\"id\": 11252, \"name\": \"lettuce\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup lettuce, chopped\"}]',
        'Étape 1: Place all ingredients (except tortillas, lettuce, and cream cheese) into a bowl. Stir well, until everything is nicely mixed and the larger chicken pieces have pulled apart.\n\nÉtape 2: Lightly toast or warm your tortillas on the stove top.\n\nÉtape 3: Scoop out a quarter of your chicken salad mixture and evenly spread it over the top of the tortilla.\n\nÉtape 4: Sprinkle a quarter of your lettuce over the chicken salad.\n\nÉtape 5: Now gently, and tightly, roll up your tortilla.\n\nÉtape 6: Use a good serrated knife to gently slice the roll into 4 or 6 pieces.',
        'https://img.spoonacular.com/recipes/641066-556x370.jpg',
        0,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        18,
        664306,
        'Vanilla Coconut Snowball Cupcakes',
        'You can never have too many American recipes, so give Vanilla Coconut Snowball Cupcakes a try. For 54 cents per serving, you get a dessert that serves 13. One serving contains 383 calories, 4g of protein, and 18g of fat. A mixture of flour, eggs, vanilla, and a handful of other ingredients are all it takes to make this recipe so yummy. Not a lot of people made this recipe, and 9 would say it hit the spot. From preparation to the plate, this recipe takes around 45 minutes. It is brought to you by',
        45,
        0.54,
        'difficile',
        '[{\"id\": 20081, \"name\": \"flour\", \"unit\": \"cups\", \"amount\": 1.5, \"original\": \"1 1/2 cups All-Purpose Flour\"}, {\"id\": 18369, \"name\": \"baking powder\", \"unit\": \"teaspoons\", \"amount\": 1.5, \"original\": \"1 1/2 teaspoons Baking Powder\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"teaspoon\", \"amount\": 0.25, \"original\": \"1/4 teaspoon Salt\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup (1 stick) Butter, at room temperature, cut into small pieces\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"3/4 cup Sugar\"}, {\"id\": 2050, \"name\": \"vanilla extract\", \"unit\": \"teaspoons\", \"amount\": 1.5, \"original\": \"1 1/2 teaspoons Vanilla Extract\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"large\", \"amount\": 2, \"original\": \"2 larges Eggs\"}, {\"id\": 1077, \"name\": \"regular milk\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup Coconut or Regular Milk, at room temperature\"}, {\"id\": 1056, \"name\": \"cream\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"cup Sour Cream\"}, {\"id\": 12108, \"name\": \"unsweeted coconut flakes\", \"unit\": \"cup\", \"amount\": 0.6666667, \"original\": \"2/3 cup Unsweeted Coconut Flakes, plus more for topping\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons Butter, softened\"}, {\"id\": 1056, \"name\": \"cream\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup Sour Cream\"}, {\"id\": 1052050, \"name\": \"vanilla\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon Vanilla\"}, {\"id\": 19336, \"name\": \"confectioners\'s sugar\", \"unit\": \"cups\", \"amount\": 3, \"original\": \"3 cups Confectioners\'s Sugar\"}]',
        'Étape 1: Preheat oven to 350 degrees. Line a 12-cupcake pan with paper liners (or a mini-pan). Grease lightly if not using liners.\n\nÉtape 2: Whisk flour, baking powder and salt together in a small bowl; set aside.\n\nÉtape 3: In a large bowl with an electric mixer on medium-high speed beat butter until creamy, about 2 minutes. Gradually add sugar, beat until light and fluffy, about 3 minutes, scraping down the bowl once or twice. Beat in vanilla extract. Beat in eggs one at a time.\n\nÉtape 4: Add the flour mixture in 4 additions, alternating with the milk. Beat briefly after each addition.\n\nÉtape 5: Stir in sour cream and coconut.\n\nÉtape 6: Fill cupcake wells about 3/4 of the way.\n\nÉtape 7: Bake for 18 minutes or until a toothpick comes out clean (about 15 minutes for mini).\n\nÉtape 8: Cool pan on wire rack for 5 minutes, then turn out and return to wire rack to cool completely.\n\nÉtape 9: For the frosting beat the butter, sour cream and vanilla together until fluffy.\n\nÉtape 10: Add 2 cups Confectioners\' and beat on low, continue to add confectioners\' a little bit at a time until the frosting sticks to the beater when lifted without dripping off. If it gets too thick add in a little more sour cream. Beat an additional 3-4 minutes on low to get a light and fluffy frosting.\n\nÉtape 11: Fill a small, shallow bowl with coconut flakes. Frost cupcakes and stick the tops into the coconut to coat, using your hand to help it stick if needed.',
        'https://img.spoonacular.com/recipes/664306-556x370.jpg',
        1,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        19,
        663338,
        'The Scotch Egg',
        'The Scotch Egg takes around 45 minutes from beginning to end. Watching your figure? This dairy free recipe has 658 calories, 22g of protein, and 56g of fat per serving. This recipe serves 6 and costs $1.71 per serving. 10 people have made this recipe and would make it again. A few people really liked this hor d\'oeuvre. A mixture of panko breadcrumbs, eggs, pork sausage, and a handful of other ingredients are all it takes to make this recipe so flavorful. It is brought to you by Foodista. Overall',
        45,
        1.71,
        'difficile',
        '[{\"id\": 1123, \"name\": \"eggs\", \"unit\": \"large\", \"amount\": 6, \"original\": \"6 large eggs\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 eggs (beaten and used for the coating)\"}, {\"id\": 1007063, \"name\": \"pork sausage\", \"unit\": \"oz\", \"amount\": 16, \"original\": \"16 oz pork sausage\"}, {\"id\": 10018079, \"name\": \"panko breadcrumbs\", \"unit\": \"cup\", \"amount\": 2, \"original\": \"2 cup panko breadcrumbs (or regular bread crumbs)\"}, {\"id\": 4669, \"name\": \"vegetable oil\", \"unit\": \"cups\", \"amount\": 4, \"original\": \"4 cups vegetable oil for frying\"}]',
        'Étape 1: Hard boil your eggs.  To get perfectly hard boiled eggs, once the water is boiling, add your eggs and set your timer for 9 1/2 minutes.  As soon as your timer goes off, remove the eggs and put them in a bath of cold water.\n\nÉtape 2: Once your eggs are cooked and shells are removed, set up an assembly line with the beaten eggs, sausage meat and bread crumbs.\n\nÉtape 3: Now you\'ll want to take about a 1/4 cup of the ground sausage, form a disk and begin to shape it around the hardboiled egg.\n\nÉtape 4: Take the sausage-covered egg and dip it in the beaten egg.\n\nÉtape 5: Roll the sausage-covered egg in the bread crumbs until it is generously coated.\n\nÉtape 6: The final step is to fry those eggs up!  Once all of your eggs are coated in the bread crumbs, heat up your oil over medium high heat.  You\'ll know your oil is at the right temperature when you drop a few bread crumbs in the pot and it begins to sizzle.  Take care not to add the eggs to the oil to early - if the oil isn\'t hot enough it will just saturate the bread crumbs and it won\'t be as tasty.\n\nÉtape 7: Drop two eggs at a time in the hot oil and cook them until very golden brown, about 6-7 minutes.  Make sure you give the eggs enough time in the oil so the sausage fully cooks.\n\nÉtape 8: Remove the fried eggs from the oil and place on a plate with paper towels to remove the excess oil.\n\nÉtape 9: Cut the eggs in half or quarters and serve while hot.',
        'https://img.spoonacular.com/recipes/663338-556x370.jpg',
        0,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        20,
        662363,
        'Super Speedy Spicy Sweet and Sour Shrimp',
        'The recipe Super Speedy Spicy Sweet and Sour Shrimp can be made in around 45 minutes. This recipe makes 4 servings with 350 calories, 32g of protein, and 8g of fat each. For $3.48 per serving, this recipe covers 14% of your daily requirements of vitamins and minerals. 7 people have tried and liked this recipe. It works well as a main course. A mixture of soy sauce, rice, 2 lb shrimp, and a handful of other ingredients are all it takes to make this recipe so tasty. It is brought to you by Foodist',
        45,
        3.48,
        'difficile',
        '[{\"id\": 11165, \"name\": \"cilantro\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"cilantro\"}, {\"id\": 10220445, \"name\": \"rice\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"cooked white rice\"}, {\"id\": 10211215, \"name\": \"garlic cloves\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 garlic cloves chopped finely\"}, {\"id\": 11216, \"name\": \"ginger\", \"unit\": \"piece\", \"amount\": 1, \"original\": \"1 piece of ginger, grated\"}, {\"id\": 19296, \"name\": \"honey\", \"unit\": \"tbsp\", \"amount\": 2, \"original\": \"2 tbsp honey\"}, {\"id\": 10216124, \"name\": \"soy sauce\", \"unit\": \"tbsp\", \"amount\": 2, \"original\": \"2 tbsp light soy sauce\"}, {\"id\": 99215, \"name\": \"bok choi\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 bok choi\"}, {\"id\": 10511819, \"name\": \"chili pepper\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 red chili pepper\"}, {\"id\": 1022053, \"name\": \"rice wine vinegar\", \"unit\": \"tbsp\", \"amount\": 2, \"original\": \"2 tbsp Chinese rice wine vinegar\"}, {\"id\": 15270, \"name\": \".2 lb shrimp\", \"unit\": \"gr\", \"amount\": 550, \"original\": \"550gr / 1.2 lb shrimp (prawns), raw, but peeled, de veined and cleaned\"}, {\"id\": 11291, \"name\": \"spring onions to 1 cm / 0.5in. pieces\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 spring onions (scallions) chopped to about 1 cm / 0.5in. pieces\"}, {\"id\": 4584, \"name\": \"sunflower oil\", \"unit\": \"tbsp\", \"amount\": 2, \"original\": \"2 tbsp sunflower oil (or other flavourless oil)\"}, {\"id\": 11935, \"name\": \"tomato ketchup\", \"unit\": \"tbsp\", \"amount\": 4, \"original\": \"4 tbsp tomato ketchup\"}]',
        'Étape 1: Mix the sauce ingredients together in a bowl, taste it to check if you like the balance of flavour and adjust if you wish.  Set this aside.\n\nÉtape 2: Heat the oil on a very high heat in a wok. Get the oil as hot as you can, just below smoking point.  Check the heat by dropping a piece of spring onion (scallion) and if it sizzles immediately, the oil is hot enough.\n\nÉtape 3: Add the chili, garlic and ginger, stir and cook for about 30 seconds.\n\nÉtape 4: Add the spring onions (scallions) and cook for a further minute.\n\nÉtape 5: Add the shrimp (prawns) cook for about 2 minutes or until they turn pink.\n\nÉtape 6: Add the sauce, keeping the heat high so that as soon as it hits your pan or wok, it sizzles and reduces.When the sauce has thickened a little, add the pak choi, mix through and cover it, cooking only for a minute.\n\nÉtape 7: Serve with simply boiled white rice and sprinkle with some fresh coriander (cilantro).',
        'https://img.spoonacular.com/recipes/662363-556x370.jpg',
        0,
        '2025-05-02 06:02:44',
        '2025-05-02 06:02:44',
        NULL
    ),
(
        21,
        640395,
        'Cranberry Orange Biscotti',
        'The recipe Cranberry Orange Biscotti is ready in roughly 1 hour and is definitely an outstanding lacto ovo vegetarian option for lovers of Mediterranean food. This recipe makes 48 servings with 106 calories, 2g of protein, and 5g of fat each. For 24 cents per serving, this recipe covers 3% of your daily requirements of vitamins and minerals. Not a lot of people made this recipe, and 5 would say it hit the spot. It works well as a very affordable dessert. This recipe from Foodista requires salt, ',
        60,
        0.24,
        'difficile',
        '[{\"id\": 18369, \"name\": \"baking powder\", \"unit\": \"teaspoons\", \"amount\": 1.5, \"original\": \"1 1/2 teaspoons baking powder\"}, {\"id\": 19336, \"name\": \"confectioners\' sugar\", \"unit\": \"cups\", \"amount\": 0.75, \"original\": \"3/4 cups Confectioners\' Sugar\"}, {\"id\": 9079, \"name\": \"cranberries\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"3/4 cup dried cranberries, finely chopped\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 Large Eggs\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups flour, sifted\"}, {\"id\": 9206, \"name\": \"orange juice\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup fresh orange juice\"}, {\"id\": 9216, \"name\": \"orange zest\", \"unit\": \"tablespoon\", \"amount\": 0.5, \"original\": \"1/2 tablespoon orange zest\"}, {\"id\": 12142, \"name\": \"pecans\", \"unit\": \"ounces\", \"amount\": 8, \"original\": \"8 ounces pecans, chopped\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"teaspoon\", \"amount\": 0.75, \"original\": \"3/4 teaspoon salt\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup sugar\"}, {\"id\": 1145, \"name\": \"butter\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup unsalted butter, softened\"}, {\"id\": 2050, \"name\": \"vanilla extract\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon pure vanilla extract\"}, {\"id\": 10020080, \"name\": \"pastry flour\", \"unit\": \"cup\", \"amount\": 1.25, \"original\": \"1 1/4 cup Whole Wheat Pastry Flour\"}]',
        'Étape 1: Preheat the oven to 350F degrees, and position the oven racks in the upper and lower thirds positions. Line two baking sheets with parchment paper.In the bowl of an electric mixer fitted with the paddle attachment, beat the butter with the sugar on medium speed until light.\n\nÉtape 2: Add the eggs, one at a time, beating well after each addition and stopping to scrape down the sides of the bowl as necessary. Continue to beat the mixture for 2 minutes more. Beat in the orange zest and vanilla extract.In a medium bowl, whisk together the flour, baking powder, and salt.\n\nÉtape 3: Add the dry ingredients to the wet ingredients and mix until just incorporated. On low speed, mix in the cranberries and the pecans.\n\nÉtape 4: Transfer the dough to a very lightly floured work surface, and divide it into 3 equal pieces. Shape each piece into a 12-inch log, spacing two of the logs apart on one of the prepared baking sheets and the third log on the second sheet.\n\nÉtape 5: Bake the logs for 15-18 minutes, until golden on top and lightly cracked.\n\nÉtape 6: Transfer the positions of the baking sheets halfway through the baking process.\n\nÉtape 7: Remove the sheets from the oven and allow to rest for 10 minutes. Reduce the oven temperature to 300F degrees.Using a serrated knife, cut each log on the diagonal into 3/4-inch slices.\n\nÉtape 8: Lay the slices on their sides and return the baking sheets to the oven for 10-15 minutes, or until lightly golden.Prepare the glaze: In a medium bowl, whisk together the confectioners sugar, and enough orange juice to make a pourable glaze.\n\nÉtape 9: Drizzle the glaze over the warm biscotti, then allow the biscotti to rest until the glaze has set.Makes 48 Cookies',
        'https://img.spoonacular.com/recipes/640395-556x370.jpg',
        1,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        22,
        640136,
        'Corned Beef And Cabbage With Irish Mustard Sauce',
        'The recipe Corned Beef And Cabbage With Irish Mustard Sauce could satisfy your European craving in about 4 hours and 30 minutes. This recipe serves 6 and costs $5.39 per serving. One portion of this dish contains around 51g of protein, 49g of fat, and a total of 835 calories. It is perfect for st. patrick day. 27 people have made this recipe and would make it again. A few people really liked this main course. It is a good option if you\'re following a gluten free diet. It is brought to you by Foo',
        270,
        5.39,
        'difficile',
        '[{\"id\": 2004, \"name\": \"bay leaf\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 bay leaf\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"tbsp\", \"amount\": 1, \"original\": \"1 tbsp. butter, melted\"}, {\"id\": 11109, \"name\": \"cabbage\", \"unit\": \"lb\", \"amount\": 2, \"original\": \"1 (2 lb.) cabbage, cut into wedges\"}, {\"id\": 11124, \"name\": \"carrot\", \"unit\": \"large\", \"amount\": 1, \"original\": \"1 large carrot, scraped and sliced\"}, {\"id\": 2048, \"name\": \"cider vinegar\", \"unit\": \"c\", \"amount\": 0.25, \"original\": \"1/4 c. cider vinegar (good quality)\"}, {\"id\": 10013346, \"name\": \"corned beef brisket\", \"unit\": \"lb\", \"amount\": 4, \"original\": \"1 (4 lb.) corned beef brisket\"}, {\"id\": 20027, \"name\": \"cornstarch\", \"unit\": \"tbsp\", \"amount\": 1, \"original\": \"1 tbsp. cornstarch\"}, {\"id\": 1002024, \"name\": \"mustard\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp. dry mustard\"}, {\"id\": 1125, \"name\": \"egg yolks\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 egg yolks, beaten\"}, {\"id\": 10511297, \"name\": \"parsley\", \"unit\": \"bunch\", \"amount\": 1, \"original\": \"1 bunch fresh parsley\"}, {\"id\": 1002055, \"name\": \"horseradish\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp. horseradish\"}, {\"id\": 10211352, \"name\": \"new potatoes\", \"unit\": \"lbs\", \"amount\": 2, \"original\": \"2 lbs. new potatoes, peeled\"}, {\"id\": 11282, \"name\": \"onions\", \"unit\": \"medium\", \"amount\": 3, \"original\": \"3 medium onions\"}, {\"id\": 1002030, \"name\": \"pepper\", \"unit\": \"teaspoon\", \"amount\": 0.25, \"original\": \"1/4 teaspoon pepper\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"tsp\", \"amount\": 0.5, \"original\": \"1/2 tsp. salt\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"tsp\", \"amount\": 2, \"original\": \"2 tsp. sugar\"}, {\"id\": 14412, \"name\": \"water\", \"unit\": \"c\", \"amount\": 1, \"original\": \"1 c. water\"}]',
        'Étape 1: Combine corned beef and water to cover in a large Dutch oven; bring to a boil then remove from heat.\n\nÉtape 2: Drain.\n\nÉtape 3: Add fresh water to cover.\n\nÉtape 4: Add onion, carrot, parsley, bay leaf, and pepper. Bring to a boil once again, then reduce to a low simmer. Skim off foam, if necessary. Cover and simmer 4 hours or until tender.\n\nÉtape 5: Remove onion and parsley.\n\nÉtape 6: Add potatoes to Dutch oven. Simmer 10 minutes.\n\nÉtape 7: Add cabbage wedges, and simmer 20 minutes or until vegetables are tender.\n\nÉtape 8: Remove and discard bay leaf.To make the Irish Mustard Sauce, combine cornstarch, sugar, dry mustard and salt in a medium saucepan; stir well.\n\nÉtape 9: Add water and cook over low heat, stirring constantly, until thickened.\n\nÉtape 10: Remove from heat. Stir in vinegar, butter and horseradish. Gradually stir about 1/4 of hot mixture into yolks; add to remaining hot mixture, stirring constantly. Cook over low heat, stirring constantly, until thickened.\n\nÉtape 11: Transfer corned beef and vegetables to a serving platter.\n\nÉtape 12: Serve with Irish Mustard Sauce.',
        'https://img.spoonacular.com/recipes/640136-556x370.jpg',
        0,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        23,
        652919,
        'Nachos Grande',
        'Nachos Grande might be just the hor d\'oeuvre you are searching for. This recipe makes 4 servings with 642 calories, 21g of protein, and 34g of fat each. For $2.05 per serving, this recipe covers 27% of your daily requirements of vitamins and minerals. It is brought to you by Foodista. 2 people were glad they tried this recipe. Only a few people really liked this Mexican dish. A mixture of chili, paprika to garnish, onion, and a handful of other ingredients are all it takes to make this recipe so',
        45,
        2.05,
        'difficile',
        '[{\"id\": 10011693, \"name\": \"canned tomatoes\", \"unit\": \"grams\", \"amount\": 400, \"original\": \"400 grams can tomatoes\"}, {\"id\": 1001009, \"name\": \"cheddar cheese\", \"unit\": \"cups\", \"amount\": 1.5, \"original\": \"1 1/2 cups Grated Cheddar Cheese\"}, {\"id\": 2009, \"name\": \"chili powder\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon Chili Powder\"}, {\"id\": 42289, \"name\": \"corn oil\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons Corn Oil\"}, {\"id\": 10211215, \"name\": \"garlic cloves\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 Garlic Cloves, crushed\"}, {\"id\": 11333, \"name\": \"bell pepper\", \"unit\": \"\", \"amount\": 0.5, \"original\": \"1/2 Green Pepper, chopped\"}, {\"id\": 31015, \"name\": \"chili\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 Fresh Green Chili, chopped\"}, {\"id\": 1012014, \"name\": \"ground cumin\", \"unit\": \"teaspoon\", \"amount\": 0.25, \"original\": \"1/4 teaspoon Ground Cumin\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 Onion, finely chopped\"}, {\"id\": 2028, \"name\": \"paprika\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon paprika\"}, {\"id\": 10211821, \"name\": \"paprika to garnish\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"Paprika to garnish\"}, {\"id\": 16202, \"name\": \"refried beans\", \"unit\": \"oz\", \"amount\": 13, \"original\": \"1 can Refried Beans (13 oz.)\"}, {\"id\": 19056, \"name\": \"tortilla chips\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups Tortilla Chips\"}, {\"id\": 14412, \"name\": \"water\", \"unit\": \"tablespoons\", \"amount\": 5, \"original\": \"5 tablespoons Water\"}]',
        'Étape 1: Heat oil in a skillet, add the onion, green pepper, and garlic, and cook gently, stirring occasionally, for 5 minutes or until soft but not browned.\n\nÉtape 2: Add the tomatoes and chili and cook over medium heat for 5 minutes, or until most of the liquid has evaporated.Stir in the chili powder and paprika and cook for 3 minutes, then add the refried beans, breaking them up with a fork.\n\nÉtape 3: Add the measured water and cook, stirring occasionally, for 8-10 minutes, until the mixture thickens.Spoon the beans into the middle of a baking dish, arrange the tortilla chips around the edge and sprinkle with cumin.\n\nÉtape 4: Sprinkle the cheese over the beans and tortilla chips.\n\nÉtape 5: Bake at 400 degrees for 15-20 minutes, until the cheese has melted.\n\nÉtape 6: Sprinkle the paprika for garnish in a lattice pattern on top and serve immediately.',
        'https://img.spoonacular.com/recipes/652919-556x370.jpg',
        1,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        24,
        658418,
        'Roast Chicken with Apples and Rosemary',
        'Need a gluten free, dairy free, paleolithic, and primal main course? Roast Chicken with Apples and Rosemary could be a super recipe to try. One portion of this dish contains around 35g of protein, 30g of fat, and a total of 513 calories. This recipe serves 8. For $2.36 per serving, this recipe covers 22% of your daily requirements of vitamins and minerals. If you have apples, onions, garlic, and a few other ingredients on hand, you can make it. 7 people have made this recipe and would make it ag',
        45,
        2.36,
        'difficile',
        '[{\"id\": 9003, \"name\": \"apples\", \"unit\": \"\", \"amount\": 4, \"original\": \"4-6 fresh apples, quartered and cored (anything but Granny Smith)\"}, {\"id\": 11282, \"name\": \"onions\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 onions, peeled and cut into large chunks\"}, {\"id\": 1002011, \"name\": \"garlic\", \"unit\": \"head\", \"amount\": 3, \"original\": \"3 head garlic, broken into cloves, peeled\"}, {\"id\": 2063, \"name\": \"rosemary\", \"unit\": \"sprigs\", \"amount\": 8, \"original\": \"8 sprigs fresh rosemary\"}, {\"id\": 9150, \"name\": \"lemons\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 lemons quartered (reserve one for garnish)\"}, {\"id\": 2069, \"name\": \"raimondo sicilian lemon balsamic vinegar\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup Raimondo Sicilian Lemon Balsamic Vinegar\"}, {\"id\": 1022020, \"name\": \"seasoning - make a rub\", \"unit\": \"servings\", \"amount\": 8, \"original\": \"Seasoning - make a rub with the following - garlic powder, salt, pepper and thyme.\"}, {\"id\": 5109, \"name\": \"roasting chickens\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 roasting chickens\"}, {\"id\": 1006615, \"name\": \"stock\", \"unit\": \"can\", \"amount\": 1, \"original\": \"1 can of stock (chicken or veggie)\"}]',
        'Étape 1: Preheat oven to 400 degrees.  Position a rack in the lower third of the oven.  Rinse the chicken, then dry it very well with paper towels, inside and out.\n\nÉtape 2: Place apples, rosemary, 3 lemons, onions, and garlic in a single layer in shallow roasting pan. Season with salt and pepper. Toss well and pour in the vinegar. Season the chicken well with the rub and place breast-side-up on top of the veggies and fruits.\n\nÉtape 3: Put the rest of the veggies and fruit in the cavity of the chicken.\n\nÉtape 4: Roast for 30 minutes, until the breast is firm and just beginning to brown in spots. Using tongs, turn the chicken breast-down and roast for 20 minutes longer, until the skin is lightly browned and the thermometer registers 175 to 18\n\nÉtape 5: Tilt the chicken to drain the cavity juices into the pan and remove the goodies from the inside and bottom of pan.  Now transfer the bird to a cutting board.\n\nÉtape 6: Remove the rack from the pan and spoon off the fat. Set the pan over high heat.\n\nÉtape 7: Add the stock and cook, scraping up any browned bits and leftover pieces of goodies. Squeeze the last lemon to release the juices. Carve the chicken and pass the chunky jus at the table.',
        'https://img.spoonacular.com/recipes/658418-556x370.jpg',
        0,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        25,
        650844,
        'Mango-Berry Swirled Smoothies',
        'Mango-Berry Swirled Smoothies is a breakfast that serves 4. One serving contains 135 calories, 2g of protein, and 1g of fat. For $2.05 per serving, this recipe covers 10% of your daily requirements of vitamins and minerals. 2 people found this recipe to be tasty and satisfying. If you have blueberries, strawberries, pomegranate juice, and a few other ingredients on hand, you can make it. From preparation to the plate, this recipe takes roughly 45 minutes. It is a good option if you\'re following ',
        45,
        2.05,
        'difficile',
        '[{\"id\": 9050, \"name\": \"blueberries\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup fresh or frozen blueberries\"}, {\"id\": 9206, \"name\": \"juice of orange\", \"unit\": \"\", \"amount\": 1, \"original\": \"juice of 1 orange\"}, {\"id\": 9176, \"name\": \"mangoes\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 mangoes, peeled and pitted\"}, {\"id\": 9442, \"name\": \"pomegranate juice\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup 100% pomegranate juice, plus more if necessary\"}, {\"id\": 9316, \"name\": \"strawberries\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup fresh or frozen strawberries (4 or 5 large ones)\"}]',
        'Étape 1: Smoothie 1: blueberries, strawberries, pomegranate juice Smoothie 2: mangos, orange juice\n\nÉtape 2: If you have an immersion blender, place the ingredients for each smoothie into its own quart-sized mason jar or a really large cup. Blend one smoothie, rinse off the blender, then blend the other.If you\'re using a blender, blend smoothies one at a time, rinsing the blender between uses.\n\nÉtape 3: Pour the smoothies together into serving cups, creating a swirled effect.',
        'https://img.spoonacular.com/recipes/650844-556x370.jpg',
        1,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        26,
        638714,
        'Chinese Style Chicken and Noodle Stir Fry',
        'Chinese Style Chicken and Noodle Stir Fry takes about 45 minutes from beginning to end. One portion of this dish contains around 31g of protein, 10g of fat, and a total of 469 calories. This recipe serves 6. For $2.13 per serving, this recipe covers 20% of your daily requirements of vitamins and minerals. 2 people found this recipe to be scrumptious and satisfying. This recipe from Foodista requires chicken thighs, garlic, bell pepper, and carrots. It works well as a Chinese main course. It is a',
        45,
        2.14,
        'difficile',
        '[{\"id\": 93803, \"name\": \"chow mein noodles\", \"unit\": \"gram\", \"amount\": 454, \"original\": \"16 ounces (454 gram) package of chow mein noodles\"}, {\"id\": 6194, \"name\": \"chicken broth\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup chicken broth\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon sugar\"}, {\"id\": 6176, \"name\": \"oyster sauce\", \"unit\": \"tablespoons\", \"amount\": 4, \"original\": \"4 tablespoons oyster sauce\"}, {\"id\": 16124, \"name\": \"soy sauce\", \"unit\": \"tablespoons\", \"amount\": 1.5, \"original\": \"1 1/2 tablespoons soy sauce\"}, {\"id\": 14412, \"name\": \"water\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup water\"}, {\"id\": 4669, \"name\": \"vegetable oil\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons vegetable oil\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons minced garlic\"}, {\"id\": 11216, \"name\": \"ginger\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons minced ginger\"}, {\"id\": 5096, \"name\": \"chicken thighs\", \"unit\": \"\", \"amount\": 5, \"original\": \"5 boneless, skinless chicken thighs, cut into bite sized pieces\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 onion, chopped\"}, {\"id\": 11821, \"name\": \"bell pepper\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 red pepper, sliced into thin strips\"}, {\"id\": 11124, \"name\": \"carrots\", \"unit\": \"large\", \"amount\": 2, \"original\": \"2 large carrots, cut into matchsticks\"}, {\"id\": 10011300, \"name\": \"sugar snap peas\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup sugar snap peas, sliced lengthwise\"}]',
        'Étape 1: Soak noodles in hot water until softened, about 5 minutes.\n\nÉtape 2: Drain and set aside.\n\nÉtape 3: In a small bowl, combine chicken broth, sugar, oyster sauce, soy sauce and water. Set aside.\n\nÉtape 4: Heat oil in a wok over medium high heat. When hot, add garlic and ginger. Cook until fragrant , about 30 seconds, then add chicken and cook until done.\n\nÉtape 5: Add vegetables and cook until tender crisp, about 4 -5 minutes, then add chicken broth mixture.\n\nÉtape 6: Stir in drained noodles and cook until heated through, about 2 minutes. Enjoy!',
        'https://img.spoonacular.com/recipes/638714-556x370.jpg',
        0,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        27,
        662560,
        'Sweet Potato Casserole with Pecan Crumble Topping',
        'Sweet Potato Casserole with Pecan Crumble Topping is a side dish that serves 10. For 49 cents per serving, this recipe covers 9% of your daily requirements of vitamins and minerals. One serving contains 237 calories, 3g of protein, and 8g of fat. It is perfect for Thanksgiving. 2 people found this recipe to be flavorful and satisfying. Head to the store and pick up sweet potatoes, vanilla, evaporated milk, and a few other things to make it today. From preparation to the plate, this recipe takes ',
        45,
        0.49,
        'difficile',
        '[{\"id\": 19334, \"name\": \"brown sugar\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup brown sugar\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons butter\"}, {\"id\": 1123, \"name\": \"egg\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 egg, beaten\"}, {\"id\": 1214, \"name\": \"evaporated milk\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup evaporated milk\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"cup\", \"amount\": 0.33333334, \"original\": \"1/3 cup flour\"}, {\"id\": 9200, \"name\": \"orange\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 orange\"}, {\"id\": 10012142, \"name\": \"pecan pieces\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup pecan pieces\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"3/4 cup sugar\"}, {\"id\": 11507, \"name\": \"sweet potatoes\", \"unit\": \"cups\", \"amount\": 3, \"original\": \"2 pounds sweet potatoes ( 3 cups mashed) (I used 4 large)\"}, {\"id\": 1052050, \"name\": \"vanilla\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon vanilla\"}]',
        'Étape 1: Preheat oven to 350F.  In a a large pot, add sweet potatoes and fill with water until the potatoes are just covered.  Bring to a boil, turn heat down and gently boil until potatoes are fork tender, about 15 minutes.  In a large bowl add: beaten egg, sugar, evaporated milk, orange zest from the orange, 3 tablespoons of butter and vanilla.\n\nÉtape 2: Add cooked and drained sweet potatoes to the large bowl and break up the sweet potatoes with a wooden spoon or a mixer on low speed.\n\nÉtape 3: Add the freshly squeezed orange juice (about 1/4 cup) and mix until combined and potatoes are smooth.  Put sweet potato mixture into a greased 9 x 5 loaf pan.For the crumb topping, mix brown sugar and flour, cut in the 2 tablespoons of butter then stir in the pecan pieces.  cover the sweet potato casserole completely with the crumb topping.  Decorate with pecan halves if desired.\n\nÉtape 4: Bake for 25 minutes.',
        'https://img.spoonacular.com/recipes/662560-556x370.jpg',
        1,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        28,
        634437,
        'Basil Tagliatelle with Roasted Red Bell Pepper Salad',
        'Basil Tagliatelle with Roasted Red Bell Pepper Salad might be a good recipe to expand your hor d\'oeuvre repertoire. This recipe serves 4 and costs $4.07 per serving. One serving contains 200 calories, 5g of protein, and 12g of fat. A mixture of extra virgin olive oil, horseradish, garlic cloves, and a handful of other ingredients are all it takes to make this recipe so tasty. 4 people have made this recipe and would make it again. It is brought to you by Foodista. From preparation to the plate, ',
        45,
        4.07,
        'difficile',
        '[{\"id\": 10220409, \"name\": \"tagliatelle\", \"unit\": \"ounces\", \"amount\": 7, \"original\": \"200g ( - 7 ounces) whole wheat tagliatelle\"}, {\"id\": 11821, \"name\": \"bell peppers\", \"unit\": \"medium\", \"amount\": 10, \"original\": \"10 red bell peppers, medium\"}, {\"id\": 10211215, \"name\": \"garlic cloves\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 garlic cloves, minced\"}, {\"id\": 11297, \"name\": \"parsley\", \"unit\": \"tbsp\", \"amount\": 4, \"original\": \"4 tbsp chopped parsley\"}, {\"id\": 1002055, \"name\": \"horseradish\", \"unit\": \"tbsp\", \"amount\": 4, \"original\": \"4 tbsp grated horseradish\"}, {\"id\": 11291, \"name\": \"green onions\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 green onions, chopped\"}, {\"id\": 9152, \"name\": \"lemon juice\", \"unit\": \"tbsp\", \"amount\": 4, \"original\": \"4 tbsp lemon juice\"}, {\"id\": 1034053, \"name\": \"extra virgin olive oil\", \"unit\": \"tbsp\", \"amount\": 3, \"original\": \"3 tbsp extra virgin olive oil\"}, {\"id\": 1012047, \"name\": \"sea salt\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp sea salt\"}, {\"id\": 1002030, \"name\": \"ground pepper\", \"unit\": \"tsp\", \"amount\": 0.33333334, \"original\": \"1/3 tsp ground pepper\"}]',
        'Étape 1: Go to my blog for the full instructions: http://gourmandelle.com/basil-tagliatelle-with-roasted-red-bell-pepper-salad/',
        'https://img.spoonacular.com/recipes/634437-556x370.jpg',
        1,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        29,
        659581,
        'Scotch Eggs',
        'The recipe Scotch Eggs can be made in approximately 45 minutes. This recipe serves 8. One serving contains 296 calories, 17g of protein, and 20g of fat. For 83 cents per serving, this recipe covers 11% of your daily requirements of vitamins and minerals. It works well as a very reasonably priced hor d\'oeuvre. It is brought to you by Foodista. Head to the store and pick up bulk sausage, corn meal, eggs, and a few other things to make it today. 2 people were impressed by this recipe. It is a good ',
        45,
        0.83,
        'difficile',
        '[{\"id\": 7063, \"name\": \"bulk sausage\", \"unit\": \"pound\", \"amount\": 1, \"original\": \"1 pound bulk sausage\"}, {\"id\": 18079, \"name\": \"corn meal\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup bread crumbs or corn meal\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 9, \"original\": \"9 eggs\"}]',
        'Étape 1: Divide sausage into 8 portions. On a lightly crumb sprinkled surface, pat out each portion to about 1/8 inch thickness. Wrap 1 sausage portion completely around 1 hard boiled egg, pressing edges together to seal. Repeat with remaining sausage and hard boiled eggs.Dip sausage-covered eggs in 1 beaten egg and then roll in breadcrumbs.Deep fry or place on baking sheet and bake in a 375 degree oven for 20 minutes until lightly browned.',
        'https://img.spoonacular.com/recipes/659581-556x370.jpg',
        0,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        30,
        642595,
        'Farmer\'s Market Wild Mushroom Risotto',
        'Farmer\'s Market Wild Mushroom Risotto is a Mediterranean hor d\'oeuvre. This gluten free recipe serves 6 and costs $8.07 per serving. One portion of this dish contains about 11g of protein, 29g of fat, and a total of 569 calories. 5 people have tried and liked this recipe. A mixture of salt and pepper, chicken broth, crimini mushrooms, and a handful of other ingredients are all it takes to make this recipe so yummy. It is brought to you by Foodista. From preparation to the plate, this recipe take',
        45,
        8.07,
        'difficile',
        '[{\"id\": 10020052, \"name\": \"arborio rice\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups Arborio rice\"}, {\"id\": 2004, \"name\": \"bay leaves\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 Bay leaves\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons butter\"}, {\"id\": 1041009, \"name\": \"parmesano-reggian cheese\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup Parmesano-Reggian cheese\"}, {\"id\": 6194, \"name\": \"chicken broth\", \"unit\": \"cups\", \"amount\": 8, \"original\": \"8 cups chicken broth\"}, {\"id\": 11266, \"name\": \"crimini mushrooms\", \"unit\": \"pound\", \"amount\": 0.5, \"original\": \"1/2 pound crimini mushrooms, sliced\"}, {\"id\": 14106, \"name\": \"wine\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"3/4 cup dry white wine\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"cloves\", \"amount\": 2, \"original\": \"2 cloves of garlic, minced\"}, {\"id\": 11240, \"name\": \"morel mushrooms\", \"unit\": \"pound\", \"amount\": 0.5, \"original\": \"1/2 pound morel mushrooms, sliced\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"tablespoons\", \"amount\": 3, \"original\": \"3 tablespoons olive oil\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 onion, finely chopped, divided\"}, {\"id\": 10311297, \"name\": \"parsley\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons Italian parsley, chopped\"}, {\"id\": 1102047, \"name\": \"salt and pepper\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Salt and pepper\"}, {\"id\": 1012049, \"name\": \"ts thyme\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 Ts fresh thyme, chopped\"}, {\"id\": 1024053, \"name\": \"truffle oil\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Truffle oil, for finishing\"}]',
        'Étape 1: Heat the chicken broth in a medium saucepan and keep warm over low heat.\n\nÉtape 2: Heat 1 tablespoon of oil in a large skillet over medium heat.\n\nÉtape 3: Add 1/2 onion and 1 clove garlic, cook, stirring, until translucent, about 5 minutes.\n\nÉtape 4: Add the fresh mushrooms, herbs and butter.\n\nÉtape 5: Saute for 3 to 5 minutes until lightly browned, season with salt and pepper. Season with salt and fresh cracked pepper.\n\nÉtape 6: Saute 1 minute then remove from heat and set aside.Coat a saucepan with remaining 2 tablespoons of oil. Over medium heat, saute the remaining 1/2 onion and garlic clove.\n\nÉtape 7: Add the rice and stir quickly until it is well-coated and opaque, 2-3 minutes.\n\nÉtape 8: Add vegetable stock and cook for 20 minutes without the lid on.Stir in wine and cook until it is nearly all evaporated.With a ladle, add 1 cup of the warm broth and cook, stirring, until the rice has absorbed the liquid.\n\nÉtape 9: Add the remaining broth, 1 cup at a time, cooking and stirring, allowing the rice to absorb each addition of broth before adding more. The risotto should be slightly firm and creamy, not mushy.\n\nÉtape 10: Transfer the mushrooms to the rice mixture.Stir in Parmesan cheese, cook briefly until melted. Top with a drizzle of truffle oil and chopped parsley before serving.',
        'https://img.spoonacular.com/recipes/642595-556x370.jpg',
        0,
        '2025-05-02 06:02:55',
        '2025-05-02 06:02:55',
        NULL
    ),
(
        31,
        642169,
        'Edamame Hummus',
        'Need a gluten free, dairy free, lacto ovo vegetarian, and vegan hor d\'oeuvre? Edamame Hummus could be an awesome recipe to try. This recipe serves 6. For 67 cents per serving, this recipe covers 6% of your daily requirements of vitamins and minerals. One serving contains 177 calories, 6g of protein, and 14g of fat. It is brought to you by Foodista. 4 people were glad they tried this recipe. This recipe is typical of middl eastern cuisine. If you have ground coriander, garlic, flat-leaf parsley, ',
        45,
        0.67,
        'difficile',
        '[{\"id\": 1032009, \"name\": \"chili flakes\", \"unit\": \"teaspoon\", \"amount\": 0.25, \"original\": \"¼ teaspoon chili flakes (if you like it spicy)\"}, {\"id\": 99296, \"name\": \"edamame\", \"unit\": \"oz\", \"amount\": 8, \"original\": \"8 oz. Edamame\"}, {\"id\": 10211297, \"name\": \"flat-leaf parsley\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon chopped, fresh flat-leaf parsley\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"cloves\", \"amount\": 4, \"original\": \"4 cloves garlic minced\"}, {\"id\": 1002013, \"name\": \"ground coriander\", \"unit\": \"teaspoon\", \"amount\": 0.25, \"original\": \"¼ teaspoon ground coriander\"}, {\"id\": 1012014, \"name\": \"ground cumin\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"½ teaspoon ground cumin\"}, {\"id\": 1082047, \"name\": \"kosher salt\", \"unit\": \"teaspoon\", \"amount\": 0.75, \"original\": \"¾ teaspoon Kosher salt\"}, {\"id\": 9150, \"name\": \"lemon\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 lemon\"}, {\"id\": 9156, \"name\": \"lemon zest\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"½ teaspoon freshly grated lemon zest\"}, {\"id\": 1034053, \"name\": \"olive oil\", \"unit\": \"tablespoons\", \"amount\": 3, \"original\": \"3 tablespoons extra-virgin olive oil\"}, {\"id\": 12698, \"name\": \"tahini\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"¼ cup Tahini (sesame-seed paste)\"}, {\"id\": 14412, \"name\": \"water\", \"unit\": \"cups\", \"amount\": 3, \"original\": \"3 cups of Water\"}]',
        'Étape 1: Boil the edamame in salted water for 4 to 5 minutes.\n\nÉtape 2: Drain.In a food processor, puree the Edamame, tahini, water, lemon zest and juice, garlic, salt, cumin, coriander, and chili flakes (optional) until smooth.With the motor running, slowly drizzle in 2 tablespoons of olive oil and mix until absorbed.\n\nÉtape 3: Transfer to a small bowl, stir in the parsley and drizzle with remaining oil.\n\nÉtape 4: Serve, or refrigerate, covered, up to 3 days.',
        'https://img.spoonacular.com/recipes/642169-556x370.jpg',
        1,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        32,
        659463,
        'Savory Cheese Dill Scones',
        'Savory Cheese Dill Scones is a breakfast that serves 12. One portion of this dish contains approximately 6g of protein, 11g of fat, and a total of 216 calories. For 27 cents per serving, this recipe covers 7% of your daily requirements of vitamins and minerals. A couple people made this recipe, and 40 would say it hit the spot. It is brought to you by Foodista. A mixture of coarsely cheddar cheese, a pinch of baking soda, sugar, and a handful of other ingredients are all it takes to make this re',
        45,
        0.27,
        'difficile',
        '[{\"id\": 18369, \"name\": \"baking powder\", \"unit\": \"teaspoon\", \"amount\": 0.75, \"original\": \"3/4 teaspoon baking powder\"}, {\"id\": 18372, \"name\": \"a pinch of baking soda\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon and a pinch of baking soda\"}, {\"id\": 1002030, \"name\": \"pepper\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon freshly ground black pepper\"}, {\"id\": 1001, \"name\": \"tablespoons butter\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup (or 1 stick) and 3 tablespoons cold butter, sliced\"}, {\"id\": 1230, \"name\": \"buttermilk\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup buttermilk\"}, {\"id\": 1001009, \"name\": \"coarsely cheddar cheese\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup coarsely grated Cheddar cheese\"}, {\"id\": 1012, \"name\": \"cottage cheese\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup cottage cheese\"}, {\"id\": 2045, \"name\": \"dill\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon chopped fresh dill\"}, {\"id\": 11677, \"name\": \"shallot\", \"unit\": \"large\", \"amount\": 1, \"original\": \"1 large shallot, chopped\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon sugar\"}, {\"id\": 20081, \"name\": \"unbleached flour\", \"unit\": \"cups\", \"amount\": 2.25, \"original\": \"2 1/4 cups unbleached all-purpose flour\"}, {\"id\": 20080, \"name\": \"flour\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup whole wheat flour\"}]',
        'Étape 1: Preheat oven to 375F with the rack in middle position.Make the Scone',
        'https://img.spoonacular.com/recipes/659463-556x370.jpg',
        1,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        33,
        633786,
        'Baked Scallops With Parma Ham',
        'Baked Scallops With Parma Ham is a dairy free recipe with 6 servings. One portion of this dish contains approximately 13g of protein, 9g of fat, and a total of 168 calories. For $1.51 per serving, this recipe covers 16% of your daily requirements of vitamins and minerals. 31 person were impressed by this recipe. It works best as a main course, and is done in around 45 minutes. Head to the store and pick up big scallops, parsley, bell pepper, and a few other things to make it today. It is brought',
        45,
        1.51,
        'difficile',
        '[{\"id\": 10015172, \"name\": \"big scallops\", \"unit\": \"small\", \"amount\": 12, \"original\": \"12 big fresh scallops (18 if they\'re small)\"}, {\"id\": 10151, \"name\": \"parma ham\", \"unit\": \"slices\", \"amount\": 4, \"original\": \"4 thin slices of Parma ham\"}, {\"id\": 10211215, \"name\": \"garlic clove\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 garlic clove\"}, {\"id\": 18079, \"name\": \"breadcrumbs\", \"unit\": \"tablespoons\", \"amount\": 3, \"original\": \"3 tablespoons of dried breadcrumbs\"}, {\"id\": 11297, \"name\": \"parsley\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons of parsley\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons of olive oil\"}, {\"id\": 10211821, \"name\": \"bell pepper\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Pepper\"}]',
        'Étape 1: Preheat oven to 410 F (210 C / T 7).\n\nÉtape 2: Mix breadcrumbs, Parma ham, garlic, parsley and 1 teaspoon of olive oil in a food processor.\n\nÉtape 3: Fold a piece of kitchen paper, pour 1 teaspoon of olive oil on it and use it to grease an oven rack.\n\nÉtape 4: Place scallops on the greased rack and top them with Parma ham mix.\n\nÉtape 5: Pour a dash of olive oil on top and bake in oven for 8 minutes.\n\nÉtape 6: Serve as a starter with a few leaves of lamb\'s lettuce or rocket if you like.',
        'https://img.spoonacular.com/recipes/633786-556x370.jpg',
        0,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        34,
        636087,
        'Breakfast: Waffles',
        'Breakfast: Waffles takes about 45 minutes from beginning to end. This recipe serves 4. One serving contains 483 calories, 13g of protein, and 19g of fat. For 64 cents per serving, this recipe covers 15% of your daily requirements of vitamins and minerals. It is brought to you by Foodista. It works well as an inexpensive breakfast. 10 people have tried and liked this recipe. Head to the store and pick up sugar, butter, powder sugar, and a few other things to make it today. It is a good option if ',
        45,
        0.64,
        'difficile',
        '[{\"id\": 18369, \"name\": \"baking powder\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon baking powder\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"c\", \"amount\": 0.25, \"original\": \"1/4 - 1/3 c. butter (butter)\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"large\", \"amount\": 3, \"original\": \"3 large eggs, well beaten\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"cups\", \"amount\": 1.75, \"original\": \"1 ¾ cups all-purpose flour\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"½ teaspoon salt\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons sugar\"}, {\"id\": 19335, \"name\": \"powder sugar\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"Powder sugar\"}, {\"id\": 2050, \"name\": \"vanilla extract\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1teaspoon vanilla extract\"}, {\"id\": 1011077, \"name\": \"milk\", \"unit\": \"cups\", \"amount\": 1.5, \"original\": \"1 ½ cups whole milk\"}]',
        'Étape 1: Preheat the waffle iron. In a large bowl add the flour, baking powder, sugar and salt.\n\nÉtape 2: Mix well together.In another bowl add the well beaten eggs, melted butter, vanilla extract and milk.\n\nÉtape 3: Add the liquid ingredients to the dry ingredients and gently whisk together well.Spoon  cup in the center of the hot waffle iron, or amount recommended by manufacturer.\n\nÉtape 4: Spread the batter  away from the edge of the iron. Close the lid and cook until the waffle is nice and golden brown.\n\nÉtape 5: Serve with sprinkled powder sugar.',
        'https://img.spoonacular.com/recipes/636087-556x370.jpg',
        1,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        35,
        660048,
        'Siamese Fried Noodle (Mee Siam)',
        'Siamese Fried Noodle (Mee Siam) is a dairy free main course. This recipe serves 5 and costs $7.3 per serving. One portion of this dish contains roughly 49g of protein, 30g of fat, and a total of 708 calories. It is brought to you by Foodista. 4 people have tried and liked this recipe. From preparation to the plate, this recipe takes roughly 45 minutes. A mixture of rice vermicelli - soaked in water, shallots, sugar, and a handful of other ingredients are all it takes to make this recipe so yummy',
        45,
        7.30,
        'difficile',
        '[{\"id\": 20133, \"name\": \"rice vermicelli - soaked in water\", \"unit\": \"grams\", \"amount\": 300, \"original\": \"300 grams rice vermicelli (meehoon)- soaked in water for 5 minutes\"}, {\"id\": 15270, \"name\": \"prawns\", \"unit\": \"grams\", \"amount\": 300, \"original\": \"300 grams prawns, shelled and deveined\"}, {\"id\": 10016213, \"name\": \"tofu\", \"unit\": \"pieces\", \"amount\": 2, \"original\": \"2 pieces firm tofu, sliced\"}, {\"id\": 11043, \"name\": \"beansprouts\", \"unit\": \"grams\", \"amount\": 200, \"original\": \"200 grams beansprouts\"}, {\"id\": 11156, \"name\": \"chives\", \"unit\": \"grams\", \"amount\": 150, \"original\": \"150 grams chives, cut into 2 cm length\"}, {\"id\": 15270, \"name\": \"shrimps\", \"unit\": \"grams\", \"amount\": 80, \"original\": \"80 grams dried shrimps, wash and chopped coarsely\"}, {\"id\": 93633, \"name\": \"kaffir lime leaves\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 kaffir lime leaves, shredded finely\"}, {\"id\": 4582, \"name\": \"oil\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"cup oil\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"cloves\", \"amount\": 4, \"original\": \"4 cloves garlic\"}, {\"id\": 11677, \"name\": \"shallots\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 shallots\"}, {\"id\": 2043, \"name\": \"turmeric\", \"unit\": \"small knob\", \"amount\": 1, \"original\": \"1 small knob of fresh turmeric (or 1 1/2 tsp turmeric powder)\"}, {\"id\": 10023232, \"name\": \"birds eye chillies\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 birds eye chillies (up to individual)\"}, {\"id\": 98958, \"name\": \"candlenuts\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 candlenuts\"}, {\"id\": 11972, \"name\": \"lemongrass\", \"unit\": \"stalk\", \"amount\": 1, \"original\": \"1 stalk lemongrass\"}, {\"id\": 11216, \"name\": \"ginger flower\", \"unit\": \"tablespoons\", \"amount\": 3, \"original\": \"3 tablespoons chopped ginger flower (bunga kantan)\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"teaspoons\", \"amount\": 2, \"original\": \"2 teaspoons sugar\"}, {\"id\": 6172, \"name\": \"chicken stock granules\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon chicken stock granules\"}, {\"id\": 1002030, \"name\": \"pepper\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon pepper\"}, {\"id\": 6179, \"name\": \"fish sauce\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons fish sauce\"}, {\"id\": 16124, \"name\": \"soy sauce\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon soy sauce\"}, {\"id\": 9322, \"name\": \"tamarind paste\", \"unit\": \"tablespoon\", \"amount\": 0.5, \"original\": \"1/2 tablespoon tamarind paste\"}, {\"id\": 14412, \"name\": \"water\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups water\"}]',
        'Étape 1: Heat oil in a frying pan.  Lightly fry the chopped dried shrimps and tofu separately.  Dish out and leave aside.\n\nÉtape 2: Stir fry  the pounded ingredients and kaffir lime leaves until aromatic.\n\nÉtape 3: Add prawns and fry until they are half-cooked.  Dish out the prawns and set aside.\n\nÉtape 4: Add in seasonings and bring to the boil.\n\nÉtape 5: Add meehoon and stir fry.\n\nÉtape 6: Mix in dried shrimps, tofu slices, prawns, chives and beansprouts.  Toss well.\n\nÉtape 7: Serve hot with a drizzle of lime/lemon juice.',
        'https://img.spoonacular.com/recipes/660048-556x370.jpg',
        0,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        36,
        716361,
        'Stir Fried Quinoa, Brown Rice and Chicken Breast',
        'You can never have too many main course recipes, so give Stir Fried Quinoa, Brown Rice and Chicken Breast a try. This recipe serves 1 and costs $3.58 per serving. One serving contains 750 calories, 58g of protein, and 20g of fat. 39 people were impressed by this recipe. If you have cherry tomatoes, spring onion, butter, and a few other ingredients on hand, you can make it. It is brought to you by Afrolems. From preparation to the plate, this recipe takes roughly 45 minutes. It is a good option i',
        45,
        3.58,
        'difficile',
        '[{\"id\": 1032027, \"name\": \"suya spice\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon of suya spice or Yaji (optional)\"}, {\"id\": 20040, \"name\": \"quinoa and brown rice mix\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup of quinoa and brown rice mix\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"teaspoon\", \"amount\": 1.5, \"original\": \"1.5 teaspoon of melted butter\"}, {\"id\": 11124, \"name\": \"carrots\", \"unit\": \"handful\", \"amount\": 1, \"original\": \"A handful of chopped carrots\"}, {\"id\": 10311529, \"name\": \"cherry tomatoes\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 whole cherry tomatoes (optional)\"}, {\"id\": 5062, \"name\": \"chicken breast\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 chicken breast (Thinly sliced)\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"cloves\", \"amount\": 2, \"original\": \"2 cloves of garlic\"}, {\"id\": 99186, \"name\": \"seasoning cubes\", \"unit\": \"serving\", \"amount\": 1, \"original\": \"Seasoning cubes\"}, {\"id\": 11333, \"name\": \"bell pepper\", \"unit\": \"handful\", \"amount\": 1, \"original\": \"A handful of chopped green pepper\"}, {\"id\": 10211529, \"name\": \"roma tomato\", \"unit\": \"medium\", \"amount\": 1, \"original\": \"1 medium roma tomato\"}, {\"id\": 10011819, \"name\": \"scotch bonnet pepper\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 scotch bonnet pepper (ata rodo)\"}, {\"id\": 11291, \"name\": \"spring onion\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 chopped spring onion\"}, {\"id\": 4669, \"name\": \"vegetable oil\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon of vegetable oil\"}, {\"id\": 14412, \"name\": \"water\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup water\"}]',
        'Étape 1: In a bowl, season the chicken breast with the seasoning cubes and suya spice and allow to marinate for 2 hours or if you are really hungry, you can use immediately.In a pot of boiling water (1 cup), pour in your quinoa mix and the teaspoon of oil and allow to boil till soft which should take about 5-7 minutes.\n\nÉtape 2: Pour into a bowl and set aside.In a pan, heat up the melted butter and pan fry on medium heat the chicken breast, constantly flipping it over so it browns on both sides, reduce the heat, cover the pan and allow the chicken cook properly. If the pan becomes to dry, add 2 tablespoons of water.Stir in the chopped vegetables into the pan of frying chicken and finally add the quinoa/brown rice mix.\n\nÉtape 3: Serve hot!     ',
        'https://img.spoonacular.com/recipes/716361-556x370.jpg',
        0,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        37,
        636787,
        'Caldo Verde - Portuguese Kale Soup',
        'Caldo Verde - Portuguese Kale Soup takes approximately 45 minutes from beginning to end. One portion of this dish contains around 20g of protein, 10g of fat, and a total of 493 calories. For $2.24 per serving, this recipe covers 35% of your daily requirements of vitamins and minerals. This recipe serves 4. 13 people were glad they tried this recipe. It is a good option if you\'re following a gluten free, dairy free, and whole 30 diet. It is brought to you by Foodista. It works well as a main cour',
        45,
        2.24,
        'difficile',
        '[{\"id\": 11282, \"name\": \"onion\", \"unit\": \"large\", \"amount\": 0.5, \"original\": \"1/2 large onion chopped\"}, {\"id\": 11124, \"name\": \"carrots\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 carrots peeled and sliced\"}, {\"id\": 10211215, \"name\": \"garlic cloves\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 garlic cloves smashed\"}, {\"id\": 11352, \"name\": \"potatoes\", \"unit\": \"large\", \"amount\": 4, \"original\": \"4 large yellow potatoes chopped\"}, {\"id\": 99231, \"name\": \"chorizo links\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 chorizo links with casings removed, halved and chopped\"}, {\"id\": 6172, \"name\": \"chicken stock and 2 cups of water\", \"unit\": \"cups\", \"amount\": 4, \"original\": \"4 cups of chicken stock and 2 cups of water\"}, {\"id\": 11233, \"name\": \"kale\", \"unit\": \"bunch\", \"amount\": 1, \"original\": \"1 bunch of kale julienned\"}, {\"id\": 14412, \"name\": \"of water and 2 packets of chicken boullion\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"cup or 6 of water and 2 packets of Chicken Boullion\"}, {\"id\": 1032009, \"name\": \"pepper flakes\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"crushed red pepper flakes\"}, {\"id\": 1102047, \"name\": \"salt and pepper\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"salt and pepper to taste\"}]',
        'Étape 1: Chop your onions, slice your carrots and smash your garlic. Set aside.\n\nÉtape 2: Peel and chop the potatoes. Set aside in a bowl of cold water.\n\nÉtape 3: Remove the casing from your chorizo. This is an important step. Chorizo casing is tough and unforgiving and will make the sausage link curl during the cooking process. Just remove it and don\'t worry about appearance.\n\nÉtape 4: Cut the links length-wise then chop into half-moons.\n\nÉtape 5: Sautee in a separate pan until the are nice and browned. Don\'t put into the pot until the last minute, otherwise the color of the chorizo will leach into the soup turning it a weird red color.\n\nÉtape 6: Now it\'s time to prepare the kale. With each individual leaf, cut out the stem. You can do this several ways.\n\nÉtape 7: Cut a triangle out of the leaf, or fold over the leaf and cut out the stem that way. Or rip off the halves of the leaves off the stem. I like a little bit of stem to give some crunch and texture.\n\nÉtape 8: Tightly roll the leaf into a bundle.\n\nÉtape 9: Run your knife over it to julienne the leaf into thin strips.\n\nÉtape 10: Don\'t worry if it\'s not perfect. Set aside the kale.\n\nÉtape 11: In a big pot, sautee your onions, carrots and garlic in a bit of olive oil.\n\nÉtape 12: Once the vegetables start to soften, add the potatoes and some crushed red pepper flakes. Stir the pot and cook the potatoes until the outer edges start turning clear.\n\nÉtape 13: Then add the 6 cups of water and 2 bouillion packets (or 4 cups of broth and 2 cups of water) to the pot. Bring to a boil then let simmer until the potatoes are cooked.\n\nÉtape 14: With a wooden spoon, mash the potatoes against the side of the pot. Do this until almost all the chunks of potatoes are mashed. Leave some chunks behind. This will give your soup a wonderful hearty texture.\n\nÉtape 15: Now it\'s time to add the Kale. It looks like a lot and will fill up your whole pot but not to worry because it wilts down pretty quickly.\n\nÉtape 16: Cook for 5 minutes at a simmer then stir in chorizo sausage.\n\nÉtape 17: Serve hot or at room temperature (the latter is my favorite). Eat with a nice crusty loaf of Portuguese bread. Enjoy!',
        'https://img.spoonacular.com/recipes/636787-556x370.jpg',
        0,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        38,
        640166,
        'Cornmeal-Crusted Catfish with Cajun Seasoning and Spicy Tartar Sauce',
        'You can never have too many main course recipes, so give Cornmeal-Crusted Catfish with Cajun Seasoning and Spicy Tartar Sauce a try. This gluten free and pescatarian recipe serves 4 and costs $2.68 per serving. One portion of this dish contains approximately 27g of protein, 26g of fat, and a total of 406 calories. From preparation to the plate, this recipe takes approximately 45 minutes. 8 people were impressed by this recipe. This recipe from Foodista requires jalapeno chile, lemon juice, cornm',
        45,
        2.68,
        'difficile',
        '[{\"id\": 1123, \"name\": \"egg\", \"unit\": \"large\", \"amount\": 1, \"original\": \"1 large egg\"}, {\"id\": 1077, \"name\": \"milk\", \"unit\": \"tbsp\", \"amount\": 1, \"original\": \"1 tbsp milk\"}, {\"id\": 35137, \"name\": \"cornmeal\", \"unit\": \"cup\", \"amount\": 0.33333334, \"original\": \"1/3 cup yellow cornmeal\"}, {\"id\": 2009, \"name\": \"chile powder\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp chile powder\"}, {\"id\": 2031, \"name\": \"cayenne powder\", \"unit\": \"tsp\", \"amount\": 0.5, \"original\": \"1/2 tsp cayenne powder\"}, {\"id\": 1012028, \"name\": \"paprika\", \"unit\": \"tsp\", \"amount\": 0.5, \"original\": \"1/2 tsp hot smoked paprika\"}, {\"id\": 1002020, \"name\": \"granulated garlic\", \"unit\": \"tsp\", \"amount\": 0.5, \"original\": \"1/2 tsp granulated garlic\"}, {\"id\": 15010, \"name\": \"catfish filets\", \"unit\": \"oz\", \"amount\": 20, \"original\": \"4 5-oz. skinless catfish filets\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"tbsp\", \"amount\": 3, \"original\": \"3 tbsp olive oil\"}, {\"id\": 1012047, \"name\": \"sea salt\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"sea salt\"}, {\"id\": 1002030, \"name\": \"pepper\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"freshly ground black pepper\"}, {\"id\": 4641, \"name\": \"mayonnaise\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"3/4 cup light mayonnaise\"}, {\"id\": 10011937, \"name\": \"dill pickle\", \"unit\": \"tbsp\", \"amount\": 2, \"original\": \"2 tbsp finely chopped dill pickle\"}, {\"id\": 11979, \"name\": \"jalapeno chile\", \"unit\": \"tbsp\", \"amount\": 1, \"original\": \"1 tbsp finely chopped jalapeno chile\"}, {\"id\": 11291, \"name\": \"scallion\", \"unit\": \"tbsp\", \"amount\": 1, \"original\": \"1 tbsp finely chopped scallion (white and green parts)\"}, {\"id\": 93640, \"name\": \"dill pickle juice\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp dill pickle juice\"}, {\"id\": 9152, \"name\": \"lemon juice\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp fresh lemon juice\"}]',
        'Étape 1: Whisk the egg and milk in a medium bowl.\n\nÉtape 2: Combine the cornmeal, chile powder, cayenne powder, paprika, and garlic in a large zip-top bag.\n\nÉtape 3: Dip each catfish filet in the egg mixture.\n\nÉtape 4: Let excess egg drip off and place the filets in the bag with the cornmeal mixture. Zip the top and shake the bag until all pieces are well coated.\n\nÉtape 5: Remove the filets and lay side by side on a plate (do not overlap).\n\nÉtape 6: Place in the refrigerator for 30 minutes. (Refrigeration helps keep the crust adhered during cooking.)\n\nÉtape 7: While the fish chills, make the sauce.\n\nÉtape 8: Whisk the first 6 ingredients (through lemon juice) in a small bowl. Season with salt and pepper and set aside.\n\nÉtape 9: Heat a large, nonstick skillet over medium heat and add the olive oil. When the oil is hot (but not smoking), season the catfish filets with salt and pepper and add to the skillet. Fry until crispy on the outside and tender on the inside, 3-4 minutes per side, depending on thickness.\n\nÉtape 10: Divide the fish among 4 plates and top each with a dollop of tartar sauce or pass the sauce at the table.',
        'https://img.spoonacular.com/recipes/640166-556x370.jpg',
        0,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        39,
        645145,
        'Grandma B\'s Rhubarb Cake',
        'Grandma B\'s Rhubarb Cake is a lacto ovo vegetarian recipe with 15 servings. This dessert has 209 calories, 3g of protein, and 2g of fat per serving. For 45 cents per serving, this recipe covers 5% of your daily requirements of vitamins and minerals. A mixture of rhubarb, baking powder, brandy, and a handful of other ingredients are all it takes to make this recipe so tasty. 2 people found this recipe to be tasty and satisfying. It is perfect for Mother\'s Day. From preparation to the plate, this ',
        45,
        0.45,
        'difficile',
        '[{\"id\": 9019, \"name\": \"apple sauce\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup apple sauce\"}, {\"id\": 18369, \"name\": \"baking powder\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon baking powder\"}, {\"id\": 1052050, \"name\": \"brandy\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon brandy (or vanilla)\"}, {\"id\": 19334, \"name\": \"brown sugar\", \"unit\": \"cups\", \"amount\": 1.5, \"original\": \"1 1/2 cups brown sugar\"}, {\"id\": 2010, \"name\": \"cinnamon\", \"unit\": \"teaspoons\", \"amount\": 2, \"original\": \"2 teaspoons cinnamon\"}, {\"id\": 12104, \"name\": \"coconut\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup coconut\"}, {\"id\": 1123, \"name\": \"egg\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 egg\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups all-purpose flour\"}, {\"id\": 9307, \"name\": \"rhubarb\", \"unit\": \"cups\", \"amount\": 4, \"original\": \"4 cups rhubarb, finely sliced\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon salt\"}, {\"id\": 1085, \"name\": \"skim milk\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup skim milk\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup sugar\"}, {\"id\": 10112155, \"name\": \"walnuts\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup chopped walnuts\"}]',
        'Étape 1: Mix together cake ingredients and pour into a 9x13 pan sprayed with non-stick.\n\nÉtape 2: Combine sugar, cinnamon and coconut, top cake with mixture and walnuts.\n\nÉtape 3: Bake for 30 minutes.\n\nÉtape 4: Serve warm.',
        'https://img.spoonacular.com/recipes/645145-556x370.jpg',
        1,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        40,
        642585,
        'Farfalle with fresh tomatoes, basil and mozzarella',
        'Need a lacto ovo vegetarian main course? Farfalle with fresh tomatoes, basil and mozzarella could be a tremendous recipe to try. For 97 cents per serving, this recipe covers 19% of your daily requirements of vitamins and minerals. This recipe serves 4. One serving contains 557 calories, 16g of protein, and 15g of fat. 7 people were glad they tried this recipe. Head to the store and pick up butter, basil leaves, tomatoes, and a few other things to make it today. It is brought to you by Foodista. ',
        15,
        0.97,
        'facile',
        '[{\"id\": 10120420, \"name\": \"farfalle pasta by barilla\", \"unit\": \"pound\", \"amount\": 1, \"original\": \"1 pound of Farfalle pasta by Barilla\"}, {\"id\": 2044, \"name\": \"basil leaves\", \"unit\": \"medium\", \"amount\": 24, \"original\": \"24 medium fresh basil leaves\"}, {\"id\": 1026, \"name\": \"mozzarella\", \"unit\": \"large\", \"amount\": 2, \"original\": \"2 large mozzarella, diced\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"tbsp\", \"amount\": 2, \"original\": \"2 tbsp olive oil\"}, {\"id\": 1102047, \"name\": \"salt and pepper\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"Salt and pepper\"}, {\"id\": 11529, \"name\": \"tomatoes\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 tomatoes, halved, seeded and cut in small pieces ½ inch dice (3 cups)\"}, {\"id\": 1145, \"name\": \"butter\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons unsalted butter\"}]',
        'Étape 1: Boil a large pot of salted water and cook the pasta according to the package directions. When done drain, place back in the cooking pan and add the butter.In a large skillet saut the tomatoes with the olive oil, 5 minutes.\n\nÉtape 2: Remove from the heat and add the basil.In a large bowl add the pasta, the tomatoes and mix well.\n\nÉtape 3: Add the mozzarella and give it a last light folding.\n\nÉtape 4: Serve immediately',
        'https://img.spoonacular.com/recipes/642585-556x370.jpg',
        1,
        '2025-05-02 06:02:58',
        '2025-05-02 06:02:58',
        NULL
    ),
(
        41,
        662917,
        'Tasty Easy Meatloaf',
        'Tasty Easy Meatloaf is a dairy free main course. This recipe serves 8 and costs $1.17 per serving. One portion of this dish contains roughly 18g of protein, 20g of fat, and a total of 334 calories. Not a lot of people made this recipe, and 2 would say it hit the spot. This recipe from Foodista requires salt, worcestershire, pepper, and grain mustard. From preparation to the plate, this recipe takes around 45 minutes. Overall, this recipe earns a rather bad spoonacular score of 38%. If you like t',
        45,
        1.17,
        'difficile',
        '[{\"id\": 18079, \"name\": \"breadcrumbs\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup breadcrumbs\"}, {\"id\": 19334, \"name\": \"brown sugar\", \"unit\": \"Tbs\", \"amount\": 3, \"original\": \"3 Tbs brown sugar – packed\"}, {\"id\": 7063, \"name\": \"bulk sausage\", \"unit\": \"lb\", \"amount\": 0.5, \"original\": \"½ lb bulk sausage\"}, {\"id\": 11549, \"name\": \"tomato sauce\", \"unit\": \"oz\", \"amount\": 16, \"original\": \"2 8 oz cans tomato sauce - divided\"}, {\"id\": 2048, \"name\": \"cider vinegar\", \"unit\": \"Tbs\", \"amount\": 3, \"original\": \"3 Tbs Cider vinegar\"}, {\"id\": 1002014, \"name\": \"cumin\", \"unit\": \"tsp\", \"amount\": 0.5, \"original\": \"½ tsp cumin\"}, {\"id\": 1123, \"name\": \"egg\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 egg beaten\"}, {\"id\": 1022020, \"name\": \"garlic powder\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp garlic powder\"}, {\"id\": 10023572, \"name\": \"ground beef\", \"unit\": \"lb\", \"amount\": 1, \"original\": \"1 lb Ground Beef\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"small\", \"amount\": 1, \"original\": \"1 small onion – diced.\"}, {\"id\": 1002030, \"name\": \"pepper\", \"unit\": \"tsp\", \"amount\": 0.5, \"original\": \"½ tsp pepper\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"tsp\", \"amount\": 1.5, \"original\": \"1 ½ tsp salt\"}, {\"id\": 14412, \"name\": \"water\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"½ cup water\"}, {\"id\": 1012046, \"name\": \"grain mustard\", \"unit\": \"Tbs\", \"amount\": 2, \"original\": \"2 Tbs good quality whole grain mustard\"}, {\"id\": 6971, \"name\": \"worcestershire\", \"unit\": \"Tbs\", \"amount\": 2, \"original\": \"2 Tbs Worcestershire\"}]',
        'Étape 1: Mix beef, sausage, bread crumbs, onion, egg, salt, pepper, cumin, garlic powder,  cup tomato sauce. Do not over mix or your meatloaf will become chewy. Simply use your fingers and mush it together and only do this until it is just mixed.\n\nÉtape 2: Place in a shallow oven proof pan and form into a loaf. Stir together the remaining sauce, vinegar, sugar, mustard, water and Worcestershire\n\nÉtape 3: Pour the sauce over the meatloaf and bake x 1 hour until cooked through. While cooking, spoon the sauce over the top of the meatloaf about every 20 minutes.\n\nÉtape 4: Remove from the oven and spoon the sauce over the top a final time. Allow to rest for 10 minutes before serving.',
        'https://img.spoonacular.com/recipes/662917-556x370.jpg',
        0,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        42,
        663833,
        'Triple Chocolate Whoppers',
        'Triple Chocolate Whoppers takes roughly 45 minutes from beginning to end. One serving contains 513 calories, 8g of protein, and 40g of fat. For $1.28 per serving, you get a side dish that serves 10. Head to the store and pick up semisweet chocolate chips, plus 2 espresso powder, pecans, and a few other things to make it today. This recipe is liked by 2 foodies and cooks. It is brought to you by Foodista. Overall, this recipe earns a good spoonacular score of 41%. Try Maida Heatter’s Chocolate Wh',
        45,
        1.29,
        'difficile',
        '[{\"id\": 19078, \"name\": \"semisweet baking chocolate\", \"unit\": \"ounces\", \"amount\": 6, \"original\": \"6 ounces high quality semisweet baking chocolate, such as Valrhona or Callebaut, chopped into large chunks\"}, {\"id\": 18369, \"name\": \"baking powder\", \"unit\": \"teaspoons\", \"amount\": 2, \"original\": \"2 teaspoons baking powder\"}, {\"id\": 19334, \"name\": \"brown sugar\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"3/4 cup brown sugar\"}, {\"id\": 19078, \"name\": \"chocolate into chunks\", \"unit\": \"oz\", \"amount\": 2, \"original\": \"2 oz. unsweetened chocolate chopped into large chunks\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 eggs\"}, {\"id\": 10014214, \"name\": \"plus 2 espresso powder\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon tablespoons plus 2 instant espresso powder\"}, {\"id\": 10012142, \"name\": \"pecans\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup of chopped pecans\"}, {\"id\": 1012047, \"name\": \"sea salt\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon sea salt\"}, {\"id\": 10019903, \"name\": \"semisweet chocolate chips\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup semisweet chocolate chips\"}, {\"id\": 10020081, \"name\": \"unbleached flour\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup all-purpose unbleached flour\"}, {\"id\": 1145, \"name\": \"butter\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup (1 stick) cold unsalted butter, cut into ½ inch cubes\"}, {\"id\": 2050, \"name\": \"vanilla extract\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon pure vanilla extract\"}, {\"id\": 10112155, \"name\": \"walnuts\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup coarsely chopped walnuts\"}]',
        'Étape 1: Preheat the oven to 325 degrees F (163 degrees C).Lightly grease 2 baking sheets. Set aside.\n\nÉtape 2: Combine semisweet chocolate, unsweetened chocolate chunks, and  butter in a double boiler. Melt the chocolate over low heat until just melted, stirring occasionally. Be careful, not to burn the chocolate.\n\nÉtape 3: Remove immediately. Stir to blend the butter and chocolate off the heat, and set aside.\n\nÉtape 4: Combine the eggs, espresso powder, and vanilla extract in a large bowl and cream together using an electric mixer.\n\nÉtape 5: Add the brown sugar and mix until creamy.In a separate bowl, sift together the flour, baking powder, and sea salt. Set aside.\n\nÉtape 6: Add the melted chocolate and butter to the egg mixture and blend together using an electric mixture. Then add the flour mixture and stir by hand just until the dry ingredients and are moist.\n\nÉtape 7: Add the chopped nuts and the chocolate chips to the chocolate and flour mixture folding them in gently. Note:  The dough will be relatively soft.Drop by large tablespoonfuls onto the greased baking sheets at least 3 inches apart. If you want your cookies to look uniform in size then use a 2 oz. cookie or ice cream scoop.\n\nÉtape 8: Bake immediately to prevent the chocolate from hardening for 10 to 12 minutes. Rotate the pan halfway through the baking time. The cookies will still be very soft and sticky inside, but do not overcook the cookies or they will be crispy, rather than chewy. Cool for 10 minutes on the baking sheets before gently removing the whoppers to a baking rack to cool completely.Store the cookies in an airtight container separating the layers with wax paper.Makes about 1 dozen 3-inch cookies',
        'https://img.spoonacular.com/recipes/663833-556x370.jpg',
        0,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        43,
        657312,
        'Pumpkin gnocchi with basil and Parmesan',
        'If you want to add more Mediterranean recipes to your repertoire, Pumpkin gnocchi with basil and Parmesan might be a recipe you should try. For $1.54 per serving, this recipe covers 27% of your daily requirements of vitamins and minerals. This main course has 611 calories, 23g of protein, and 25g of fat per serving. This recipe serves 6. This recipe from Foodista has 20 fans. Head to the store and pick up pepper, grana padano cheese, corn flour, and a few other things to make it today. From prep',
        45,
        1.54,
        'difficile',
        '[{\"id\": 11422, \"name\": \"pumpkin\", \"unit\": \"kg\", \"amount\": 1, \"original\": \"1kg pumpkin, baked and cooled\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 whole eggs\"}, {\"id\": 1012047, \"name\": \"sea salt\", \"unit\": \"tsp\", \"amount\": 0.5, \"original\": \"½ tsp sea salt\"}, {\"id\": 1002030, \"name\": \"pepper\", \"unit\": \"tsp\", \"amount\": 0.25, \"original\": \"¼ tsp pepper\"}, {\"id\": 2044, \"name\": \"basil leaves\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Fresh basil leaves, chopped\"}, {\"id\": 20081, \"name\": \"wheat flour\", \"unit\": \"g\", \"amount\": 250, \"original\": \"250g wheat flour\"}, {\"id\": 20019, \"name\": \"corn flour\", \"unit\": \"g\", \"amount\": 250, \"original\": \"250g corn flour\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Olive oil\"}, {\"id\": 1011033, \"name\": \"grana padano cheese\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Prmesan or Grana Padano cheese, grated\"}, {\"id\": 2044, \"name\": \"basil leaves\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"Fresh basil leaves for garnish\"}]',
        'Étape 1: Separate the meat and chop the pumpkin into a puree.\n\nÉtape 2: Add eggs, stir.\n\nÉtape 3: Add salt, pepper and chopped basil.\n\nÉtape 4: Add flour and knead a soft dough. If the dough is too sticky, add more flour - the amount depends on the water content of the pumpkin.\n\nÉtape 5: Divide the dough into equal rolls 3 cm thick and about 20 cm long.\n\nÉtape 6: Divide and cut each roll into a 2 cm long pieces.\n\nÉtape 7: Cook the gnocchi in a large pot in plenty of salted water. Gnocchi are cooked when they rise to the surface.\n\nÉtape 8: Remove them from the pot with a slotted spoon.\n\nÉtape 9: Pour hot olive oil over gnocchi or simply saut them in hot oil.\n\nÉtape 10: Serve sprinkled with cheese and fresh basil.',
        'https://img.spoonacular.com/recipes/657312-556x370.jpg',
        0,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        44,
        661250,
        'Spinach & Toasted Pumpkin Seed Pesto Pasta',
        'Spinach & Toasted Pumpkin Seed Pesto Pasta might be a good recipe to expand your main course recipe box. This recipe serves 6. One portion of this dish contains about 22g of protein, 26g of fat, and a total of 565 calories. For $1.46 per serving, this recipe covers 26% of your daily requirements of vitamins and minerals. From preparation to the plate, this recipe takes roughly 45 minutes. 2 people were impressed by this recipe. If you have baby spinach, juice of lemon, salt, and a few other ingr',
        45,
        1.46,
        'difficile',
        '[{\"id\": 1045062, \"name\": \"chicken breast halves\", \"unit\": \"large\", \"amount\": 2, \"original\": \"2 large chicken breast halves\"}, {\"id\": 9152, \"name\": \"juice of lemon\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 lemon (juice only)\"}, {\"id\": 4542, \"name\": \"cooking fat\", \"unit\": \"tbsp\", \"amount\": 3, \"original\": \"3 tbsp cooking fat (I used rendered chicken fat, but butter or olive oil will do nicely)\"}, {\"id\": 2027, \"name\": \"salt\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"salt, pepper, dry oregano\"}, {\"id\": 11457, \"name\": \"baby spinach\", \"unit\": \"cups\", \"amount\": 3, \"original\": \"3 packed cups baby spinach\"}, {\"id\": 9156, \"name\": \"lemon zest\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 lemon - juice and zest\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"cups\", \"amount\": 0.33333334, \"original\": \"1/3 cups (or more) olive oil\"}, {\"id\": 11291, \"name\": \"scallions\", \"unit\": \"\", \"amount\": 3, \"original\": \"3-4 scallions, green serving only\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"cloves\", \"amount\": 2, \"original\": \"2-3 cloves garlic\"}, {\"id\": 12014, \"name\": \"pumpkin seeds\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup toasted pumpkin seeds\"}, {\"id\": 11297, \"name\": \"parsley\", \"unit\": \"Tbs\", \"amount\": 3, \"original\": \"3-4 Tbs chopped parsley\"}, {\"id\": 1002030, \"name\": \"salt\", \"unit\": \"servings\", \"amount\": 6, \"original\": \"salt, pepper\"}, {\"id\": 20420, \"name\": \"colorful pasta\", \"unit\": \"lbs\", \"amount\": 1, \"original\": \"1 lbs colorful pasta, not too small\"}, {\"id\": 12014, \"name\": \"coarse salt\", \"unit\": \"tbsp\", \"amount\": 0.5, \"original\": \"1/2 tbsp coarse salt for toasting pumpkin seeds\"}, {\"id\": 1033, \"name\": \"shavings of parmesan into each bowl at serving\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 shavings of parmesan into each bowl at serving\"}]',
        'Étape 1: Start by boiling water for pasta in a large pot.\n\nÉtape 2: Add some salt and olive oil to prevent pasta from sticking.  When water is boiling, add pasta, stir, reduce heat to medium and cook until ready (9-12 minutes, depending on pasta type).\n\nÉtape 3: Drain an set aside.\n\nÉtape 4: While pasta is cooking, prepare the rest of the components simultaneously.\n\nÉtape 5: Start by heating the cooking fat in a skillet over medium heat.\n\nÉtape 6: Sprinkle chicken breast halves with salt, pepper and dry oregano all over.\n\nÉtape 7: Place chicken in heated oil and cook on both sides for a short time (1 minute each).\n\nÉtape 8: Add juice of 1 lemon to the skillet, reduce heat to medium/low and continue cooking, turning occasionally, until done (about 10 - 12 minutes). Set aside.\n\nÉtape 9: If toasting pumpkin seeds, put 1/2 tbsp of coarse salt in a small (preferably cast iron) skillet over medium heat.\n\nÉtape 10: Add pumpkin seeds. Toast seeds for a few minutes, stirring or shaking frequently, until they start to crack and turn golden. Turn off the heat and leave pumpkin seeds in the skillet until cool. When move seeds away from salt before using them. It won\'t be hard, because they are lighter than coarse salt. Discard the salt.\n\nÉtape 11: Now you are ready to prepare pesto.\n\nÉtape 12: Reserve 1-2 tbsp of pumpkin seeds for garnish.\n\nÉtape 13: Put the remaining pumpkin seeds and the rest of the pesto ingredients in a processor and hit pulse a few times at first, allowing everything to settle. Now turn the processor on and see if pesto is thin enough (consistency of pancake batter). If not, add a little more olive oil and/or lemon juice as you work the pesto.\n\nÉtape 14: Slice or dice cooked chicken breasts.\n\nÉtape 15: Assemble  your dish in serving bowls: pasta, chicken, pesto, pumpkin seed sprinkle and shaved or grated parmesan.\n\nÉtape 16: Now inhale deeply and try to say Spinach & Pumpkin Seed Pesto Chicken Pasta Bowl three times in a row fast. That\'s it!',
        'https://img.spoonacular.com/recipes/661250-556x370.jpg',
        0,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        45,
        639850,
        'Cod with tomatoes, olives and polenta',
        'Cod with tomatoes, olives and polentan is a gluten free, dairy free, and pescatarian recipe with 4 servings. One portion of this dish contains approximately 25g of protein, 19g of fat, and a total of 345 calories. For $3.34 per serving, this recipe covers 20% of your daily requirements of vitamins and minerals. This recipe from Foodista has 6 fans. It works well as a main course. A mixture of oregano, salt, corn polenta, and a handful of other ingredients are all it takes to make this recipe so ',
        45,
        3.34,
        'difficile',
        '[{\"id\": 1059195, \"name\": \"olives\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"¾ cup pitted black olives\"}, {\"id\": 15015, \"name\": \"cod fillets\", \"unit\": \"g\", \"amount\": 500, \"original\": \"500 g cod fillets, fresh or frozen\"}, {\"id\": 11168, \"name\": \"corn polenta\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"½ cup instant corn polenta\"}, {\"id\": 20019, \"name\": \"corn flour\", \"unit\": \"Tbs\", \"amount\": 3, \"original\": \"3 Tbs corn flour\"}, {\"id\": 14106, \"name\": \"wine\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"¼ cup dry white wine\"}, {\"id\": 10511297, \"name\": \"parsley\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"Fresh parsley, chopped\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"¼ cup olive oil\"}, {\"id\": 2027, \"name\": \"oregano\", \"unit\": \"pinch\", \"amount\": 1, \"original\": \"A pinch of dry oregano\"}, {\"id\": 2027, \"name\": \"oregano\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"Fresh oregano, chopped\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"pinch\", \"amount\": 1, \"original\": \"A pinch of salt\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"pinch\", \"amount\": 1, \"original\": \"Pinch of Salt\"}, {\"id\": 10011531, \"name\": \"tomatoes\", \"unit\": \"pound\", \"amount\": 1, \"original\": \"1 pound peeled tomatoes\"}, {\"id\": 14412, \"name\": \"water\", \"unit\": \"Tbsp\", \"amount\": 2, \"original\": \"2 Tbsp Cold Water\"}, {\"id\": 2032, \"name\": \"pepper\", \"unit\": \"tsp\", \"amount\": 0.5, \"original\": \"½ tsp white pepper\"}, {\"id\": 14106, \"name\": \"white wine\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"¼ cup white wine\"}]',
        'Étape 1: If the fillets are frozen, thaw them.\n\nÉtape 2: Mix corn flour, salt and white pepper.Dredge the fillets through the flour mixture, and saut them in the oil for 3 minutes on each side.\n\nÉtape 3: Sprinkle the fillets with white wine.\n\nÉtape 4: Add tomatoes and olives, cook for about 5 minutes.Before serving, season the fillets with  oregano and parsley.To make polenta, bring the water to the boil, add wine, oregano and the salt. Gradually stir in the instant polenta and cook, stirring constantly, about 5 minutes or until done.\n\nÉtape 5: Add some boiling water if needed. Cool slightly and serv with the fish.',
        'https://img.spoonacular.com/recipes/639850-556x370.jpg',
        0,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        46,
        642293,
        'Eggplant Parmesan',
        'Eggplant Parmesan requires about 45 minutes from start to finish. For $3.1 per serving, you get a main course that serves 4. One serving contains 541 calories, 28g of protein, and 30g of fat. This recipe is liked by 8 foodies and cooks. Head to the store and pick up onions, parmesan cheese, tomato sauce, and a few other things to make it today. It is a pretty expensive recipe for fans of Mediterranean food. It is brought to you by Foodista. With a spoonacular score of 65%, this dish is solid. Si',
        45,
        3.10,
        'difficile',
        '[{\"id\": 11209, \"name\": \"eggplant\", \"unit\": \"large\", \"amount\": 1, \"original\": \"1 large eggplant\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 eggs, beaten\"}, {\"id\": 18079, \"name\": \"bread crumbs\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup dried bread crumbs\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"cup\", \"amount\": 0.75, \"original\": \"3/4 cup olive oil\"}, {\"id\": 1032, \"name\": \"parmesan cheese\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup grated Parmesan cheese\"}, {\"id\": 1026, \"name\": \"mozzarella cheese\", \"unit\": \"pound\", \"amount\": 0.5, \"original\": \"1/2 pound mozzarella cheese, sliced\"}, {\"id\": 11549, \"name\": \"tomato sauce\", \"unit\": \"oz\", \"amount\": 24, \"original\": \"3 8 oz. cans tomato sauce\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"clove\", \"amount\": 1, \"original\": \"1 clove garlic, crushed\"}, {\"id\": 10511282, \"name\": \"onions\", \"unit\": \"medium\", \"amount\": 2, \"original\": \"2 mediums yellow onions, chopped\"}, {\"id\": 2027, \"name\": \"oregano\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon oregano\"}]',
        'Étape 1: Preheat oven to 350 degrees.\n\nÉtape 2: Slice eggplant into 1/4 inch thick rounds and salt for 30 minutes to remove water.\n\nÉtape 3: Saute onions and garlic in a tablespoon of oil.\n\nÉtape 4: Add tomatoes and oregano, simmer until sauce thickens slightly.\n\nÉtape 5: Dip each eggplant slice first into eggs, then into crumbs.\n\nÉtape 6: Saute in hot olive oil until golden brown on both sides.\n\nÉtape 7: Place a layer of browned slices in 2 quart casserole; sprinkle with some of Parmesan, oregano and mozzarella; then cover well with some of tomato sauce.\n\nÉtape 8: Repeat until all eggplant is used, topping last layer of sauce with several slices of mozzarella.\n\nÉtape 9: Bake until the sauce bubbles and the cheese is melted and browned, about 30 minutes.',
        'https://img.spoonacular.com/recipes/642293-556x370.jpg',
        0,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        47,
        632527,
        'Apple Cupcakes',
        'If you want to add more lacto ovo vegetarian recipes to your recipe box, Apple Cupcakes might be a recipe you should try. This dessert has 305 calories, 5g of protein, and 14g of fat per serving. This recipe serves 15. For 55 cents per serving, this recipe covers 7% of your daily requirements of vitamins and minerals. This recipe is typical of American cuisine. This recipe from Foodista requires flour, apples, butter, and cinnamon powder. 3 people were impressed by this recipe. From preparation ',
        45,
        0.55,
        'difficile',
        '[{\"id\": 18369, \"name\": \"baking powder\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp Baking powder\"}, {\"id\": 19334, \"name\": \"brown sugar\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup packed brown sugar\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"g\", \"amount\": 200, \"original\": \"200g Butter\"}, {\"id\": 1012010, \"name\": \"cinnamon powder\", \"unit\": \"tsp\", \"amount\": 0.5, \"original\": \"1/2 tsp Cinnamon powder\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 eggs\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"cups\", \"amount\": 3, \"original\": \"3 cups flour\"}, {\"id\": 1012010, \"name\": \"sieve the flour\", \"unit\": \"servings\", \"amount\": 15, \"original\": \"*sieve the plain flour, cinnamon powder & baking powder together and mix in the ground almond\"}, {\"id\": 1069003, \"name\": \"apples\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 Green apples (sliced horizontally)\"}, {\"id\": 93740, \"name\": \"ground almond\", \"unit\": \"g\", \"amount\": 50, \"original\": \"50g Ground almond (almond meal)\"}, {\"id\": 1001116, \"name\": \"yogurt\", \"unit\": \"g\", \"amount\": 80, \"original\": \"80g Plain yogurt\"}, {\"id\": 9299, \"name\": \"raisin\", \"unit\": \"g\", \"amount\": 50, \"original\": \"50g Raisin\"}]',
        'Étape 1: Beat (A) - butter and brown sugar till fluffy, add in (B) eggs, one at a time, beat mixture until thick.Fold in (C) plain yogurt and (D) flour mixture alternately till well mixed at low speed.Lastly add in (E) chopped green apples and raisins, fold well with a rubber spatula.Scoop batter into cupcake liners, place apple slices on top and bake in preheated oven at 170C for about 35 minutes or till well done.',
        'https://img.spoonacular.com/recipes/632527-556x370.jpg',
        1,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        48,
        657899,
        'Raspberry Sliced',
        'The recipe Raspberry Sliced can be made in roughly 45 minutes. Watching your figure? This lacto ovo vegetarian recipe has 208 calories, 4g of protein, and 10g of fat per serving. This recipe serves 8 and costs 55 cents per serving. 4 people were impressed by this recipe. Head to the store and pick up raspberries, lemon zest, sugar, and a few other things to make it today. It is brought to you by Foodista. It works well as a cheap side dish. All things considered, we decided this recipe deserves ',
        45,
        0.55,
        'difficile',
        '[{\"id\": 9302, \"name\": \"raspberries\", \"unit\": \"g\", \"amount\": 120, \"original\": \"120g Fresh raspberries\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"g\", \"amount\": 80, \"original\": \"80g Butter, softened\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"g\", \"amount\": 80, \"original\": \"80g Sugar\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"g\", \"amount\": 140, \"original\": \"2 Eggs (about 70g each)\"}, {\"id\": 9152, \"name\": \"lemon juice\", \"unit\": \"tsp\", \"amount\": 3, \"original\": \"3 tsp Lemon juice\"}, {\"id\": 9156, \"name\": \"lemon zest\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp Lemon zest\"}, {\"id\": 2050, \"name\": \"vanilla extract\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp Vanilla extract\"}, {\"id\": 1001116, \"name\": \"natural yoghurt/sour cream\", \"unit\": \"tbsp\", \"amount\": 2, \"original\": \"2 tbsp Natural yoghurt/Sour cream\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"g\", \"amount\": 120, \"original\": \"120g Plain flour\"}, {\"id\": 18369, \"name\": \"baking powder\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp Baking powder\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"tsp\", \"amount\": 0.125, \"original\": \"1/8 tsp pinch of salt\"}, {\"id\": 1077, \"name\": \"milk\", \"unit\": \"g\", \"amount\": 60, \"original\": \"60g Fresh milk\"}]',
        'Étape 1: Line a 7 inch (7 x 7 x\n\nÉtape 2: square cake pan all sides up, set aside\n\nÉtape 3: Sieve flour, baking powder and salt together, add lemon zest into and mix them well, set aside.\n\nÉtape 4: In a mixing bowl, cream butter and sugar until light and fluffy, add 2 tbsp natural yoghurt or sour cream, mix well.\n\nÉtape 5: Add eggs, one at a time. Stir in lemon juice and vanilla extract until well blended.\n\nÉtape 6: Add flour mixture and milk alternately into creamed mixture, beating well after each addition.\n\nÉtape 7: Gently fold in the raspberries into the creamed mixture, mix well and pour into the prepared cake pan.\n\nÉtape 8: Bake at preheated oven 180C for about 30 minutes or when skewer inserted into cake and comes out clean.\n\nÉtape 9: Remove cake from oven and set to cool for 10 minutes then unmould, leave to cool completely.\n\nÉtape 10: Cut cake into 8 or 12 equal slices and dust some icing sugar or snow powder on top .',
        'https://img.spoonacular.com/recipes/657899-556x370.jpg',
        1,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        49,
        658808,
        'Rosemary Thyme Marinated Mushrooms',
        'Need a gluten free, dairy free, paleolithic, and lacto ovo vegetarian side dish? Rosemary Thyme Marinated Mushrooms could be an amazing recipe to try. This recipe serves 6. One portion of this dish contains approximately 2g of protein, 3g of fat, and a total of 45 calories. For 45 cents per serving, this recipe covers 3% of your daily requirements of vitamins and minerals. Only a few people made this recipe, and 2 would say it hit the spot. This recipe from Foodista requires water, balsamic vine',
        45,
        0.45,
        'difficile',
        '[{\"id\": 14412, \"name\": \"water\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup water\"}, {\"id\": 2069, \"name\": \"balsamic vinegar\", \"unit\": \"cup\", \"amount\": 0.33333334, \"original\": \"1/3 cup balsamic vinegar\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon olive oil\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"cloves\", \"amount\": 2, \"original\": \"2 cloves garlic, finely chopped\"}, {\"id\": 2036, \"name\": \"rosemary leaves\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon rosemary leaves, finely chopped (plus extra for garnish if preferred)\"}, {\"id\": 2049, \"name\": \"thyme\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon thyme (plus extra for garnish if preferred)\"}, {\"id\": 1032009, \"name\": \"pepper flakes\", \"unit\": \"teaspoon\", \"amount\": 0.125, \"original\": \"1/8 teaspoon crushed red pepper flakes\"}, {\"id\": 11260, \"name\": \"mushrooms\", \"unit\": \"cups\", \"amount\": 3, \"original\": \"3 cups whole small mushrooms\"}]',
        'Étape 1: Combine water, vinegar, oil, garlic, rosemary, thyme, and red pepper flakes in a medium saucepan. Bring to a boil, then cover and lower heat to simmer; cook 10 minutes.\n\nÉtape 2: Add mushrooms and cook, covered, over low heat, stirring occasionally, for 5-7 minutes or until mushrooms are fork-tender.\n\nÉtape 3: Transfer to a serving bowl, cover with plastic wrap, and refrigerate 2 hours; stir occasionally.\n\nÉtape 4: To serve, drain mushrooms from marinade and serve.\n\nÉtape 5: Optional: For added color, add a pinch of the herbs and pepper flakes and toss before serving.',
        'https://img.spoonacular.com/recipes/658808-556x370.jpg',
        1,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        50,
        652976,
        'Naturally Sweet Apple Turnovers',
        'Naturally Sweet Apple Turnovers is a hor d\'oeuvre that serves 16. Watching your figure? This lacto ovo vegetarian recipe has 203 calories, 3g of protein, and 10g of fat per serving. For 55 cents per serving, this recipe covers 4% of your daily requirements of vitamins and minerals. This recipe from Foodista has 17 fans. From preparation to the plate, this recipe takes about 45 minutes. A mixture of apples, ground allspice, milk, and a handful of other ingredients are all it takes to make this re',
        45,
        0.55,
        'difficile',
        '[{\"id\": 9003, \"name\": \"apples\", \"unit\": \"large\", \"amount\": 2, \"original\": \"2 large apples, peeled and diced\"}, {\"id\": 19334, \"name\": \"brown sugar\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon brown sugar\"}, {\"id\": 1017, \"name\": \"cream cheese\", \"unit\": \"ounces\", \"amount\": 4, \"original\": \"4 ounces cream cheese, very cold and cubed\"}, {\"id\": 1125, \"name\": \"egg yolk\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 egg yolk\"}, {\"id\": 18338, \"name\": \"dough\", \"unit\": \"servings\", \"amount\": 16, \"original\": \"Dough\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"cups\", \"amount\": 1, \"original\": \"cups flour\"}, {\"id\": 1022001, \"name\": \"ground allspice\", \"unit\": \"teaspoon\", \"amount\": 0.25, \"original\": \"1/4 teaspoon ground allspice\"}, {\"id\": 1032006, \"name\": \"ground cardamom\", \"unit\": \"teaspoon\", \"amount\": 0.125, \"original\": \"1/8 teaspoon ground cardamom\"}, {\"id\": 1012010, \"name\": \"ground cinnamon\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon ground cinnamon\"}, {\"id\": 2021, \"name\": \"ground ginger\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon ground ginger\"}, {\"id\": 9152, \"name\": \"juice of lemon\", \"unit\": \"\", \"amount\": 0.5, \"original\": \"Juice of 1/2 lemon\"}, {\"id\": 1082047, \"name\": \"kosher salt\", \"unit\": \"teaspoon\", \"amount\": 0.25, \"original\": \"1/4 teaspoon kosher salt\"}, {\"id\": 19911, \"name\": \"maple syrup\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons maple syrup\"}, {\"id\": 1077, \"name\": \"milk\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons milk\"}, {\"id\": 19336, \"name\": \"powdered sugar\", \"unit\": \"cup\", \"amount\": 0.125, \"original\": \"1/8 cup powdered sugar\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"tablespoons\", \"amount\": 3, \"original\": \"3 tablespoons Sugar\"}, {\"id\": 1145, \"name\": \"butter\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup unsalted butter, very cold and cubed\"}, {\"id\": -1, \"name\": \"frangelico\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon Frangelico (or vanilla or rum)\"}, {\"id\": -1, \"name\": \"frangelico\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon Frangelico (or vanilla or rum)\"}]',
        'Étape 1: Start dough by whisking dry ingredients in a medium sized bowl.\n\nÉtape 2: Add butter and incorporate with a pastry blender until coarse crumbs develop.\n\nÉtape 3: Add cream cheese and incorporate well.Plop in egg yolk and stir with a fork until dough comes together into a ball.Turn dough out onto a floured surface and roll into a uniform ball. Slightly press flat with the palm of your hand and wrap in plastic wrap. Chill at least one hour.Once dough has chilled, set it on a floured surface and roll it out to about 10 x 1\n\nÉtape 4: Cut into sixten even squares.\n\nÉtape 5: Lay the dough squares on a parchment paper covered baking sheet and set in the freezer to chill.In a separate bowl, toss the apples with the lemon juice, maple syrup, spices and brown sugar. Make sure to cover all of the apple pieces.Take dough out of freezer. Drop about 1 tablespoon of filling into the center of each piece of dough. Fold one pointed edge towards its opposite corner to form a triangle.  Crimp edges with a fork along the seams. Repeat with all of the dough.\n\nÉtape 6: Brush a little milk over the top of each turnover and sprinkle with extra sugar if desired. (Pop back into the freezer for a quick chill if the dough is soft.).\n\nÉtape 7: Bake in a preheated oven at 400 degrees for 20 minutes or until browned.',
        'https://img.spoonacular.com/recipes/652976-556x370.jpg',
        1,
        '2025-05-02 06:03:00',
        '2025-05-02 06:03:00',
        NULL
    ),
(
        51,
        633101,
        'Autumn Pumpkin Cake',
        'Need a gluten free, dairy free, lacto ovo vegetarian, and vegan dessert? Autumn Pumpkin Cake could be a great recipe to try. For 33 cents per serving, this recipe covers 8% of your daily requirements of vitamins and minerals. This recipe makes 12 servings with 131 calories, 2g of protein, and 4g of fat each. A mixture of raisins, agave syrup, coconut milk, and a handful of other ingredients are all it takes to make this recipe so tasty. 4 people were glad they tried this recipe. From preparation',
        45,
        0.33,
        'difficile',
        '[{\"id\": 11422, \"name\": \"pumpkin\", \"unit\": \"g\", \"amount\": 500, \"original\": \"500g pumpkin, steamed\"}, {\"id\": 20090, \"name\": \"brown rice flour\", \"unit\": \"g\", \"amount\": 180, \"original\": \"180g brown rice flour (ground some brown rice)\"}, {\"id\": 12118, \"name\": \"coconut milk\", \"unit\": \"ml\", \"amount\": 200, \"original\": \"200ml coconut milk\"}, {\"id\": 9299, \"name\": \"raisins\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup raisins\"}, {\"id\": 19912, \"name\": \"agave syrup\", \"unit\": \"g\", \"amount\": 100, \"original\": \"100g agave syrup or Sucanat\"}]',
        'Étape 1: Go to my blog for the full instructions: http://gourmandelle.com/pumpkin-cake-the-ideal-dessert-for-a-sunny-autumn-day/',
        'https://img.spoonacular.com/recipes/633101-556x370.jpg',
        1,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    ),
(
        52,
        644907,
        'Gluten-Free Tres Leches Cake',
        'Gluten-Free Tres Leches Cake is a dessert that serves 10. One serving contains 460 calories, 11g of protein, and 20g of fat. For 81 cents per serving, this recipe covers 11% of your daily requirements of vitamins and minerals. From preparation to the plate, this recipe takes around 45 minutes. This recipe from Foodista has 5 fans. It is a good option if you\'re following a gluten free and lacto ovo vegetarian diet. This recipe is typical of Latin American cuisine. If you have baking powder, butte',
        45,
        0.81,
        'difficile',
        '[{\"id\": 18369, \"name\": \"baking powder\", \"unit\": \"teaspoons\", \"amount\": 1.5, \"original\": \"1 1/2 teaspoons baking powder\"}, {\"id\": 1001, \"name\": \"butter\", \"unit\": \"teaspoons\", \"amount\": 3, \"original\": \"3 teaspoons butter\"}, {\"id\": 2010, \"name\": \"cinnamon\", \"unit\": \"pinch\", \"amount\": 1, \"original\": \"Pinch of cinnamon\"}, {\"id\": 18373, \"name\": \"cream of tartar\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon cream of tartar\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 5, \"original\": \"5 eggs, separated\"}, {\"id\": 1214, \"name\": \"evaporated milk\", \"unit\": \"ounces\", \"amount\": 12, \"original\": \"12 ounces can evaporated milk\"}, {\"id\": 1049, \"name\": \"half-and-half\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup half-and-half\"}, {\"id\": 20317, \"name\": \"masa harina\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup masa harina\"}, {\"id\": 1077, \"name\": \"milk\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup milk\"}, {\"id\": 2064, \"name\": \"strawberries and mint leaves\", \"unit\": \"servings\", \"amount\": 10, \"original\": \"Sliced strawberries and mint leaves\"}, {\"id\": 9216, \"name\": \"orange zest\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon orange zest\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"pinch\", \"amount\": 1, \"original\": \"Pinch salt\"}, {\"id\": 20648, \"name\": \"sorghum flour\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup sorghum flour\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"cup\", \"amount\": 0.25, \"original\": \"1/4 cup sugar\"}, {\"id\": 19335, \"name\": \"sugar\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup sugar\"}, {\"id\": 1095, \"name\": \"condensed milk\", \"unit\": \"ounces\", \"amount\": 14, \"original\": \"14 ounces can sweetened condensed milk\"}, {\"id\": 1052050, \"name\": \"vanilla\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon vanilla\"}, {\"id\": 2050, \"name\": \"vanilla extract\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon vanilla extract\"}, {\"id\": 1001053, \"name\": \"whipping cream\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup whipping cream\"}, {\"id\": 93626, \"name\": \"xanthan gum\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon xanthan gum\"}]',
        'Étape 1: Preheat oven to 350 degrees. Generously butter a 13X9 baking dish. In a large bowl, beat  c sugar, egg yolks, and butter until light and fluffy, about 5 minutes. Fold in the vanilla extract, orange zest, cinnamon, sorghum flour, masa harina, baking powder, xanthan gum, and milk.In another large bowl, beat egg whites to soft peaks, adding cream of tartar after about 20 seconds. Gradually add the remaining  c sugar and continue beating until egg whites are glossy and firm, but not dry.Gently fold the egg whites into the cake mixture.\n\nÉtape 2: Pour this batter into the baking dish, spreading out evenly.\n\nÉtape 3: Bake until the cake is golden and a toothpick inserted in the center comes out clean, about 25 minutes. Pierce cake all over with a toothpick.\n\nÉtape 4: Whisk together the milks, and pour evenly over cake. Allow to cool for a bit, and cover and place in refrigerator for 4 hours, up to overnight.Before serving,  place the whipping cream, sugar, and vanilla in a mixer bowl and whisk to stiff peaks, and nice and thick.\n\nÉtape 5: Spread over cake and top with strawberries and mint leaves.Allow to chill in refrigerator until ready to serve.',
        'https://img.spoonacular.com/recipes/644907-556x370.jpg',
        1,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    ),
(
        53,
        660420,
        'Smooth Bloody Mary',
        'Smooth Bloody Mary takes around 45 minutes from beginning to end. Watching your figure? This gluten free and dairy free recipe has 97 calories, 1g of protein, and 1g of fat per serving. This recipe serves 1. For $2.5 per serving, this recipe covers 8% of your daily requirements of vitamins and minerals. It is brought to you by Foodista. Not a lot of people really liked this side dish. 2 people have tried and liked this recipe. Head to the store and pick up celery stalks, juice of lemon, vodka, a',
        45,
        2.50,
        'difficile',
        '[{\"id\": 1002030, \"name\": \"pepper\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon black pepper\"}, {\"id\": 2054, \"name\": \"capers\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon capers (with brine)\"}, {\"id\": 1052047, \"name\": \"celery salt\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon celery salt\"}, {\"id\": 10111143, \"name\": \"celery stalks\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 celery stalks with leaves\"}, {\"id\": 10111143, \"name\": \"celery stick\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 celery stick, cleaned and trimmed\"}, {\"id\": 98949, \"name\": \"horseradish\", \"unit\": \"tablespoons\", \"amount\": 2, \"original\": \"2 tablespoons horseradish (bottled or canned, not fresh grated)\"}, {\"id\": 9152, \"name\": \"juice of lemon\", \"unit\": \"\", \"amount\": 1, \"original\": \"juice of 1 whole lemon\"}, {\"id\": 9159, \"name\": \"lime\", \"unit\": \"slice\", \"amount\": 1, \"original\": \"1 slice of lime\"}, {\"id\": 9195, \"name\": \"olive\", \"unit\": \"\", \"amount\": 1, \"original\": \"1 olive\"}, {\"id\": 1032009, \"name\": \"peperoncino\", \"unit\": \"pinch\", \"amount\": 1, \"original\": \"1 pinch peperoncino (dried italian red pepper flake)\"}, {\"id\": 11677, \"name\": \"shallot\", \"unit\": \"large\", \"amount\": 1, \"original\": \"1 large shallot\"}, {\"id\": 1026168, \"name\": \"tabasco sauce\", \"unit\": \"dashes\", \"amount\": 5, \"original\": \"5 dashes Tabasco sauce\"}, {\"id\": 11886, \"name\": \"sacremento tomato juice\", \"unit\": \"serving\", \"amount\": 1, \"original\": \"Sacremento Canned Tomato Juice\"}, {\"id\": 14051, \"name\": \"vodka\", \"unit\": \"serving\", \"amount\": 1, \"original\": \"Vodka, to taste\"}, {\"id\": 6971, \"name\": \"worcestershire sauce\", \"unit\": \"tablespoons\", \"amount\": 4, \"original\": \"4 tablespoons Worcestershire sauce\"}]',
        'Étape 1: In juicer, add celery, shallot, horseradish, and capers.Put juiced mixture in quart container (optional: strain through chinois).\n\nÉtape 2: Add worcestershire, Tabasco, lemon juice, celery salt, black pepper, and peperoncino.Fill container with Sacramento Canned Tomato Juice.\n\nÉtape 3: Let sit overnight in refrigerator.\n\nÉtape 4: Pour mixture over ice into a highball glass.\n\nÉtape 5: Add vodka to taste.\n\nÉtape 6: Garnish with skewered lime slice and olive, and a cleaned and trimmed celery stick.',
        'https://img.spoonacular.com/recipes/660420-556x370.jpg',
        0,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    ),
(
        54,
        655132,
        'Peach Melba Clafoutis',
        'Peach Melba Clafoutis is a lacto ovo vegetarian recipe with 6 servings. For $2.02 per serving, this recipe covers 9% of your daily requirements of vitamins and minerals. One serving contains 265 calories, 6g of protein, and 10g of fat. It works well as a dessert. Head to the store and pick up salt, flour, vanillan extract, and a few other things to make it today. From preparation to the plate, this recipe takes approximately 45 minutes. 8 people have tried and liked this recipe. It is brought to',
        45,
        2.02,
        'difficile',
        '[{\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 3, \"original\": \"3 eggs\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"cup\", \"amount\": 0.6666667, \"original\": \"2/3 cup flour\"}, {\"id\": 1077, \"name\": \"milk\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup milk\"}, {\"id\": 9236, \"name\": \"peaches\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups sliced peaches\"}, {\"id\": 9302, \"name\": \"raspberries\", \"unit\": \"cups\", \"amount\": 1.5, \"original\": \"1 1/2 cups raspberries (fresh or frozen and not thawed)\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"teaspoon\", \"amount\": 0.25, \"original\": \"1/4 teaspoon salt\"}, {\"id\": 2050, \"name\": \"vanilla extract\", \"unit\": \"teaspoon\", \"amount\": 1, \"original\": \"1 teaspoon vanilla extract\"}, {\"id\": 10319335, \"name\": \"vanilla sugar\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup vanilla sugar (½ cup white sugar and ¼ tsp vanilla)\"}, {\"id\": 1001053, \"name\": \"whipping cream\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup whipping cream (35%)\"}]',
        'Étape 1: Butter a 9-inch deep-dish pie plate and dust with a tablespoon of sugar. Preheat the oven to 350F.Peel and slice the peaches. Toss with the raspberries. Set aside.Blend the sugar, milk, cream, eggs, vanilla, flour and salt in a blender for about a minute or until well blended.\n\nÉtape 2: Pour half the custard mixture into the prepared pie plate. Arrange fruit on top and pour the remaining custard over the fruit.\n\nÉtape 3: Bake for 45-55 minutes, until the top is golden brown and puffy. Do not overcook. The custard should remain tender.\n\nÉtape 4: Serve warm or cold with whipped cream or creme anglaise.',
        'https://img.spoonacular.com/recipes/655132-556x370.jpg',
        1,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    ),
(
        55,
        631882,
        '5-Minute Rocky Road Fudge',
        '5-Minute Rocky Road Fudge might be just the Cajun recipe you are searching for. This recipe serves 15 and costs $1.03 per serving. Watching your figure? This gluten free recipe has 329 calories, 5g of protein, and 19g of fat per serving. This recipe from Foodista has 26 fans. From preparation to the plate, this recipe takes approximately 45 minutes. Head to the store and pick up salt, condensed milk, mini-marshmallows, and a few other things to make it today. Taking all factors into account, thi',
        45,
        1.03,
        'difficile',
        '[{\"id\": 19903, \"name\": \"semi-sweet chocolate chips\", \"unit\": \"c\", \"amount\": 2, \"original\": \"2 c. (12 oz. pkg.) semi-sweet chocolate chips\"}, {\"id\": 1095, \"name\": \"condensed milk\", \"unit\": \"oz\", \"amount\": 14, \"original\": \"14 oz. can sweetened condensed milk\"}, {\"id\": 2050, \"name\": \"vanilla extract\", \"unit\": \"t\", \"amount\": 1, \"original\": \"1 t. vanilla extract\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"t\", \"amount\": 0.125, \"original\": \"1/8 t. salt\"}, {\"id\": 10119116, \"name\": \"mini-marshmallows\", \"unit\": \"c\", \"amount\": 3, \"original\": \"3 c. mini-marshmallows\"}, {\"id\": 10112155, \"name\": \"walnuts\", \"unit\": \"c\", \"amount\": 1.5, \"original\": \"1 1/2 c. toasted, chopped walnuts\"}]',
        'Étape 1: Line a 13x9-inch pan with foil, lightly spray with cooking spray. Set aside.\n\nÉtape 2: In a large, microwave safe bowl, add chocolate chips and condensed milk. Microwave for about 40 seconds, or until the chips are just melted when you stir them. If needed, continue to microwave in 15 second increments until melted. Do not overcook. Immediately stir in vanilla and salt. Then fold in the marshmallows and nuts.\n\nÉtape 3: Working quickly, spread and press fudge into the prepared pan. Refrigerate until completely cooled before cutting into squares.',
        'https://img.spoonacular.com/recipes/631882-556x370.jpg',
        0,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    ),
(
        56,
        716411,
        'Snickerdoodle Ice Cream',
        'Snickerdoodle Ice Cream might be a good recipe to expand your dessert repertoire. One portion of this dish contains approximately 6g of protein, 53g of fat, and a total of 664 calories. For $2.13 per serving, this recipe covers 8% of your daily requirements of vitamins and minerals. This recipe serves 4. 215 people were impressed by this recipe. Head to the store and pick up ground cinnamon, heavy whipping cream, vanillan extract, and a few other things to make it today. It is brought to you by ',
        45,
        2.13,
        'difficile',
        '[{\"id\": 1012010, \"name\": \"ground cinnamon\", \"unit\": \"teaspoon\", \"amount\": 0.5, \"original\": \"1/2 teaspoon ground cinnamon\"}, {\"id\": 2025, \"name\": \"ground nutmeg\", \"unit\": \"teaspoon\", \"amount\": 0.125, \"original\": \"1/8 teaspoon ground nutmeg\"}, {\"id\": 1049, \"name\": \"half-and-half\", \"unit\": \"cups\", \"amount\": 1.5, \"original\": \"1 1/2 cups half-and-half\"}, {\"id\": 1053, \"name\": \"heavy whipping cream\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"2 cups heavy whipping cream\"}, {\"id\": 19334, \"name\": \"brown sugar\", \"unit\": \"cup\", \"amount\": 0.33333334, \"original\": \"1/3 cup packed light brown sugar\"}, {\"id\": 2050, \"name\": \"vanilla extract\", \"unit\": \"teaspoons\", \"amount\": 2, \"original\": \"2 teaspoons vanilla extract\"}, {\"id\": 10319335, \"name\": \"vanilla sugar\", \"unit\": \"cup\", \"amount\": 0.33333334, \"original\": \"1/3 cup vanilla sugar (can substitute plain sugar)\"}]',
        'Instructions not available',
        'https://img.spoonacular.com/recipes/716411-556x370.jpg',
        1,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    ),
(
        57,
        641565,
        'Donkatsu - Korean Breaded Pork Cutlet',
        'Donkatsu - Korean Breaded Pork Cutlet is a Korean recipe that serves 4. Watching your figure? This dairy free recipe has 557 calories, 38g of protein, and 27g of fat per serving. For $2.08 per serving, this recipe covers 32% of your daily requirements of vitamins and minerals. This recipe is liked by 2 foodies and cooks. It works best as a main course, and is done in about 30 minutes. This recipe from Foodista requires pork chops, carrot, panko bread crumbs, and flour. Taking all factors into ac',
        30,
        2.08,
        'moyen',
        '[{\"id\": 11109, \"name\": \"cabbage\", \"unit\": \"head\", \"amount\": 0.25, \"original\": \"•1/4 head cabbage, thinly shredded\"}, {\"id\": 11124, \"name\": \"carrot\", \"unit\": \"\", \"amount\": 0.5, \"original\": \"•1/2 carrot, grated or shredded\"}, {\"id\": 1123, \"name\": \"eggs\", \"unit\": \"\", \"amount\": 2, \"original\": \"•2 beaten eggs\"}, {\"id\": 20081, \"name\": \"flour\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"•1/2 cup flour\"}, {\"id\": 98997, \"name\": \"katsu sauce\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"•katsu sauce\"}, {\"id\": 10018079, \"name\": \"panko bread crumbs\", \"unit\": \"cups\", \"amount\": 2, \"original\": \"•2 cups panko bread crumbs\"}, {\"id\": 10010062, \"name\": \"pork chops\", \"unit\": \"\", \"amount\": 4, \"original\": \"4 boneless pork chops (thin cut)\"}, {\"id\": 1102047, \"name\": \"salt and pepper\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"•salt and pepper to taste\"}, {\"id\": 4669, \"name\": \"vegetable oil\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"•vegetable oil\"}]',
        'Étape 1: Trim off fat from pork chops (usually on the sides), then pound into thin pieces with tenderizer. Season with salt and pepper.Coat pork with flour, then beaten egg, and lastly panko bread crumbs.\n\nÉtape 2: Heat vegetable oil in pan or skillet on medium heat.Fry until golden brown and cooked through (you can cut to check insides). Usually takes about 8-10 minutes total if fully submerged in oil.\n\nÉtape 3: Remove cutlets from the oil and drain on paper towel to remove excess oil and cool.\n\nÉtape 4: Drain shredded cabbage well.\n\nÉtape 5: Cut each cutlet into small pieces and serve on plate with cabbage slaw.\n\nÉtape 6: Serve with katsu sauce for dipping and serve with rice.',
        'https://img.spoonacular.com/recipes/641565-556x370.jpg',
        0,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    ),
(
        58,
        652750,
        'Mussels & Clams in White Wine {Cozze e Vongole}',
        'Mussels & Clams in White Wine {Cozze e Vongole} is a gluten free, dairy free, paleolithic, and lacto ovo vegetarian hor d\'oeuvre. This recipe serves 4. For $2.46 per serving, this recipe covers 11% of your daily requirements of vitamins and minerals. One serving contains 115 calories, 2g of protein, and 4g of fat. Head to the store and pick up garlic, salt, parsley, and a few other things to make it today. 36 people were impressed by this recipe. From preparation to the plate, this recipe takes ',
        45,
        2.46,
        'difficile',
        '[{\"id\": 10311529, \"name\": \"cherry tomatoes\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"couple of cherry tomatoes, halved\"}, {\"id\": 1032009, \"name\": \"chili flakes\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"pepper or chili flakes\"}, {\"id\": 10511297, \"name\": \"parsley\", \"unit\": \"tablespoons\", \"amount\": 4, \"original\": \"4 tablespoons chopped fresh parsley\"}, {\"id\": 11215, \"name\": \"garlic\", \"unit\": \"teaspoons\", \"amount\": 2, \"original\": \"2 teaspoons minced garlic\"}, {\"id\": 4053, \"name\": \"olive oil\", \"unit\": \"tablespoon\", \"amount\": 1, \"original\": \"1 tablespoon olive oil\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"servings\", \"amount\": 4, \"original\": \"Salt to taste\"}, {\"id\": 14106, \"name\": \"white wine\", \"unit\": \"glass\", \"amount\": 1, \"original\": \"glass of white wine\"}]',
        'Étape 1: In a large frying pan on low heat add 3-4 glugs of olive oil and slowly cook the garlic until brown all over.\n\nÉtape 2: Remove & discard the garlic (if you like it, leave it in.)Turn the heat up, add in chili flakes & clams - cook about 30 seconds to 1 minute. Then add in the mussels. Turn up the heat and toss in the cherry tomatoes, sauteing for a moment or two.Next add a half glass of white wine and cover. Allow to sit covered 1-2 minutes at most until the shells open.  Then shut off the heat, add in your parsley. Finish with a bit of butter or good glug of olive oil.  Top with arugula if you like.\n\nÉtape 3: Serve immediately with plenty of good crunchy bread to dip & white wine wine.',
        'https://img.spoonacular.com/recipes/652750-556x370.jpg',
        1,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    ),
(
        59,
        715447,
        'Easy Vegetable Beef Soup',
        'You can never have too many main course recipes, so give Easy Vegetable Beef Soup a try. This dairy free recipe serves 8 and costs $3.45 per serving. One serving contains 566 calories, 45g of protein, and 19g of fat. 130 people were glad they tried this recipe. It will be a hit at your Autumn event. A mixture of salt, seasoning, on carrots, and a handful of other ingredients are all it takes to make this recipe so flavorful. It is brought to you by Pink When. From preparation to the plate, this ',
        150,
        3.45,
        'difficile',
        '[{\"id\": 13149, \"name\": \"beef short ribs\", \"unit\": \"lbs\", \"amount\": 3, \"original\": \"3 lbs of boneless beef short ribs\"}, {\"id\": 10120499, \"name\": \"elbow macaroni\", \"unit\": \"cup\", \"amount\": 0.5, \"original\": \"1/2 cup uncooked elbow macaroni\"}, {\"id\": 14412, \"name\": \"water 4 qts\", \"unit\": \"cups\", \"amount\": 16, \"original\": \"16 cups of water 4 Qts\"}, {\"id\": 10011693, \"name\": \"canned tomatoes\", \"unit\": \"oz\", \"amount\": 28, \"original\": \"1 28oz can diced tomatoes\"}, {\"id\": 11352, \"name\": \"potatoes\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup of small diced potatoes\"}, {\"id\": 11124, \"name\": \"on carrots\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup on thin sliced carrots\"}, {\"id\": 11143, \"name\": \"celery\", \"unit\": \"cup\", \"amount\": 1, \"original\": \"1 cup thin sliced celery\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"cups\", \"amount\": 1.5, \"original\": \"1 1/2 cups chopped onion\"}, {\"id\": 11168, \"name\": \"kernal corn\", \"unit\": \"oz\", \"amount\": 15, \"original\": \"1 15oz kernal corn (uncooked)\"}, {\"id\": 10016073, \"name\": \"butter beans\", \"unit\": \"oz\", \"amount\": 15, \"original\": \"1 15oz can butter beans\"}, {\"id\": 10016063, \"name\": \"eyed peas\", \"unit\": \"oz\", \"amount\": 15, \"original\": \"1 15oz can black – eyed peas\"}, {\"id\": 2004, \"name\": \"bay leaves\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 bay leaves\"}, {\"id\": 1022020, \"name\": \"garlic powder\", \"unit\": \"Tbsp\", \"amount\": 1, \"original\": \"1 Tbsp garlic powder\"}, {\"id\": 1052047, \"name\": \"celery salt\", \"unit\": \"tsp\", \"amount\": 1, \"original\": \"1 tsp celery salt\"}, {\"id\": 6971, \"name\": \"worcestershire sauce\", \"unit\": \"Tbsp\", \"amount\": 1, \"original\": \"1 Tbsp Worcestershire sauce\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"Tbsp\", \"amount\": 1, \"original\": \"1 Tbsp salt\"}, {\"id\": 1002030, \"name\": \"ground pepper\", \"unit\": \"Tbsp\", \"amount\": 1, \"original\": \"1 Tbsp fresh ground pepper\"}, {\"id\": 1022027, \"name\": \"seasoning\", \"unit\": \"Tbsp\", \"amount\": 1, \"original\": \"1 Tbsp Italian seasoning\"}, {\"id\": 6076, \"name\": \"beef bouillon cubes\", \"unit\": \"\", \"amount\": 2, \"original\": \"2 beef bouillon cubes\"}, {\"id\": 2029, \"name\": \"parsley\", \"unit\": \"Tbsp\", \"amount\": 2, \"original\": \"2 Tbsp dried parsley or fresh parsley\"}]',
        'Étape 1: To get started, bring 4 quarts of water to a boil in a large pot. \n\nÉtape 2: While waiting on the water to boil, cut the beef short ribs into bite-sized pieces and add them to the water.\n\nÉtape 3: Add in diced tomatoes, potatoes, diced onion, parsley, garlic powder, beef bouillon cubes, Italian seasoning, salt, pepper, Worcestershire sauce, celery salt, bay leaves, and stir.\n\nÉtape 4: Then add carrots, celery, black-eyed peas, butter beans, corn, and macaroni.\n\nÉtape 5: Heat on high, stirring occasionally until the stew mixture comes to a boil.\n\nÉtape 6: Once you have reached a boil, cover with a lid, lower heat enough to keep it simmering.  Continue to simmer for 1.5 to 2 hours, stirring occasionally.',
        'https://img.spoonacular.com/recipes/715447-556x370.jpg',
        0,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    ),
(
        60,
        660306,
        'Slow Cooker: Pork and Garbanzo Beans',
        'Slow Cooker: Pork and Garbanzo Beans takes approximately 45 minutes from beginning to end. This recipe serves 6. This main course has 587 calories, 66g of protein, and 14g of fat per serving. For $2.99 per serving, this recipe covers 45% of your daily requirements of vitamins and minerals. Head to the store and pick up water *2, cumin, pork should roast, and a few other things to make it today. This recipe is liked by 22 foodies and cooks. It is brought to you by Foodista. It is a good option if',
        45,
        2.99,
        'difficile',
        '[{\"id\": 2010, \"name\": \"cinnamon\", \"unit\": \"tsp\", \"amount\": 2, \"original\": \"2 tsp cinnamon\"}, {\"id\": 1002014, \"name\": \"cumin\", \"unit\": \"Tbsp\", \"amount\": 1, \"original\": \"1 Tbsp dried cumin\"}, {\"id\": 16056, \"name\": \"garbanzo beans *1\", \"unit\": \"oz\", \"amount\": 16, \"original\": \"16 oz bag of dried garbanzo beans (rinsed, but not soaked) *1\"}, {\"id\": 1002030, \"name\": \"ground pepper\", \"unit\": \"tsp\", \"amount\": 2, \"original\": \"2 tsp ground black pepper\"}, {\"id\": 11282, \"name\": \"onion\", \"unit\": \"small\", \"amount\": 1, \"original\": \"1 small onion, sliced\"}, {\"id\": 10010225, \"name\": \"pork should roast\", \"unit\": \"lb\", \"amount\": 3, \"original\": \"3lb Pork Should Roast – bone-in\"}, {\"id\": 2047, \"name\": \"salt\", \"unit\": \"tsp\", \"amount\": 2, \"original\": \"2 tsp salt\"}, {\"id\": 14412, \"name\": \"water *2\", \"unit\": \"cups\", \"amount\": 4, \"original\": \"4 cups of water (also see “Notes” at bottom of recipe) *2\"}]',
        'Étape 1: In slow cooker layer in this order: pork, then garbanzo beans, onion, pour water over all.\n\nÉtape 2: Mix spices together and sprinkle over pork and beans. Cover. Set on low and cook for approximately 6 hours. The beans should be tender and creamy. The pork should fall very easily from the bone. The pork can be either shredded for cubed for your preference. *3Serving Suggestion: Scoop about 1 cup of beans with broth into a soup bowl. Top with shredded pork.\n\nÉtape 3: Add 1/4 of an avocado sliced, top with chopped fresh cilantro.NOTES:*1 The beans do not need to be soaked before adding to the slow cooker. They will be perfectly soft and creamy without pre-soaking.*2 Substitute the water for: 2 cups water and 1 bottle of good quality dark beer like Negra Modelo. You can also substitute the water for chicken stock or pork stock. Each of these substitutions will add an extra dimension of flavor.*3 If you want to shred the pork, it is easiest to do when the pork is hot. Use two forks to pull the pork apart and shred. If you want to slice the pork (like for sandwiches) it is best to do when the pork is cold.\n\nÉtape 4: Let the pork rest in the refrigerator for several hours or over night. Slice with a serrated knife or a very sharp chef knife.',
        'https://img.spoonacular.com/recipes/660306-556x370.jpg',
        0,
        '2025-05-02 06:03:03',
        '2025-05-02 06:03:03',
        NULL
    );

/*!40000 ALTER TABLE `recipes` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `sessions`
--
DROP TABLE IF EXISTS `sessions`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `sessions` (
    `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `user_id` bigint unsigned DEFAULT NULL,
    `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `user_agent` text COLLATE utf8mb4_unicode_ci,
    `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_activity` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `sessions_user_id_index` (`user_id`),
    KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE = MyISAM DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `sessions`
--
LOCK TABLES `sessions` WRITE;

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */
;

INSERT INTO
    `sessions`
VALUES
    (
        'TMP71ioeSZRwnWAhEBPBZiSM7QeSCEekMMSSCMSJ',
        NULL,
        '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36',
        'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZVpzSVQzWk53N01QSmxiek9sazk0alNWeHBXeW9mV3l6cHgxaHpHbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA4MiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODA4Mi9zaG9wcGluZy1saXN0Ijt9fQ==',
        1746180298
    ),
(
        '2bPusT1Iq39bGRv1QxHBehka03ptErqUbe4Z4JMp',
        NULL,
        '127.0.0.1',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36',
        'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTmRNVTRhUnlZYThRbGFDVXJOU3Y0OFRQdEpHWGw4cTBkRGVnZ2RTRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA4MiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODA4Mi9zaG9wcGluZy1saXN0Ijt9fQ==',
        1746192500
    );

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `users` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email_verified_at` timestamp NULL DEFAULT NULL,
    `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
    `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_admin` tinyint(1) NOT NULL DEFAULT '0',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `users_email_unique` (`email`)
) ENGINE = MyISAM AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `users`
--
LOCK TABLES `users` WRITE;

/*!40000 ALTER TABLE `users` DISABLE KEYS */
;

INSERT INTO
    `users`
VALUES
    (
        1,
        'Admin User',
        'admin@example.com',
        NULL,
        '$2y$12$3JWI0FM4bcNg4hRZR.0UX.ST/m3Nb5OjSXEpfzJ1xQL3e8kwxi5oG',
        NULL,
        1,
        '2025-05-02 02:25:53',
        '2025-05-02 02:25:53'
    );

/*!40000 ALTER TABLE `users` ENABLE KEYS */
;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;

-- Dump completed on 2025-05-02 13:43:28