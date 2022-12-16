
create database gallary;
	use gallary;


create table if not exists gallery(
id int auto_increment primary key,
categoryId int,
name varchar(20),
creater varchar(20),
price int,
createTime timestamp not null,
updateTime timestamp null default current_timestamp,
image mediumblob,
descroption varchar(225),
details text
)ENGINE=InnoDB auto_increment = 1 default charset=utf8;


create table if not exists category(
id int auto_increment  primary key,
name varchar(20),
createTime timestamp not null,
updateTime timestamp not null default current_timestamp,
description varchar(255)
)Engine=InnoDB auto_increment = 1 default charset=utf8;