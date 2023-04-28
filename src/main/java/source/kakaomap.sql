create table member(
	idx int not null auto_increment primary key,
	id varchar(20) not null,
	pwd varchar(20) not null,
	name varchar(20) not null,
	birthday varchar(20) not null,
	gender varchar(5) not null
);

select * from member;

insert

desc member;

alter table member modify birthday varchar(20) not null;

desc member;

select * from member;