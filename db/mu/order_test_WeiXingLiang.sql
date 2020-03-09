/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : datams

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-03-09 10:47:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mu_db
-- ----------------------------
DROP TABLE IF EXISTS `mu_db`;
CREATE TABLE `mu_db` (
  `DB_ID` int(11) NOT NULL COMMENT '编号',
  `DB_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '中文名称',
  `DB_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `DB_TYPE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '库类型',
  `DB_HOST` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '库地址',
  `DB_USER` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '库用户',
  `DB_PASS` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '库密码',
  `DB_DRIVER` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '驱动',
  `DB_EV` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '环境',
  `REMARKS` mediumtext COLLATE utf8_bin COMMENT '备注',
  `DEL_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标志',
  `CREATE_BY` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_BY` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `SYSTEM_ID` int(11) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管户库管理表';

-- ----------------------------
-- Records of mu_db
-- ----------------------------
INSERT INTO `mu_db` VALUES ('11', '信贷库', 'aa', null, null, null, null, null, null, null, '0', null, '2020-02-19 19:08:35', null, '2020-02-06 15:49:33', '1');
INSERT INTO `mu_db` VALUES ('22', '票据库', 'piaoju', null, null, null, null, null, null, null, '0', null, '2020-02-17 16:27:09', null, '2020-02-11 15:50:05', '2');

-- ----------------------------
-- Table structure for mu_field
-- ----------------------------
DROP TABLE IF EXISTS `mu_field`;
CREATE TABLE `mu_field` (
  `field_id` int(11) NOT NULL COMMENT '编号',
  `FIELD_NUMBER` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '列序号',
  `FIELD_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '列名',
  `FIELD_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '列CODE',
  `FIELD_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '列类型',
  `FIELD_LEN` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '列长度',
  `FIELD_ACCURACY` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '精度',
  `KEY_FLAG` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '主键标识',
  `OR_EMPTY` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为空',
  `REMARKS` mediumtext COLLATE utf8_bin COMMENT '备注',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `TABLE_ID` int(11) DEFAULT NULL COMMENT 'table_id',
  `TABLE_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'CODE',
  `db_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'DB的CODE',
  `scheme_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'CODE',
  `system_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '系统code',
  `field_key` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '字段列主键',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管户字段表';

-- ----------------------------
-- Records of mu_field
-- ----------------------------
INSERT INTO `mu_field` VALUES ('1', '1', '你好', 'id', 'varchar', '64', null, '是', null, null, 'lisi', '2020-02-17 17:54:29', '', '2020-02-17 17:54:32', '1111', 'mu_a', 'aa', 'sss', 'ddd', 'a', '0');
INSERT INTO `mu_field` VALUES ('2', '1', 'ddd', 'sd', 'int', '11', null, null, null, null, 'gg', '2020-02-19 18:02:20', '', '2020-02-18 12:21:14', '1111', 'mu_a', 'aa', 'sss', 'ddd', 'd', '0');

-- ----------------------------
-- Table structure for mu_order
-- ----------------------------
DROP TABLE IF EXISTS `mu_order`;
CREATE TABLE `mu_order` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `EXECUTOR` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '执行人',
  `CHANGER` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变更人',
  `DB_TYPE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '库类型',
  `UPDATE_TYPE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新类型',
  `DB_CODE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '库名称',
  `AVAILABLE` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '是否可用',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工单表';

-- ----------------------------
-- Records of mu_order
-- ----------------------------
INSERT INTO `mu_order` VALUES ('1', 'lisi', 'zhangsan', 'aa', 'insert', 'aa', '0', '2020-02-19 18:03:15');
INSERT INTO `mu_order` VALUES ('2', 'mm', 'ss', 'aa', 'update', 'aa', '0', '2020-02-19 18:05:51');
INSERT INTO `mu_order` VALUES ('5', '张三', '李四', 'aa', 'update_insert', 'aa', '0', '2020-02-25 15:51:02');
INSERT INTO `mu_order` VALUES ('6', null, null, 'aa', 'update_insert', 'aa', '0', '2020-03-04 09:59:16');
INSERT INTO `mu_order` VALUES ('7', null, null, 'aa', 'update_insert', 'aa', '0', '2020-03-04 10:01:31');
INSERT INTO `mu_order` VALUES ('8', null, '系统管理员', 'aa', 'update_insert', 'aa', '0', '2020-03-04 10:03:26');

-- ----------------------------
-- Table structure for mu_order_infro
-- ----------------------------
DROP TABLE IF EXISTS `mu_order_infro`;
CREATE TABLE `mu_order_infro` (
  `ORDER_INFOR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `SYSTEM_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '系统名称',
  `TABLE_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '表名称',
  `FIELD_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '字段名称',
  `UPDATE_TYPE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新类型',
  `OLD_CONTENT` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '原始内容',
  `NEW_CONTENT` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新后内容',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `ORDER_ID` int(11) NOT NULL COMMENT '工单id',
  PRIMARY KEY (`ORDER_INFOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工单信息表';

-- ----------------------------
-- Records of mu_order_infro
-- ----------------------------
INSERT INTO `mu_order_infro` VALUES ('1', 'ddd', 'mu_a', 'id', '新增字段', null, 'scheme:sss,序号:1,类型:varchar,长度:64,精度:,是否主键:1,是否为空:null,备注:', '2020-02-19 19:09:38', '5');
INSERT INTO `mu_order_infro` VALUES ('2', 'ddd', 'mu_a', 'name', '列名改  ', '列名：id  ', '列名：id  ', '2020-02-19 19:09:38', '5');
INSERT INTO `mu_order_infro` VALUES ('3', 'ddd', 'mu_a', 'name', '列名改  ', '列名：id  ', '列名：id  ', '2020-03-04 09:59:16', '6');
INSERT INTO `mu_order_infro` VALUES ('4', 'ddd', 'mu_a', 'id', '修改字段', '', '', '2020-03-04 09:59:16', '6');
INSERT INTO `mu_order_infro` VALUES ('5', 'ddd', 'mu_a', 'rr', '新增字段', '', 'scheme:sss,序号:5,类型:int,长度:12,精度:1,是否主键:null,是否为空:1,备注:', '2020-03-04 09:59:16', '6');
INSERT INTO `mu_order_infro` VALUES ('6', 'ddd', 'mu_a', 'wr', '新增字段', '', 'scheme:sss,序号:1,类型:varchar,长度:64,精度:,是否主键:null,是否为空:1,备注:', '2020-03-04 09:59:16', '6');
INSERT INTO `mu_order_infro` VALUES ('7', 'ddd', 'mu_a', 'name', '列名改  ', '列名：id  ', '列名：id  ', '2020-03-04 10:01:31', '7');
INSERT INTO `mu_order_infro` VALUES ('8', 'ddd', 'mu_a', 'id', '修改字段', '', '', '2020-03-04 10:01:31', '7');
INSERT INTO `mu_order_infro` VALUES ('9', 'ddd', 'mu_a', 'rr', '新增字段', '', 'scheme:sss,序号:5,类型:int,长度:12,精度:1,是否主键:null,是否为空:1,备注:', '2020-03-04 10:01:32', '7');
INSERT INTO `mu_order_infro` VALUES ('10', 'ddd', 'mu_a', 'wr', '新增字段', '', 'scheme:sss,序号:1,类型:varchar,长度:64,精度:,是否主键:null,是否为空:1,备注:', '2020-03-04 10:01:32', '7');
INSERT INTO `mu_order_infro` VALUES ('11', 'ddd', 'mu_a', 'name', '列名改  ', '列名：id  ', '列名：id  ', '2020-03-04 10:03:26', '8');
INSERT INTO `mu_order_infro` VALUES ('12', 'ddd', 'mu_a', 'id', '修改字段', '', '', '2020-03-04 10:03:26', '8');
INSERT INTO `mu_order_infro` VALUES ('13', 'ddd', 'mu_a', 'rr', '新增字段', '', 'scheme:sss,序号:5,类型:int,长度:12,精度:1,是否主键:null,是否为空:1,备注:', '2020-03-04 10:03:26', '8');
INSERT INTO `mu_order_infro` VALUES ('14', 'ddd', 'mu_a', 'wr', '新增字段', '', 'scheme:sss,序号:1,类型:varchar,长度:64,精度:,是否主键:null,是否为空:1,备注:', '2020-03-04 10:03:26', '8');

-- ----------------------------
-- Table structure for mu_order_script
-- ----------------------------
DROP TABLE IF EXISTS `mu_order_script`;
CREATE TABLE `mu_order_script` (
  `ORDER_SCRIPT_ID` int(11) NOT NULL COMMENT '编号',
  `TABLE_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `EXE_STR` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行语句',
  `SCRIP_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '脚本类型',
  `ORDER_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ORDER_SCRIPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工单脚本表';

-- ----------------------------
-- Records of mu_order_script
-- ----------------------------
INSERT INTO `mu_order_script` VALUES ('1', 'mu_a', 'select * from vc-cust', 'source_type', '5', '2020-02-24 15:17:54');
INSERT INTO `mu_order_script` VALUES ('2', 'mu_a', 'update vc_family set 。。', 'bigDataSystem_type', '5', '2020-02-24 15:18:26');
INSERT INTO `mu_order_script` VALUES ('3', 'mu_a', 'delete from vc_cust', 'source_type', '5', '2020-02-25 15:18:44');
INSERT INTO `mu_order_script` VALUES ('4', 'mu_a', 'select_update vc_cust', 'bigDataExe_type', '5', '2020-02-25 15:19:39');

-- ----------------------------
-- Table structure for mu_order_temp
-- ----------------------------
DROP TABLE IF EXISTS `mu_order_temp`;
CREATE TABLE `mu_order_temp` (
  `ORDER_INFOR_ID` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `SYSTEM_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '系统名称',
  `TABLE_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '表名称',
  `FIELD_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '字段名称',
  `UPDATE_TYPE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新类型',
  `OLD_CONTENT` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '原始内容',
  `NEW_CONTENT` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新后内容',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ORDER_INFOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工单信息临时表';

-- ----------------------------
-- Records of mu_order_temp
-- ----------------------------
INSERT INTO `mu_order_temp` VALUES ('1', 'ddd', 'mu_a', 'id', '新增字段', null, 'scheme:sss,序号:1,类型:varchar,长度:64,精度:,是否主键:1,是否为空:null,备注:', '2020-02-19 19:25:07');
INSERT INTO `mu_order_temp` VALUES ('2', 'ddd', 'mu_a', 'id', '新增字段', '', 'scheme:ww,序号:2,类型:int,长度:32,精度:,是否主键:null,是否为空:null,备注:', '2020-02-19 16:58:21');
INSERT INTO `mu_order_temp` VALUES ('3', 'ddd', 'mu_a', 'name', '列名改  ', '列名：id  ', '列名：id  ', '2020-02-19 19:05:17');
INSERT INTO `mu_order_temp` VALUES ('4', 'ddd', 'mu_a', 'name', '长度改  ', '长度：64  ', '长度：varchar  ', '2020-02-19 17:25:36');
INSERT INTO `mu_order_temp` VALUES ('5', null, 'mu_k', 'kll', '新增字段', '', 'scheme:sss,序号:3,类型:varchar,长度:12,精度:1,是否主键:1,是否为空:null,备注:', '2020-03-03 21:23:00');
INSERT INTO `mu_order_temp` VALUES ('6', 'ddd', 'mu_a', 'id', '修改字段', '', '', '2020-03-03 21:26:14');
INSERT INTO `mu_order_temp` VALUES ('7', null, 'ee', 'rt', '新增字段', '', 'scheme:sss,序号:4,类型:int,长度:12,精度:,是否主键:1,是否为空:1,备注:', '2020-03-03 21:27:37');
INSERT INTO `mu_order_temp` VALUES ('8', 'ddd', 'mu_a', 'rr', '新增字段', '', 'scheme:sss,序号:5,类型:int,长度:12,精度:1,是否主键:null,是否为空:1,备注:', '2020-03-04 09:42:32');
INSERT INTO `mu_order_temp` VALUES ('9', 'ddd', 'mu_a', 'wr', '新增字段', '', 'scheme:sss,序号:1,类型:varchar,长度:64,精度:,是否主键:null,是否为空:1,备注:', '2020-03-04 09:48:27');

-- ----------------------------
-- Table structure for mu_scheme
-- ----------------------------
DROP TABLE IF EXISTS `mu_scheme`;
CREATE TABLE `mu_scheme` (
  `SCHEME_ID` int(11) NOT NULL COMMENT '编号',
  `SCHEME_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '中文名称',
  `SCHEME_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `REMARKS` mediumtext COLLATE utf8_bin COMMENT '备注',
  `DEL_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标志',
  `CREATE_BY` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_BY` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `DB_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '库id',
  PRIMARY KEY (`SCHEME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管户scheme表';

-- ----------------------------
-- Records of mu_scheme
-- ----------------------------
INSERT INTO `mu_scheme` VALUES ('111', '案例', null, null, '0', null, '2020-02-17 16:26:52', null, '2020-02-06 15:51:41', '11');
INSERT INTO `mu_scheme` VALUES ('222', '总览', null, null, '0', null, '2020-02-17 16:26:54', null, '2020-02-14 15:52:15', '11');
INSERT INTO `mu_scheme` VALUES ('333', '查询', null, null, '0', null, '2020-02-17 16:26:53', null, '0000-00-00 00:00:00', '22');
INSERT INTO `mu_scheme` VALUES ('444', '总计', null, null, '0', null, '2020-02-17 16:26:57', null, '2020-02-29 15:53:24', '22');

-- ----------------------------
-- Table structure for mu_script_exe
-- ----------------------------
DROP TABLE IF EXISTS `mu_script_exe`;
CREATE TABLE `mu_script_exe` (
  `ORDER_SCRIPT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `TABLE_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `EXE_STR` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行语句',
  `SCRIP_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '脚本类型',
  `IS_EXECUTE` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否执行',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`ORDER_SCRIPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='脚本执行表';

-- ----------------------------
-- Records of mu_script_exe
-- ----------------------------
INSERT INTO `mu_script_exe` VALUES ('1', 'mu_a', 'select * from vc-cust', 'source_type', '0', '2020-02-28 12:22:49', '2020-02-28 12:22:49');
INSERT INTO `mu_script_exe` VALUES ('2', 'mu_a', 'update vc_family set 。。', 'bigDataSystem_type', '0', '2020-02-28 12:22:50', '2020-02-28 12:22:50');
INSERT INTO `mu_script_exe` VALUES ('3', 'mu_a', 'delete from vc_cust', 'source_type', '0', '2020-02-28 12:22:50', '2020-02-28 12:22:50');
INSERT INTO `mu_script_exe` VALUES ('4', 'mu_a', 'select_update vc_cust', 'bigDataExe_type', '0', '2020-02-28 12:22:50', '2020-02-28 12:22:50');

-- ----------------------------
-- Table structure for mu_system
-- ----------------------------
DROP TABLE IF EXISTS `mu_system`;
CREATE TABLE `mu_system` (
  `SYSTEM_ID` int(11) NOT NULL COMMENT '编号',
  `SYSTEM_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '中文名称',
  `SYSTEM_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `REMARKS` mediumtext COLLATE utf8_bin COMMENT '备注',
  `DEL_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标志',
  `CREATE_BY` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_BY` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`SYSTEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管户系统表';

-- ----------------------------
-- Records of mu_system
-- ----------------------------
INSERT INTO `mu_system` VALUES ('1', '信贷系统', 'credit', null, '0', null, '2020-02-17 15:47:34', null, '2020-02-17 15:47:40');
INSERT INTO `mu_system` VALUES ('2', '票据', 'piaoju', null, '0', null, '2020-02-12 15:48:13', null, '2020-02-13 15:48:20');

-- ----------------------------
-- Table structure for mu_table
-- ----------------------------
DROP TABLE IF EXISTS `mu_table`;
CREATE TABLE `mu_table` (
  `TABLE_ID` int(11) NOT NULL COMMENT '编号',
  `TABLE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '中文名称',
  `TABLE_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `REMARKS` mediumtext COLLATE utf8_bin COMMENT '备注',
  `DEL_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标志',
  `CREATE_BY` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_BY` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `SCHEME_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '库id',
  PRIMARY KEY (`TABLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管户表';

-- ----------------------------
-- Records of mu_table
-- ----------------------------
INSERT INTO `mu_table` VALUES ('1111', '系统表', 'mu_a', null, '0', null, '2020-02-17 16:26:44', null, '0000-00-00 00:00:00', '111');
INSERT INTO `mu_table` VALUES ('2222', '分指表', 'mu_f', null, '0', null, '2020-02-17 16:26:45', null, '2020-02-18 15:55:17', '222');
INSERT INTO `mu_table` VALUES ('3333', '总览表', 'mu_g', null, '0', null, '2020-02-17 16:26:45', null, '2020-02-15 15:55:59', '333');
INSERT INTO `mu_table` VALUES ('4444', '哈呼表', 'mu_s', null, '0', null, '2020-02-17 16:26:47', null, '2020-02-17 15:56:40', '444');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', '60', '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', '90', '/test/testTree', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('1e38d77133574874a70b3a84d01288e3', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '工单', '120', '/order/other/findTable?tableId=1111', '', '', '1', '', '1', '2020-02-18 15:29:16', '1', '2020-02-18 18:11:07', '', '1');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '990', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', '30', 'http://jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', '50', 'http://jeesite.com/donation.html', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', '80', 'http://bbs.jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '500', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '990', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '30', '/cms/category/', null, 'align-justify', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '30', null, null, null, '0', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '40', null, null, null, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '40', '/cms/site/', null, 'certificate', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '30', null, null, null, '0', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '40', null, null, null, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '50', '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', '120', '', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '500', null, null, null, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '30', '/cms/', null, 'briefcase', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '40', '/cms/article/', null, 'file', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '30', null, null, null, '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '40', null, null, null, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '50', null, null, null, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '60', '/cms/link/', null, 'random', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '30', null, null, null, '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '40', null, null, null, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', '30', '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '50', null, null, null, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '40', '/cms/comment/?status=2', null, 'comment', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '30', null, null, null, '0', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '40', null, null, null, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '80', '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '30', null, null, null, '0', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '40', null, null, null, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', '90', '/../static/ckfinder/ckfinder.html', null, 'folder-open', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '30', null, null, null, '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '40', null, null, null, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', null, null, null, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '600', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '30', '/cms/stats/article', null, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '200', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '300', '/oa/leave', null, 'leaf', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '30', null, null, null, '0', 'oa:leave:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '40', null, null, null, '0', 'oa:leave:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', null, null, null, '1', null, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('69', '62', '0,1,62,', '流程管理', '300', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,62,69,', '流程管理', '50', '/act/process', null, 'road', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '90', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,1,62,69,', '模型管理', '100', '/act/model', null, 'road', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2013-09-20 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('73', '63', '0,1,62,63,', '我的任务', '50', '/act/task/todo/', null, 'tasks', '1', null, '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('74', '63', '0,1,62,63,', '审批测试', '100', '/oa/testAudit', null, null, '1', 'oa:testAudit:view,oa:testAudit:edit', '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('75', '1', '0,1,', '在线演示', '3000', null, null, null, '1', null, '1', '2013-10-08 08:00:00', '1', '2013-10-08 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '0,1,79,80,', '代码模板管理', '90', '/gen/genTemplate', null, null, '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('86', '75', '0,1,75,', '组件演示', '50', null, null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('87', '86', '0,1,75,86,', '组件演示', '30', '/test/test/form', null, null, '1', 'test:test:view,test:test:edit', '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,1,62,', '通知通告', '20', '', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,1,62,88,', '我的通告', '30', '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,1,62,88,', '通告管理', '50', '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('ad253620c6d7411f9b14186c65d215a1', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '工单脚本', '120', '/order/other/orderScript?orderId=5', '', '', '1', '', '1', '2020-02-24 11:23:22', '1', '2020-02-25 15:30:53', '', '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', '60', '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', '60', '/test/testDataMain', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', '30', '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', '30', '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('d0bab87c47d548979af9171686eb7519', '1e38d77133574874a70b3a84d01288e3', '0,1,79,3c92c17886944d0687e73e286cada573,1e38d77133574874a70b3a84d01288e3,', '工单脚本', '50', '/order/update/orderScript', '', '', '1', '', '1', '2020-02-24 11:19:42', '1', '2020-02-24 11:19:42', '', '1');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', '60', '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', '30', '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('faf4f4734a8f4dffbb7ecc5cd45592ef', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '工单', '60', '/order/other/findTable?tableId=1111', '', '', '1', '', '1', '2020-02-24 11:22:23', '1', '2020-02-24 11:22:23', '', '0');
