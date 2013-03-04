/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50155
Source Host           : localhost:3306
Source Database       : report

Target Server Type    : MYSQL
Target Server Version : 50155
File Encoding         : 65001

Date: 2012-12-25 14:45:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `report`
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `reportId` int(11) NOT NULL AUTO_INCREMENT,
  `assess` varchar(20) DEFAULT NULL,
  `nextWeekWorkPlan` varchar(500) DEFAULT NULL,
  `nextWeekFinishTime` date DEFAULT NULL,
  `nextWeekContent` varchar(500) DEFAULT NULL,
  `nextWeekTarget` varchar(500) DEFAULT NULL,
  `thisWeekWorkPlan` varchar(500) DEFAULT NULL,
  `thisWeekFinishTime` date DEFAULT NULL,
  `thisWeekContent` varchar(500) DEFAULT NULL,
  `thisWeekTarget` varchar(500) DEFAULT NULL,
  `finishStatus` varchar(100) DEFAULT NULL,
  `finishRatio` varchar(10) DEFAULT NULL,
  `uniqueFlag` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `username` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `post` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'admin', 'admin', 'admin');
