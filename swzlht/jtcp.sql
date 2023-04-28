/*
Navicat MySQL Data Transfer

Source Server         : bysj
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : jtcp

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2021-07-24 17:18:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_foods`
-- ----------------------------
DROP TABLE IF EXISTS `t_foods`;
CREATE TABLE `t_foods` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `content` text,
  `pic` text,
  `video` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_foods
-- ----------------------------

-- ----------------------------
-- Table structure for `t_gg`
-- ----------------------------
DROP TABLE IF EXISTS `t_gg`;
CREATE TABLE `t_gg` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gg
-- ----------------------------
INSERT INTO `t_gg` VALUES ('eebefaed781549f298c9fb3937fa87bd', '系统维护通知', ' 为确保信息中心超融合系统的安全稳定运行，拟于2021年1月4日18:00—20:00对系统进行升级操作。该时段内主页及二级网站可能会出现暂时无法访问的情况。\n 造成不便，敬请谅解。', '2021-07-23 18:51:29');

-- ----------------------------
-- Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('20c6e4d989c440c79dc750ef61130fab', '家常菜');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `userName` varchar(100) DEFAULT NULL,
  `nikName` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `passwords` varchar(255) DEFAULT NULL,
  `head` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('fd1b8d4a8a6047b8b2d077484d52dcae', 'aaa5849310', 'lala', '12345678912', '男', 'e10adc3949ba59abbe56e057f20f883e', '/161613622974954440.jpg');
