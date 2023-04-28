/*
Navicat MySQL Data Transfer

Source Server         : bs
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : swzl

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2021-12-27 21:45:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_banner`
-- ----------------------------
DROP TABLE IF EXISTS `t_banner`;
CREATE TABLE `t_banner` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_banner
-- ----------------------------
INSERT INTO `t_banner` VALUES ('41a0d001dd344ca08f26670ab85b0efb', '天气日渐寒冷 注意添衣保暖', '北京时间11月22日上午10时34分，我们正式迎来“小雪”节气。“小雪”是二十四节气中的第20个节气，也是冬季第2个节气。我国古代将“小雪”分为三候：“一候虹藏不见，二候天气上升地气下降，三候闭塞而成冬。”民间有：“冬腊风腌，蓄以御冬”的习俗。\n“小雪”时节，冷空气活动频繁，降水量逐渐增加，气温明显下降，公众应注意防寒保暖，特别是加强头部和手脚的保暖，提高机体免疫功能。同时可适当多食热量高的肉、鱼、乳类以及核桃、红枣、桂圆、黑芝麻、黑豆、黑木耳等富含维生素与铁质的温补益肾食品。', '/164049379404568690.png');
INSERT INTO `t_banner` VALUES ('99239083c91e4730a2e28482df1183f8', '十二月：不负时光，善待自己', '时光匆匆，岁月无声，不知不觉，2021年只剩最后一个月了，好好珍惜今年所剩不多的时间吧，为爱付出，为梦想奋斗，为幸福努力，为自己而活。愿所有汗水都有收获，所有努力都不被辜负。\n\n十二月，愿你坚持梦想\n\n平庸与卓越之间的差别，不在于天赋，而在于长期的坚持。你今日撒下的种子，会在你看不见、想不到的岁月里生根发芽。无论何时，别停下追逐梦想的脚步。\n\n十二月，愿你自信坚强\n\n最使人颓废的，往往不是前途的坎坷，而是自信的丧失。当全世界都在说放弃的时候，请坚定地告诉自己：再试一次！别认输，坚强一些，糟糕的日子熬过去了，剩下的就是好运气。\n\n十二月，愿你初心不改\n\n奋力向前的路上，别忘了出发时的心之所向，只有坚守初衷，才不会偏离自己的本心，才能得到自己想要的结果。\n\n十二月，愿你往事清零\n\n生活是一场漂泊的旅程，旅途中你会不停的收集很多东西，在每一次停泊的时候，都请清理你的行囊。新的一月，往事清零，轻松前行。\n\n十二月，愿你爱恨随意\n\n人生在世，每个人都会遇到情感上的失意，爱过痛过，哭过笑过绝望过。无法左右的，就随缘吧；难以挽留的，就放手吧。无论爱过恨过，都没白过。\n\n十二月，愿你一路向阳\n\n哪怕生活总是阴霾，抬头总能看见阳光，愿你用心感受生命中的美好，静享岁月中的悠闲时光，怀一份欣喜，许一片明媚，一路向阳，温暖向寒，只要熬过了寒冬，便是春暖花开。\n\n十二月，愿你微笑前行\n\n不管昨天发生了什么，不管昨天的自己有多难堪，对于过往，不必遗憾。你若是能有勇气跟过去说再见，生活就会给你一个崭新的开始，愿你收拾好心情，微笑前行。\n', '/164049416223353323.png');
INSERT INTO `t_banner` VALUES ('b35cc1ef38c34e0d8636384cfa0de069', '谷雨 （二十四节气之一）', '谷雨，是春季最后一个节气，谷雨取自“雨生百谷“之意。在传统农耕文化中，谷雨节气将“谷”和“雨”联系起来，表示降水状况和“雨生百谷”。谷雨最主要的特点是春雨绵绵，雨生百谷，反映了“谷雨”的农业气候意义，它是古代农耕文化对于节令的反映。谷雨节气后，气温升高，雨量增多，空气中的湿度进一步加大，极适合谷类作物生长正是庄稼生长的最佳时节。\n《通纬·孝经援神契》中说：“清明后十五日，斗指辰，为谷雨，三月中，言雨生百谷清净明洁也。”《群芳谱》也有记载：“谷雨，谷得雨而生也。”谷雨前后，天气较暖，降雨量增加，有利于春作物播种生长。在《月令七十二候集解》中记载：“三月中，自雨水后，土膏脉动，今又雨其谷于水也。雨读作去声，如雨我公田之雨。盖谷以此时播种，自上而下也。”这时天气温和，雨水明显增多，对谷类作物的生长发育关系很大。', '/164049424995614796.png');

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
INSERT INTO `t_gg` VALUES ('eebefaed781549f298c9fb3937fa87bd', '系统维护通知', ' 为确保信息中心超融合系统的安全稳定运行，拟于2021年1月4日18:00—20:00对系统进行升级操作。该时段内主页及二级网站可能会出现暂时无法访问的情况。\n 造成不便，敬请谅解。', '2021-01-04 18:51:29');

-- ----------------------------
-- Table structure for `t_lost`
-- ----------------------------
DROP TABLE IF EXISTS `t_lost`;
CREATE TABLE `t_lost` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `userId` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `content` text,
  `time` text,
  `pic` text,
  `phone` varchar(100) DEFAULT NULL,
  `address` text,
  `contacts` varchar(100) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lost
-- ----------------------------
INSERT INTO `t_lost` VALUES ('57b962a2030145a0baf3ced6f99f310f', '532c450a16ee4d4c9838a0202eb7ed1c', '失物', '苹果12手机', '今天我在操场上丢了一部苹果12手机，麻烦捡到的同学联系。', '2021-12-27 18:57:05', '/164060262501526715.webp,/164060262501590080.webp,/164060262501596542.webp', '15208406137', '学校操场上', '张三', '1');
INSERT INTO `t_lost` VALUES ('7ff95f93c79a451db2489e7dd7d8e3a2', '532c450a16ee4d4c9838a0202eb7ed1c', '招领', '钥匙', '今天在学校操场上捡到一串钥匙，请丢失者联系。', '2021-12-27 17:42:04', '/164059812480169075.jpg,/164059812480189341.jpg,/164059812480197237.jpg', '15208406137', '学校操场上', '战三', '1');

-- ----------------------------
-- Table structure for `t_msg`
-- ----------------------------
DROP TABLE IF EXISTS `t_msg`;
CREATE TABLE `t_msg` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `userId` varchar(100) DEFAULT NULL,
  `lostId` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_msg
-- ----------------------------
INSERT INTO `t_msg` VALUES ('03419b55dd2c4d19b3cbea1e90fa5c02', '532c450a16ee4d4c9838a0202eb7ed1c', '7ff95f93c79a451db2489e7dd7d8e3a2', '您好，是我丢的');
INSERT INTO `t_msg` VALUES ('1419a705b3f646ac830eb10638594126', '532c450a16ee4d4c9838a0202eb7ed1c', '7ff95f93c79a451db2489e7dd7d8e3a2', '您好，是我丢的');
INSERT INTO `t_msg` VALUES ('182cdabdb5ab4b33a5a1780f492f7f54', '532c450a16ee4d4c9838a0202eb7ed1c', '7ff95f93c79a451db2489e7dd7d8e3a2', '您好，是我丢的');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `age` varchar(100) NOT NULL,
  `userName` varchar(100) NOT NULL COMMENT '学号',
  `phone` varchar(11) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('532c450a16ee4d4c9838a0202eb7ed1c', '小红', '男', '20', 'aaa5849310', '15208406137', '/164061252814150157.jpg', 'e10adc3949ba59abbe56e057f20f883e');
