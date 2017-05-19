/*
Navicat MySQL Data Transfer

Source Server         : zz
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : sy-yun

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-04-08 17:34:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xx_admin
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin`;
CREATE TABLE `xx_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_locked` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `m_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_admin
-- ----------------------------
INSERT INTO `xx_admin` VALUES ('1', '2014-03-04 00:03:36', '2015-06-29 21:43:10', '技术部', 'admin@shopxx.net', '', '\0', null, '2017-02-26 09:26:48', '0', '172.31.30.40', '管理员', '78649679a1b1c8c3a52bc08be61586eb', 'shengyuan2014', null);
INSERT INTO `xx_admin` VALUES ('2', '2014-03-04 00:03:36', '2015-06-29 21:43:10', '技术部', 'admin@shopxx.net', '', '\0', null, '2017-03-01 09:46:59', '0', '127.0.0.1', '管理员', '0192023a7bbd73250516f069df18b500', 'admin', null);
INSERT INTO `xx_admin` VALUES ('3', '2017-02-24 16:56:36', '2017-02-25 14:53:30', null, '123456@qq.com', '', '\0', null, '2017-02-25 14:54:11', '1', '172.31.30.40', '管理员', 'e10adc3949ba59abbe56e057f20f883e', 'admin1234', null);

-- ----------------------------
-- Table structure for xx_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin_role`;
CREATE TABLE `xx_admin_role` (
  `admins` bigint(20) NOT NULL,
  `roles` bigint(20) NOT NULL,
  PRIMARY KEY (`admins`,`roles`),
  KEY `FKD291D6053FF548F7` (`roles`),
  KEY `FKD291D605A022690F` (`admins`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_admin_role
-- ----------------------------
INSERT INTO `xx_admin_role` VALUES ('1', '1');
INSERT INTO `xx_admin_role` VALUES ('2', '1');
INSERT INTO `xx_admin_role` VALUES ('3', '1');

-- ----------------------------
-- Table structure for xx_menu
-- ----------------------------
DROP TABLE IF EXISTS `xx_menu`;
CREATE TABLE `xx_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `full_name` longtext NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `tree_path` varchar(255) NOT NULL,
  `menu_value` bigint(20) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9E1F1F3EFC0C969F` (`menu_value`),
  KEY `FK9E1F1F3EFE2357CD` (`parent`),
  CONSTRAINT `FK9E1F1F3EFC0C969F` FOREIGN KEY (`menu_value`) REFERENCES `xx_menu_value` (`id`),
  CONSTRAINT `FK9E1F1F3EFE2357CD` FOREIGN KEY (`parent`) REFERENCES `xx_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_menu
-- ----------------------------
INSERT INTO `xx_menu` VALUES ('1', '2017-02-09 15:52:17', '2017-02-09 15:52:19', '1', '会员', '0', '会员', ',', null, null);
INSERT INTO `xx_menu` VALUES ('2', '2014-07-17 10:34:55', '2014-07-21 19:56:19', '2', '会员管理', '1', '会员管理', ',1,', '1', '1');
INSERT INTO `xx_menu` VALUES ('3', '2017-02-24 16:41:24', '2017-02-24 16:55:31', '3', '标签管理商家', '2', '商家', ',3,239,', null, '239');
INSERT INTO `xx_menu` VALUES ('121', '2014-07-16 16:14:17', '2014-07-16 16:14:17', '4', '内容', '0', '内容', ',', null, null);
INSERT INTO `xx_menu` VALUES ('123', '2014-07-17 08:59:43', '2014-07-17 08:59:43', '2', '内容文章管理', '1', '文章管理', ',121,', '119', '121');
INSERT INTO `xx_menu` VALUES ('124', '2014-07-17 09:00:09', '2014-07-17 09:00:09', '3', '内容文章分类', '1', '文章分类', ',121,', '120', '121');
INSERT INTO `xx_menu` VALUES ('127', '2014-07-17 09:01:55', '2014-07-17 09:01:55', '6', '内容广告位', '1', '广告位', ',121,', '123', '121');
INSERT INTO `xx_menu` VALUES ('128', '2014-07-17 09:02:20', '2014-07-17 09:02:20', '7', '内容广告管理', '1', '广告管理', ',121,', '124', '121');
INSERT INTO `xx_menu` VALUES ('132', '2014-07-17 09:58:55', '2014-07-17 09:58:55', '1', '内容文章管理添加', '2', '添加', ',121,123,', '128', '123');
INSERT INTO `xx_menu` VALUES ('133', '2014-07-17 09:59:18', '2014-07-17 09:59:18', '2', '内容文章管理编辑', '2', '编辑', ',121,123,', '129', '123');
INSERT INTO `xx_menu` VALUES ('134', '2014-07-17 09:59:35', '2014-07-17 09:59:35', '3', '内容文章管理查看', '2', '查看', ',121,123,', '130', '123');
INSERT INTO `xx_menu` VALUES ('135', '2014-07-17 10:00:06', '2014-07-17 10:00:06', '4', '内容文章管理删除', '2', '删除', ',121,123,', '131', '123');
INSERT INTO `xx_menu` VALUES ('136', '2014-07-17 10:00:33', '2014-07-17 10:00:33', '5', '内容文章管理类型', '2', '类型', ',121,123,', '132', '123');
INSERT INTO `xx_menu` VALUES ('137', '2014-07-17 10:01:24', '2014-07-17 10:01:24', '1', '内容文章分类添加', '2', '添加', ',121,124,', '133', '124');
INSERT INTO `xx_menu` VALUES ('138', '2014-07-17 10:01:43', '2014-07-17 10:01:43', '2', '内容文章分类编辑', '2', '编辑', ',121,124,', '134', '124');
INSERT INTO `xx_menu` VALUES ('139', '2014-07-17 10:01:59', '2014-07-17 10:01:59', '3', '内容文章分类查看', '2', '查看', ',121,124,', '135', '124');
INSERT INTO `xx_menu` VALUES ('140', '2014-07-17 10:02:37', '2014-07-17 10:02:37', '4', '内容文章分类删除', '2', '删除', ',121,124,', '136', '124');
INSERT INTO `xx_menu` VALUES ('141', '2014-07-17 10:02:57', '2014-07-17 10:02:57', '5', '内容文章分类子类', '2', '子类', ',121,124,', '137', '124');
INSERT INTO `xx_menu` VALUES ('148', '2014-07-17 10:08:38', '2014-07-17 10:08:38', '1', '内容广告位添加', '2', '添加', ',121,127,', '144', '127');
INSERT INTO `xx_menu` VALUES ('149', '2014-07-17 10:08:54', '2014-07-17 10:08:54', '2', '内容广告位编辑', '2', '编辑', ',121,127,', '145', '127');
INSERT INTO `xx_menu` VALUES ('150', '2014-07-17 10:09:10', '2014-07-17 10:09:10', '3', '内容广告位删除', '2', '删除', ',121,127,', '146', '127');
INSERT INTO `xx_menu` VALUES ('151', '2014-07-17 10:10:00', '2014-07-17 10:10:00', '1', '内容广告管理添加', '2', '添加', ',121,128,', '147', '128');
INSERT INTO `xx_menu` VALUES ('152', '2014-07-17 10:10:17', '2014-07-17 10:10:17', '2', '内容广告管理编辑', '2', '编辑', ',121,128,', '148', '128');
INSERT INTO `xx_menu` VALUES ('153', '2014-07-17 10:10:33', '2014-07-17 10:10:33', '3', '内容广告管理删除', '2', '删除', ',121,128,', '149', '128');
INSERT INTO `xx_menu` VALUES ('180', '2014-07-17 10:34:55', '2014-07-21 19:56:19', '1', '系统', '0', '系统', ',', null, null);
INSERT INTO `xx_menu` VALUES ('187', '2014-07-17 11:58:41', '2014-07-17 15:42:25', '7', '系统管理员', '1', '管理员', ',180,', '179', '180');
INSERT INTO `xx_menu` VALUES ('188', '2014-07-17 11:59:03', '2014-07-17 11:59:03', '8', '系统角色管理', '1', '角色管理', ',180,', '180', '180');
INSERT INTO `xx_menu` VALUES ('196', '2014-07-17 12:03:54', '2014-07-21 19:57:44', '16', '系统权限管理', '1', '权限管理', ',180,', '188', '180');
INSERT INTO `xx_menu` VALUES ('217', '2014-07-17 15:41:24', '2014-07-17 15:42:39', '1', '系统管理员添加', '2', '添加', ',180,187,', '209', '187');
INSERT INTO `xx_menu` VALUES ('218', '2014-07-17 15:42:57', '2014-07-17 15:42:57', '2', '系统管理员编辑', '2', '编辑', ',180,187,', '210', '187');
INSERT INTO `xx_menu` VALUES ('219', '2014-07-17 15:43:13', '2014-07-17 15:43:13', '3', '系统管理员删除', '2', '删除', ',180,187,', '211', '187');
INSERT INTO `xx_menu` VALUES ('220', '2014-07-17 15:43:48', '2014-07-17 15:43:48', '1', '系统角色管理添加', '2', '添加', ',180,188,', '212', '188');
INSERT INTO `xx_menu` VALUES ('221', '2014-07-17 15:45:12', '2014-07-17 15:45:12', '2', '系统角色管理编辑', '2', '编辑', ',180,188,', '213', '188');
INSERT INTO `xx_menu` VALUES ('222', '2014-07-17 15:45:31', '2014-07-17 15:45:31', '3', '系统角色管理删除', '2', '删除', ',180,188,', '214', '188');
INSERT INTO `xx_menu` VALUES ('229', '2014-07-17 17:34:55', '2014-07-17 17:34:55', '1', '系统权限管理添加', '2', '添加', ',180,196,', '221', '196');
INSERT INTO `xx_menu` VALUES ('230', '2014-07-17 17:35:53', '2014-07-17 17:35:53', '2', '系统权限管理编辑', '2', '编辑', ',180,196,', '222', '196');
INSERT INTO `xx_menu` VALUES ('231', '2014-07-17 17:36:14', '2014-07-17 17:36:14', '3', '系统权限管理删除', '2', '删除', ',180,196,', '223', '196');
INSERT INTO `xx_menu` VALUES ('232', '2014-07-17 17:36:40', '2014-07-17 17:36:40', '4', '系统权限管理子类', '2', '子类', ',180,196,', '224', '196');
INSERT INTO `xx_menu` VALUES ('239', '2017-02-24 16:51:14', '2017-02-24 16:51:14', '5', '商家标签管理', '1', '标签管理', ',3,', '225', '3');

-- ----------------------------
-- Table structure for xx_menu_value
-- ----------------------------
DROP TABLE IF EXISTS `xx_menu_value`;
CREATE TABLE `xx_menu_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `v_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_menu_value
-- ----------------------------
INSERT INTO `xx_menu_value` VALUES ('1', '2017-02-09 15:54:11', '2017-02-09 15:54:13', null, 'admin:member');
INSERT INTO `xx_menu_value` VALUES ('119', '2014-07-17 08:59:43', '2014-07-17 08:59:43', null, 'admin:article');
INSERT INTO `xx_menu_value` VALUES ('120', '2014-07-17 09:00:09', '2014-07-17 09:00:09', null, 'admin:articleCategory');
INSERT INTO `xx_menu_value` VALUES ('123', '2014-07-17 09:01:55', '2014-07-17 09:01:55', null, 'admin:adPosition');
INSERT INTO `xx_menu_value` VALUES ('124', '2014-07-17 09:02:20', '2014-07-17 09:02:20', null, 'admin:ad');
INSERT INTO `xx_menu_value` VALUES ('128', '2014-07-17 09:58:55', '2014-07-17 09:58:55', null, 'article:add');
INSERT INTO `xx_menu_value` VALUES ('129', '2014-07-17 09:59:18', '2014-07-17 09:59:18', null, 'article:edit');
INSERT INTO `xx_menu_value` VALUES ('130', '2014-07-17 09:59:35', '2014-07-17 09:59:35', null, 'article:view');
INSERT INTO `xx_menu_value` VALUES ('131', '2014-07-17 10:00:06', '2014-07-17 10:00:06', null, 'article:delete');
INSERT INTO `xx_menu_value` VALUES ('132', '2014-07-17 10:00:33', '2014-07-17 10:00:33', null, 'article:select');
INSERT INTO `xx_menu_value` VALUES ('133', '2014-07-17 10:01:24', '2014-07-17 10:01:24', null, 'articleCategory:add');
INSERT INTO `xx_menu_value` VALUES ('134', '2014-07-17 10:01:43', '2014-07-17 10:01:43', null, 'articleCategory:edit');
INSERT INTO `xx_menu_value` VALUES ('135', '2014-07-17 10:01:59', '2014-07-17 10:01:59', null, 'articleCategory:view');
INSERT INTO `xx_menu_value` VALUES ('136', '2014-07-17 10:02:37', '2014-07-17 10:02:37', null, 'articleCategory:delete');
INSERT INTO `xx_menu_value` VALUES ('137', '2014-07-17 10:02:57', '2014-07-17 10:02:57', null, 'articleCategory:category');
INSERT INTO `xx_menu_value` VALUES ('144', '2014-07-17 10:08:38', '2014-07-17 10:08:38', null, 'adPosition:add');
INSERT INTO `xx_menu_value` VALUES ('145', '2014-07-17 10:08:54', '2014-07-17 10:08:54', null, 'adPosition:edit');
INSERT INTO `xx_menu_value` VALUES ('146', '2014-07-17 10:09:10', '2014-07-17 10:09:10', null, 'adPosition:delete');
INSERT INTO `xx_menu_value` VALUES ('147', '2014-07-17 10:10:00', '2014-07-17 10:10:00', null, 'ad:add');
INSERT INTO `xx_menu_value` VALUES ('148', '2014-07-17 10:10:17', '2014-07-17 10:10:17', null, 'ad:edit');
INSERT INTO `xx_menu_value` VALUES ('149', '2014-07-17 10:10:33', '2014-07-17 10:10:33', null, 'ad:delete');
INSERT INTO `xx_menu_value` VALUES ('179', '2014-07-17 11:58:41', '2014-07-17 15:42:25', null, 'system:admin');
INSERT INTO `xx_menu_value` VALUES ('180', '2014-07-17 11:59:03', '2014-07-17 11:59:03', null, 'system:role');
INSERT INTO `xx_menu_value` VALUES ('188', '2014-07-17 12:03:54', '2014-07-17 12:03:54', null, 'system:authority');
INSERT INTO `xx_menu_value` VALUES ('209', '2014-07-17 15:41:24', '2014-07-17 15:42:39', null, 'administrator:add');
INSERT INTO `xx_menu_value` VALUES ('210', '2014-07-17 15:42:57', '2014-07-17 15:42:57', null, 'administrator:edit');
INSERT INTO `xx_menu_value` VALUES ('211', '2014-07-17 15:43:13', '2014-07-17 15:43:13', null, 'administrator:delete');
INSERT INTO `xx_menu_value` VALUES ('212', '2014-07-17 15:43:48', '2014-07-17 15:43:48', null, 'role:add');
INSERT INTO `xx_menu_value` VALUES ('213', '2014-07-17 15:45:12', '2014-07-17 15:45:12', null, 'role:edit');
INSERT INTO `xx_menu_value` VALUES ('214', '2014-07-17 15:45:31', '2014-07-17 15:45:31', null, 'role:delete');
INSERT INTO `xx_menu_value` VALUES ('221', '2014-07-17 17:34:55', '2014-07-17 17:34:55', null, 'authority:add');
INSERT INTO `xx_menu_value` VALUES ('222', '2014-07-17 17:35:53', '2014-07-17 17:35:53', null, 'authority:edit');
INSERT INTO `xx_menu_value` VALUES ('223', '2014-07-17 17:36:14', '2014-07-17 17:36:14', null, 'authority:delete');
INSERT INTO `xx_menu_value` VALUES ('224', '2014-07-17 17:36:40', '2014-07-17 17:36:40', null, 'authority:category');
INSERT INTO `xx_menu_value` VALUES ('225', '2017-02-24 16:26:53', '2017-02-24 16:26:53', null, 'admin:tag');
INSERT INTO `xx_menu_value` VALUES ('226', '2017-02-24 16:48:58', '2017-02-24 16:48:58', null, 'admin:tag');
INSERT INTO `xx_menu_value` VALUES ('227', '2017-02-24 16:55:31', '2017-02-24 16:55:31', null, '标签');

-- ----------------------------
-- Table structure for xx_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `xx_operate_log`;
CREATE TABLE `xx_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` longtext,
  `ip` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `operator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for xx_role
-- ----------------------------
DROP TABLE IF EXISTS `xx_role`;
CREATE TABLE `xx_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_system` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_role
-- ----------------------------
INSERT INTO `xx_role` VALUES ('1', '2014-03-04 00:02:44', '2014-03-04 00:02:44', '拥有管理后台最高权限', '', '超级管理员', null);

-- ----------------------------
-- Table structure for xx_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `xx_role_authority`;
CREATE TABLE `xx_role_authority` (
  `role` bigint(20) NOT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  KEY `FKE06165D939B03AB0` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_role_authority
-- ----------------------------
INSERT INTO `xx_role_authority` VALUES ('1', 'member:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'member:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'member:view');
INSERT INTO `xx_role_authority` VALUES ('1', 'member:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'member:setpwd');
INSERT INTO `xx_role_authority` VALUES ('1', 'memberMessage:send');
INSERT INTO `xx_role_authority` VALUES ('1', 'memberMessage:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'memberMessage:view');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:member');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:merchant');
INSERT INTO `xx_role_authority` VALUES ('1', 'merchant:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'merchant:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'merchant:filter');
INSERT INTO `xx_role_authority` VALUES ('1', 'merchant:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:category');
INSERT INTO `xx_role_authority` VALUES ('1', 'category:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'category:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'category:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'category:children');
INSERT INTO `xx_role_authority` VALUES ('1', 'merchant:order');
INSERT INTO `xx_role_authority` VALUES ('1', 'merchant:dynamic');
INSERT INTO `xx_role_authority` VALUES ('1', 'memberMessage:view');
INSERT INTO `xx_role_authority` VALUES ('1', 'memberMessage:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:brand');
INSERT INTO `xx_role_authority` VALUES ('1', 'brand:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'brand:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'brand:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'brand:merchantView');
INSERT INTO `xx_role_authority` VALUES ('1', 'normalOrder:view');
INSERT INTO `xx_role_authority` VALUES ('1', 'dynamicMsg:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'dynamicMsg:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'dynamicMsg:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:message');
INSERT INTO `xx_role_authority` VALUES ('1', 'system:admin');
INSERT INTO `xx_role_authority` VALUES ('1', 'system:role');
INSERT INTO `xx_role_authority` VALUES ('1', 'system:authority');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:article');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:articleCategory');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:adPosition');
INSERT INTO `xx_role_authority` VALUES ('1', 'articleCategory:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'articleCategory:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'articleCategory:view');
INSERT INTO `xx_role_authority` VALUES ('1', 'article:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'ad:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'ad:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'adPosition:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'adPosition:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'adPosition:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:ad');
INSERT INTO `xx_role_authority` VALUES ('1', 'administrator:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'administrator:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'authority:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'authority:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'authority:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'authority:category');
INSERT INTO `xx_role_authority` VALUES ('1', 'role:add');
INSERT INTO `xx_role_authority` VALUES ('1', 'role:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'role:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'articleCategory:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'articleCategory:category');
INSERT INTO `xx_role_authority` VALUES ('1', 'article:edit');
INSERT INTO `xx_role_authority` VALUES ('1', 'article:view');
INSERT INTO `xx_role_authority` VALUES ('1', 'article:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'article:select');
INSERT INTO `xx_role_authority` VALUES ('1', 'ad:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'administrator:delete');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:salary');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:recharge');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:drawCash');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:withdrawal');
INSERT INTO `xx_role_authority` VALUES ('1', 'recharge:rehandle');
INSERT INTO `xx_role_authority` VALUES ('1', 'fund:task');
INSERT INTO `xx_role_authority` VALUES ('1', 'fund:balance');
INSERT INTO `xx_role_authority` VALUES ('1', 'fund:finance');
INSERT INTO `xx_role_authority` VALUES ('0', null);


DROP TABLE IF EXISTS `xx_log`;
CREATE TABLE `xx_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` longtext,
  `ip` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `parameter` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83418 DEFAULT CHARSET=utf8;