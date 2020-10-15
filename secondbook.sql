/*
Navicat MySQL Data Transfer

Source Server         : Qzp
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : secondbook

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2020-10-15 23:16:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `aid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '3', '测试地址');
INSERT INTO `address` VALUES ('2', '3', '测试地址2');
INSERT INTO `address` VALUES ('3', '3', '测试地址3');
INSERT INTO `address` VALUES ('4', '4', '新地址');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', 'admin', 'admin');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int(11) NOT NULL auto_increment,
  `uuid` varchar(60) default NULL,
  `name` varchar(60) default NULL,
  `price` int(11) default NULL,
  `type` int(11) default NULL,
  `status` int(11) default '0',
  `number` int(11) default NULL,
  `nowprice` int(11) default NULL,
  `introduction` varchar(200) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'book1', '考研数学复习全书', '60', '0', '0', '95', '50', '111', '5');
INSERT INTO `book` VALUES ('2', 'book2', '汤家凤1800题(数二)', '69', '0', '0', '12', '49', '222', '5');
INSERT INTO `book` VALUES ('3', 'book3', '高等数学第七版上册', '39', '0', '0', '3', '19', '333', '5');
INSERT INTO `book` VALUES ('4', 'book4', '线性代数教材', '30', '0', '0', '4', '20', '444', '5');
INSERT INTO `book` VALUES ('5', 'book5', '概率论与数理统计', '20', '0', '0', '4', '15', '555', '5');
INSERT INTO `book` VALUES ('6', '8c5dfb3931734339bf53a223a105693c', '何凯文长难句', '30', '1', '0', '20', '15', '666', '5');
INSERT INTO `book` VALUES ('7', 'c12f7d1cd61d409fae16c8fd26a3b32c', '政治教材', '80', '2', '0', '30', '60', '777', null);
INSERT INTO `book` VALUES ('8', '1a4a20244b8a4d628fc40b91b53ee9bd', '数据结构教材', '30', '3', '1', '30', '20', '888', null);
INSERT INTO `book` VALUES ('9', '94c132a13d274100b50fbf09a274c83c', '概率论', '39', '0', '0', '18', '19', '这是一本关于概率论的书籍', '6');

-- ----------------------------
-- Table structure for `orderrecord`
-- ----------------------------
DROP TABLE IF EXISTS `orderrecord`;
CREATE TABLE `orderrecord` (
  `oid` int(11) NOT NULL auto_increment,
  `uuid` varchar(60) default NULL,
  `status` int(11) default NULL,
  `bid` int(11) default NULL,
  `number` int(11) default NULL,
  `createTime` varchar(50) default NULL,
  `sendTime` varchar(50) default NULL,
  `doneTime` varchar(50) default NULL,
  `buyId` int(11) default NULL,
  `name` varchar(11) default NULL,
  `soldId` int(11) default NULL,
  PRIMARY KEY  (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderrecord
-- ----------------------------
INSERT INTO `orderrecord` VALUES ('28', 'f1ceee1a41d34be9b7422567c00d5bad', '2', '1', '2', '2020-09-25 16:57', '2020-09-28 16:34', '2020-09-28 16:39', '3', '测试地址2', '5');
INSERT INTO `orderrecord` VALUES ('29', '4dd67257a3f3465ba228f65ce2c840e9', '1', '1', '1', '2020-09-25 17:31', '2020-09-30 10:30', null, '3', '测试地址2', '5');
INSERT INTO `orderrecord` VALUES ('30', '0edbe8d938ac41d69d02a2ba7e413ea7', '0', '3', '2', '2020-09-25 17:31', null, null, '3', '测试地址2', '5');
INSERT INTO `orderrecord` VALUES ('31', 'e85c5a971af447149bc50455dc056b80', '0', '1', '1', '2020-09-28 15:20', null, null, '3', '测试地址2', '5');
INSERT INTO `orderrecord` VALUES ('32', 'bbed903376ab4605b1ff4c6a7a2f2e9d', '0', '3', '2', '2020-09-28 15:21', null, null, '3', '测试地址3', '5');
INSERT INTO `orderrecord` VALUES ('33', '61e36726344e49baa4f9269c6ca6bb2c', '0', '2', '1', '2020-09-28 15:27', null, null, '3', '测试地址', '5');
INSERT INTO `orderrecord` VALUES ('34', '79a6c94bc7764cf0a2a0073f894eed02', '0', '1', '1', '2020-09-28 15:32', null, null, '3', '测试地址2', '5');
INSERT INTO `orderrecord` VALUES ('35', '08e34303e6154cf3bf461f8d5b6e2aae', '0', '2', '1', '2020-09-28 15:32', null, null, '3', '测试地址2', '5');
INSERT INTO `orderrecord` VALUES ('36', '8b75130e8b2745a7b72b2e6d34df5605', '0', '9', '2', '2020-09-28 15:32', null, null, '3', '测试地址2', '6');
INSERT INTO `orderrecord` VALUES ('37', '39650f635a164d5f9d9fd0040195764e', '0', '2', '2', '2020-09-28 17:46', null, null, '3', '测试地址2', '5');
INSERT INTO `orderrecord` VALUES ('38', 'c5c1e19b269b45bdb43d5ba0d421d4d3', '0', '4', '1', '2020-09-28 17:47', null, null, '3', '测试地址', '5');

-- ----------------------------
-- Table structure for `shopcar`
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `sid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `bid` int(11) default NULL,
  `number` int(11) default '1',
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------

-- ----------------------------
-- Table structure for `talk`
-- ----------------------------
DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk` (
  `tid` int(11) NOT NULL auto_increment,
  `buyId` int(11) default NULL,
  `soldId` int(11) default NULL,
  `content` varchar(200) default NULL,
  `createTime` varchar(50) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talk
-- ----------------------------
INSERT INTO `talk` VALUES ('4', '3', '5', '测试', '2020-09-29 14:59', '0');
INSERT INTO `talk` VALUES ('5', '3', '5', '测试', '2020-09-29 14:59', '0');
INSERT INTO `talk` VALUES ('6', '3', '5', '测试', '2020-09-29 14:59', '0');
INSERT INTO `talk` VALUES ('7', '3', '5', '用户发送', '2020-09-29 15:00', '0');
INSERT INTO `talk` VALUES ('8', '3', '5', '用户发送测试', '2020-09-29 15:01', '0');
INSERT INTO `talk` VALUES ('39', '3', '5', '测试', '2020-09-29 15:09', '0');
INSERT INTO `talk` VALUES ('52', '3', '5', '测试', '2020-09-29 15:22', '0');
INSERT INTO `talk` VALUES ('55', '3', '5', '测试', '2020-09-29 15:24', '0');
INSERT INTO `talk` VALUES ('57', '4', '5', '二号测试', '2020-09-29 17:24', '0');
INSERT INTO `talk` VALUES ('58', '4', '5', '商家测试', '2020-09-29 19:04', '1');
INSERT INTO `talk` VALUES ('59', '3', '5', '商家测试', '2020-09-29 19:04', '1');
INSERT INTO `talk` VALUES ('60', '3', '5', '商家再次测试', '2020-09-29 19:04', '1');
INSERT INTO `talk` VALUES ('61', '3', '5', '客户发送', '2020-09-29 19:09', '0');
INSERT INTO `talk` VALUES ('62', '3', '5', '用户再发送', '2020-09-29 19:09', '0');
INSERT INTO `talk` VALUES ('63', '3', '5', '用户再再发送', '2020-09-29 19:09', '0');
INSERT INTO `talk` VALUES ('64', '3', '5', '商家发送', '2020-09-29 19:10', '1');
INSERT INTO `talk` VALUES ('65', '3', '5', '用户发送', '2020-09-29 19:10', '0');
INSERT INTO `talk` VALUES ('66', '3', '5', '测试', '2020-09-29 19:11', '1');
INSERT INTO `talk` VALUES ('67', '3', '5', '发送', '2020-09-29 19:14', '1');
INSERT INTO `talk` VALUES ('68', '3', '5', '发送1', '2020-09-29 19:15', '1');
INSERT INTO `talk` VALUES ('70', '3', '5', '发送2', '2020-09-29 19:15', '1');
INSERT INTO `talk` VALUES ('71', '3', '5', '我来了', '2020-09-29 19:20', '0');
INSERT INTO `talk` VALUES ('72', '3', '5', '测试', '2020-09-29 19:21', '0');
INSERT INTO `talk` VALUES ('73', '3', '5', '测试', '2020-09-29 19:26', '0');
INSERT INTO `talk` VALUES ('139', '3', '5', '123', '2020-09-30 09:13', '1');
INSERT INTO `talk` VALUES ('186', '3', '5', '123', '2020-09-30 09:14', '1');
INSERT INTO `talk` VALUES ('187', '3', '5', '1234', '2020-09-30 09:14', '0');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `tid` int(11) NOT NULL auto_increment,
  `tname` varchar(255) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('0', '数学');
INSERT INTO `type` VALUES ('1', '英语');
INSERT INTO `type` VALUES ('2', '政治');
INSERT INTO `type` VALUES ('3', '专业书');
INSERT INTO `type` VALUES ('4', '测试');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `tel` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `name` varchar(20) default NULL,
  `createTime` varchar(50) default NULL,
  `sno` varchar(20) default NULL,
  `account` int(11) default NULL,
  `identify` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '123', '123', '测试', '2020-09-24 14:16', '123', '20', '0');
INSERT INTO `user` VALUES ('4', '1234', '1234', '测试', '2020-09-27 11:23', '1234', '0', '0');
INSERT INTO `user` VALUES ('5', '123', 'sold', '二手书商铺', '2020-09-27 11:24', 'sold', '118', '1');
INSERT INTO `user` VALUES ('6', '123', 'test', '测试商铺', '2020-09-28 11:13', 'test', '0', '1');
