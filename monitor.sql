/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : monitor

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-05-15 20:41:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add sys log', '7', 'add_syslog');
INSERT INTO `auth_permission` VALUES ('26', 'Can change sys log', '7', 'change_syslog');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete sys log', '7', 'delete_syslog');
INSERT INTO `auth_permission` VALUES ('28', 'Can view sys log', '7', 'view_syslog');
INSERT INTO `auth_permission` VALUES ('29', 'Can add sys menu', '8', 'add_sysmenu');
INSERT INTO `auth_permission` VALUES ('30', 'Can change sys menu', '8', 'change_sysmenu');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete sys menu', '8', 'delete_sysmenu');
INSERT INTO `auth_permission` VALUES ('32', 'Can view sys menu', '8', 'view_sysmenu');
INSERT INTO `auth_permission` VALUES ('33', 'Can add sys org', '9', 'add_sysorg');
INSERT INTO `auth_permission` VALUES ('34', 'Can change sys org', '9', 'change_sysorg');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete sys org', '9', 'delete_sysorg');
INSERT INTO `auth_permission` VALUES ('36', 'Can view sys org', '9', 'view_sysorg');
INSERT INTO `auth_permission` VALUES ('37', 'Can add sys role', '10', 'add_sysrole');
INSERT INTO `auth_permission` VALUES ('38', 'Can change sys role', '10', 'change_sysrole');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete sys role', '10', 'delete_sysrole');
INSERT INTO `auth_permission` VALUES ('40', 'Can view sys role', '10', 'view_sysrole');
INSERT INTO `auth_permission` VALUES ('41', 'Can add sys role menu', '11', 'add_sysrolemenu');
INSERT INTO `auth_permission` VALUES ('42', 'Can change sys role menu', '11', 'change_sysrolemenu');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete sys role menu', '11', 'delete_sysrolemenu');
INSERT INTO `auth_permission` VALUES ('44', 'Can view sys role menu', '11', 'view_sysrolemenu');
INSERT INTO `auth_permission` VALUES ('45', 'Can add sys user', '12', 'add_sysuser');
INSERT INTO `auth_permission` VALUES ('46', 'Can change sys user', '12', 'change_sysuser');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete sys user', '12', 'delete_sysuser');
INSERT INTO `auth_permission` VALUES ('48', 'Can view sys user', '12', 'view_sysuser');
INSERT INTO `auth_permission` VALUES ('49', 'Can add sys user org', '13', 'add_sysuserorg');
INSERT INTO `auth_permission` VALUES ('50', 'Can change sys user org', '13', 'change_sysuserorg');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete sys user org', '13', 'delete_sysuserorg');
INSERT INTO `auth_permission` VALUES ('52', 'Can view sys user org', '13', 'view_sysuserorg');
INSERT INTO `auth_permission` VALUES ('53', 'Can add sys user role', '14', 'add_sysuserrole');
INSERT INTO `auth_permission` VALUES ('54', 'Can change sys user role', '14', 'change_sysuserrole');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete sys user role', '14', 'delete_sysuserrole');
INSERT INTO `auth_permission` VALUES ('56', 'Can view sys user role', '14', 'view_sysuserrole');
INSERT INTO `auth_permission` VALUES ('57', 'Can add auth group', '15', 'add_authgroup');
INSERT INTO `auth_permission` VALUES ('58', 'Can change auth group', '15', 'change_authgroup');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete auth group', '15', 'delete_authgroup');
INSERT INTO `auth_permission` VALUES ('60', 'Can view auth group', '15', 'view_authgroup');
INSERT INTO `auth_permission` VALUES ('61', 'Can add auth group permissions', '16', 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES ('62', 'Can change auth group permissions', '16', 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete auth group permissions', '16', 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES ('64', 'Can view auth group permissions', '16', 'view_authgrouppermissions');
INSERT INTO `auth_permission` VALUES ('65', 'Can add auth permission', '17', 'add_authpermission');
INSERT INTO `auth_permission` VALUES ('66', 'Can change auth permission', '17', 'change_authpermission');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete auth permission', '17', 'delete_authpermission');
INSERT INTO `auth_permission` VALUES ('68', 'Can view auth permission', '17', 'view_authpermission');
INSERT INTO `auth_permission` VALUES ('69', 'Can add auth user', '18', 'add_authuser');
INSERT INTO `auth_permission` VALUES ('70', 'Can change auth user', '18', 'change_authuser');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete auth user', '18', 'delete_authuser');
INSERT INTO `auth_permission` VALUES ('72', 'Can view auth user', '18', 'view_authuser');
INSERT INTO `auth_permission` VALUES ('73', 'Can add auth user groups', '19', 'add_authusergroups');
INSERT INTO `auth_permission` VALUES ('74', 'Can change auth user groups', '19', 'change_authusergroups');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete auth user groups', '19', 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES ('76', 'Can view auth user groups', '19', 'view_authusergroups');
INSERT INTO `auth_permission` VALUES ('77', 'Can add auth user user permissions', '20', 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES ('78', 'Can change auth user user permissions', '20', 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete auth user user permissions', '20', 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES ('80', 'Can view auth user user permissions', '20', 'view_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES ('81', 'Can add django admin log', '21', 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES ('82', 'Can change django admin log', '21', 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete django admin log', '21', 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES ('84', 'Can view django admin log', '21', 'view_djangoadminlog');
INSERT INTO `auth_permission` VALUES ('85', 'Can add django content type', '22', 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES ('86', 'Can change django content type', '22', 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete django content type', '22', 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES ('88', 'Can view django content type', '22', 'view_djangocontenttype');
INSERT INTO `auth_permission` VALUES ('89', 'Can add django migrations', '23', 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES ('90', 'Can change django migrations', '23', 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete django migrations', '23', 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES ('92', 'Can view django migrations', '23', 'view_djangomigrations');
INSERT INTO `auth_permission` VALUES ('93', 'Can add django session', '24', 'add_djangosession');
INSERT INTO `auth_permission` VALUES ('94', 'Can change django session', '24', 'change_djangosession');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete django session', '24', 'delete_djangosession');
INSERT INTO `auth_permission` VALUES ('96', 'Can view django session', '24', 'view_djangosession');
INSERT INTO `auth_permission` VALUES ('97', 'Can add sys history', '25', 'add_syshistory');
INSERT INTO `auth_permission` VALUES ('98', 'Can change sys history', '25', 'change_syshistory');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete sys history', '25', 'delete_syshistory');
INSERT INTO `auth_permission` VALUES ('100', 'Can view sys history', '25', 'view_syshistory');
INSERT INTO `auth_permission` VALUES ('101', 'Can add conversion', '26', 'add_conversion');
INSERT INTO `auth_permission` VALUES ('102', 'Can change conversion', '26', 'change_conversion');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete conversion', '26', 'delete_conversion');
INSERT INTO `auth_permission` VALUES ('104', 'Can view conversion', '26', 'view_conversion');
INSERT INTO `auth_permission` VALUES ('105', 'Can add sys image setting', '27', 'add_sysimagesetting');
INSERT INTO `auth_permission` VALUES ('106', 'Can change sys image setting', '27', 'change_sysimagesetting');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete sys image setting', '27', 'delete_sysimagesetting');
INSERT INTO `auth_permission` VALUES ('108', 'Can view sys image setting', '27', 'view_sysimagesetting');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `conversion`
-- ----------------------------
DROP TABLE IF EXISTS `conversion`;
CREATE TABLE `conversion` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `initial` varchar(255) DEFAULT NULL COMMENT '初始币种',
  `exchange_rate` float(32,2) DEFAULT NULL COMMENT '汇率',
  `target` varchar(255) DEFAULT NULL COMMENT '目标币种',
  `abbreviation` varchar(255) DEFAULT NULL COMMENT '缩写',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3329 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conversion
-- ----------------------------
INSERT INTO `conversion` VALUES ('3225', '1 人民币', '1.11', '港元', '(HKD)', '人民币兑换港元');
INSERT INTO `conversion` VALUES ('3226', '1 人民币', '1.15', '澳门元', '(MOP)', '人民币兑换澳门元');
INSERT INTO `conversion` VALUES ('3227', '1 人民币', '4.35', '台币', '(TWD)', '人民币兑换台币');
INSERT INTO `conversion` VALUES ('3228', '1 人民币', '0.13', '欧元', '(EUR)', '人民币兑换欧元');
INSERT INTO `conversion` VALUES ('3229', '1 人民币', '0.14', '美元', '(USD)', '人民币兑换美元');
INSERT INTO `conversion` VALUES ('3230', '1 人民币', '0.11', '英镑', '(GBP)', '人民币兑换英镑');
INSERT INTO `conversion` VALUES ('3231', '1 人民币', '0.21', '澳元', '(AUD)', '人民币兑换澳元');
INSERT INTO `conversion` VALUES ('3232', '1 人民币', '166.58', '韩元', '(KRW)', '人民币兑换韩元');
INSERT INTO `conversion` VALUES ('3233', '1 人民币', '15.65', '日元', '(JPY)', '人民币兑换日元');
INSERT INTO `conversion` VALUES ('3234', '1 人民币', '1.00', '离岸人民币', '(CNH)', '人民币兑换离岸人民币');
INSERT INTO `conversion` VALUES ('3235', '1 人民币', '0.19', '加拿大元', '(CAD)', '人民币兑换加拿大元');
INSERT INTO `conversion` VALUES ('3236', '1 人民币', '9.09', '俄罗斯卢布', '(RUB)', '人民币兑换俄罗斯卢布');
INSERT INTO `conversion` VALUES ('3237', '1 人民币', '4.29', '泰国铢', '(THB)', '人民币兑换泰国铢');
INSERT INTO `conversion` VALUES ('3238', '1 人民币', '7.25', '菲律宾比索', '(PHP)', '人民币兑换菲律宾比索');
INSERT INTO `conversion` VALUES ('3239', '1 人民币', '15.75', '阿尔巴尼亚列克', '(ALL)', '人民币兑换阿尔巴尼亚列克');
INSERT INTO `conversion` VALUES ('3240', '1 人民币', '8.48', '阿根廷比索', '(ARS)', '人民币兑换阿根廷比索');
INSERT INTO `conversion` VALUES ('3241', '1 人民币', '0.25', '阿鲁巴岛弗罗林', '(AWG)', '人民币兑换阿鲁巴岛弗罗林');
INSERT INTO `conversion` VALUES ('3242', '1 人民币', '0.55', '阿联酋迪拉姆', '(AED)', '人民币兑换阿联酋迪拉姆');
INSERT INTO `conversion` VALUES ('3243', '1 人民币', '0.25', '列斯荷兰盾', '(ANG)', '人民币兑换列斯荷兰盾');
INSERT INTO `conversion` VALUES ('3244', '1 人民币', '0.24', '阿塞拜疆新马纳特', '(AZN)', '人民币兑换阿塞拜疆新马纳特');
INSERT INTO `conversion` VALUES ('3245', '1 人民币', '65.65', '安哥拉宽扎', '(AOA)', '人民币兑换安哥拉宽扎');
INSERT INTO `conversion` VALUES ('3246', '1 人民币', '0.14', '巴哈马元', '(BSD)', '人民币兑换巴哈马元');
INSERT INTO `conversion` VALUES ('3247', '1 人民币', '0.05', '巴林第纳尔', '(BHD)', '人民币兑换巴林第纳尔');
INSERT INTO `conversion` VALUES ('3248', '1 人民币', '0.28', '巴巴多斯元', '(BBD)', '人民币兑换巴巴多斯元');
INSERT INTO `conversion` VALUES ('3249', '1 人民币', '3029.48', '白俄罗斯卢', '(BYR)', '人民币兑换白俄罗斯卢');
INSERT INTO `conversion` VALUES ('3250', '1 人民币', '0.29', '伯利兹元', '(BZD)', '人民币兑换伯利兹元');
INSERT INTO `conversion` VALUES ('3251', '1 人民币', '0.14', '百慕大元', '(BMD)', '人民币兑换百慕大元');
INSERT INTO `conversion` VALUES ('3252', '1 人民币', '10.22', '不丹卢比', '(BTN)', '人民币兑换不丹卢比');
INSERT INTO `conversion` VALUES ('3253', '1 人民币', '0.98', '玻利维亚诺', '(BOB)', '人民币兑换玻利维亚诺');
INSERT INTO `conversion` VALUES ('3254', '1 人民币', '1.55', '博茨瓦纳普拉', '(BWP)', '人民币兑换博茨瓦纳普拉');
INSERT INTO `conversion` VALUES ('3255', '1 人民币', '0.60', '巴西里亚伊', '(BRL)', '人民币兑换巴西里亚伊');
INSERT INTO `conversion` VALUES ('3256', '1 人民币', '0.25', '保加利亚列瓦', '(BGN)', '人民币兑换保加利亚列瓦');
INSERT INTO `conversion` VALUES ('3257', '1 人民币', '266.98', '布隆迪法郎', '(BIF)', '人民币兑换布隆迪法郎');
INSERT INTO `conversion` VALUES ('3258', '1 人民币', '12.04', '孟加拉塔卡', '(BDT)', '人民币兑换孟加拉塔卡');
INSERT INTO `conversion` VALUES ('3259', '1 人民币', '0.19', '文莱元', '(BND)', '人民币兑换文莱元');
INSERT INTO `conversion` VALUES ('3260', '1 人民币', '14.16', '佛得角埃斯库多', '(CVE)', '人民币兑换佛得角埃斯库多');
INSERT INTO `conversion` VALUES ('3261', '1 人民币', '486.85', '哥伦比亚比索', '(COP)', '人民币兑换哥伦比亚比索');
INSERT INTO `conversion` VALUES ('3262', '1 人民币', '81.69', '哥斯达黎加科朗', '(CRC)', '人民币兑换哥斯达黎加科朗');
INSERT INTO `conversion` VALUES ('3263', '1 人民币', '3.77', '古巴比索', '(CUP)', '人民币兑换古巴比索');
INSERT INTO `conversion` VALUES ('3264', '1 人民币', '3.30', '捷克克朗', '(CZK)', '人民币兑换捷克克朗');
INSERT INTO `conversion` VALUES ('3265', '1 人民币', '0.14', '瑞士法郎', '(CHF)', '人民币兑换瑞士法郎');
INSERT INTO `conversion` VALUES ('3266', '1 人民币', '0.00', '塞浦路斯镑', '(CYP)', '人民币兑换塞浦路斯镑');
INSERT INTO `conversion` VALUES ('3267', '1 人民币', '101.19', '智利比索', '(CLP)', '人民币兑换智利比索');
INSERT INTO `conversion` VALUES ('3268', '1 人民币', '16.89', '阿尔及利亚第纳尔', '(DZD)', '人民币兑换阿尔及利亚第纳尔');
INSERT INTO `conversion` VALUES ('3269', '1 人民币', '0.95', '丹麦克朗', '(DKK)', '人民币兑换丹麦克朗');
INSERT INTO `conversion` VALUES ('3270', '1 人民币', '7.50', '多米尼加比索', '(DOP)', '人民币兑换多米尼加比索');
INSERT INTO `conversion` VALUES ('3271', '1 人民币', '25.28', '吉布提法郎', '(DJF)', '人民币兑换吉布提法郎');
INSERT INTO `conversion` VALUES ('3272', '1 人民币', '2.29', '埃及镑', '(EGP)', '人民币兑换埃及镑');
INSERT INTO `conversion` VALUES ('3273', '1 人民币', '4.23', '埃塞俄比亚比尔', '(ETB)', '人民币兑换埃塞俄比亚比尔');
INSERT INTO `conversion` VALUES ('3274', '1 人民币', '3783.06', '厄瓜多尔苏克雷', '(ECS)', '人民币兑换厄瓜多尔苏克雷');
INSERT INTO `conversion` VALUES ('3275', '1 人民币', '2.13', '厄立特里亚', '(ERN)', '人民币兑换厄立特里亚');
INSERT INTO `conversion` VALUES ('3276', '1 人民币', '0.11', '福克兰群岛镑', '(FKP)', '人民币兑换福克兰群岛镑');
INSERT INTO `conversion` VALUES ('3277', '1 人民币', '0.31', '斐济元', '(FJD)', '人民币兑换斐济元');
INSERT INTO `conversion` VALUES ('3278', '1 人民币', '7.29', '冈比亚达拉西', '(GMD)', '人民币兑换冈比亚达拉西');
INSERT INTO `conversion` VALUES ('3279', '1 人民币', '29.66', '圭亚那元', '(GYD)', '人民币兑换圭亚那元');
INSERT INTO `conversion` VALUES ('3280', '1 人民币', '0.79', '加纳塞地', '(GHS)', '人民币兑换加纳塞地');
INSERT INTO `conversion` VALUES ('3281', '1 人民币', '1352.51', '几内亚法郎', '(GNF)', '人民币兑换几内亚法郎');
INSERT INTO `conversion` VALUES ('3282', '1 人民币', '1.09', '危地马拉格查尔', '(GTQ)', '人民币兑换危地马拉格查尔');
INSERT INTO `conversion` VALUES ('3283', '1 人民币', '0.11', '直布罗陀镑', '(GIP)', '人民币兑换直布罗陀镑');
INSERT INTO `conversion` VALUES ('3284', '1 人民币', '13.82', '海地古德', '(HTG)', '人民币兑换海地古德');
INSERT INTO `conversion` VALUES ('3285', '1 人民币', '3.50', '洪都拉斯伦皮拉', '(HNL)', '人民币兑换洪都拉斯伦皮拉');
INSERT INTO `conversion` VALUES ('3286', '1 人民币', '0.95', '克罗地亚库纳', '(HRK)', '人民币兑换克罗地亚库纳');
INSERT INTO `conversion` VALUES ('3287', '1 人民币', '42.44', '匈牙利福林', '(HUF)', '人民币兑换匈牙利福林');
INSERT INTO `conversion` VALUES ('3288', '1 人民币', '17.59', '冰岛克朗', '(ISK)', '人民币兑换冰岛克朗');
INSERT INTO `conversion` VALUES ('3289', '1 人民币', '10.22', '印度卢比', '(INR)', '人民币兑换印度卢比');
INSERT INTO `conversion` VALUES ('3290', '1 人民币', '2004.01', '印度尼西亚卢比盾', '(IDR)', '人民币兑换印度尼西亚卢比盾');
INSERT INTO `conversion` VALUES ('3291', '1 人民币', '6004.23', '伊朗里亚尔', '(IRR)', '人民币兑换伊朗里亚尔');
INSERT INTO `conversion` VALUES ('3292', '1 人民币', '167.25', '伊拉克第纳尔', '(IQD)', '人民币兑换伊拉克第纳尔');
INSERT INTO `conversion` VALUES ('3293', '1 人民币', '0.49', '以色列镑', '(ILS)', '人民币兑换以色列镑');
INSERT INTO `conversion` VALUES ('3294', '1 人民币', '19.12', '牙买加元', '(JMD)', '人民币兑换牙买加元');
INSERT INTO `conversion` VALUES ('3295', '1 人民币', '0.10', '约旦第纳尔', '(JOD)', '人民币兑换约旦第纳尔');
INSERT INTO `conversion` VALUES ('3296', '1 人民币', '128.00', '朝鲜圆', '(KPW)', '人民币兑换朝鲜圆');
INSERT INTO `conversion` VALUES ('3297', '1 人民币', '55.07', '哈萨克斯坦腾格', '(KZT)', '人民币兑换哈萨克斯坦腾格');
INSERT INTO `conversion` VALUES ('3298', '1 人民币', '569.48', '柬埔寨利尔斯', '(KHR)', '人民币兑换柬埔寨利尔斯');
INSERT INTO `conversion` VALUES ('3299', '1 人民币', '0.12', '开曼岛元', '(KYD)', '人民币兑换开曼岛元');
INSERT INTO `conversion` VALUES ('3300', '1 人民币', '63.19', '科摩罗法郎', '(KMF)', '人民币兑换科摩罗法郎');
INSERT INTO `conversion` VALUES ('3301', '1 人民币', '14.60', '肯尼亚先令', '(KES)', '人民币兑换肯尼亚先令');
INSERT INTO `conversion` VALUES ('3302', '1 人民币', '0.04', '科威特第纳尔', '(KWD)', '人民币兑换科威特第纳尔');
INSERT INTO `conversion` VALUES ('3303', '1 人民币', '1237.62', '老挝基普', '(LAK)', '人民币兑换老挝基普');
INSERT INTO `conversion` VALUES ('3304', '1 人民币', '0.09', '拉脱维亚拉图', '(LVL)', '人民币兑换拉脱维亚拉图');
INSERT INTO `conversion` VALUES ('3305', '1 人民币', '218.15', '黎巴嫩镑', '(LBP)', '人民币兑换黎巴嫩镑');
INSERT INTO `conversion` VALUES ('3306', '1 人民币', '2.14', '莱索托洛提', '(LSL)', '人民币兑换莱索托洛提');
INSERT INTO `conversion` VALUES ('3307', '1 人民币', '18.00', '利比里亚元', '(LRD)', '人民币兑换利比里亚元');
INSERT INTO `conversion` VALUES ('3308', '1 人民币', '0.21', '利比亚第纳尔', '(LYD)', '人民币兑换利比亚第纳尔');
INSERT INTO `conversion` VALUES ('3309', '1 人民币', '0.46', '立陶宛里塔斯', '(LTL)', '人民币兑换立陶宛里塔斯');
INSERT INTO `conversion` VALUES ('3310', '1 人民币', '25.94', '斯里兰卡卢比', '(LKR)', '人民币兑换斯里兰卡卢比');
INSERT INTO `conversion` VALUES ('3311', '1 人民币', '7.98', '马其顿第纳尔', '(MKD)', '人民币兑换马其顿第纳尔');
INSERT INTO `conversion` VALUES ('3312', '1 人民币', '108.37', '马拉维克瓦查', '(MWK)', '人民币兑换马拉维克瓦查');
INSERT INTO `conversion` VALUES ('3313', '1 人民币', '0.59', '马来西亚林吉特', '(MYR)', '人民币兑换马来西亚林吉特');
INSERT INTO `conversion` VALUES ('3314', '1 人民币', '2.36', '马尔代夫卢非亚', '(MVR)', '人民币兑换马尔代夫卢非亚');
INSERT INTO `conversion` VALUES ('3315', '1 人民币', '53.16', '毛里塔尼亚乌吉亚', '(MRO)', '人民币兑换毛里塔尼亚乌吉亚');
INSERT INTO `conversion` VALUES ('3316', '1 人民币', '5.17', '毛里求斯卢比', '(MUR)', '人民币兑换毛里求斯卢比');
INSERT INTO `conversion` VALUES ('3317', '1 人民币', '2.94', '墨西哥比索', '(MXN)', '人民币兑换墨西哥比索');
INSERT INTO `conversion` VALUES ('3318', '1 人民币', '2.62', '摩尔多瓦列伊', '(MDL)', '人民币兑换摩尔多瓦列伊');
INSERT INTO `conversion` VALUES ('3319', '1 人民币', '370.13', '蒙古图格里克', '(MNT)', '人民币兑换蒙古图格里克');
INSERT INTO `conversion` VALUES ('3320', '1 人民币', '1.36', '摩洛哥道拉姆', '(MAD)', '人民币兑换摩洛哥道拉姆');
INSERT INTO `conversion` VALUES ('3321', '1 人民币', '214.73', '缅甸元', '(MMK)', '人民币兑换缅甸元');
INSERT INTO `conversion` VALUES ('3322', '1 人民币', '475.91', '马达加斯加阿里亚里', '(MGA)', '人民币兑换马达加斯加阿里亚里');
INSERT INTO `conversion` VALUES ('3323', '1 人民币', '2.13', '纳米比亚元', '(NAD)', '人民币兑换纳米比亚元');
INSERT INTO `conversion` VALUES ('3324', '1 人民币', '15.95', '尼泊尔卢比', '(NPR)', '人民币兑换尼泊尔卢比');
INSERT INTO `conversion` VALUES ('3325', '1 人民币', '4.62', '尼加拉瓜科多巴', '(NIO)', '人民币兑换尼加拉瓜科多巴');
INSERT INTO `conversion` VALUES ('3326', '1 人民币', '53.42', '尼日利亚奈拉', '(NGN)', '人民币兑换尼日利亚奈拉');
INSERT INTO `conversion` VALUES ('3327', '1 人民币', '1.28', '挪威克朗', '(NOK)', '人民币兑换挪威克朗');
INSERT INTO `conversion` VALUES ('3328', '1 人民币', '0.22', '新西兰元', '(NZD)', '人民币兑换新西兰元');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('15', 'app', 'authgroup');
INSERT INTO `django_content_type` VALUES ('16', 'app', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES ('17', 'app', 'authpermission');
INSERT INTO `django_content_type` VALUES ('18', 'app', 'authuser');
INSERT INTO `django_content_type` VALUES ('19', 'app', 'authusergroups');
INSERT INTO `django_content_type` VALUES ('20', 'app', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES ('26', 'app', 'conversion');
INSERT INTO `django_content_type` VALUES ('21', 'app', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES ('22', 'app', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES ('23', 'app', 'djangomigrations');
INSERT INTO `django_content_type` VALUES ('24', 'app', 'djangosession');
INSERT INTO `django_content_type` VALUES ('25', 'app', 'syshistory');
INSERT INTO `django_content_type` VALUES ('27', 'app', 'sysimagesetting');
INSERT INTO `django_content_type` VALUES ('7', 'app', 'syslog');
INSERT INTO `django_content_type` VALUES ('8', 'app', 'sysmenu');
INSERT INTO `django_content_type` VALUES ('9', 'app', 'sysorg');
INSERT INTO `django_content_type` VALUES ('10', 'app', 'sysrole');
INSERT INTO `django_content_type` VALUES ('11', 'app', 'sysrolemenu');
INSERT INTO `django_content_type` VALUES ('12', 'app', 'sysuser');
INSERT INTO `django_content_type` VALUES ('13', 'app', 'sysuserorg');
INSERT INTO `django_content_type` VALUES ('14', 'app', 'sysuserrole');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-01-10 10:26:03.254654');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2020-01-10 10:26:04.775741');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2020-01-10 10:26:10.862089');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2020-01-10 10:26:12.638191');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2020-01-10 10:26:12.678193');
INSERT INTO `django_migrations` VALUES ('6', 'app', '0001_initial', '2020-01-10 10:26:12.733196');
INSERT INTO `django_migrations` VALUES ('7', 'contenttypes', '0002_remove_content_type_name', '2020-01-10 10:26:13.890262');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0002_alter_permission_name_max_length', '2020-01-10 10:26:15.008326');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0003_alter_user_email_max_length', '2020-01-10 10:26:15.853375');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0004_alter_user_username_opts', '2020-01-10 10:26:15.910378');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0005_alter_user_last_login_null', '2020-01-10 10:26:16.822430');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0006_require_contenttypes_0002', '2020-01-10 10:26:16.880433');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0007_alter_validators_add_error_messages', '2020-01-10 10:26:16.938437');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0008_alter_user_username_max_length', '2020-01-10 10:26:17.971496');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0009_alter_user_last_name_max_length', '2020-01-10 10:26:18.666535');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0010_alter_group_name_max_length', '2020-01-10 10:26:19.469581');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0011_update_proxy_permissions', '2020-01-10 10:26:19.522584');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2020-01-10 10:26:19.785599');
INSERT INTO `django_migrations` VALUES ('19', 'app', '0002_sysimagesetting', '2020-08-11 14:53:08.808847');
INSERT INTO `django_migrations` VALUES ('20', 'auth', '0012_alter_user_first_name_max_length', '2020-10-12 11:17:21.308011');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1jez6oh5scej83xet8dk7c5yhk64uvgp', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-17 17:59:02.319155');
INSERT INTO `django_session` VALUES ('4245h939twlqy83fr7jk2rrmfq7gxvpe', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-10 12:52:43.472203');
INSERT INTO `django_session` VALUES ('4cbgdbovg8lupzxkj1j1iwb924l7e8sc', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-17 16:54:13.639735');
INSERT INTO `django_session` VALUES ('4t7kqelh8ckpkhcfxpg5754qff1eiq0h', '.eJyrVkpMTlayUkpMyc3MU9JRKgWyY0rNk9OSgGRqShqQTEo0BJImBmYxpaYmphZARTmpZak5EIWYkpnF8Tn56UDDrEqKSlN1lOKLU4uLM_Pz4lMrCjKLKpWszAxqAXGXJXk:1kRomi:SMtfEu9ixVc-AWL7nYPw35gc-tznI7YaiDIxZHjIGYs', '2020-10-12 11:47:04.436841');
INSERT INTO `django_session` VALUES ('4xoskusnv4ovvvcs9p34ge27zkipvz2w', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-08 12:15:34.969239');
INSERT INTO `django_session` VALUES ('8flzq44ji6zal6eabzskk5yvltmn9mux', 'MzQ0Y2ZhYjA0ODJhOTE2MmNlMDhkOGZhNGNlMGM4Mjc4NDg4NDkwNDp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NjB9', '2020-08-11 15:28:26.962567');
INSERT INTO `django_session` VALUES ('a8fp9toruh3heq19lvubs3g3a4a1fg45', 'OWNhYzg1NWU1OWJkYjhjZmE3NTZjN2MwYWRkNTM2MzA5ODkxMjU5Yjp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NX0=', '2020-08-11 14:56:43.945866');
INSERT INTO `django_session` VALUES ('al9gbvywh5wqmdmnuxx7x5whsurksc11', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-11 12:40:01.070310');
INSERT INTO `django_session` VALUES ('amavvqhcljc82y3akxio7xdpz68efw44', '.eJyrVkpMTlayUkpMyc3MU9JRKgWyY0rNk9OSgGRqShqQTEo0BJImBmYxpaYmphZARTmpZak5EIWYkpnF8Tn56UDDrEqKSlN1lOKLU4uLM_Pz4lMrCjKLKpWsjM0MDGoBvIgl3A:1kniDy:EG3ZDuZnqxUwmhRosasnxPdywrI9GGMlsWD2p9UW-nI', '2020-12-11 22:12:42.521605');
INSERT INTO `django_session` VALUES ('bpe5rl8x8vqlfyruty7rlibfqxdvuyj7', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-04-30 16:33:21.742263');
INSERT INTO `django_session` VALUES ('buk4imlx38dpq9grgardhm6zxuvbptn7', 'OWNhYzg1NWU1OWJkYjhjZmE3NTZjN2MwYWRkNTM2MzA5ODkxMjU5Yjp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NX0=', '2020-08-11 15:20:30.770476');
INSERT INTO `django_session` VALUES ('cbvc7yls7ghqfg9vfjp8hnwoybiwe10x', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-05-12 17:55:43.791682');
INSERT INTO `django_session` VALUES ('e0gofr8798rmyua8fkjoz1c0msqdzjgj', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-09 11:12:34.794872');
INSERT INTO `django_session` VALUES ('eged4vmrxmhvf5wuq4dsn78h0dvn8uh4', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-06-17 11:53:26.078783');
INSERT INTO `django_session` VALUES ('g7o3dyo15b0k7j5upv6qhafmxxdiunte', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-05-12 12:32:03.177886');
INSERT INTO `django_session` VALUES ('gim70n7ifgeitsbou5zbyp6vx7pnt79r', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-05-12 16:40:35.748836');
INSERT INTO `django_session` VALUES ('gkwjer3n2t6ptogb0af1uqeuzgmdf4yb', 'OWNhYzg1NWU1OWJkYjhjZmE3NTZjN2MwYWRkNTM2MzA5ODkxMjU5Yjp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NX0=', '2020-08-11 15:20:53.902799');
INSERT INTO `django_session` VALUES ('gsir3529zz4r68thhf2nmyvxf0coflxd', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-11 10:28:09.801022');
INSERT INTO `django_session` VALUES ('iicrrmzvjlitxxyq1otu0wbvclk254z6', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-05-09 15:00:09.026044');
INSERT INTO `django_session` VALUES ('k6dnich3ukh60nujpt9ecukvmo7ibjtr', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-09 13:17:30.630609');
INSERT INTO `django_session` VALUES ('kmfu4vkgn4109yl285nasb6bzkvtgfpk', 'OWNhYzg1NWU1OWJkYjhjZmE3NTZjN2MwYWRkNTM2MzA5ODkxMjU5Yjp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NX0=', '2020-08-11 15:18:27.190408');
INSERT INTO `django_session` VALUES ('odq5kze8l9jlrn9r8d8bnmacexj0cz12', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-10 17:56:47.144681');
INSERT INTO `django_session` VALUES ('onyw0vzrybkr7lzv44lpol8oyr5avnqu', 'OWNhYzg1NWU1OWJkYjhjZmE3NTZjN2MwYWRkNTM2MzA5ODkxMjU5Yjp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NX0=', '2020-08-11 10:55:50.295074');
INSERT INTO `django_session` VALUES ('pcidvn2mq228qhzln7on6pxyk4coi1gu', '.eJyrVkpMTlayUkpMyc3MU9JRKgWyY0rNk9OSgGRqShqQTEo0BJImBmYxpaYmphZARTmpZak5EIWYkpnF8Tn56UDDrEqKSlN1lOKLU4uLM_Pz4lMrCjKLKpWszAxqAXGXJXk:1l6pnh:B-DBnpwgTjIeyqOmsXa3VRU5isF3rPepj_CeI_jWgZw', '2021-02-02 15:09:37.571964');
INSERT INTO `django_session` VALUES ('pcl1jni5cy9tu9fmwsn76wul9pq2t6zu', 'e30:1kRpoR:F6D_wfE0jFTRJ8O4qt3G_QkckQ_7esAMj0i98M9Ixr0', '2020-10-26 12:51:55.549401');
INSERT INTO `django_session` VALUES ('q42uysl72tpj5ia9w1dosgoqmymt1b6p', 'ZGMzZjgyNzBlZjk4ZTFmMTBhY2RjMjliNGIwODJlOTA0OTdkNmQ0NTp7fQ==', '2020-08-07 16:31:13.287166');
INSERT INTO `django_session` VALUES ('qk4o88tcxf7hali2ojla2fygnx2w08la', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-11 12:23:52.216291');
INSERT INTO `django_session` VALUES ('r3moaekwbf9tuqjvzbvo7e8x9paq78ml', 'e30:1kRpwn:FP7y0Kk8Bn0FC9C-sNEawNH2JedadfAlJ1G0KblkKeQ', '2020-10-26 13:00:33.836043');
INSERT INTO `django_session` VALUES ('rvocws5e3hz9ewtuwgje189uahaj8k7e', 'OWNhYzg1NWU1OWJkYjhjZmE3NTZjN2MwYWRkNTM2MzA5ODkxMjU5Yjp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NX0=', '2020-08-11 15:14:22.113390');
INSERT INTO `django_session` VALUES ('wewkwsqx8u8fysgh4n7ui7nb7h4ka0je', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-11 10:59:36.888931');
INSERT INTO `django_session` VALUES ('x9qly25h3ha5n4lv85tj83gftl3dc8ho', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-10 18:51:42.830183');
INSERT INTO `django_session` VALUES ('xq6ps8zm6so2bxr0rlwroyzvcak27ivg', 'ZTg4ODc0ZGZkNmVhN2ViOWU3MzA5Mzc1M2ZjYzQzYjMzYzYyMDQyODp7ImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjM2MDB9', '2020-07-10 12:00:41.148616');
INSERT INTO `django_session` VALUES ('xxj1cc8agtlko8nkkkjrnd4z8kwrw8lj', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-09 13:04:48.857038');
INSERT INTO `django_session` VALUES ('ydwps1kg99v44l3ra7elxd4365u5o3i2', 'OWNhYzg1NWU1OWJkYjhjZmE3NTZjN2MwYWRkNTM2MzA5ODkxMjU5Yjp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NX0=', '2020-08-11 15:07:33.441015');
INSERT INTO `django_session` VALUES ('yfi51ij9xrixh490og14tt348mcr5lyj', 'OWNhYzg1NWU1OWJkYjhjZmE3NTZjN2MwYWRkNTM2MzA5ODkxMjU5Yjp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NX0=', '2020-08-11 10:57:06.198594');
INSERT INTO `django_session` VALUES ('zi2zx3cr35nwyr02gid003k8rnepd2r0', 'NmMyYjA0Y2FlODZkMmMyOGY3NWNhOWFlNjk1ZDY2OWI4OWI0MjA0ODp7ImFjYyI6ImFkbWluIiwidSI6Ilx1N2NmYlx1N2VkZlx1N2JhMVx1NzQwNlx1NTQ1OCIsImxldmVsIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6MzYwMH0=', '2020-07-10 19:12:16.623752');

-- ----------------------------
-- Table structure for `sys_history`
-- ----------------------------
DROP TABLE IF EXISTS `sys_history`;
CREATE TABLE `sys_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` varchar(255) DEFAULT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `memory` varchar(255) DEFAULT NULL,
  `network` varchar(255) DEFAULT NULL,
  `disk_detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_history
-- ----------------------------
INSERT INTO `sys_history` VALUES ('509', '1612249696000', '17.0,20.4,19.6,16.4,14.5,12.2,18.6', '8529371136,4757200896,3772170240,9871548416,8229748736', '98085888,392970988,250604,387265,0,0', '163070,198226,4660583936,7074091520,1010,89');
INSERT INTO `sys_history` VALUES ('510', '1612249702000', '13.6,12.8,18.4,13.4,8.7,13.2,15.1', '8529371136,4742758400,3786612736,9871548416,8152526848', '98089084,392972510,250622,387277,0,0', '163084,198316,4660826112,7079550464,1010,89');
INSERT INTO `sys_history` VALUES ('511', '1612249707000', '9.4,8.3,12.2,6.2,5.9,13.1,10.9', '8529371136,4722921472,3806449664,9871548416,8114638848', '98091754,392973106,250641,387286,0,0', '163090,198414,4660924416,7080730112,1010,89');
INSERT INTO `sys_history` VALUES ('512', '1612249712000', '6.5,5.2,6.6,4.7,6.6,6.9,9.1', '8529371136,4721848320,3807522816,9871548416,8113684480', '98094866,392973956,250662,387299,0,0', '163104,198549,4661055488,7082160128,1010,89');
INSERT INTO `sys_history` VALUES ('513', '1612249717000', '6.3,8.6,6.6,4.4,6.0,5.6,6.6', '8529371136,4723204096,3806167040,9871548416,8115306496', '98137323,392981494,250728,387332,0,0', '163106,198601,4661088256,7083166720,1010,89');

-- ----------------------------
-- Table structure for `sys_image_setting`
-- ----------------------------
DROP TABLE IF EXISTS `sys_image_setting`;
CREATE TABLE `sys_image_setting` (
  `edition` int(1) NOT NULL COMMENT '0为临时目录，1为图片存放目录',
  `path` varchar(126) NOT NULL COMMENT '图片存放路径(必须以''/''结尾)',
  `temp_path` varchar(126) DEFAULT NULL,
  `cjcs` int(1) DEFAULT NULL COMMENT '图片采集次数',
  `jgsj` int(1) DEFAULT NULL COMMENT '采集多张照片时，每两张照片的间隔时间(edition为0时无效)',
  `dqsj` int(1) DEFAULT NULL COMMENT '登录读取人脸数据时间',
  `sfqy` int(1) DEFAULT NULL,
  PRIMARY KEY (`edition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_image_setting
-- ----------------------------
INSERT INTO `sys_image_setting` VALUES ('1', 'F:\\py_object\\Monitor\\face\\', 'F:\\py_object\\Monitor\\temp\\', '3', '3', '3', '1');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(32) NOT NULL,
  `accout` varchar(32) DEFAULT NULL COMMENT '操作账号',
  `name` varchar(32) DEFAULT NULL COMMENT '操作人姓名',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `time` varchar(32) DEFAULT NULL COMMENT '时间',
  `content` varchar(128) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('017c78788ab311eaa8d13c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-30 15:20:01', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('01f9473a335511ea9b8c3c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 10:57:18', '系统管理员创建角色：《123》');
INSERT INTO `sys_log` VALUES ('0384186836a811ea8deb3c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 16:29:35', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('05264e8235ad11ea87c93c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-13 10:33:02', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('064e8be6337e11eab2be3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:51:35', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('076bb574335b11ea9c033c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:39:13', '系统管理员更新角色菜单：《123》');
INSERT INTO `sys_log` VALUES ('07a9c0f8337c11ea82393c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:37:18', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('07f3bc4a337711eabd4b3c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-10 14:55:44', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('0a57dc24375b11eab4553c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-15 13:51:02', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('0b30b5ac35d911ea92c03c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 15:48:10', '系统管理员创建菜单：《系统安全》');
INSERT INTO `sys_log` VALUES ('0c02524acd8711eaa6463c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-24 16:24:09', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('0c26fcf6dba311ea8f433c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 15:19:51', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('0c8a0bf8338011eab5273c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 16:06:04', '系统管理员查看角色：《普通用户》');
INSERT INTO `sys_log` VALUES ('0eb183e2335c11eaad0f3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:48:04', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('0f0f6d88337e11ea8b723c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:51:49', '系统管理员查看角色：《临时用户》');
INSERT INTO `sys_log` VALUES ('134c63ca337e11ea9bb53c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:51:57', '系统管理员查看角色：《普通用户》');
INSERT INTO `sys_log` VALUES ('13557168337c11ea876a3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:37:38', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('1717faf6c31a11eaa6833c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-11 09:59:01', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('1725516e336f11eaa20f3c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-10 14:04:32', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('17c9858ac32811ea8e363c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-11 11:39:15', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('18fd41cc93ff11ea8df73c970ed7519c', 'admin', '系统管理员', 'insert', '2020-05-12 11:17:23', '系统管理员新增部门：《11》');
INSERT INTO `sys_log` VALUES ('1999ee743baf11ebb5a82cf05d231dfa', 'admin', '系统管理员', 'login', '2020-12-11 20:47:59', '系统管理员使用人脸识别登录系统');
INSERT INTO `sys_log` VALUES ('19f31ce4337c11eab2ea3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:37:49', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('1a08029e35db11ea953c3c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 16:02:53', '系统管理员创建菜单：《个人小工具》');
INSERT INTO `sys_log` VALUES ('1b049dd24be011ea816b3c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-10 16:33:48', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('1b30591c335e11ea82cd3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 12:03:06', '系统管理员更新角色菜单：《临时用户》');
INSERT INTO `sys_log` VALUES ('1c2ee474337c11ea99523c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:37:53', '系统管理员修改角色：《管理员》');
INSERT INTO `sys_log` VALUES ('1cb7bbd891ba11ea9e983c970ed7519c', 'admin', '系统管理员', 'update', '2020-05-09 13:58:31', '系统管理员编辑菜单：《其他功能》');
INSERT INTO `sys_log` VALUES ('1e7b58ba35d911eaa6103c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 15:48:42', '系统管理员创建菜单：《端口扫描》');
INSERT INTO `sys_log` VALUES ('1eb46048337c11eabdbe3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:37:57', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('1f801746369411ea85e03c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 14:07:12', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('2210196c675511ea95a73c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-16 15:07:18', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('2214c528335a11eaabe33c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:34:26', '系统管理员更新角色菜单：《123》');
INSERT INTO `sys_log` VALUES ('2319bc5891ba11ea85b23c970ed7519c', 'admin', '系统管理员', 'update', '2020-05-09 13:58:42', '系统管理员编辑菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('232f1706c18a11eaa30f3c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-09 10:16:02', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('245ed4f4db7e11eaa0d03c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 10:55:41', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('26148b0859c711eab4893c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-28 09:07:45', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('263c270c942e11ea95b03c970ed7519c', 'admin', '系统管理员', 'login', '2020-05-12 16:54:11', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('265056a8c28b11ea81ec3c970ed7519c', 'admin', '系统管理员', 'update', '2020-07-10 16:55:48', '系统管理员更新角色用户：《普通用户》');
INSERT INTO `sys_log` VALUES ('268e5a90337d11ea9d3d3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:45:19', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('27f18ed2335a11eaa7783c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:34:26', '系统管理员更新角色菜单：《123》');
INSERT INTO `sys_log` VALUES ('2869e29e368111eabe1a3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-14 11:51:34', '系统管理员查看用户：《adm》');
INSERT INTO `sys_log` VALUES ('286baa000c3d11eb95722cf05d231dfa', 'admin', '系统管理员', 'login', '2020-10-12 11:43:57', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('28873738337411ea8be03c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-10 14:39:39', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('2984055c337c11eaa8e93c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:38:15', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('2a8d1e243bb011eba6cc2cf05d231dfa', 'admin', '系统管理员', 'select', '2020-12-11 20:55:37', '系统管理员查看用户：《adm》');
INSERT INTO `sys_log` VALUES ('2ab9dec2681b11eabd9e3c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-17 14:47:27', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('2c040a54dba311ea80023c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 15:20:45', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('2c0ceeb83bb011ebb8ca2cf05d231dfa', 'admin', '系统管理员', 'select', '2020-12-11 20:55:40', '系统管理员查看用户：《wanga》');
INSERT INTO `sys_log` VALUES ('2d5f29ca337011ea9d323c970ed7519c', 'admin', '系统管理员', 'insert', '2020-01-10 14:12:27', '系统管理员新增部门：《aa》');
INSERT INTO `sys_log` VALUES ('2e20a2d2337d11ea995b3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:45:32', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('2e611e5c335b11eab3403c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:39:13', '系统管理员更新角色菜单：《123》');
INSERT INTO `sys_log` VALUES ('2f0b3e6235d911ea980d3c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 15:49:10', '系统管理员创建菜单：《局域网IP扫描》');
INSERT INTO `sys_log` VALUES ('2f5bbed2337711eaa19f3c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 15:02:37', '系统管理员删除角色：《普通用户》');
INSERT INTO `sys_log` VALUES ('2fd7e80a337311eaa7753c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 14:34:00', '系统管理员删除菜单：《asd》');
INSERT INTO `sys_log` VALUES ('31a6972cc0c111eab9633c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-08 10:17:38', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('31e61cb8337711ea81803c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 15:02:41', '系统管理员删除角色：《临时用户》');
INSERT INTO `sys_log` VALUES ('323d72cc942e11eaa9743c970ed7519c', 'admin', '系统管理员', 'insert', '2020-05-12 16:54:32', '系统管理员新增部门：《aa》');
INSERT INTO `sys_log` VALUES ('32eb3ba2515e11ea8d2c3c970ed7519c', 'admin', '系统管理员', 'select', '2020-02-17 16:19:21', '系统管理员查看用户：《系统管理员》');
INSERT INTO `sys_log` VALUES ('331186a835db11eab5393c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 16:03:35', '系统管理员创建菜单：《汇率爬取》');
INSERT INTO `sys_log` VALUES ('332181cc337e11ea959f3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:52:50', '系统管理员查看角色：《普通用户》');
INSERT INTO `sys_log` VALUES ('34b01180334e11ea97313c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 10:05:46', '系统管理员查看用户：《123》');
INSERT INTO `sys_log` VALUES ('34f55eaa0c3d11eb8ad22cf05d231dfa', 'aaaa', 'adm', 'login', '2020-10-12 11:44:18', 'adm使用人脸识别登录系统');
INSERT INTO `sys_log` VALUES ('3501cba84f1211ea96bf3c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-14 18:10:11', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('359abdb6cd8411eabe7f3c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-24 16:03:50', '系统管理员使用人脸识别登录系统');
INSERT INTO `sys_log` VALUES ('35db4a64335b11eaa21d3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:39:13', '系统管理员更新角色菜单：《123》');
INSERT INTO `sys_log` VALUES ('378ef9ca854511eab9343c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-23 17:31:31', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('37c1b038335211ea91a33c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 10:37:42', '系统管理员创建菜单：《测试菜单》');
INSERT INTO `sys_log` VALUES ('37fe7fda335511ea95283c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 10:59:20', '系统管理员删除角色：《123》');
INSERT INTO `sys_log` VALUES ('39071d78337311eaa2b03c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 14:34:15', '系统管理员删除菜单：《aa》');
INSERT INTO `sys_log` VALUES ('392c629c36a811eaa4773c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 16:30:59', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('3a707e82337e11ea9c943c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:53:02', '系统管理员查看菜单：《其他功能》');
INSERT INTO `sys_log` VALUES ('3aa884fe337711eaa6133c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 15:02:56', '系统管理员创建角色：《普通用户》');
INSERT INTO `sys_log` VALUES ('3b5cbecc335211ea9ff93c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 10:37:42', '系统管理员查看菜单：《测试菜单》');
INSERT INTO `sys_log` VALUES ('3c0dc69c337c11eab1033c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:38:46', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('3cae264a337011eaab2a3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 14:12:53', '系统管理员编辑部门：《技术部》');
INSERT INTO `sys_log` VALUES ('3cfc9086337d11eaa9623c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:45:57', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('3d1fd4ba35db11eaabfc3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-13 16:03:52', '系统管理员更新角色菜单：《管理员》');
INSERT INTO `sys_log` VALUES ('3d2ebda235e911ea907f3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-13 17:44:05', '系统管理员查看菜单：《访问情况》');
INSERT INTO `sys_log` VALUES ('3dbdd04c335c11ea9d943c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:48:04', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('3e17f836c19a11ea9ee73c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-09 12:11:19', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('3e3bcd9e335211eaa19b3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 10:37:42', '系统管理员编辑菜单：《测试菜单1111》');
INSERT INTO `sys_log` VALUES ('3e5b6810337611ea83e73c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 14:55:53', '系统管理员更新角色菜单：《临时用户》');
INSERT INTO `sys_log` VALUES ('3e7077ac337c11ea93323c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:38:50', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('3f53f30b0c3d11eba0982cf05d231dfa', 'admin', '系统管理员', 'login', '2020-10-12 11:44:35', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('3fa13c6ec19911ea90a63c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-09 12:04:13', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('4102e74a335211ea9a203c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 10:37:42', '系统管理员删除菜单：《测试菜单1111》');
INSERT INTO `sys_log` VALUES ('4128327635d911ea891d3c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 15:49:40', '系统管理员创建菜单：《数据库监控》');
INSERT INTO `sys_log` VALUES ('4147ee66cd8511ea97913c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-24 16:11:19', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('434b5124337e11ea9ecb3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:53:17', '系统管理员查看角色：《普通用户》');
INSERT INTO `sys_log` VALUES ('437bf3ac335511ea9bb73c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 10:59:20', '系统管理员创建角色：《123》');
INSERT INTO `sys_log` VALUES ('4424fa52c19a11ea8b233c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-09 12:11:30', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('44f87192337d11ea92073c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:46:10', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('450f4214338011ea93d23c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 16:07:39', '系统管理员编辑部门：《技术部11》');
INSERT INTO `sys_log` VALUES ('47c55112676311eaaa263c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-16 16:51:09', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('48e6ac1c335211eaa5e43c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 10:37:42', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('49eec9ac940011eaa7e03c970ed7519c', 'admin', '系统管理员', 'insert', '2020-05-12 11:25:54', '系统管理员新增部门：《11》');
INSERT INTO `sys_log` VALUES ('4a86d9d4dba311ea9f4b3c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 15:21:36', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('4d56718638cc11eaabf53c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-17 09:54:09', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('4e7293c8337d11eab0a33c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:46:26', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('5130105c337d11eaa9da3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:46:31', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('51927750940011ea88643c970ed7519c', 'admin', '系统管理员', 'insert', '2020-05-12 11:26:07', '系统管理员新增部门：《123》');
INSERT INTO `sys_log` VALUES ('51f33ad0337111eab37f3c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 14:20:38', '系统管理员删除角色：《123》');
INSERT INTO `sys_log` VALUES ('51f99182db7e11eabf053c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 10:56:57', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('523fd4ee521d11ea9f6e3c970ed7519c', 'admin', '系统管理员', 'select', '2020-02-18 15:07:27', '系统管理员查看用户：《系统管理员》');
INSERT INTO `sys_log` VALUES ('55e3d536335b11ea9c053c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:39:13', '系统管理员更新角色菜单：《123》');
INSERT INTO `sys_log` VALUES ('574a93804be011ea87ca3c970ed7519c', 'admin', '系统管理员', 'select', '2020-02-10 16:35:49', '系统管理员查看用户：《系统管理员》');
INSERT INTO `sys_log` VALUES ('57ac669ccd8411ea89bd3c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-24 16:04:47', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('5b3d3cb8592311ea87c53c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-27 13:37:59', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('5c0cc93a334e11ea863d3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 10:05:46', '系统管理员查看用户：《www》');
INSERT INTO `sys_log` VALUES ('5d6d6206338111eabbea3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 16:15:29', '系统管理员编辑部门：《软件部》');
INSERT INTO `sys_log` VALUES ('5dc9ad1e337c11eaa3c63c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:39:43', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('5e07d5644be011eabc3d3c970ed7519c', 'admin', '系统管理员', 'select', '2020-02-10 16:36:01', '系统管理员查看用户：《wanga》');
INSERT INTO `sys_log` VALUES ('5e12e5ca337d11ea87eb3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:46:53', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('5f7610c68ab411ea887d3c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-30 15:29:48', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('5ffcde30367111ea97fc3c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 09:48:51', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('60a6efca854711ea82ad3c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-23 17:46:59', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('60c651b436a711eab7893c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 16:17:34', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('619430d4337c11eaaed63c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:39:49', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('6400792893ff11eabf0c3c970ed7519c', 'admin', '系统管理员', 'insert', '2020-05-12 11:19:29', '系统管理员新增部门：《qweq》');
INSERT INTO `sys_log` VALUES ('6550b8fa36a411ea85593c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-14 16:03:49', '系统管理员删除用户：《KuGou.exe》');
INSERT INTO `sys_log` VALUES ('66dc796e337711ea91563c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 15:04:10', '系统管理员创建角色：《临时用户》');
INSERT INTO `sys_log` VALUES ('672963da652511ebbf262cf05d231dfa', 'admin', '系统管理员', 'login', '2021-02-02 15:08:08', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('686d316c337711eaa6223c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:04:13', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('688a0e62337011eaa22b3c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 14:14:07', '系统管理员创建菜单：《asda》');
INSERT INTO `sys_log` VALUES ('691a9b76335c11ea88293c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:50:48', '系统管理员更新角色用户：《123》');
INSERT INTO `sys_log` VALUES ('6b8c310c337d11ea936b3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:47:15', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('6c1e655435db11ea9c4c3c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-13 15:41:01', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('6ca3d9e8337f11eab2373c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-10 16:01:25', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('6dfab22e367a11ea90a13c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 10:52:39', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('6e7d40d8337711eabbfc3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:04:23', '系统管理员修改角色：《管理员》');
INSERT INTO `sys_log` VALUES ('6e9b8828335c11ea8e833c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:50:48', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('708795664e2211ea8e4b3c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-13 13:21:53', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('71d00076337011ea806c3c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 14:14:22', '系统管理员创建菜单：《ads》');
INSERT INTO `sys_log` VALUES ('731bbe18368211ea86f83c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 11:40:19', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('743db826854711ea833f3c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-23 17:47:32', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('74770e86337011eaadab3c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 14:14:27', '系统管理员删除菜单：《asda》');
INSERT INTO `sys_log` VALUES ('75a8b05e5db811eaa5633c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-04 09:34:45', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('77531ad4335c11eaa6963c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:50:48', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('7762a50a335d11ea86c83c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:58:31', '系统管理员更新角色用户：《123》');
INSERT INTO `sys_log` VALUES ('77ffb60236a411eab9b33c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-14 16:04:20', '系统管理员删除用户：《KuGou.exe》');
INSERT INTO `sys_log` VALUES ('795aa26ec31511ea8e9d3c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-11 09:25:58', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('7b4ffdf4338011ea949d3c970ed7519c', 'admin', '系统管理员', 'insert', '2020-01-10 16:09:10', '系统管理员新增部门：《asda》');
INSERT INTO `sys_log` VALUES ('7cec6b7a335d11ea8eb73c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:58:40', '系统管理员更新角色用户：《123》');
INSERT INTO `sys_log` VALUES ('7d25cfdc338111eab7473c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 16:16:23', '系统管理员查看角色：《临时用户》');
INSERT INTO `sys_log` VALUES ('7da33022c29511eaa18c3c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-10 18:09:50', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('805aa926335511ea90ea3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:01:23', '系统管理员更新角色菜单：《管理员》');
INSERT INTO `sys_log` VALUES ('80a96bacdba111eaa0e53c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 15:08:48', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('81d930b4334a11ea8ea63c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 09:28:27', '系统管理员查看用户：《系统管理员》');
INSERT INTO `sys_log` VALUES ('81dd8af636a811eaa8283c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 16:33:03', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('82bd0a68338011ea9ab03c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 16:09:23', '系统管理员编辑部门：《asda》');
INSERT INTO `sys_log` VALUES ('8599d70cc32511ea91c33c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-11 11:20:51', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('85d97d62337811eab8fb3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:12:12', '系统管理员查看用户：《系统管理员》');
INSERT INTO `sys_log` VALUES ('85f80880675c11eaa1e63c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-16 16:02:24', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('8666ebfe337911eab0603c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:19:22', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('86c11c40334811ea8a913c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 09:28:27', '系统管理员更新角色菜单：《管理员》');
INSERT INTO `sys_log` VALUES ('89506552335f11eaa2d23c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 12:13:20', '系统管理员编辑菜单：《HTML页面》');
INSERT INTO `sys_log` VALUES ('8a2fdcee338111ea88163c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 16:16:45', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('8b2a0e40335f11ea96553c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 12:13:23', '系统管理员查看菜单：《其他功能》');
INSERT INTO `sys_log` VALUES ('8c5dd940514d11ea9beb3c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-17 14:20:00', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('8dbaf5970c4211eb9eca2cf05d231dfa', 'admin', '系统管理员', 'login', '2020-10-12 12:22:35', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('8e46560a942311eabb9a3c970ed7519c', 'admin', '系统管理员', 'select', '2020-05-12 15:38:21', '系统管理员查看角色：《普通用户》');
INSERT INTO `sys_log` VALUES ('8e6a89ec59c711ea98093c970ed7519c', 'admin', '系统管理员', 'update', '2020-02-28 09:13:41', '系统管理员编辑菜单：《图标》');
INSERT INTO `sys_log` VALUES ('8e7f839c337811ea97993c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:12:26', '系统管理员修改用户：《系统管理员》');
INSERT INTO `sys_log` VALUES ('8ea5de54337c11eab4dc3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:41:05', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('8ef9fc6e335c11eab03c3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:50:48', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('90efd794338211ea94fd3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 16:24:05', '系统管理员查看角色：《普通用户》');
INSERT INTO `sys_log` VALUES ('9196b1485cfa11eab2233c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-03 10:55:57', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('921cafb4334811eaa4e33c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 09:28:27', '系统管理员查看用户：《系统管理员》');
INSERT INTO `sys_log` VALUES ('927b762835d711eaaecb3c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-13 15:37:25', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('92d6bf66337711ea84743c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:05:24', '系统管理员更新角色菜单：《普通用户》');
INSERT INTO `sys_log` VALUES ('932e9ebe676311ea84943c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-16 16:53:15', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('938c4c984e2111eabb643c970ed7519c', 'admin', '系统管理员', 'select', '2020-02-13 13:27:50', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('94121e6c334811ea90ba3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 09:28:27', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('957cfb3835d811eaba4a3c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 15:44:52', '系统管理员创建菜单：《硬件信息》');
INSERT INTO `sys_log` VALUES ('95b1fd9c337711ea80b53c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:05:29', '系统管理员更新角色菜单：《管理员》');
INSERT INTO `sys_log` VALUES ('967cef02335f11eaae123c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 12:13:42', '系统管理员查看用户：《adm》');
INSERT INTO `sys_log` VALUES ('96df02dc337311eabf873c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 14:36:53', '系统管理员删除菜单：《aa》');
INSERT INTO `sys_log` VALUES ('98ed8658337d11eab2e83c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:48:31', '系统管理员查看菜单：《其他功能》');
INSERT INTO `sys_log` VALUES ('9913abda337711ea98423c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:05:35', '系统管理员更新角色菜单：《管理员》');
INSERT INTO `sys_log` VALUES ('99a5a754337311eaa2e63c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-10 14:36:58', '系统管理员删除菜单：《asd》');
INSERT INTO `sys_log` VALUES ('9d867d46335f11ea88a03c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 12:13:54', '系统管理员查看用户：《wang》');
INSERT INTO `sys_log` VALUES ('9da4cee835d811eaaa093c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-13 15:45:06', '系统管理员编辑菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('9f3659d4337d11ea9c8d3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:48:42', '系统管理员查看菜单：《其他功能》');
INSERT INTO `sys_log` VALUES ('9fb821480c4211eb94ac2cf05d231dfa', 'aaaa', 'adm', 'login', '2020-10-12 12:23:05', 'adm使用人脸识别登录系统');
INSERT INTO `sys_log` VALUES ('9fde9c18337311ea95923c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 14:37:08', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('a012d702335f11eab3a83c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 12:13:58', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('a28e345e520d11ea83003c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-18 13:14:59', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('a29e8d68335a11eab1e13c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-10 11:38:06', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('a31f44dc335d11eaaa7f3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:59:44', '系统管理员更新角色菜单：《123》');
INSERT INTO `sys_log` VALUES ('a36203a4337311eab0af3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 14:37:14', '系统管理员查看菜单：《其他功能》');
INSERT INTO `sys_log` VALUES ('a3d9cbfe35d811ea97603c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-13 15:45:16', '系统管理员编辑菜单：《其他功能》');
INSERT INTO `sys_log` VALUES ('a4cdbd5e366f11ea88a53c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 09:45:49', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('a4ec92a70c4611eba3642cf05d231dfa', 'admin', '系统管理员', 'login', '2020-10-12 12:51:51', '系统管理员使用人脸识别登录系统');
INSERT INTO `sys_log` VALUES ('a54459b08ab411ea82a83c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-30 15:31:45', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('a7dfa24cdba311ea8b693c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 15:24:13', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('a823bb58c80211ea88a43c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-17 15:53:52', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('a824ea3636a511eab9d43c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-14 16:12:50', '系统管理员删除用户：《KuGou.exe》');
INSERT INTO `sys_log` VALUES ('a86a1c22337811ea8ff63c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:13:10', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('a90cf1e8335f11eaa8623c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 12:14:13', '系统管理员查看角色：《普通用户》');
INSERT INTO `sys_log` VALUES ('aa5af38a335a11eaac103c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:38:06', '系统管理员更新角色菜单：《管理员》');
INSERT INTO `sys_log` VALUES ('aa5c5cc635e811eabfdb3c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-13 17:39:52', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('ad2442c2b04511eab52e3c970ed7519c', 'admin', '系统管理员', 'login', '2020-06-17 10:53:09', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('ad4665ae335f11ea9ada3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 12:14:21', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('ad8b0d1c337811eab5213c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:13:18', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('aff8a05ec80b11eaabeb3c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-17 16:58:31', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('b102db0c337211eabcfa3c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 14:30:27', '系统管理员创建菜单：《asd》');
INSERT INTO `sys_log` VALUES ('b3d1216e337811eaaf5d3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:13:29', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('b5cfffc6337911eaa1003c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:20:42', '系统管理员更新角色用户：《管理员》');
INSERT INTO `sys_log` VALUES ('b5dedbcd0c4211eb9e532cf05d231dfa', 'admin', '系统管理员', 'login', '2020-10-12 12:23:42', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('b726a1f6db9f11eaaf0f3c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 14:56:00', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('b8afd850337811ea92f13c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:13:37', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('b90077f6337c11eaab7f3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:42:16', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('b9166324337211eaba813c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 14:30:41', '系统管理员创建菜单：《aa》');
INSERT INTO `sys_log` VALUES ('b9578266cd8411eaa8403c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-24 16:07:31', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('b980b436dba211eabe0e3c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 15:17:33', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('ba09b136cd8611eab9563c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-24 16:21:51', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('ba304014335f11ea9a1e3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 12:14:42', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('bb044764854711eaa6a53c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-23 17:49:31', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('bd564050337811ea9ebb3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:13:45', '系统管理员查看角色：《管理员》');
INSERT INTO `sys_log` VALUES ('be803d3435d811ea95f33c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 15:46:01', '系统管理员创建菜单：《访问情况》');
INSERT INTO `sys_log` VALUES ('bfafa1c0337211eaa1ac3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 14:30:52', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('c2a7b8f0dba011eaa2553c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 15:03:29', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('c313691293f411ea9dfe3c970ed7519c', 'admin', '系统管理员', 'login', '2020-05-12 10:03:24', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('c33961524e1d11ea9e313c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-13 13:00:22', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('c3d7ed1a4ec511eaaaf13c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-14 09:02:47', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('c6505b36337811ea94223c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:14:00', '系统管理员更新角色用户：《管理员》');
INSERT INTO `sys_log` VALUES ('c6f4f114854711ea9b603c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-23 17:49:51', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('c85c0a82c26011ea9cf23c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-10 11:52:32', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('c89c0a2c36a711eaa5343c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 16:27:53', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('c8b18242335a11eabe793c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:39:13', '系统管理员更新角色菜单：《管理员》');
INSERT INTO `sys_log` VALUES ('c901c4eb0c3611eb805d2cf05d231dfa', 'admin', '系统管理员', 'login', '2020-10-12 10:58:20', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('c9f9862b3bac11eb8cbc2cf05d231dfa', 'admin', '系统管理员', 'login', '2020-12-11 20:31:27', '系统管理员使用人脸识别登录系统');
INSERT INTO `sys_log` VALUES ('cb8bbaee681e11ea9e183c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-17 15:13:26', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('cbb143c8db9f11eaac4e3c970ed7519c', 'admin', '系统管理员', 'login', '2020-08-11 14:56:35', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('cc2fa834675411eabe1d3c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-16 15:07:18', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('cc8c0f22337811ea91413c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 15:14:10', '系统管理员更新角色用户：《管理员》');
INSERT INTO `sys_log` VALUES ('ce120a52c29211eabbc23c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-10 17:50:36', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('ce8bf322334a11ea87e53c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 09:28:27', '系统管理员修改用户：《测试》');
INSERT INTO `sys_log` VALUES ('cf9c1eca73c211ea85953c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-01 10:45:13', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('d09b784cc18111eab29c3c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-09 09:16:28', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('d09e893a335c11ea9ed03c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:53:51', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('d106c40c942111ea9dab3c970ed7519c', 'admin', '系统管理员', 'login', '2020-05-12 15:25:54', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('d1c8df5e35e511ea86b83c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-13 17:19:28', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('d39106084e1c11eabc033c970ed7519c', 'admin', '系统管理员', 'login', '2020-02-13 12:53:42', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('d618d752334c11ea97b13c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-10 09:59:01', '系统管理员新增用户：《www》');
INSERT INTO `sys_log` VALUES ('d6b493cc35d811ea8eaf3c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 15:46:41', '系统管理员创建菜单：《系统进程》');
INSERT INTO `sys_log` VALUES ('d8e02610854711eaa4673c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-23 17:50:21', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('d9797946676111ea90793c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-16 16:40:43', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('da325fbf0c4711eb8d8f2cf05d231dfa', 'admin', '系统管理员', 'login', '2020-10-12 13:00:30', '系统管理员使用人脸识别登录系统');
INSERT INTO `sys_log` VALUES ('da756962337c11ea9fb93c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:43:12', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('dcb7c04a369411ea81c33c970ed7519c', 'admin', '系统管理员', 'delete', '2020-01-14 14:12:37', '系统管理员删除用户：《123》');
INSERT INTO `sys_log` VALUES ('de0e155091b911eab3693c970ed7519c', 'admin', '系统管理员', 'login', '2020-05-09 13:56:46', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('dec434d2334c11ea854b3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 09:59:01', '系统管理员修改用户：《www》');
INSERT INTO `sys_log` VALUES ('e2052a9835d811eabb723c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-13 15:47:00', '系统管理员编辑菜单：《访问情况》');
INSERT INTO `sys_log` VALUES ('e259a14a73c211eab6663c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-01 10:45:44', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('e27dc482c28911ea9a0d3c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-10 16:46:45', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('e3f2c962335c11eaab783c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:54:24', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('e48371ee854711eaad983c970ed7519c', 'admin', '系统管理员', 'login', '2020-04-23 17:50:41', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('e82eee1436a711ea89fd3c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-14 16:28:47', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('e874cd50c28911ea9bbe3c970ed7519c', 'admin', '系统管理员', 'select', '2020-07-10 16:46:55', '系统管理员查看菜单：《系统安全》');
INSERT INTO `sys_log` VALUES ('ea4b0668335c11eaa58c3c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:54:34', '系统管理员更新角色用户：《临时用户》');
INSERT INTO `sys_log` VALUES ('ed8684d0676111eaadc33c970ed7519c', 'admin', '系统管理员', 'login', '2020-03-16 16:40:43', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('ed9f517035ac11ea9eec3c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-13 10:32:12', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('ee3540e4cd8611ea83803c970ed7519c', 'admin', '系统管理员', 'update', '2020-07-24 16:23:19', '系统管理员编辑菜单：《采集设置》');
INSERT INTO `sys_log` VALUES ('f01f07b90c4211ebbe9d2cf05d231dfa', 'admin', '系统管理员', 'login', '2020-10-12 12:25:20', '系统管理员使用人脸识别登录系统');
INSERT INTO `sys_log` VALUES ('f25684770c3c11eb9ba92cf05d231dfa', 'admin', '系统管理员', 'login', '2020-10-12 11:42:26', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('f489f2e493ff11eabf8b3c970ed7519c', 'admin', '系统管理员', 'insert', '2020-05-12 11:23:31', '系统管理员新增部门：《ada》');
INSERT INTO `sys_log` VALUES ('f5652112334a11eaaf783c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 09:28:27', '系统管理员查看用户：《系统管理员》');
INSERT INTO `sys_log` VALUES ('f5af3f76cd8711eab3df3c970ed7519c', 'admin', '系统管理员', 'login', '2020-07-24 16:30:41', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('f5b595d835d811eab9583c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 15:47:33', '系统管理员创建菜单：《监控历史》');
INSERT INTO `sys_log` VALUES ('f8594b5835ac11ea8e1b3c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-13 10:32:40', '系统管理员查看用户：《系统管理员》');
INSERT INTO `sys_log` VALUES ('f920fa924e2111ea8bdb3c970ed7519c', 'admin', '系统管理员', 'update', '2020-02-13 13:30:40', '系统管理员编辑菜单：《HTML页面》');
INSERT INTO `sys_log` VALUES ('f97b78cc35da11ea89023c970ed7519c', 'admin', '系统管理员', 'create', '2020-01-13 16:01:59', '系统管理员创建菜单：《MySQL》');
INSERT INTO `sys_log` VALUES ('fadd52fa337611eaadf73c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-10 14:55:44', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('fc6d9b18942211ea947e3c970ed7519c', 'admin', '系统管理员', 'select', '2020-05-12 15:34:17', '系统管理员查看菜单：《访问情况》');
INSERT INTO `sys_log` VALUES ('fca9a2d235ac11eab1f93c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-13 10:32:47', '系统管理员查看菜单：《系统设置》');
INSERT INTO `sys_log` VALUES ('fdff2800335a11eab7f33c970ed7519c', 'admin', '系统管理员', 'update', '2020-01-10 11:39:13', '系统管理员更新角色菜单：《管理员》');
INSERT INTO `sys_log` VALUES ('fea5cf7e373211ea84e73c970ed7519c', 'admin', '系统管理员', 'login', '2020-01-15 09:04:18', '系统管理员登录系统');
INSERT INTO `sys_log` VALUES ('ff767506337c11eaa7413c970ed7519c', 'admin', '系统管理员', 'select', '2020-01-10 15:44:14', '系统管理员查看菜单：《系统设置》');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `order` int(32) DEFAULT NULL,
  `caption` varchar(32) DEFAULT NULL,
  `lcon` varchar(32) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `pid` int(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '11', '系统设置', 'layui-icon-fa-cog', '', '0', '系统设置');
INSERT INTO `sys_menu` VALUES ('2', '1', '角色管理', 'layui-icon-fa-eercast', 'role.html', '1', 'None');
INSERT INTO `sys_menu` VALUES ('3', '2', '菜单管理', 'layui-icon-fa-server', 'menu.html', '1', 'None');
INSERT INTO `sys_menu` VALUES ('4', '4', '部门管理', 'layui-icon-fa-gears', 'position.html', '1', 'None');
INSERT INTO `sys_menu` VALUES ('8', '3', '用户管理', 'layui-icon-fa-user', 'user.html', '1', 'None');
INSERT INTO `sys_menu` VALUES ('10', '6', '采集设置', 'layui-icon-fa-camera-retro', 'face_gather.html', '1', 'c');
INSERT INTO `sys_menu` VALUES ('12', '10', '其他功能', 'layui-icon-fa-briefcase', 'https://www.baidu.com', '0', '其他功能');
INSERT INTO `sys_menu` VALUES ('14', '5', '日志管理', 'layui-icon-fa-book', 'log.html', '1', '系统操作日志记录');
INSERT INTO `sys_menu` VALUES ('15', '2', '图标', 'fa-star-half-o', 'other1.html', '12', 'a');
INSERT INTO `sys_menu` VALUES ('16', '3', '硬件信息', 'layui-icon-fa-laptop', 'Hardware.html', '0', '硬件信息');
INSERT INTO `sys_menu` VALUES ('17', '2', '访问情况', 'layui-icon-fa-sliders', 'usage.html', '0', '访问情况');
INSERT INTO `sys_menu` VALUES ('18', '3', '系统进程', 'layui-icon-fa-server', 'process.html', '0', '系统进程');
INSERT INTO `sys_menu` VALUES ('19', '4', '监控历史', 'layui-icon-fa-pie-chart', 'history.html', '0', '监控历史');
INSERT INTO `sys_menu` VALUES ('20', '5', '系统安全', 'layui-icon-fa-shield', '', '0', '系统安全');
INSERT INTO `sys_menu` VALUES ('21', '1', '端口扫描', 'layui-icon-fa-first-order', 'security.html', '20', '端口扫描');
INSERT INTO `sys_menu` VALUES ('22', '2', '局域网IP扫描', 'layui-icon-fa-search', 'ip_scan.html', '20', '局域网IP扫描');
INSERT INTO `sys_menu` VALUES ('23', '6', '数据库监控', 'layui-icon-fa-database', '', '0', '数据库监控');
INSERT INTO `sys_menu` VALUES ('24', '1', 'MySQL', 'layui-icon-fa-calendar-o', 'mysql.html', '23', 'MySQL数据库监控');
INSERT INTO `sys_menu` VALUES ('25', '7', '个人小工具', 'layui-icon-fa-wrench', '', '0', '个人小工具');
INSERT INTO `sys_menu` VALUES ('26', '1', '汇率爬取', 'layui-icon-fa-download', 'reptile.html', '25', '汇率爬取');

-- ----------------------------
-- Table structure for `sys_org`
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` varchar(32) NOT NULL,
  `org_name` varchar(32) DEFAULT NULL,
  `org_code` varchar(128) DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('a253148a337611eaa3373c970ed7519c', '根目录', 'ROOT', '0', '根目录');
INSERT INTO `sys_org` VALUES ('a253148b337611ea8d653c970ed7519c', '软件部', 'RJB', 'a253148a337611eaa3373c970ed7519c', 'None');
INSERT INTO `sys_org` VALUES ('a253148c337611ea891b3c970ed7519c', '开发部', 'KFB', 'a253148b337611ea8d653c970ed7519c', null);
INSERT INTO `sys_org` VALUES ('a253148d337611ea8a7a3c970ed7519c', '开发1部', 'KF1B', 'a253148c337611ea891b3c970ed7519c', null);
INSERT INTO `sys_org` VALUES ('a2533b9a337611ea99853c970ed7519c', '测试部', 'CSB', 'a253148b337611ea8d653c970ed7519c', null);
INSERT INTO `sys_org` VALUES ('a2533b9b337611ea88e93c970ed7519c', '测试部1', 'CS1B', 'a2533b9a337611ea99853c970ed7519c', null);
INSERT INTO `sys_org` VALUES ('a2533b9c337611ea9e123c970ed7519c', '测试2部', 'CS2B', 'a2533b9a337611ea99853c970ed7519c', null);
INSERT INTO `sys_org` VALUES ('a2533b9d337611ea89f03c970ed7519c', '技术部', 'JSB', 'a253148a337611eaa3373c970ed7519c', null);
INSERT INTO `sys_org` VALUES ('a2533b9e337611ea90833c970ed7519c', '开发2部', 'KF2B', 'a253148d337611ea8a7a3c970ed7519c', null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL,
  `caption` varchar(32) DEFAULT NULL,
  `abbreviation` varchar(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('3a9bda9e337711ea9b6f3c970ed7519c', '普通用户', '普通用户', '普通用户');
INSERT INTO `sys_role` VALUES ('66cc73a2337711eabdbc3c970ed7519c', '临时用户', '临时用户', '临时用户');
INSERT INTO `sys_role` VALUES ('a2533b9f337611ea84c03c970ed7519c', '管理员', 'administrator', '系统管理员');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `role_name` varchar(32) DEFAULT NULL,
  `menu_id` int(32) DEFAULT NULL,
  `menu_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('3cd3132c35db11eaa6fb3c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '17', '访问情况');
INSERT INTO `sys_role_menu` VALUES ('3cdb028a35db11eaa5953c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '16', '硬件信息');
INSERT INTO `sys_role_menu` VALUES ('3ce16b4235db11eaa5373c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '18', '系统进程');
INSERT INTO `sys_role_menu` VALUES ('3cec40da35db11eaab183c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '19', '监控历史');
INSERT INTO `sys_role_menu` VALUES ('3cf7d9c635db11eab7023c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '20', '系统安全');
INSERT INTO `sys_role_menu` VALUES ('3d034ba235db11eaaded3c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '21', '端口扫描');
INSERT INTO `sys_role_menu` VALUES ('3d07917035db11ea99a03c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '22', '局域网IP扫描');
INSERT INTO `sys_role_menu` VALUES ('3d0c256235db11ea89523c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '23', '数据库监控');
INSERT INTO `sys_role_menu` VALUES ('3d112e8635db11ea8cc03c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '24', 'MySQL');
INSERT INTO `sys_role_menu` VALUES ('3d16d3e835db11eabf4a3c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '25', '个人小工具');
INSERT INTO `sys_role_menu` VALUES ('3d1b67dc35db11ea88543c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '26', '汇率爬取');
INSERT INTO `sys_role_menu` VALUES ('98c9f794337711ea9f073c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '1', '系统设置');
INSERT INTO `sys_role_menu` VALUES ('98da7292337711ea938e3c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '2', '角色管理');
INSERT INTO `sys_role_menu` VALUES ('98e0db4a337711ea8be23c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '3', '菜单管理');
INSERT INTO `sys_role_menu` VALUES ('98f1a468337711ea9c903c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '8', '用户管理');
INSERT INTO `sys_role_menu` VALUES ('98f7e612337711ea8f543c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '4', '部门管理');
INSERT INTO `sys_role_menu` VALUES ('9900bfd2337711ea90803c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '14', '日志管理');
INSERT INTO `sys_role_menu` VALUES ('99046962337711ea85b23c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '12', '其他功能');
INSERT INTO `sys_role_menu` VALUES ('99086110337711ea832b3c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '10', 'HTML页面');
INSERT INTO `sys_role_menu` VALUES ('990d1c12337711eaab143c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', '15', '图标');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `account` varchar(32) DEFAULT NULL,
  `tell` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `sfcj` int(1) unsigned zerofill NOT NULL COMMENT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('b1e99c02337711eab3543c970ed7519c', '系统管理员', '0192023a7bbd73250516f069df18b500', '123@qq.com', 'admin', '13256468596', '成都市成华区', '管理员', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c03337711ea9f373c970ed7519c', 'adm', '0192023a7bbd73250516f069df18b500', '123@qq.com', 'aaaa', '13256565656', '啊是大大啊是', '普通用户', '男', '1');
INSERT INTO `sys_user` VALUES ('b1e99c04337711eab8233c970ed7519c', 'wang', '0192023a7bbd73250516f069df18b500', '123@qq.com', 'wang', '13256565656', '阿达的撒大多撒', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c05337711eab6993c970ed7519c', 'wanga', '0192023a7bbd73250516f069df18b500', '123@qq.com', 'wanga', '13256565654', '啊是大大阿达', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c06337711ea9ecd3c970ed7519c', 'was', '0192023a7bbd73250516f069df18b500', '123@qq.com', 'was', '13256565654', '啊双打哒哒哒', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c07337711ea9ad93c970ed7519c', 'gf', '0192023a7bbd73250516f069df18b500', '123@qq.com', 'gf', '13256565656', '阿达啊大大', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c08337711eaa8e03c970ed7519c', '123', '0192023a7bbd73250516f069df18b500', '123@qq.com', '123', '13256565656', '啊大大大啊', '普通用户', '男', '1');
INSERT INTO `sys_user` VALUES ('b1e99c09337711eabfa63c970ed7519c', '123', '0192023a7bbd73250516f069df18b500', '123@qq.com', '123', '13256565656', '啊大大大啊', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c0a337711eaba783c970ed7519c', '123', '0192023a7bbd73250516f069df18b500', '123@qq.com', '123', '13256565656', '啊大大大啊', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c0c337711ea9b2e3c970ed7519c', '测试用户', '0192023a7bbd73250516f069df18b500', '123@qq.com', 'cs', '13256468596', '成都市123', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c0d337711eaa77e3c970ed7519c', '123', '0192023a7bbd73250516f069df18b500', '123@qq.com', '123', '13256565656', '啊大大大啊', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c0e337711ea9daf3c970ed7519c', '测试', '0192023a7bbd73250516f069df18b500', '123@qq.com', '测试1号', '13256565656', 'asdsadadadad', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c0f337711eab42c3c970ed7519c', 'ad', '0192023a7bbd73250516f069df18b500', '123@qq.com', '测试2号', '13232323232', 'asdadsadad', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('b1e99c10337711eaa9833c970ed7519c', 'asda', '0192023a7bbd73250516f069df18b500', '123@qq.com', 'asc', '13256565656', 'asdadadad', '普通用户', '男', '0');
INSERT INTO `sys_user` VALUES ('d603ef76334c11eab0e23c970ed7519c', 'www', '0192023a7bbd73250516f069df18b500', '123@qq.com', 'www', '13256565656', '是胜多负少的事实上', '普通用户', '男', '0');

-- ----------------------------
-- Table structure for `sys_user_org`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org` (
  `id` varchar(32) NOT NULL,
  `org_id` varchar(32) DEFAULT NULL,
  `org_name` varchar(64) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `user_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
INSERT INTO `sys_user_org` VALUES ('8e73275e337811ea8b983c970ed7519c', 'a253148b337611ea8d653c970ed7519c', '软件部', 'b1e99c02337711eab3543c970ed7519c', '系统管理员');
INSERT INTO `sys_user_org` VALUES ('8e796906337811eaacb53c970ed7519c', 'a2533b9d337611ea89f03c970ed7519c', '技术部', 'b1e99c02337711eab3543c970ed7519c', '系统管理员');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(32) NOT NULL,
  `rle_id` varchar(32) DEFAULT NULL,
  `rle_name` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('0613a4e8337e11eabb143c970ed7519c', '66cc73a2337711eabdbc3c970ed7519c', '临时用户', 'b1e99c02337711eab3543c970ed7519c', '系统管理员');
INSERT INTO `sys_user_role` VALUES ('26488e5cc28b11ea9b3e3c970ed7519c', '3a9bda9e337711ea9b6f3c970ed7519c', '普通用户', 'b1e99c04337711eab8233c970ed7519c', 'wang');
INSERT INTO `sys_user_role` VALUES ('cc7f64c2337811ea84833c970ed7519c', 'a2533b9f337611ea84c03c970ed7519c', '管理员', 'b1e99c02337711eab3543c970ed7519c', '系统管理员');
