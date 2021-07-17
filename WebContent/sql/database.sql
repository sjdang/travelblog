
CREATE TABLE `tb_login_history` (
  `history_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `session_id` CHAR(50) NOT NULL COMMENT '��¼Ψһ��ʶ',
  `user_type` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '�û����(0:�ò�,1:�������̨)',
  `user_id` INT(11) NOT NULL COMMENT '�û�ID',
  `login_time` DATETIME NOT NULL COMMENT '����ʱ��',
  `logout_time` DATETIME DEFAULT NULL COMMENT '�ǳ�ʱ��',
  PRIMARY KEY (`history_id`),
  UNIQUE KEY `UNIQUE_SESSION_ID` (`session_id`)
) ENGINE=INNODB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COMMENT='�û���¼��ʷ��־��'


CREATE TABLE `tb_common_sculpture` (
  `sculpture_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `sculpture_url` CHAR(200) NOT NULL COMMENT 'ͷ��URL',
  `sculpture_class` CHAR(20) DEFAULT NULL COMMENT 'ͷ��ɫϵ',
  `gender_role` TINYINT(1) NOT NULL DEFAULT '2' COMMENT '�����Ա�(0:��,1:Ů,2:����)',
  `is_valid` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ���Ч(0:��,1:��)',
  `create_user` INT(11) NOT NULL COMMENT '������',
  `create_time` DATETIME NOT NULL COMMENT '����ʱ��',
  `last_update_user` INT(11) NOT NULL COMMENT '��������',
  `last_update_time` DATETIME NOT NULL COMMENT '������ʱ��',
  PRIMARY KEY (`sculpture_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='�û�����ͷ���'


CREATE TABLE `tb_manage_user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_no` CHAR(20) NOT NULL COMMENT '�û��˺�',
  `user_name` CHAR(60) NOT NULL COMMENT '�û�����',
  `user_level` TINYINT(4) NOT NULL DEFAULT '1' COMMENT '�û�����(0:����,1:�߼�)',
  `password` CHAR(25) NOT NULL COMMENT '����',
  `image_url` CHAR(60) DEFAULT NULL COMMENT 'ͷ���ַ',
  `is_valid` TINYINT(4) NOT NULL DEFAULT '1' COMMENT '�Ƿ���Ч(0:��,1:��)',
  `create_time` DATETIME NOT NULL COMMENT '����ʱ��',
  `last_update_time` DATETIME NOT NULL COMMENT '������ʱ��',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNIQUE_USER_NO` (`user_no`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='�������̨�û���'


CREATE TABLE `tb_manage_user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_no` CHAR(30) NOT NULL COMMENT '�û��˺�/��Ա����',
  `password` CHAR(30) NOT NULL COMMENT '����',
  `user_name` CHAR(60) NOT NULL COMMENT '�û�����/��Ա�ǳ�',
  `user_sign` CHAR(255) NULL COMMENT '��Ա����ǩ��',
  `user_level` TINYINT(1) NOT NULL DEFAULT '2' COMMENT '�û�����(0:����,1:�߼�,2:��ͨ,3:��Ա)',
  `user_type` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '�û�����(0:����Ա,1:��Ա)',
  `user_grade` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '��Ա�ȼ�(1:����,2:��ʦ,3:����,4:����,5:�û�,6:����,7:����,8:��ʥ,9:�õ�)',
  `user_star` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '��Ա�Ǽ�(1-9:һ������)',
  `image_url` CHAR(200) DEFAULT NULL COMMENT 'ͷ���ַ',
  `is_valid` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ���Ч(0:��,1:��)',
  `create_user` INT(11) NOT NULL COMMENT '������',
  `create_time` DATETIME NOT NULL COMMENT '����ʱ��',
  `last_update_user` INT(11) NOT NULL COMMENT '��������',
  `last_update_time` DATETIME NOT NULL COMMENT '������ʱ��',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNIQUE_USER_NO` (`user_no`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='�������̨�û�/��Ա��'


CREATE TABLE `tb_manage_role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `role_code` CHAR(20) NOT NULL COMMENT '��ɫ����',
  `role_name` CHAR(60) NOT NULL COMMENT '��ɫ����',
  `role_level` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '��ɫ����(0:����,1:�߼�,2:��ͨ,3:��Ա)',
  `role_desc` VARCHAR(255) NULL DEFAULT '' COMMENT '��ɫ����',
  `is_valid` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ���Ч(0:��,1:��)',
  `create_user` INT(11) NOT NULL COMMENT '������',
  `create_time` DATETIME NOT NULL COMMENT '����ʱ��',
  `last_update_user` INT(11) NOT NULL COMMENT '��������',
  `last_update_time` DATETIME NOT NULL COMMENT '������ʱ��',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UNIQUE_ROLE_CODE` (`role_code`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='�������̨��ɫ��'


CREATE TABLE `tb_manage_role_limit` (
  `limit_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `role_id` INT(11) NOT NULL COMMENT '��ɫID',
  `menu_id` INT(11) NOT NULL COMMENT '�˵�ID',
  PRIMARY KEY (`limit_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='�������̨��ɫȨ�ޱ�'


CREATE TABLE `tb_manage_menu` (
  `menu_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `menu_code` CHAR(20) NOT NULL COMMENT '�˵�����',
  `menu_name` CHAR(60) NOT NULL COMMENT '�˵�����',
  `menu_icon` CHAR(30) NULL COMMENT '�˵�ͼ��',
  `menu_url` CHAR(60) NULL COMMENT '�˵�URL',
  `menu_desc` VARCHAR(255) NULL DEFAULT '' COMMENT '�˵�����',
  `menu_sort` TINYINT(3) NOT NULL COMMENT '�˵�����',
  `parent_id` INT(11) NOT NULL COMMENT '�����˵�ID',
  `is_valid` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ���Ч(0:��,1:��)',
  `create_user` INT(11) NOT NULL COMMENT '������',
  `create_time` DATETIME NOT NULL COMMENT '����ʱ��',
  `last_update_user` INT(11) NOT NULL COMMENT '��������',
  `last_update_time` DATETIME NOT NULL COMMENT '������ʱ��',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `UNIQUE_MENU_CODE` (`menu_code`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='�������̨�˵���'


