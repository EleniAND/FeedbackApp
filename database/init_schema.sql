create database andi_feedback;

create table club
(
	id int primary key
);

create table squad
(
	id int primary key,
	club_id int references club (id),
	name text not null unique
);

create table andi
(
	id int primary key not null,
	squad_id int references squad (id) not null,
	squad_lead_id int references andi (id) null,
	username text not null unique
);

create table question
(
	id int primary key not null,
	club_id int references club (id) null,
	question_text text not null
);

create table submission
(
	id int primary key not null,
	source_user_id int references andi (id) not null,
	target_user_id int references andi (id) not null
);

create table answer
(
	id int primary key not null,
	question_id int references question (id) not null,
	submission_id int references submission (id) not null,
	answer_text text not null
);
