
create database gallary;
	use gallary;


CREATE TABLE `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `creater` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `imgPath` varchar(256) DEFAULT NULL,
  `descroption` varchar(225) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8

create table if not exists category(
id int auto_increment  primary key,
name varchar(20),
createTime timestamp not null,
updateTime timestamp not null default current_timestamp,
description varchar(255)
)Engine=InnoDB auto_increment = 1 default charset=utf8;