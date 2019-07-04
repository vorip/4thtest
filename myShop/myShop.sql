create database myShop;
use myShop;
create table product(
	id int not null primary key,
	pName varchar(100) not null,
	content varchar(500) not null,
	price varchar(20) not null
);
