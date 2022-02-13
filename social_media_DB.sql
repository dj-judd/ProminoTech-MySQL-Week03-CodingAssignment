create database if not exists social_media_DB;

use social_media_DB;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users (
	id int(11) not null auto_increment,
	user_name varchar(25) not null,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	email varchar(50) not null,
	password varchar(32) not null,
	date_joined datetime default current_timestamp not null,
	primary key (id)
);

create table posts (
	id int(11) not null auto_increment,
	user_id int(11) not null,
	post_content tinytext not null,
	date_posted datetime default current_timestamp not null,
	primary key(id),
	foreign key (user_id) references users (id)
);

create table comments (
	user_id int(11) not null,
	post_id int(11) not null,
	comment_content tinytext not null,
	date_commented datetime default current_timestamp not null,
	foreign key (user_id) references users (id),
	foreign key (post_id) references posts (id)
);
