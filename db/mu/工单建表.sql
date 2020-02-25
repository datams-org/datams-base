 thinkgem  admin
CREATE TABLE MU_FIELD
(
	field_id int(11) NOT NULL COMMENT '编号',
	FIELD_NUMBER varchar(11) COMMENT '列序号',
	FIELD_NAME varchar(255) COMMENT '列名',
	FIELD_CODE varchar(255) COMMENT '列CODE',
	FIELD_TYPE varchar(255) COMMENT '列类型',
	FIELD_LEN varchar(255) COMMENT '列长度',
	FIELD_ACCURACY varchar(255) COMMENT '精度',
	KEY_FLAG varchar(255) COMMENT '主键标识',
	OR_EMPTY char(1) COMMENT '是否为空',
	REMARKS mediumtext COMMENT '备注',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_time timestamp NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_time timestamp NOT NULL COMMENT '更新时间',
	TABLE_ID int(11) COMMENT 'table_id',
	TABLE_CODE varchar(255) COMMENT 'CODE',
	db_code varchar(255) COMMENT 'DB的CODE',
	scheme_code varchar(255) COMMENT 'CODE',
	system_code varchar(255) COMMENT '系统code',
	field_key varchar(255) COMMENT '字段列主键',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (field_id)
) COMMENT = '管户字段表';

CREATE TABLE MU_ORDER
(
	ORDER_ID int(11) NOT NULL COMMENT '编号',
	EXECUTOR varchar(64) COMMENT '执行人',
	CHANGER varchar(64) COMMENT '变更人',
	DB_TYPE varchar(64) COMMENT '库类型',
	UPDATE_TYPE varchar(64) COMMENT '更新类型',
	DB_CODE varchar(64) COMMENT '库名称',
	AVAILABLE char(1) DEFAULT '0' COMMENT '是否可用',
	CREATE_TIME timestamp COMMENT '更新时间',
	PRIMARY KEY (ORDER_ID)
) COMMENT = '工单表';

CREATE TABLE MU_ORDER_INFRO
(
	ORDER_INFOR_ID int(11) NOT NULL COMMENT '编号',
	SYSTEM_CODE varchar(255) COMMENT '系统名称',
	TABLE_CODE varchar(255) COMMENT '表名称',
	FIELD_CODE varchar(255) COMMENT '字段名称',
	UPDATE_TYPE varchar(64) COMMENT '更新类型',
	OLD_CONTENT varchar(64) COMMENT '原始内容',
	NEW_CONTENT varchar(64) COMMENT '更新后内容',
	CREATE_TIME timestamp COMMENT '更新时间',
	ORDER_ID int(11) NOT NULL COMMENT '工单id',
	PRIMARY KEY (ORDER_INFOR_ID)
) COMMENT = '工单信息表';

CREATE TABLE MU_ORDER_TEMP
(
	ORDER_INFOR_ID int(11) NOT NULL COMMENT '编号',
	SYSTEM_CODE varchar(255) COMMENT '系统名称',
	TABLE_CODE varchar(255) COMMENT '表名称',
	FIELD_CODE varchar(255) COMMENT '字段名称',
	UPDATE_TYPE varchar(64) COMMENT '更新类型',
	OLD_CONTENT varchar(64) COMMENT '原始内容',
	NEW_CONTENT varchar(64) COMMENT '更新后内容',
	CREATE_TIME timestamp COMMENT '更新时间',
	PRIMARY KEY (ORDER_INFOR_ID)
) COMMENT = '工单信息临时表';

CREATE TABLE MU_SYSTEM
(
	SYSTEM_ID int(11) NOT NULL COMMENT '编号',
	SYSTEM_NAME varchar(255) COMMENT '中文名称',
	SYSTEM_CODE varchar(255) COMMENT '英文名称',
	REMARKS MEDIUMTEXT COMMENT '备注',
	DEL_FLAG char(1) COMMENT '删除标志',
	CREATE_BY varchar(64) COMMENT '创建人',
	CREATE_DATE timestamp COMMENT '创建时间',
	UPDATE_BY varchar(64) COMMENT '更新人',
	UPDATE_DATE timestamp COMMENT '更新时间',
	PRIMARY KEY (SYSTEM_ID)
) COMMENT = '管户系统表';

