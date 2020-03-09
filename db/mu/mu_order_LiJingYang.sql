/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : jeesite

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-03-09 10:50:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mu_order`
-- ----------------------------
DROP TABLE IF EXISTS `mu_order`;
CREATE TABLE `mu_order` (
  `order_id` int(11) NOT NULL COMMENT '主键id',
  `executor` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '执行人',
  `changer` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变更人',
  `db_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '库类型',
  `update_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新类型',
  `db_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '库名称',
  `available` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工单表';

-- ----------------------------
-- Records of mu_order
-- ----------------------------
INSERT INTO `mu_order` VALUES ('1', '系统管理员', null, 'oracle', null, 'please', '0', '2020-03-09 10:49:54');
