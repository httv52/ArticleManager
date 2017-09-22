/*
Navicat MySQL Data Transfer

Source Server         : HuTao
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : article

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-09-23 02:50:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `previewImg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  `modified` bigint(20) DEFAULT NULL,
  `type` int(1) NOT NULL,
  `state` int(1) NOT NULL,
  `views` int(10) NOT NULL,
  `commens` int(10) NOT NULL,
  `allowCommon` int(1) NOT NULL COMMENT '允许评论',
  `allowSub` int(1) NOT NULL COMMENT '允许订阅',
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `categoryId` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `article-user` (`uid`),
  CONSTRAINT `article-user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `categoryName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `user_category` (`uid`),
  CONSTRAINT `user_category` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `creatrd` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_logs` (`uid`),
  CONSTRAINT `user_logs` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagId` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `tagName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tagId`),
  KEY `user_tag` (`uid`),
  CONSTRAINT `user_tag` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` bigint(20) NOT NULL,
  `logged` bigint(20) DEFAULT NULL,
  `activateCode` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(1) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for user_tag_tbl
-- ----------------------------
DROP TABLE IF EXISTS `user_tag_tbl`;
CREATE TABLE `user_tag_tbl` (
  `aid` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `tagId` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`aid`,`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET FOREIGN_KEY_CHECKS=1;
