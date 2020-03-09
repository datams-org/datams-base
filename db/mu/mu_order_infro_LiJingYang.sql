/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : jeesite

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-03-09 10:50:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mu_order_infro`
-- ----------------------------
DROP TABLE IF EXISTS `mu_order_infro`;
CREATE TABLE `mu_order_infro` (
  `order_infor_id` int(11) NOT NULL COMMENT '主键id',
  `system_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '系统名称',
  `table_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '表名称',
  `field_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '字段名称',
  `update_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新类型',
  `old_content` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '原始内容',
  `new_content` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新后内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `order_id` int(11) DEFAULT NULL COMMENT '工单号',
  PRIMARY KEY (`order_infor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工单信息表';

-- ----------------------------
-- Records of mu_order_infro
-- ----------------------------
INSERT INTO `mu_order_infro` VALUES ('1', '测试系统', 'people', 'name', '修改', 'varchar(20)', 'varchar(30)', '2020-02-28 09:17:07', '1');
INSERT INTO `mu_order_infro` VALUES ('2', '测试系统', 'people', 'age', '修改', 'varchar(10)', 'int(10)', '2020-02-28 09:18:26', '1');
INSERT INTO `mu_order_infro` VALUES ('3', '测试系统', 'people', 'sex', '修改', 'varchar(10)', 'int(11)', '2020-02-28 09:19:49', '1');
INSERT INTO `mu_order_infro` VALUES ('4', '测试系统', 'people', 'id', '新增字段', null, 'scheme:100,序号:1,类型:varchar,长度:64,精度:,是否主键:是,是否为空:是,备注:主键id', '2020-02-28 11:57:14', '1');
