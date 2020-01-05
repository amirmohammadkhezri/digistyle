/*
Navicat MySQL Data Transfer

Source Server         : xampp
Source Server Version : 100122
Source Host           : localhost:3306
Source Database       : digistyle

Target Server Type    : MYSQL
Target Server Version : 100122
File Encoding         : 65001

Date: 2019-03-15 15:30:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_province_id_foreign` (`province_id`),
  KEY `addresses_city_id_foreign` (`city_id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `addresses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `addresses_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', 'خیابان پاستور - کوچه نیکومنظری - پلاک ۳', 'روکسو', '30', '418', '1234567891', '6', '2019-03-07 09:15:11', '2019-03-07 09:15:11');

-- ----------------------------
-- Table structure for attributegroup_category
-- ----------------------------
DROP TABLE IF EXISTS `attributegroup_category`;
CREATE TABLE `attributegroup_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `attributeGroup_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attributegroup_category_category_id_foreign` (`category_id`),
  KEY `attributegroup_category_attributegroup_id_foreign` (`attributeGroup_id`),
  CONSTRAINT `attributegroup_category_attributegroup_id_foreign` FOREIGN KEY (`attributeGroup_id`) REFERENCES `attributesgroup` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attributegroup_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attributegroup_category
-- ----------------------------
INSERT INTO `attributegroup_category` VALUES ('12', '1', '2', null, null);
INSERT INTO `attributegroup_category` VALUES ('14', '4', '1', null, null);
INSERT INTO `attributegroup_category` VALUES ('15', '4', '2', null, null);
INSERT INTO `attributegroup_category` VALUES ('16', '1', '3', null, null);
INSERT INTO `attributegroup_category` VALUES ('20', '1', '1', null, null);
INSERT INTO `attributegroup_category` VALUES ('23', '1', '4', null, null);

-- ----------------------------
-- Table structure for attributesgroup
-- ----------------------------
DROP TABLE IF EXISTS `attributesgroup`;
CREATE TABLE `attributesgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attributesgroup
-- ----------------------------
INSERT INTO `attributesgroup` VALUES ('1', 'جنس', 'select', '2018-12-31 07:17:34', '2018-12-31 07:17:34');
INSERT INTO `attributesgroup` VALUES ('2', 'کشور سازنده', 'select', '2019-01-09 12:24:11', '2019-01-09 12:24:11');
INSERT INTO `attributesgroup` VALUES ('3', 'طرح پارچه', 'select', '2019-02-23 11:29:45', '2019-02-23 11:29:45');
INSERT INTO `attributesgroup` VALUES ('4', 'سایز', 'select', '2019-03-11 15:22:18', '2019-03-11 15:22:18');

-- ----------------------------
-- Table structure for attributesvalue
-- ----------------------------
DROP TABLE IF EXISTS `attributesvalue`;
CREATE TABLE `attributesvalue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributeGroup_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attributesvalue_attributegroup_id_foreign` (`attributeGroup_id`),
  CONSTRAINT `attributesvalue_attributegroup_id_foreign` FOREIGN KEY (`attributeGroup_id`) REFERENCES `attributesgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attributesvalue
-- ----------------------------
INSERT INTO `attributesvalue` VALUES ('1', 'نخ', '1', '2019-01-09 15:37:49', '2019-01-09 15:37:51');
INSERT INTO `attributesvalue` VALUES ('2', 'پلاستیک', '1', '2019-01-09 15:37:49', '2019-01-09 15:37:49');
INSERT INTO `attributesvalue` VALUES ('3', 'پنبه', '1', '2019-01-09 12:26:59', '2019-01-09 12:26:59');
INSERT INTO `attributesvalue` VALUES ('4', 'ایران', '2', '2019-01-09 12:27:16', '2019-01-09 12:34:57');
INSERT INTO `attributesvalue` VALUES ('5', 'آمریکا', '2', '2019-02-21 16:12:45', '2019-02-21 16:12:45');
INSERT INTO `attributesvalue` VALUES ('6', 'ساده', '3', '2019-02-23 11:30:25', '2019-02-23 11:30:25');
INSERT INTO `attributesvalue` VALUES ('7', 'چهار خانه', '3', '2019-02-23 11:30:34', '2019-02-23 11:30:34');
INSERT INTO `attributesvalue` VALUES ('8', 'S', '4', '2019-03-11 15:22:28', '2019-03-11 15:22:28');
INSERT INTO `attributesvalue` VALUES ('9', 'M', '4', '2019-03-11 15:22:33', '2019-03-11 15:22:33');
INSERT INTO `attributesvalue` VALUES ('10', 'L', '4', '2019-03-11 15:22:39', '2019-03-11 15:22:39');
INSERT INTO `attributesvalue` VALUES ('11', 'XL', '4', '2019-03-11 15:22:47', '2019-03-11 15:22:47');

-- ----------------------------
-- Table structure for attributevalue_product
-- ----------------------------
DROP TABLE IF EXISTS `attributevalue_product`;
CREATE TABLE `attributevalue_product` (
  `attributeValue_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `attributevalue_product_attributevalue_id_foreign` (`attributeValue_id`),
  KEY `attributevalue_product_product_id_foreign` (`product_id`),
  CONSTRAINT `attributevalue_product_attributevalue_id_foreign` FOREIGN KEY (`attributeValue_id`) REFERENCES `attributesvalue` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attributevalue_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attributevalue_product
-- ----------------------------
INSERT INTO `attributevalue_product` VALUES ('1', '2', null, null);
INSERT INTO `attributevalue_product` VALUES ('5', '2', null, null);
INSERT INTO `attributevalue_product` VALUES ('6', '2', null, null);
INSERT INTO `attributevalue_product` VALUES ('1', '4', null, null);
INSERT INTO `attributevalue_product` VALUES ('5', '4', null, null);
INSERT INTO `attributevalue_product` VALUES ('6', '4', null, null);
INSERT INTO `attributevalue_product` VALUES ('2', '5', null, null);
INSERT INTO `attributevalue_product` VALUES ('4', '5', null, null);
INSERT INTO `attributevalue_product` VALUES ('6', '5', null, null);
INSERT INTO `attributevalue_product` VALUES ('1', '6', null, null);
INSERT INTO `attributevalue_product` VALUES ('5', '6', null, null);
INSERT INTO `attributevalue_product` VALUES ('7', '6', null, null);
INSERT INTO `attributevalue_product` VALUES ('3', '7', null, null);
INSERT INTO `attributevalue_product` VALUES ('5', '7', null, null);
INSERT INTO `attributevalue_product` VALUES ('6', '7', null, null);
INSERT INTO `attributevalue_product` VALUES ('1', '8', null, null);
INSERT INTO `attributevalue_product` VALUES ('5', '8', null, null);
INSERT INTO `attributevalue_product` VALUES ('7', '8', null, null);
INSERT INTO `attributevalue_product` VALUES ('1', '9', null, null);
INSERT INTO `attributevalue_product` VALUES ('4', '9', null, null);
INSERT INTO `attributevalue_product` VALUES ('7', '9', null, null);
INSERT INTO `attributevalue_product` VALUES ('1', '10', null, null);
INSERT INTO `attributevalue_product` VALUES ('4', '10', null, null);
INSERT INTO `attributevalue_product` VALUES ('7', '10', null, null);
INSERT INTO `attributevalue_product` VALUES ('9', '2', null, null);

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_title_unique` (`title`),
  KEY `brands_photo_id_foreign` (`photo_id`),
  CONSTRAINT `brands_photo_id_foreign` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('1', 'Dune', 'توضیحات برند Dune در این بخش قرار می گیرد.', '52', '2019-01-27 14:23:55', '2019-03-01 13:29:17');
INSERT INTO `brands` VALUES ('3', 'Adidas', 'توضیحات برند adidas در این بخش قرار می گیرد', '57', '2019-01-28 09:02:20', '2019-03-01 13:31:36');
INSERT INTO `brands` VALUES ('4', 'Vero Moda', 'برند Vero Moda', '53', '2019-03-01 13:24:05', '2019-03-01 13:29:48');
INSERT INTO `brands` VALUES ('5', 'Mango', 'منگو', '54', '2019-03-01 13:24:14', '2019-03-01 13:30:05');
INSERT INTO `brands` VALUES ('6', 'Toms', 'Toms', '55', '2019-03-01 13:24:24', '2019-03-01 13:30:20');
INSERT INTO `brands` VALUES ('7', 'Tiffosi', 'Tiffosi توضیحات', '56', '2019-03-01 13:25:24', '2019-03-01 13:30:41');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'پوشاک', null, null, null, null, '2018-12-28 13:30:50', '2018-12-28 13:30:50');
INSERT INTO `categories` VALUES ('4', 'مردانه', 'پوشاک مردانه توضیحات تست دارد', 'پوشاک مردانه', 'پوشاک مردانه, پوشاک', '1', '2018-12-28 13:31:55', '2019-03-01 12:08:45');
INSERT INTO `categories` VALUES ('5', 'زنانه', 'پوشاک زنانه', 'لباس زنانه', 'کلمه کلیدی', '1', '2019-03-01 12:09:07', '2019-03-01 12:09:07');

-- ----------------------------
-- Table structure for category_product
-- ----------------------------
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  KEY `category_product_category_id_foreign` (`category_id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category_product
-- ----------------------------
INSERT INTO `category_product` VALUES ('1', '2');
INSERT INTO `category_product` VALUES ('5', '2');
INSERT INTO `category_product` VALUES ('1', '4');
INSERT INTO `category_product` VALUES ('4', '4');
INSERT INTO `category_product` VALUES ('1', '5');
INSERT INTO `category_product` VALUES ('4', '5');
INSERT INTO `category_product` VALUES ('1', '6');
INSERT INTO `category_product` VALUES ('4', '6');
INSERT INTO `category_product` VALUES ('1', '7');
INSERT INTO `category_product` VALUES ('4', '7');
INSERT INTO `category_product` VALUES ('1', '8');
INSERT INTO `category_product` VALUES ('4', '8');
INSERT INTO `category_product` VALUES ('1', '9');
INSERT INTO `category_product` VALUES ('5', '9');
INSERT INTO `category_product` VALUES ('1', '10');
INSERT INTO `category_product` VALUES ('5', '10');

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_province_id_foreign` (`province_id`),
  CONSTRAINT `cities_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES ('1', '1', 'تبريز');
INSERT INTO `cities` VALUES ('2', '1', 'كندوان');
INSERT INTO `cities` VALUES ('3', '1', 'بندر شرفخانه');
INSERT INTO `cities` VALUES ('4', '1', 'مراغه');
INSERT INTO `cities` VALUES ('5', '1', 'ميانه');
INSERT INTO `cities` VALUES ('6', '1', 'شبستر');
INSERT INTO `cities` VALUES ('7', '1', 'مرند');
INSERT INTO `cities` VALUES ('8', '1', 'جلفا');
INSERT INTO `cities` VALUES ('9', '1', 'سراب');
INSERT INTO `cities` VALUES ('10', '1', 'هاديشهر');
INSERT INTO `cities` VALUES ('11', '1', 'بناب');
INSERT INTO `cities` VALUES ('12', '1', 'كليبر');
INSERT INTO `cities` VALUES ('13', '1', 'تسوج');
INSERT INTO `cities` VALUES ('14', '1', 'اهر');
INSERT INTO `cities` VALUES ('15', '1', 'هريس');
INSERT INTO `cities` VALUES ('16', '1', 'عجبشير');
INSERT INTO `cities` VALUES ('17', '1', 'هشترود');
INSERT INTO `cities` VALUES ('18', '1', 'ملكان');
INSERT INTO `cities` VALUES ('19', '1', 'بستان آباد');
INSERT INTO `cities` VALUES ('20', '1', 'ورزقان');
INSERT INTO `cities` VALUES ('21', '1', 'اسكو');
INSERT INTO `cities` VALUES ('22', '1', 'آذر شهر');
INSERT INTO `cities` VALUES ('23', '1', 'قره آغاج');
INSERT INTO `cities` VALUES ('24', '1', 'ممقان');
INSERT INTO `cities` VALUES ('25', '1', 'صوفیان');
INSERT INTO `cities` VALUES ('26', '1', 'ایلخچی');
INSERT INTO `cities` VALUES ('27', '1', 'خسروشهر');
INSERT INTO `cities` VALUES ('28', '1', 'باسمنج');
INSERT INTO `cities` VALUES ('29', '1', 'سهند');
INSERT INTO `cities` VALUES ('30', '2', 'اروميه');
INSERT INTO `cities` VALUES ('31', '2', 'نقده');
INSERT INTO `cities` VALUES ('32', '2', 'ماكو');
INSERT INTO `cities` VALUES ('33', '2', 'تكاب');
INSERT INTO `cities` VALUES ('34', '2', 'خوي');
INSERT INTO `cities` VALUES ('35', '2', 'مهاباد');
INSERT INTO `cities` VALUES ('36', '2', 'سر دشت');
INSERT INTO `cities` VALUES ('37', '2', 'چالدران');
INSERT INTO `cities` VALUES ('38', '2', 'بوكان');
INSERT INTO `cities` VALUES ('39', '2', 'مياندوآب');
INSERT INTO `cities` VALUES ('40', '2', 'سلماس');
INSERT INTO `cities` VALUES ('41', '2', 'شاهين دژ');
INSERT INTO `cities` VALUES ('42', '2', 'پيرانشهر');
INSERT INTO `cities` VALUES ('43', '2', 'سيه چشمه');
INSERT INTO `cities` VALUES ('44', '2', 'اشنويه');
INSERT INTO `cities` VALUES ('45', '2', 'چایپاره');
INSERT INTO `cities` VALUES ('46', '2', 'پلدشت');
INSERT INTO `cities` VALUES ('47', '2', 'شوط');
INSERT INTO `cities` VALUES ('48', '3', 'اردبيل');
INSERT INTO `cities` VALUES ('49', '3', 'سرعين');
INSERT INTO `cities` VALUES ('50', '3', 'بيله سوار');
INSERT INTO `cities` VALUES ('51', '3', 'پارس آباد');
INSERT INTO `cities` VALUES ('52', '3', 'خلخال');
INSERT INTO `cities` VALUES ('53', '3', 'مشگين شهر');
INSERT INTO `cities` VALUES ('54', '3', 'مغان');
INSERT INTO `cities` VALUES ('55', '3', 'نمين');
INSERT INTO `cities` VALUES ('56', '3', 'نير');
INSERT INTO `cities` VALUES ('57', '3', 'كوثر');
INSERT INTO `cities` VALUES ('58', '3', 'كيوي');
INSERT INTO `cities` VALUES ('59', '3', 'گرمي');
INSERT INTO `cities` VALUES ('60', '4', 'اصفهان');
INSERT INTO `cities` VALUES ('61', '4', 'فريدن');
INSERT INTO `cities` VALUES ('62', '4', 'فريدون شهر');
INSERT INTO `cities` VALUES ('63', '4', 'فلاورجان');
INSERT INTO `cities` VALUES ('64', '4', 'گلپايگان');
INSERT INTO `cities` VALUES ('65', '4', 'دهاقان');
INSERT INTO `cities` VALUES ('66', '4', 'نطنز');
INSERT INTO `cities` VALUES ('67', '4', 'نايين');
INSERT INTO `cities` VALUES ('68', '4', 'تيران');
INSERT INTO `cities` VALUES ('69', '4', 'كاشان');
INSERT INTO `cities` VALUES ('70', '4', 'فولاد شهر');
INSERT INTO `cities` VALUES ('71', '4', 'اردستان');
INSERT INTO `cities` VALUES ('72', '4', 'سميرم');
INSERT INTO `cities` VALUES ('73', '4', 'درچه');
INSERT INTO `cities` VALUES ('74', '4', 'کوهپایه');
INSERT INTO `cities` VALUES ('75', '4', 'مباركه');
INSERT INTO `cities` VALUES ('76', '4', 'شهرضا');
INSERT INTO `cities` VALUES ('77', '4', 'خميني شهر');
INSERT INTO `cities` VALUES ('78', '4', 'شاهين شهر');
INSERT INTO `cities` VALUES ('79', '4', 'نجف آباد');
INSERT INTO `cities` VALUES ('80', '4', 'دولت آباد');
INSERT INTO `cities` VALUES ('81', '4', 'زرين شهر');
INSERT INTO `cities` VALUES ('82', '4', 'آران و بيدگل');
INSERT INTO `cities` VALUES ('83', '4', 'باغ بهادران');
INSERT INTO `cities` VALUES ('84', '4', 'خوانسار');
INSERT INTO `cities` VALUES ('85', '4', 'مهردشت');
INSERT INTO `cities` VALUES ('86', '4', 'علويجه');
INSERT INTO `cities` VALUES ('87', '4', 'عسگران');
INSERT INTO `cities` VALUES ('88', '4', 'نهضت آباد');
INSERT INTO `cities` VALUES ('89', '4', 'حاجي آباد');
INSERT INTO `cities` VALUES ('90', '4', 'تودشک');
INSERT INTO `cities` VALUES ('91', '4', 'ورزنه');
INSERT INTO `cities` VALUES ('92', '6', 'ايلام');
INSERT INTO `cities` VALUES ('93', '6', 'مهران');
INSERT INTO `cities` VALUES ('94', '6', 'دهلران');
INSERT INTO `cities` VALUES ('95', '6', 'آبدانان');
INSERT INTO `cities` VALUES ('96', '6', 'شيروان چرداول');
INSERT INTO `cities` VALUES ('97', '6', 'دره شهر');
INSERT INTO `cities` VALUES ('98', '6', 'ايوان');
INSERT INTO `cities` VALUES ('99', '6', 'سرابله');
INSERT INTO `cities` VALUES ('100', '7', 'بوشهر');
INSERT INTO `cities` VALUES ('101', '7', 'تنگستان');
INSERT INTO `cities` VALUES ('102', '7', 'دشتستان');
INSERT INTO `cities` VALUES ('103', '7', 'دير');
INSERT INTO `cities` VALUES ('104', '7', 'ديلم');
INSERT INTO `cities` VALUES ('105', '7', 'كنگان');
INSERT INTO `cities` VALUES ('106', '7', 'گناوه');
INSERT INTO `cities` VALUES ('107', '7', 'ريشهر');
INSERT INTO `cities` VALUES ('108', '7', 'دشتي');
INSERT INTO `cities` VALUES ('109', '7', 'خورموج');
INSERT INTO `cities` VALUES ('110', '7', 'اهرم');
INSERT INTO `cities` VALUES ('111', '7', 'برازجان');
INSERT INTO `cities` VALUES ('112', '7', 'خارك');
INSERT INTO `cities` VALUES ('113', '7', 'جم');
INSERT INTO `cities` VALUES ('114', '7', 'کاکی');
INSERT INTO `cities` VALUES ('115', '7', 'عسلویه');
INSERT INTO `cities` VALUES ('116', '7', 'بردخون');
INSERT INTO `cities` VALUES ('117', '8', 'تهران');
INSERT INTO `cities` VALUES ('118', '8', 'ورامين');
INSERT INTO `cities` VALUES ('119', '8', 'فيروزكوه');
INSERT INTO `cities` VALUES ('120', '8', 'ري');
INSERT INTO `cities` VALUES ('121', '8', 'دماوند');
INSERT INTO `cities` VALUES ('122', '8', 'اسلامشهر');
INSERT INTO `cities` VALUES ('123', '8', 'رودهن');
INSERT INTO `cities` VALUES ('124', '8', 'لواسان');
INSERT INTO `cities` VALUES ('125', '8', 'بومهن');
INSERT INTO `cities` VALUES ('126', '8', 'تجريش');
INSERT INTO `cities` VALUES ('127', '8', 'فشم');
INSERT INTO `cities` VALUES ('128', '8', 'كهريزك');
INSERT INTO `cities` VALUES ('129', '8', 'پاكدشت');
INSERT INTO `cities` VALUES ('130', '8', 'چهاردانگه');
INSERT INTO `cities` VALUES ('131', '8', 'شريف آباد');
INSERT INTO `cities` VALUES ('132', '8', 'قرچك');
INSERT INTO `cities` VALUES ('133', '8', 'باقرشهر');
INSERT INTO `cities` VALUES ('134', '8', 'شهريار');
INSERT INTO `cities` VALUES ('135', '8', 'رباط كريم');
INSERT INTO `cities` VALUES ('136', '8', 'قدس');
INSERT INTO `cities` VALUES ('137', '8', 'ملارد');
INSERT INTO `cities` VALUES ('138', '9', 'شهركرد');
INSERT INTO `cities` VALUES ('139', '9', 'فارسان');
INSERT INTO `cities` VALUES ('140', '9', 'بروجن');
INSERT INTO `cities` VALUES ('141', '9', 'چلگرد');
INSERT INTO `cities` VALUES ('142', '9', 'اردل');
INSERT INTO `cities` VALUES ('143', '9', 'لردگان');
INSERT INTO `cities` VALUES ('144', '9', 'سامان');
INSERT INTO `cities` VALUES ('145', '10', 'قائن');
INSERT INTO `cities` VALUES ('146', '10', 'فردوس');
INSERT INTO `cities` VALUES ('147', '10', 'بيرجند');
INSERT INTO `cities` VALUES ('148', '10', 'نهبندان');
INSERT INTO `cities` VALUES ('149', '10', 'سربيشه');
INSERT INTO `cities` VALUES ('150', '10', 'طبس مسینا');
INSERT INTO `cities` VALUES ('151', '10', 'قهستان');
INSERT INTO `cities` VALUES ('152', '10', 'درمیان');
INSERT INTO `cities` VALUES ('153', '11', 'مشهد');
INSERT INTO `cities` VALUES ('154', '11', 'نيشابور');
INSERT INTO `cities` VALUES ('155', '11', 'سبزوار');
INSERT INTO `cities` VALUES ('156', '11', 'كاشمر');
INSERT INTO `cities` VALUES ('157', '11', 'گناباد');
INSERT INTO `cities` VALUES ('158', '11', 'طبس');
INSERT INTO `cities` VALUES ('159', '11', 'تربت حيدريه');
INSERT INTO `cities` VALUES ('160', '11', 'خواف');
INSERT INTO `cities` VALUES ('161', '11', 'تربت جام');
INSERT INTO `cities` VALUES ('162', '11', 'تايباد');
INSERT INTO `cities` VALUES ('163', '11', 'قوچان');
INSERT INTO `cities` VALUES ('164', '11', 'سرخس');
INSERT INTO `cities` VALUES ('165', '11', 'بردسكن');
INSERT INTO `cities` VALUES ('166', '11', 'فريمان');
INSERT INTO `cities` VALUES ('167', '11', 'چناران');
INSERT INTO `cities` VALUES ('168', '11', 'درگز');
INSERT INTO `cities` VALUES ('169', '11', 'كلات');
INSERT INTO `cities` VALUES ('170', '11', 'طرقبه');
INSERT INTO `cities` VALUES ('171', '11', 'سر ولایت');
INSERT INTO `cities` VALUES ('172', '12', 'بجنورد');
INSERT INTO `cities` VALUES ('173', '12', 'اسفراين');
INSERT INTO `cities` VALUES ('174', '12', 'جاجرم');
INSERT INTO `cities` VALUES ('175', '12', 'شيروان');
INSERT INTO `cities` VALUES ('176', '12', 'آشخانه');
INSERT INTO `cities` VALUES ('177', '12', 'گرمه');
INSERT INTO `cities` VALUES ('178', '12', 'ساروج');
INSERT INTO `cities` VALUES ('179', '13', 'اهواز');
INSERT INTO `cities` VALUES ('180', '13', 'ايرانشهر');
INSERT INTO `cities` VALUES ('181', '13', 'شوش');
INSERT INTO `cities` VALUES ('182', '13', 'آبادان');
INSERT INTO `cities` VALUES ('183', '13', 'خرمشهر');
INSERT INTO `cities` VALUES ('184', '13', 'مسجد سليمان');
INSERT INTO `cities` VALUES ('185', '13', 'ايذه');
INSERT INTO `cities` VALUES ('186', '13', 'شوشتر');
INSERT INTO `cities` VALUES ('187', '13', 'انديمشك');
INSERT INTO `cities` VALUES ('188', '13', 'سوسنگرد');
INSERT INTO `cities` VALUES ('189', '13', 'هويزه');
INSERT INTO `cities` VALUES ('190', '13', 'دزفول');
INSERT INTO `cities` VALUES ('191', '13', 'شادگان');
INSERT INTO `cities` VALUES ('192', '13', 'بندر ماهشهر');
INSERT INTO `cities` VALUES ('193', '13', 'بندر امام خميني');
INSERT INTO `cities` VALUES ('194', '13', 'اميديه');
INSERT INTO `cities` VALUES ('195', '13', 'بهبهان');
INSERT INTO `cities` VALUES ('196', '13', 'رامهرمز');
INSERT INTO `cities` VALUES ('197', '13', 'باغ ملك');
INSERT INTO `cities` VALUES ('198', '13', 'هنديجان');
INSERT INTO `cities` VALUES ('199', '13', 'لالي');
INSERT INTO `cities` VALUES ('200', '13', 'رامشیر');
INSERT INTO `cities` VALUES ('201', '13', 'حمیدیه');
INSERT INTO `cities` VALUES ('202', '13', 'دغاغله');
INSERT INTO `cities` VALUES ('203', '13', 'ملاثانی');
INSERT INTO `cities` VALUES ('204', '13', 'شادگان');
INSERT INTO `cities` VALUES ('205', '13', 'ویسی');
INSERT INTO `cities` VALUES ('206', '14', 'زنجان');
INSERT INTO `cities` VALUES ('207', '14', 'ابهر');
INSERT INTO `cities` VALUES ('208', '14', 'خدابنده');
INSERT INTO `cities` VALUES ('209', '14', 'كارم');
INSERT INTO `cities` VALUES ('210', '14', 'ماهنشان');
INSERT INTO `cities` VALUES ('211', '14', 'خرمدره');
INSERT INTO `cities` VALUES ('212', '14', 'ايجرود');
INSERT INTO `cities` VALUES ('213', '14', 'زرين آباد');
INSERT INTO `cities` VALUES ('214', '14', 'آب بر');
INSERT INTO `cities` VALUES ('215', '14', 'قيدار');
INSERT INTO `cities` VALUES ('216', '15', 'سمنان');
INSERT INTO `cities` VALUES ('217', '15', 'شاهرود');
INSERT INTO `cities` VALUES ('218', '15', 'گرمسار');
INSERT INTO `cities` VALUES ('219', '15', 'ايوانكي');
INSERT INTO `cities` VALUES ('220', '15', 'دامغان');
INSERT INTO `cities` VALUES ('221', '15', 'بسطام');
INSERT INTO `cities` VALUES ('222', '16', 'زاهدان');
INSERT INTO `cities` VALUES ('223', '16', 'چابهار');
INSERT INTO `cities` VALUES ('224', '16', 'خاش');
INSERT INTO `cities` VALUES ('225', '16', 'سراوان');
INSERT INTO `cities` VALUES ('226', '16', 'زابل');
INSERT INTO `cities` VALUES ('227', '16', 'سرباز');
INSERT INTO `cities` VALUES ('228', '16', 'نيكشهر');
INSERT INTO `cities` VALUES ('229', '16', 'ايرانشهر');
INSERT INTO `cities` VALUES ('230', '16', 'راسك');
INSERT INTO `cities` VALUES ('231', '16', 'ميرجاوه');
INSERT INTO `cities` VALUES ('232', '17', 'شيراز');
INSERT INTO `cities` VALUES ('233', '17', 'اقليد');
INSERT INTO `cities` VALUES ('234', '17', 'داراب');
INSERT INTO `cities` VALUES ('235', '17', 'فسا');
INSERT INTO `cities` VALUES ('236', '17', 'مرودشت');
INSERT INTO `cities` VALUES ('237', '17', 'خرم بيد');
INSERT INTO `cities` VALUES ('238', '17', 'آباده');
INSERT INTO `cities` VALUES ('239', '17', 'كازرون');
INSERT INTO `cities` VALUES ('240', '17', 'ممسني');
INSERT INTO `cities` VALUES ('241', '17', 'سپيدان');
INSERT INTO `cities` VALUES ('242', '17', 'لار');
INSERT INTO `cities` VALUES ('243', '17', 'فيروز آباد');
INSERT INTO `cities` VALUES ('244', '17', 'جهرم');
INSERT INTO `cities` VALUES ('245', '17', 'ني ريز');
INSERT INTO `cities` VALUES ('246', '17', 'استهبان');
INSERT INTO `cities` VALUES ('247', '17', 'لامرد');
INSERT INTO `cities` VALUES ('248', '17', 'مهر');
INSERT INTO `cities` VALUES ('249', '17', 'حاجي آباد');
INSERT INTO `cities` VALUES ('250', '17', 'نورآباد');
INSERT INTO `cities` VALUES ('251', '17', 'اردكان');
INSERT INTO `cities` VALUES ('252', '17', 'صفاشهر');
INSERT INTO `cities` VALUES ('253', '17', 'ارسنجان');
INSERT INTO `cities` VALUES ('254', '17', 'قيروكارزين');
INSERT INTO `cities` VALUES ('255', '17', 'سوريان');
INSERT INTO `cities` VALUES ('256', '17', 'فراشبند');
INSERT INTO `cities` VALUES ('257', '17', 'سروستان');
INSERT INTO `cities` VALUES ('258', '17', 'ارژن');
INSERT INTO `cities` VALUES ('259', '17', 'گويم');
INSERT INTO `cities` VALUES ('260', '17', 'داريون');
INSERT INTO `cities` VALUES ('261', '17', 'زرقان');
INSERT INTO `cities` VALUES ('262', '17', 'خان زنیان');
INSERT INTO `cities` VALUES ('263', '17', 'کوار');
INSERT INTO `cities` VALUES ('264', '17', 'ده بید');
INSERT INTO `cities` VALUES ('265', '17', 'باب انار/خفر');
INSERT INTO `cities` VALUES ('266', '17', 'بوانات');
INSERT INTO `cities` VALUES ('267', '17', 'خرامه');
INSERT INTO `cities` VALUES ('268', '17', 'خنج');
INSERT INTO `cities` VALUES ('269', '17', 'سیاخ دارنگون');
INSERT INTO `cities` VALUES ('270', '18', 'قزوين');
INSERT INTO `cities` VALUES ('271', '18', 'تاكستان');
INSERT INTO `cities` VALUES ('272', '18', 'آبيك');
INSERT INTO `cities` VALUES ('273', '18', 'بوئين زهرا');
INSERT INTO `cities` VALUES ('274', '19', 'قم');
INSERT INTO `cities` VALUES ('275', '5', 'طالقان');
INSERT INTO `cities` VALUES ('276', '5', 'نظرآباد');
INSERT INTO `cities` VALUES ('277', '5', 'اشتهارد');
INSERT INTO `cities` VALUES ('278', '5', 'هشتگرد');
INSERT INTO `cities` VALUES ('279', '5', 'كن');
INSERT INTO `cities` VALUES ('280', '5', 'آسارا');
INSERT INTO `cities` VALUES ('281', '5', 'شهرک گلستان');
INSERT INTO `cities` VALUES ('282', '5', 'اندیشه');
INSERT INTO `cities` VALUES ('283', '5', 'كرج');
INSERT INTO `cities` VALUES ('284', '5', 'نظر آباد');
INSERT INTO `cities` VALUES ('285', '5', 'گوهردشت');
INSERT INTO `cities` VALUES ('286', '5', 'ماهدشت');
INSERT INTO `cities` VALUES ('287', '5', 'مشکین دشت');
INSERT INTO `cities` VALUES ('288', '20', 'سنندج');
INSERT INTO `cities` VALUES ('289', '20', 'ديواندره');
INSERT INTO `cities` VALUES ('290', '20', 'بانه');
INSERT INTO `cities` VALUES ('291', '20', 'بيجار');
INSERT INTO `cities` VALUES ('292', '20', 'سقز');
INSERT INTO `cities` VALUES ('293', '20', 'كامياران');
INSERT INTO `cities` VALUES ('294', '20', 'قروه');
INSERT INTO `cities` VALUES ('295', '20', 'مريوان');
INSERT INTO `cities` VALUES ('296', '20', 'صلوات آباد');
INSERT INTO `cities` VALUES ('297', '20', 'حسن آباد');
INSERT INTO `cities` VALUES ('298', '21', 'كرمان');
INSERT INTO `cities` VALUES ('299', '21', 'راور');
INSERT INTO `cities` VALUES ('300', '21', 'بابك');
INSERT INTO `cities` VALUES ('301', '21', 'انار');
INSERT INTO `cities` VALUES ('302', '21', 'کوهبنان');
INSERT INTO `cities` VALUES ('303', '21', 'رفسنجان');
INSERT INTO `cities` VALUES ('304', '21', 'بافت');
INSERT INTO `cities` VALUES ('305', '21', 'سيرجان');
INSERT INTO `cities` VALUES ('306', '21', 'كهنوج');
INSERT INTO `cities` VALUES ('307', '21', 'زرند');
INSERT INTO `cities` VALUES ('308', '21', 'بم');
INSERT INTO `cities` VALUES ('309', '21', 'جيرفت');
INSERT INTO `cities` VALUES ('310', '21', 'بردسير');
INSERT INTO `cities` VALUES ('311', '22', 'كرمانشاه');
INSERT INTO `cities` VALUES ('312', '22', 'اسلام آباد غرب');
INSERT INTO `cities` VALUES ('313', '22', 'سر پل ذهاب');
INSERT INTO `cities` VALUES ('314', '22', 'كنگاور');
INSERT INTO `cities` VALUES ('315', '22', 'سنقر');
INSERT INTO `cities` VALUES ('316', '22', 'قصر شيرين');
INSERT INTO `cities` VALUES ('317', '22', 'گيلان غرب');
INSERT INTO `cities` VALUES ('318', '22', 'هرسين');
INSERT INTO `cities` VALUES ('319', '22', 'صحنه');
INSERT INTO `cities` VALUES ('320', '22', 'پاوه');
INSERT INTO `cities` VALUES ('321', '22', 'جوانرود');
INSERT INTO `cities` VALUES ('322', '22', 'شاهو');
INSERT INTO `cities` VALUES ('323', '23', 'ياسوج');
INSERT INTO `cities` VALUES ('324', '23', 'گچساران');
INSERT INTO `cities` VALUES ('325', '23', 'دنا');
INSERT INTO `cities` VALUES ('326', '23', 'دوگنبدان');
INSERT INTO `cities` VALUES ('327', '23', 'سي سخت');
INSERT INTO `cities` VALUES ('328', '23', 'دهدشت');
INSERT INTO `cities` VALUES ('329', '23', 'ليكك');
INSERT INTO `cities` VALUES ('330', '24', 'گرگان');
INSERT INTO `cities` VALUES ('331', '24', 'آق قلا');
INSERT INTO `cities` VALUES ('332', '24', 'گنبد كاووس');
INSERT INTO `cities` VALUES ('333', '24', 'علي آباد كتول');
INSERT INTO `cities` VALUES ('334', '24', 'مينو دشت');
INSERT INTO `cities` VALUES ('335', '24', 'تركمن');
INSERT INTO `cities` VALUES ('336', '24', 'كردكوي');
INSERT INTO `cities` VALUES ('337', '24', 'بندر گز');
INSERT INTO `cities` VALUES ('338', '24', 'كلاله');
INSERT INTO `cities` VALUES ('339', '24', 'آزاد شهر');
INSERT INTO `cities` VALUES ('340', '24', 'راميان');
INSERT INTO `cities` VALUES ('341', '25', 'رشت');
INSERT INTO `cities` VALUES ('342', '25', 'منجيل');
INSERT INTO `cities` VALUES ('343', '25', 'لنگرود');
INSERT INTO `cities` VALUES ('344', '25', 'رود سر');
INSERT INTO `cities` VALUES ('345', '25', 'تالش');
INSERT INTO `cities` VALUES ('346', '25', 'آستارا');
INSERT INTO `cities` VALUES ('347', '25', 'ماسوله');
INSERT INTO `cities` VALUES ('348', '25', 'آستانه اشرفيه');
INSERT INTO `cities` VALUES ('349', '25', 'رودبار');
INSERT INTO `cities` VALUES ('350', '25', 'فومن');
INSERT INTO `cities` VALUES ('351', '25', 'صومعه سرا');
INSERT INTO `cities` VALUES ('352', '25', 'بندرانزلي');
INSERT INTO `cities` VALUES ('353', '25', 'كلاچاي');
INSERT INTO `cities` VALUES ('354', '25', 'هشتپر');
INSERT INTO `cities` VALUES ('355', '25', 'رضوان شهر');
INSERT INTO `cities` VALUES ('356', '25', 'ماسال');
INSERT INTO `cities` VALUES ('357', '25', 'شفت');
INSERT INTO `cities` VALUES ('358', '25', 'سياهكل');
INSERT INTO `cities` VALUES ('359', '25', 'املش');
INSERT INTO `cities` VALUES ('360', '25', 'لاهیجان');
INSERT INTO `cities` VALUES ('361', '25', 'خشک بيجار');
INSERT INTO `cities` VALUES ('362', '25', 'خمام');
INSERT INTO `cities` VALUES ('363', '25', 'لشت نشا');
INSERT INTO `cities` VALUES ('364', '25', 'بندر کياشهر');
INSERT INTO `cities` VALUES ('365', '26', 'خرم آباد');
INSERT INTO `cities` VALUES ('366', '26', 'ماهشهر');
INSERT INTO `cities` VALUES ('367', '26', 'دزفول');
INSERT INTO `cities` VALUES ('368', '26', 'بروجرد');
INSERT INTO `cities` VALUES ('369', '26', 'دورود');
INSERT INTO `cities` VALUES ('370', '26', 'اليگودرز');
INSERT INTO `cities` VALUES ('371', '26', 'ازنا');
INSERT INTO `cities` VALUES ('372', '26', 'نور آباد');
INSERT INTO `cities` VALUES ('373', '26', 'كوهدشت');
INSERT INTO `cities` VALUES ('374', '26', 'الشتر');
INSERT INTO `cities` VALUES ('375', '26', 'پلدختر');
INSERT INTO `cities` VALUES ('376', '27', 'ساري');
INSERT INTO `cities` VALUES ('377', '27', 'آمل');
INSERT INTO `cities` VALUES ('378', '27', 'بابل');
INSERT INTO `cities` VALUES ('379', '27', 'بابلسر');
INSERT INTO `cities` VALUES ('380', '27', 'بهشهر');
INSERT INTO `cities` VALUES ('381', '27', 'تنكابن');
INSERT INTO `cities` VALUES ('382', '27', 'جويبار');
INSERT INTO `cities` VALUES ('383', '27', 'چالوس');
INSERT INTO `cities` VALUES ('384', '27', 'رامسر');
INSERT INTO `cities` VALUES ('385', '27', 'سواد كوه');
INSERT INTO `cities` VALUES ('386', '27', 'قائم شهر');
INSERT INTO `cities` VALUES ('387', '27', 'نكا');
INSERT INTO `cities` VALUES ('388', '27', 'نور');
INSERT INTO `cities` VALUES ('389', '27', 'بلده');
INSERT INTO `cities` VALUES ('390', '27', 'نوشهر');
INSERT INTO `cities` VALUES ('391', '27', 'پل سفيد');
INSERT INTO `cities` VALUES ('392', '27', 'محمود آباد');
INSERT INTO `cities` VALUES ('393', '27', 'فريدون كنار');
INSERT INTO `cities` VALUES ('394', '28', 'اراك');
INSERT INTO `cities` VALUES ('395', '28', 'آشتيان');
INSERT INTO `cities` VALUES ('396', '28', 'تفرش');
INSERT INTO `cities` VALUES ('397', '28', 'خمين');
INSERT INTO `cities` VALUES ('398', '28', 'دليجان');
INSERT INTO `cities` VALUES ('399', '28', 'ساوه');
INSERT INTO `cities` VALUES ('400', '28', 'سربند');
INSERT INTO `cities` VALUES ('401', '28', 'محلات');
INSERT INTO `cities` VALUES ('402', '28', 'شازند');
INSERT INTO `cities` VALUES ('403', '29', 'بندرعباس');
INSERT INTO `cities` VALUES ('404', '29', 'قشم');
INSERT INTO `cities` VALUES ('405', '29', 'كيش');
INSERT INTO `cities` VALUES ('406', '29', 'بندر لنگه');
INSERT INTO `cities` VALUES ('407', '29', 'بستك');
INSERT INTO `cities` VALUES ('408', '29', 'حاجي آباد');
INSERT INTO `cities` VALUES ('409', '29', 'دهبارز');
INSERT INTO `cities` VALUES ('410', '29', 'انگهران');
INSERT INTO `cities` VALUES ('411', '29', 'ميناب');
INSERT INTO `cities` VALUES ('412', '29', 'ابوموسي');
INSERT INTO `cities` VALUES ('413', '29', 'بندر جاسك');
INSERT INTO `cities` VALUES ('414', '29', 'تنب بزرگ');
INSERT INTO `cities` VALUES ('415', '29', 'بندر خمیر');
INSERT INTO `cities` VALUES ('416', '29', 'پارسیان');
INSERT INTO `cities` VALUES ('417', '29', 'قشم');
INSERT INTO `cities` VALUES ('418', '30', 'همدان');
INSERT INTO `cities` VALUES ('419', '30', 'ملاير');
INSERT INTO `cities` VALUES ('420', '30', 'تويسركان');
INSERT INTO `cities` VALUES ('421', '30', 'نهاوند');
INSERT INTO `cities` VALUES ('422', '30', 'كبودر اهنگ');
INSERT INTO `cities` VALUES ('423', '30', 'رزن');
INSERT INTO `cities` VALUES ('424', '30', 'اسدآباد');
INSERT INTO `cities` VALUES ('425', '30', 'بهار');
INSERT INTO `cities` VALUES ('426', '31', 'يزد');
INSERT INTO `cities` VALUES ('427', '31', 'تفت');
INSERT INTO `cities` VALUES ('428', '31', 'اردكان');
INSERT INTO `cities` VALUES ('429', '31', 'ابركوه');
INSERT INTO `cities` VALUES ('430', '31', 'ميبد');
INSERT INTO `cities` VALUES ('431', '31', 'طبس');
INSERT INTO `cities` VALUES ('432', '31', 'بافق');
INSERT INTO `cities` VALUES ('433', '31', 'مهريز');
INSERT INTO `cities` VALUES ('434', '31', 'اشكذر');
INSERT INTO `cities` VALUES ('435', '31', 'هرات');
INSERT INTO `cities` VALUES ('436', '31', 'خضرآباد');
INSERT INTO `cities` VALUES ('437', '31', 'شاهديه');
INSERT INTO `cities` VALUES ('438', '31', 'حمیدیه شهر');
INSERT INTO `cities` VALUES ('439', '31', 'سید میرزا');
INSERT INTO `cities` VALUES ('440', '31', 'زارچ');

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES ('1', 'نوروز 98', 'offNorooz98', '15000', '1', '2019-03-10 14:58:42', '2019-03-10 14:58:42');

-- ----------------------------
-- Table structure for coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `coupon_user`;
CREATE TABLE `coupon_user` (
  `coupon_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  KEY `coupon_user_coupon_id_foreign` (`coupon_id`),
  KEY `coupon_user_user_id_foreign` (`user_id`),
  CONSTRAINT `coupon_user_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  CONSTRAINT `coupon_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon_user
-- ----------------------------
INSERT INTO `coupon_user` VALUES ('1', '6');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('5', '2018_12_28_091231_create_categories_table', '2');
INSERT INTO `migrations` VALUES ('7', '2018_12_31_065738_create_attributes_group_table', '3');
INSERT INTO `migrations` VALUES ('8', '2019_01_09_115457_create_attributes_value', '4');
INSERT INTO `migrations` VALUES ('13', '2019_01_27_092048_create_photos_table', '5');
INSERT INTO `migrations` VALUES ('14', '2019_01_27_105302_create_brands_table', '5');
INSERT INTO `migrations` VALUES ('17', '2019_01_30_141302_create_products_table', '6');
INSERT INTO `migrations` VALUES ('18', '2019_01_30_143929_add_foriegn_to_category', '7');
INSERT INTO `migrations` VALUES ('22', '2019_02_24_074053_add_attribute_product_table', '8');
INSERT INTO `migrations` VALUES ('23', '2019_02_24_074306_modify_products_table', '9');
INSERT INTO `migrations` VALUES ('24', '2019_02_24_074608_add_category_product_table', '10');
INSERT INTO `migrations` VALUES ('25', '2019_02_24_074750_add_photo_product', '11');
INSERT INTO `migrations` VALUES ('26', '2019_02_26_063831_add_seo_to_products_table', '12');
INSERT INTO `migrations` VALUES ('29', '2019_03_07_074504_create_addresses_table', '13');
INSERT INTO `migrations` VALUES ('32', '2019_03_10_140133_create_coupons_table', '14');
INSERT INTO `migrations` VALUES ('33', '2019_03_10_140205_create_coupon_user', '14');
INSERT INTO `migrations` VALUES ('38', '2019_03_14_152649_create_orders_table', '15');
INSERT INTO `migrations` VALUES ('39', '2019_03_14_152945_create_order_product_table', '15');
INSERT INTO `migrations` VALUES ('41', '2019_03_15_074805_create_payments_table', '16');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(8,2) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('15', '175000.00', '6', '1', '2019-03-15 08:16:38', '2019-03-15 08:16:44');
INSERT INTO `orders` VALUES ('16', '100000.00', '6', '0', '2019-03-15 08:17:20', '2019-03-15 08:17:20');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  KEY `order_product_order_id_foreign` (`order_id`),
  KEY `order_product_product_id_foreign` (`product_id`),
  CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('15', '2', '1');
INSERT INTO `order_product` VALUES ('15', '4', '1');
INSERT INTO `order_product` VALUES ('16', '4', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RefID` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_order_id_foreign` (`order_id`),
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES ('2', '000000000000000000000000000000019386', 'OK', '1', '15', '2019-03-15 08:16:44', '2019-03-15 08:16:44');

-- ----------------------------
-- Table structure for photos
-- ----------------------------
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `photos_user_id_foreign` (`user_id`),
  CONSTRAINT `photos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of photos
-- ----------------------------
INSERT INTO `photos` VALUES ('1', '1548598855Versace_logo.png', 'Versace_logo.png', '1', '2019-01-27 14:20:55', '2019-01-27 14:20:55');
INSERT INTO `photos` VALUES ('2', '1548599012Versace_logo.png', 'Versace_logo.png', '1', '2019-01-27 14:23:33', '2019-01-27 14:23:33');
INSERT INTO `photos` VALUES ('3', '1548599028Versace_logo.png', 'Versace_logo.png', '1', '2019-01-27 14:23:48', '2019-01-27 14:23:48');
INSERT INTO `photos` VALUES ('4', '1548663443Old_Nike_logo.jpg', 'Old_Nike_logo.jpg', '1', '2019-01-28 08:17:23', '2019-01-28 08:17:23');
INSERT INTO `photos` VALUES ('5', '1548663948index.jpg', 'index.jpg', '1', '2019-01-28 08:25:48', '2019-01-28 08:25:48');
INSERT INTO `photos` VALUES ('6', '1548665993index.jpg', 'index.jpg', '1', '2019-01-28 08:59:53', '2019-01-28 08:59:53');
INSERT INTO `photos` VALUES ('7', '1548666139Old_Nike_logo.jpg', 'Old_Nike_logo.jpg', '1', '2019-01-28 09:02:19', '2019-01-28 09:02:19');
INSERT INTO `photos` VALUES ('8', '1550760744react-course-preview.jpg', 'react-course-preview.jpg', '1', '2019-02-21 14:52:25', '2019-02-21 14:52:25');
INSERT INTO `photos` VALUES ('9', '1550761237nodejs.jpeg', 'nodejs.jpeg', '1', '2019-02-21 15:00:37', '2019-02-21 15:00:37');
INSERT INTO `photos` VALUES ('22', '1550918712Some+C+++Operators+Precedence+Operator+Description.jpg', 'Some+C+++Operators+Precedence+Operator+Description.jpg', '1', '2019-02-23 10:45:12', '2019-02-23 10:45:12');
INSERT INTO `photos` VALUES ('23', '1550918715sql-language-update-delete.jpg', 'sql-language-update-delete.jpg', '1', '2019-02-23 10:45:16', '2019-02-23 10:45:16');
INSERT INTO `photos` VALUES ('24', '1550918720javascript-hoisting.jpg', 'javascript-hoisting.jpg', '1', '2019-02-23 10:45:20', '2019-02-23 10:45:20');
INSERT INTO `photos` VALUES ('25', '155099968105516096_zi_heather_reflex.jpg', '05516096_zi_heather_reflex.jpg', '1', '2019-02-24 09:14:41', '2019-02-24 09:14:41');
INSERT INTO `photos` VALUES ('26', '15509996814f9bfce7-9056-11e8-90dc-e1022f6b63e5.jpg', '4f9bfce7-9056-11e8-90dc-e1022f6b63e5.jpg', '1', '2019-02-24 09:14:41', '2019-02-24 09:14:41');
INSERT INTO `photos` VALUES ('27', '1550999682DP1116201820352595C.jpg', 'DP1116201820352595C.jpg', '1', '2019-02-24 09:14:42', '2019-02-24 09:14:42');
INSERT INTO `photos` VALUES ('28', '1550999711DP1116201820352595C.jpg', 'DP1116201820352595C.jpg', '1', '2019-02-24 09:15:12', '2019-02-24 09:15:12');
INSERT INTO `photos` VALUES ('30', '1551166798sql-language-important-functions.jpg', 'sql-language-important-functions.jpg', '1', '2019-02-26 07:39:58', '2019-02-26 07:39:58');
INSERT INTO `photos` VALUES ('31', '1551168502sql-language-important-functions.jpg', 'sql-language-important-functions.jpg', '1', '2019-02-26 08:08:22', '2019-02-26 08:08:22');
INSERT INTO `photos` VALUES ('32', '1551172997DP1116201820352595C.jpg', 'DP1116201820352595C.jpg', '1', '2019-02-26 09:23:17', '2019-02-26 09:23:17');
INSERT INTO `photos` VALUES ('33', '1551173349SQL-Language-select-top.jpg', 'SQL-Language-select-top.jpg', '1', '2019-02-26 09:29:09', '2019-02-26 09:29:09');
INSERT INTO `photos` VALUES ('34', '1551173349sql-language-important-functions.jpg', 'sql-language-important-functions.jpg', '1', '2019-02-26 09:29:09', '2019-02-26 09:29:09');
INSERT INTO `photos` VALUES ('35', '1551442355ipod_classic_1-220x330.jpg', 'ipod_classic_1-220x330.jpg', '1', '2019-03-01 12:12:35', '2019-03-01 12:12:35');
INSERT INTO `photos` VALUES ('36', '1551442355nikon_d300_4-220x330.jpg', 'nikon_d300_4-220x330.jpg', '1', '2019-03-01 12:12:35', '2019-03-01 12:12:35');
INSERT INTO `photos` VALUES ('37', '1551442539ipod_shuffle_1-220x330.jpg', 'ipod_shuffle_1-220x330.jpg', '1', '2019-03-01 12:15:39', '2019-03-01 12:15:39');
INSERT INTO `photos` VALUES ('38', '1551442539ipod_nano_1-220x330.jpg', 'ipod_nano_1-220x330.jpg', '1', '2019-03-01 12:15:39', '2019-03-01 12:15:39');
INSERT INTO `photos` VALUES ('39', '1551442614apple_cinema_30-220x330.jpg', 'apple_cinema_30-220x330.jpg', '1', '2019-03-01 12:16:54', '2019-03-01 12:16:54');
INSERT INTO `photos` VALUES ('40', '1551442614canon_eos_5d_1-220x330.jpg', 'canon_eos_5d_1-220x330.jpg', '1', '2019-03-01 12:16:54', '2019-03-01 12:16:54');
INSERT INTO `photos` VALUES ('41', '1551442658canon_eos_5d_1-200x200.jpg', 'canon_eos_5d_1-200x200.jpg', '1', '2019-03-01 12:17:38', '2019-03-01 12:17:38');
INSERT INTO `photos` VALUES ('42', '1551442658hp_2-220x330.jpg', 'hp_2-220x330.jpg', '1', '2019-03-01 12:17:38', '2019-03-01 12:17:38');
INSERT INTO `photos` VALUES ('43', '1551443638canon_eos_5d_1-220x330.jpg', 'canon_eos_5d_1-220x330.jpg', '1', '2019-03-01 12:33:58', '2019-03-01 12:33:58');
INSERT INTO `photos` VALUES ('44', '1551444406macbook_pro_1-220x330.jpg', 'macbook_pro_1-220x330.jpg', '1', '2019-03-01 12:46:46', '2019-03-01 12:46:46');
INSERT INTO `photos` VALUES ('45', '1551444406macbook_air_1-220x330.jpg', 'macbook_air_1-220x330.jpg', '1', '2019-03-01 12:46:46', '2019-03-01 12:46:46');
INSERT INTO `photos` VALUES ('46', '15514466442000px-Adidas_Logo.svg.png', '2000px-Adidas_Logo.svg.png', '1', '2019-03-01 13:24:04', '2019-03-01 13:24:04');
INSERT INTO `photos` VALUES ('47', '1551446653mango_0.png', 'mango_0.png', '1', '2019-03-01 13:24:13', '2019-03-01 13:24:13');
INSERT INTO `photos` VALUES ('48', '15514466621024px-Zara_Logo.svg.png', '1024px-Zara_Logo.svg.png', '1', '2019-03-01 13:24:22', '2019-03-01 13:24:22');
INSERT INTO `photos` VALUES ('49', '1551446723download.png', 'download.png', '1', '2019-03-01 13:25:23', '2019-03-01 13:25:23');
INSERT INTO `photos` VALUES ('50', '1551446790Louis_Vuitton_Logo.svg.png', 'Louis_Vuitton_Logo.svg.png', '1', '2019-03-01 13:26:30', '2019-03-01 13:26:30');
INSERT INTO `photos` VALUES ('51', '15514469426551.jpg', '6551.jpg', '1', '2019-03-01 13:29:02', '2019-03-01 13:29:02');
INSERT INTO `photos` VALUES ('52', '15514469486661.jpg', '6661.jpg', '1', '2019-03-01 13:29:08', '2019-03-01 13:29:08');
INSERT INTO `photos` VALUES ('53', '15514469776555.jpg', '6555.jpg', '1', '2019-03-01 13:29:37', '2019-03-01 13:29:37');
INSERT INTO `photos` VALUES ('54', '15514470046551.jpg', '6551.jpg', '1', '2019-03-01 13:30:04', '2019-03-01 13:30:04');
INSERT INTO `photos` VALUES ('55', '15514470126554.jpg', '6554.jpg', '1', '2019-03-01 13:30:12', '2019-03-01 13:30:12');
INSERT INTO `photos` VALUES ('56', '15514470296553.jpg', '6553.jpg', '1', '2019-03-01 13:30:29', '2019-03-01 13:30:29');
INSERT INTO `photos` VALUES ('57', '15514470896543 (1).jpg', '6543 (1).jpg', '1', '2019-03-01 13:31:29', '2019-03-01 13:31:29');
INSERT INTO `photos` VALUES ('58', '1552638552macbook_air_1-220x330.jpg', 'macbook_air_1-220x330.jpg', '1', '2019-03-15 08:29:12', '2019-03-15 08:29:12');
INSERT INTO `photos` VALUES ('59', '1552638574macbook_pro_1-220x330.jpg', 'macbook_pro_1-220x330.jpg', '1', '2019-03-15 08:29:34', '2019-03-15 08:29:34');
INSERT INTO `photos` VALUES ('60', '1552638643nikon_d300_4-220x330.jpg', 'nikon_d300_4-220x330.jpg', '1', '2019-03-15 08:30:43', '2019-03-15 08:30:43');
INSERT INTO `photos` VALUES ('61', '1552638643macbook_1-220x330.jpg', 'macbook_1-220x330.jpg', '1', '2019-03-15 08:30:43', '2019-03-15 08:30:43');
INSERT INTO `photos` VALUES ('62', '1552638751canon_eos_5d_1-220x330.jpg', 'canon_eos_5d_1-220x330.jpg', '1', '2019-03-15 08:32:32', '2019-03-15 08:32:32');
INSERT INTO `photos` VALUES ('63', '1552638752apple_cinema_30-220x330.jpg', 'apple_cinema_30-220x330.jpg', '1', '2019-03-15 08:32:32', '2019-03-15 08:32:32');
INSERT INTO `photos` VALUES ('64', '1552638756apple_cinema_30-220x330.jpg', 'apple_cinema_30-220x330.jpg', '1', '2019-03-15 08:32:36', '2019-03-15 08:32:36');

-- ----------------------------
-- Table structure for photo_product
-- ----------------------------
DROP TABLE IF EXISTS `photo_product`;
CREATE TABLE `photo_product` (
  `photo_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  KEY `photo_product_photo_id_foreign` (`photo_id`),
  KEY `photo_product_product_id_foreign` (`product_id`),
  CONSTRAINT `photo_product_photo_id_foreign` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `photo_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of photo_product
-- ----------------------------
INSERT INTO `photo_product` VALUES ('35', '2');
INSERT INTO `photo_product` VALUES ('36', '2');
INSERT INTO `photo_product` VALUES ('37', '4');
INSERT INTO `photo_product` VALUES ('38', '4');
INSERT INTO `photo_product` VALUES ('39', '5');
INSERT INTO `photo_product` VALUES ('40', '5');
INSERT INTO `photo_product` VALUES ('42', '6');
INSERT INTO `photo_product` VALUES ('43', '6');
INSERT INTO `photo_product` VALUES ('44', '7');
INSERT INTO `photo_product` VALUES ('45', '7');
INSERT INTO `photo_product` VALUES ('58', '8');
INSERT INTO `photo_product` VALUES ('59', '8');
INSERT INTO `photo_product` VALUES ('60', '9');
INSERT INTO `photo_product` VALUES ('61', '9');
INSERT INTO `photo_product` VALUES ('62', '10');
INSERT INTO `photo_product` VALUES ('63', '10');
INSERT INTO `photo_product` VALUES ('64', '10');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount_price` double(8,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_user_id_foreign` (`user_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('2', 'لباس زنانه adidas مدل 1195', '60360', 'لباس-زنانه-adidas', '1', '95000.00', '75000.00', '<p>توضیحات ویژگی های لباس</p>', '3', '1', '2019-03-01 12:12:51', '2019-03-15 09:29:34', 'توضیحات لباس زنانه adidas', 'لباس زنانه adidas  مدل 1195', 'کلمه کیدی adidas');
INSERT INTO `products` VALUES ('4', 'شلوار مردانه adidas مدل 4578', '24012', 'شلوار-مردانه-adidas', '1', '150000.00', '100000.00', '<p>لباس مردانه adidas&nbsp;</p>', '3', '1', '2019-03-01 12:15:41', '2019-03-01 13:32:25', 'توضیحات سئو', 'لباس مردانه adidas', 'کلمه کلیدی');
INSERT INTO `products` VALUES ('5', 'پیرهن مردانه adidas مدل 754', '99999', 'پیرهن-مردانه-adidas-مدل-754', '1', '105000.00', null, '<p>توضیحات&nbsp;</p>', '3', '1', '2019-03-01 12:16:56', '2019-03-01 13:32:51', 'توضیحات سئو پیراهن مردانه adidas', 'عنوان سئو پیراهن مردانه adidas', 'کلمه کلیدی');
INSERT INTO `products` VALUES ('6', 'پیراهن مردانه زیبا', '63226', 'پیراهن-مردانه-زیبا', '1', '50000.00', '25000.00', '<p>توضیحات ویژه</p>', '3', '1', '2019-03-01 12:17:50', '2019-03-01 12:33:59', 'توضیحات سئو', 'عنوان سئو پیراهن مردانه', 'کلمه کلیدی');
INSERT INTO `products` VALUES ('7', 'سویشرت مردانه adidas', '6217', 'سویشرت-مرادانه-adidas', '1', '195000.00', null, '<p>توضیحات</p>', '3', '1', '2019-03-01 12:46:48', '2019-03-01 13:33:10', 'توضیحات تست متا', 'توضیحات سئو برای سویشرت', 'توضیحات کلمات کلیدی');
INSERT INTO `products` VALUES ('8', 'تی شرت آدیداس پسرانه مدل ۱۲', '26276', 'تی-شرت-آدیداس-پسرانه-مدل-۱۲', '1', '78500.00', null, '<p>توضیحات مربوط به این تی شرت در این قسمت قرار می گیرد</p>', '3', '1', '2019-03-15 08:29:39', '2019-03-15 08:32:56', 'شسی', 'شسی', null);
INSERT INTO `products` VALUES ('9', 'لباس زنانه آدیداس مدل ۱۲۹', '66890', 'لباس-زنانه-آدیداس-مدل-۱۲۹', '1', '65000.00', null, '<p>توضیحات تست این محصول زنانه</p>', '3', '1', '2019-03-15 08:30:48', '2019-03-15 08:33:16', null, null, null);
INSERT INTO `products` VALUES ('10', 'لباس مردانه آدیداس مدل 8796', '10365', 'لباس-مردانه-آدیداس-مدل-8796', '1', '2000.00', null, '<p>توضیحات تست این محصول</p>', '3', '1', '2019-03-15 08:32:38', '2019-03-15 08:32:38', null, null, null);

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES ('1', 'آذربايجان شرقي');
INSERT INTO `provinces` VALUES ('2', 'آذربايجان غربي');
INSERT INTO `provinces` VALUES ('3', 'اردبيل');
INSERT INTO `provinces` VALUES ('4', 'اصفهان');
INSERT INTO `provinces` VALUES ('5', 'البرز');
INSERT INTO `provinces` VALUES ('6', 'ايلام');
INSERT INTO `provinces` VALUES ('7', 'بوشهر');
INSERT INTO `provinces` VALUES ('8', 'تهران');
INSERT INTO `provinces` VALUES ('9', 'چهارمحال بختياري');
INSERT INTO `provinces` VALUES ('10', 'خراسان جنوبي');
INSERT INTO `provinces` VALUES ('11', 'خراسان رضوي');
INSERT INTO `provinces` VALUES ('12', 'خراسان شمالي');
INSERT INTO `provinces` VALUES ('13', 'خوزستان');
INSERT INTO `provinces` VALUES ('14', 'زنجان');
INSERT INTO `provinces` VALUES ('15', 'سمنان');
INSERT INTO `provinces` VALUES ('16', 'سيستان و بلوچستان');
INSERT INTO `provinces` VALUES ('17', 'فارس');
INSERT INTO `provinces` VALUES ('18', 'قزوين');
INSERT INTO `provinces` VALUES ('19', 'قم');
INSERT INTO `provinces` VALUES ('20', 'كردستان');
INSERT INTO `provinces` VALUES ('21', 'كرمان');
INSERT INTO `provinces` VALUES ('22', 'كرمانشاه');
INSERT INTO `provinces` VALUES ('23', 'كهكيلويه و بويراحمد');
INSERT INTO `provinces` VALUES ('24', 'گلستان');
INSERT INTO `provinces` VALUES ('25', 'گيلان');
INSERT INTO `provinces` VALUES ('26', 'لرستان');
INSERT INTO `provinces` VALUES ('27', 'مازندران');
INSERT INTO `provinces` VALUES ('28', 'مركزي');
INSERT INTO `provinces` VALUES ('29', 'هرمزگان');
INSERT INTO `provinces` VALUES ('30', 'همدان');
INSERT INTO `provinces` VALUES ('31', 'يزد');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `national_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'masoud', 'salehi', '021', '0935555555', 'masoud@gmail.com', '0000-00-00 00:00:00', '$duiYg4Z3cN9kqUJw/avG3.', null, '2019-01-27 16:45:49', '2019-01-27 16:45:52');
INSERT INTO `users` VALUES ('6', 'محمد', 'محمدی', '3584789536', '0912111111', 'mohammad@gmail.com', null, '$2y$10$xwp76VUiLZiBJLr/maV4W.OmZoy6cqLCSvxbn.yvrIuNOL/ZcDzQS', 'pcAyyMDoLxE7wTtSGH70GGTMZmWosrQAzNctsawi30HmvAn1cImEfmHTV7a2', '2019-03-07 09:15:11', '2019-03-07 09:15:11');