CREATE TABLE MU_DB
(
	DB_ID int(11) NOT NULL COMMENT '编号',
	DB_NAME varchar(255) COMMENT '中文名称',
	DB_CODE varchar(255) COMMENT '英文名称',
	DB_TYPE varchar(64) COMMENT '库类型',
	DB_HOST varchar(64) COMMENT '库地址',
	DB_USER varchar(64) COMMENT '库用户',
	DB_PASS varchar(64) COMMENT '库密码',
	DB_DRIVER varchar(64) COMMENT '驱动',
	DB_EV varchar(64) COMMENT '环境',
	REMARKS MEDIUMTEXT COMMENT '备注',
	DEL_FLAG char(1) COMMENT '删除标志',
	CREATE_BY varchar(64) COMMENT '创建人',
	CREATE_TIME timestamp COMMENT '创建时间',
	UPDATE_BY varchar(64) COMMENT '更新人',
	UPDATE_TIME timestamp COMMENT '更新时间',
	SYSTEM_ID int(11) COMMENT '系统编号',
	PRIMARY KEY (DB_ID)
) COMMENT = '管户库管理表';

CREATE TABLE MU_SCHEME
(
	SCHEME_ID int(11) NOT NULL COMMENT '编号',
	SCHEME_NAME varchar(255) COMMENT '中文名称',
	SCHEME_CODE varchar(255) COMMENT '英文名称',
	REMARKS MEDIUMTEXT COMMENT '备注',
	DEL_FLAG char(1) COMMENT '删除标志',
	CREATE_BY varchar(64) COMMENT '创建人',
	CREATE_DATE timestamp COMMENT '创建时间',
	UPDATE_BY varchar(64) COMMENT '更新人',
	UPDATE_DATE timestamp COMMENT '更新时间',
	DB_ID varchar(255) COMMENT '库id',
	PRIMARY KEY (SCHEME_ID)
) COMMENT = '管户scheme表';

CREATE TABLE MU_TABLE
(
	TABLE_ID int(11) NOT NULL COMMENT '编号',
	TABLE_NAME varchar(255) COMMENT '中文名称',
	TABLE_CODE varchar(255) COMMENT '英文名称',
	REMARKS MEDIUMTEXT COMMENT '备注',
	DEL_FLAG char(1) COMMENT '删除标志',
	CREATE_BY varchar(64) COMMENT '创建人',
	CREATE_DATE timestamp COMMENT '创建时间',
	UPDATE_BY varchar(64) COMMENT '更新人',
	UPDATE_DATE timestamp COMMENT '更新时间',
	SCHEME_ID varchar(255) COMMENT '库id',
	PRIMARY KEY (TABLE_ID)
) COMMENT = '管户表';

CREATE TABLE MU_ORDER_SCRIPT
(
	ORDER_SCRIPT_ID int(11) NOT NULL COMMENT '编号',
	TABLE_CODE varchar(255) COMMENT '英文名称',
	EXE_STR varchar(255) COMMENT '执行语句',
	SCRIP_TYPE varchar(255) COMMENT '脚本类型',
	ORDER_ID varchar(255) COMMENT '订单号',
	CREATE_TIME timestamp COMMENT '更新时间',
	PRIMARY KEY (ORDER_SCRIPT_ID)
) COMMENT = '工单脚本表';

CREATE TABLE MU_SCRIPT_EXE
(
	ORDER_SCRIPT_ID int(11) NOT NULL COMMENT '编号',
	DB_CODE varchar(255) COMMENT '英文名称',
	CHANGER varchar(255) COMMENT '执行语句',
	EXECUTOR varchar(255) COMMENT '脚本类型',
	IS_EXECUTE char(1) COMMENT '是否执行',
	CREATE_TIME timestamp COMMENT '创建时间',
	UPDATE_TIME timestamp COMMENT '更新时间',
	PRIMARY KEY (ORDER_SCRIPT_ID)
) COMMENT = '脚本执行表';