
CREATE TABLE `tb_login_history` (
  `history_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `session_id` CHAR(50) NOT NULL COMMENT '登录唯一标识',
  `user_type` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '用户类别(0:旅博,1:管理控制台)',
  `user_id` INT(11) NOT NULL COMMENT '用户ID',
  `login_time` DATETIME NOT NULL COMMENT '登入时间',
  `logout_time` DATETIME DEFAULT NULL COMMENT '登出时间',
  PRIMARY KEY (`history_id`),
  UNIQUE KEY `UNIQUE_SESSION_ID` (`session_id`)
) ENGINE=INNODB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COMMENT='用户登录历史日志表'


CREATE TABLE `tb_common_sculpture` (
  `sculpture_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sculpture_url` CHAR(200) NOT NULL COMMENT '头像URL',
  `sculpture_class` CHAR(20) DEFAULT NULL COMMENT '头像色系',
  `gender_role` TINYINT(1) NOT NULL DEFAULT '2' COMMENT '适用性别(0:男,1:女,2:保密)',
  `is_valid` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '是否生效(0:否,1:是)',
  `create_user` INT(11) NOT NULL COMMENT '创建人',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `last_update_user` INT(11) NOT NULL COMMENT '最后更新人',
  `last_update_time` DATETIME NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sculpture_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用户基础头像表'


CREATE TABLE `tb_manage_user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_no` CHAR(20) NOT NULL COMMENT '用户账号',
  `user_name` CHAR(60) NOT NULL COMMENT '用户名称',
  `user_level` TINYINT(4) NOT NULL DEFAULT '1' COMMENT '用户级别(0:超级,1:高级)',
  `password` CHAR(25) NOT NULL COMMENT '密码',
  `image_url` CHAR(60) DEFAULT NULL COMMENT '头像地址',
  `is_valid` TINYINT(4) NOT NULL DEFAULT '1' COMMENT '是否生效(0:否,1:是)',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `last_update_time` DATETIME NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNIQUE_USER_NO` (`user_no`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理控制台用户表'


CREATE TABLE `tb_manage_user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_no` CHAR(30) NOT NULL COMMENT '用户账号/会员邮箱',
  `password` CHAR(30) NOT NULL COMMENT '密码',
  `user_name` CHAR(60) NOT NULL COMMENT '用户名称/会员昵称',
  `user_sign` CHAR(255) NULL COMMENT '会员个性签名',
  `user_level` TINYINT(1) NOT NULL DEFAULT '2' COMMENT '用户级别(0:超级,1:高级,2:普通,3:会员)',
  `user_type` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '用户类型(0:管理员,1:会员)',
  `user_grade` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '会员等级(1:旅者,2:旅师,3:旅灵,4:旅王,5:旅皇,6:旅宗,7:旅尊,8:旅圣,9:旅帝)',
  `user_star` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '会员星级(1-9:一至九星)',
  `image_url` CHAR(200) DEFAULT NULL COMMENT '头像地址',
  `is_valid` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '是否生效(0:否,1:是)',
  `create_user` INT(11) NOT NULL COMMENT '创建人',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `last_update_user` INT(11) NOT NULL COMMENT '最后更新人',
  `last_update_time` DATETIME NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNIQUE_USER_NO` (`user_no`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理控制台用户/会员表'


CREATE TABLE `tb_manage_role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_code` CHAR(20) NOT NULL COMMENT '角色编码',
  `role_name` CHAR(60) NOT NULL COMMENT '角色名称',
  `role_level` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '角色级别(0:超级,1:高级,2:普通,3:会员)',
  `role_desc` VARCHAR(255) NULL DEFAULT '' COMMENT '角色描述',
  `is_valid` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '是否生效(0:否,1:是)',
  `create_user` INT(11) NOT NULL COMMENT '创建人',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `last_update_user` INT(11) NOT NULL COMMENT '最后更新人',
  `last_update_time` DATETIME NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UNIQUE_ROLE_CODE` (`role_code`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理控制台角色表'


CREATE TABLE `tb_manage_role_limit` (
  `limit_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` INT(11) NOT NULL COMMENT '角色ID',
  `menu_id` INT(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`limit_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='管理控制台角色权限表'


CREATE TABLE `tb_manage_menu` (
  `menu_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_code` CHAR(20) NOT NULL COMMENT '菜单编码',
  `menu_name` CHAR(60) NOT NULL COMMENT '菜单名称',
  `menu_icon` CHAR(30) NULL COMMENT '菜单图标',
  `menu_url` CHAR(60) NULL COMMENT '菜单URL',
  `menu_desc` VARCHAR(255) NULL DEFAULT '' COMMENT '菜单描述',
  `menu_sort` TINYINT(3) NOT NULL COMMENT '菜单排序',
  `parent_id` INT(11) NOT NULL COMMENT '父级菜单ID',
  `is_valid` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '是否生效(0:否,1:是)',
  `create_user` INT(11) NOT NULL COMMENT '创建人',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `last_update_user` INT(11) NOT NULL COMMENT '最后更新人',
  `last_update_time` DATETIME NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `UNIQUE_MENU_CODE` (`menu_code`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理控制台菜单表'


