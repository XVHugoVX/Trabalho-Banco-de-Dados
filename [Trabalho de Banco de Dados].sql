create database system;

use system;

CREATE TABLE user(
id_user INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
nascimento DATE,
sexo ENUM('M','F'),
peso DECIMAL(5,2),
altura DECIMAL(3,2)
)DEFAULT CHARSET = utf8;

INSERT INTO user
(nome, nascimento, sexo, peso, altura)
values 
('Ronaldo', '1954-04-12', 'M', '72.5', '1.73'),
('Felipe', '1994-01-02', 'M', '68.9', '1.83'),
('Kaua', '1996-06-27', 'M', '71.8', '1.65'),
('Lucas', '1998-09-11', 'M', '64.1', '1.63'),
('Gabriel', '1995-11-02', 'M', '62.4', '1.84');

delete from user where id_user = '2';
select * from user;
---------------------------------------------------------------------------
CREATE TABLE post(
id_post INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(30),
description TEXT,
id_user INT,
foreign key(id_user) references user(id_user)
);

INSERT INTO post
(title, description, id_user)
values
('Como sou', 'Uma pessoa bem de humor',  1),
('O que Gosto', 'Gosto de jogar durante a tarde',  1),
('Como sou', 'Uma pessoa alegre',  3),
('O que Gosto', 'Gosto de dançar em festas',  3),
('Como sou', 'Uma pessoa que trabalha muito',  4),
('O que Gosto', 'Gosto de viajar nas ferias',  4),
('Como sou', 'Uma pessoa bem de vida',  5),
('O que Gosto', 'Gosto de aproveitar tudo que dá',  5);

DELETE FROM POST WHERE id_post = 4 LIMIT 2;
select * from post where id_user in (3,5);

UPDATE post
SET  description = 'Uma pessoa meio timida'
where id_post = '1' limit 1;

select * from post;
---------------------------------------------------------------------------
create table if not exists role (
	id_role int auto_increment primary key,
	access varchar(20) not null
);

insert into role (access) values ("Admin"),("Client"),("Employee");

create table user_role (
	id_user int, foreign key(id_user) references user(id_user),
	id_role int, foreign key(id_role) references role(id_role)
);

select * from user_role;

insert into user_role 
(id_user, id_role)
values (1, 3),(3, 1),(4, 1),(5, 3);

select user.id_user, user.nome,
role.access from user_role
join user on user.id_user = user_role.id_user
join role on role.id_role = user_role.id_role
where role.access = 'admin';