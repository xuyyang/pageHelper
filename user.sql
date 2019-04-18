/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-04-18 22:10:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'a', '123456', '111111111', '深圳1', '80');
INSERT INTO `user` VALUES ('2', 'b', '123456', '222222222', '深圳2', '20');
INSERT INTO `user` VALUES ('3', 'c', '123456', '333333333', '深圳3', '30');
INSERT INTO `user` VALUES ('4', 'd', '123456', '444444444', '深圳4', '40');
INSERT INTO `user` VALUES ('5', 'e', '123456', '555555555', '深圳5', '50');
INSERT INTO `user` VALUES ('6', 'f', '123456', '111111111', '深圳6', '60');
INSERT INTO `user` VALUES ('7', 'g', '123456', '111111111', '深圳7', '70');
INSERT INTO `user` VALUES ('8', 'h', '123456', '111111111', '深圳8', '80');
INSERT INTO `user` VALUES ('9', 'i', '123456', '111111111', '深圳9', '90');
INSERT INTO `user` VALUES ('10', 'j', '123456', '111111111', '深圳10', '100');
INSERT INTO `user` VALUES ('11', 'k', '123456', '111111111', '深圳11', '95');
INSERT INTO `user` VALUES ('12', 'l', '123456', '111111111', '深圳12', '85');
INSERT INTO `user` VALUES ('13', 'm', '123456', '111111111', '深圳13', '65');
INSERT INTO `user` VALUES ('14', 'n', '123456', '111111111', '深圳14', '35');
INSERT INTO `user` VALUES ('15', 'o', '123456', '111111111', '深圳15', '25');
INSERT INTO `user` VALUES ('16', 'p', '123456', '111111111', '深圳16', '85');
