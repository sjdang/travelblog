/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.5.43 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `tb_common_sculpture` (
	`sculpture_id` int (11),
	`sculpture_url` char (600),
	`sculpture_class` char (60),
	`gender_role` tinyint (1),
	`is_valid` tinyint (1),
	`create_user` int (11),
	`create_time` datetime ,
	`last_update_user` int (11),
	`last_update_time` datetime 
); 
insert into `tb_common_sculpture` (`sculpture_id`, `sculpture_url`, `sculpture_class`, `gender_role`, `is_valid`, `create_user`, `create_time`, `last_update_user`, `last_update_time`) values('1','https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/a378c71d-86af-4f92-94b0-56fd1e3e4617.png','bg-primary','0','1','1','2018-03-29 21:51:42','1','2018-03-29 21:51:42');
insert into `tb_common_sculpture` (`sculpture_id`, `sculpture_url`, `sculpture_class`, `gender_role`, `is_valid`, `create_user`, `create_time`, `last_update_user`, `last_update_time`) values('2','https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/e43edcb1-4e89-4cd0-bea4-9b331098610e.png','bg-primary','1','1','1','2018-03-29 21:51:56','1','2018-03-29 21:51:56');
insert into `tb_common_sculpture` (`sculpture_id`, `sculpture_url`, `sculpture_class`, `gender_role`, `is_valid`, `create_user`, `create_time`, `last_update_user`, `last_update_time`) values('3','https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/dcb385a4-e810-47ff-b122-3b3c95cd4885.png','bg-success','0','1','1','2018-03-29 21:52:22','1','2018-03-29 21:52:22');
insert into `tb_common_sculpture` (`sculpture_id`, `sculpture_url`, `sculpture_class`, `gender_role`, `is_valid`, `create_user`, `create_time`, `last_update_user`, `last_update_time`) values('4','https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/79093c0e-b4b0-461b-8bef-78d8293cc707.png','bg-success','1','1','1','2018-03-29 21:52:31','1','2018-03-29 21:52:31');
insert into `tb_common_sculpture` (`sculpture_id`, `sculpture_url`, `sculpture_class`, `gender_role`, `is_valid`, `create_user`, `create_time`, `last_update_user`, `last_update_time`) values('5','https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/de462149-b75b-42ee-8265-79c6bccb9c14.png','bg-info','0','1','1','2018-03-29 21:53:46','1','2018-03-29 21:53:46');
insert into `tb_common_sculpture` (`sculpture_id`, `sculpture_url`, `sculpture_class`, `gender_role`, `is_valid`, `create_user`, `create_time`, `last_update_user`, `last_update_time`) values('6','https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/b01eee0b-88e8-4ab9-95eb-32eed9d6915a.png','bg-purple','1','1','1','2018-03-29 21:54:48','1','2018-03-29 21:54:48');
insert into `tb_common_sculpture` (`sculpture_id`, `sculpture_url`, `sculpture_class`, `gender_role`, `is_valid`, `create_user`, `create_time`, `last_update_user`, `last_update_time`) values('7','https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/4e8acdb5-a227-43ab-91ef-19b63342dba1.png','bg-mint','0','1','1','2018-03-29 21:55:15','1','2018-03-29 21:55:15');
insert into `tb_common_sculpture` (`sculpture_id`, `sculpture_url`, `sculpture_class`, `gender_role`, `is_valid`, `create_user`, `create_time`, `last_update_user`, `last_update_time`) values('8','https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/157a5fe2-2125-42c8-af5b-968bfa2edac9.png','bg-pink','1','1','1','2018-03-29 21:56:13','1','2018-03-29 21:56:13');
insert into `tb_common_sculpture` (`sculpture_id`, `sculpture_url`, `sculpture_class`, `gender_role`, `is_valid`, `create_user`, `create_time`, `last_update_user`, `last_update_time`) values('9','https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/ecb65e1a-62de-45c9-acdb-1f28c565968e.png','bg-warning','0','1','1','2018-03-29 21:56:43','1','2018-03-29 21:56:43');
