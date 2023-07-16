drop database if exists posse;

create database if not exists posse;

use posse;

create table if not exists Posse.BlockTypes (
	pk_id int primary key auto_increment,
    block_name varchar(100) not null
);

create table if not exists Posse.Movements (
	pk_id int primary key auto_increment,
    movement_name varchar(100) not null
);

create table if not exists Posse.Mesocycles (
	pk_id int primary key auto_increment,
    mesocycle_name varchar(100) not null,
    duration int
);

create table if not exists Posse.Blocks (
	pk_id int primary key auto_increment,
    fk_blockType int not null,
    fk_movement int,
    fk_mesocycle int not null,
    duration int,
    constraint fk_blocks_blockTypes foreign key (fk_blockType) references BlockTypes (pk_id),
    constraint fk_blocks_movements foreign key (fk_movement) references Movements (pk_id),
    constraint fk_blocks_mesocycles foreign key (fk_mesocycle) references Mesocycles (pk_id)
);

create table Posse.RutineDay (
	pk_id int primary key auto_increment,
    fk_mesocycle int not null,
    fk_block int not null,
    week_n int not null,
    day_n int not null,
    constraint fk_rutineDay_mesocycles foreign key (fk_mesocycle) references Mesocycles(pk_id),
    constraint fk_rutineDay_blocks foreign key (fk_block) references Blocks(pk_id)
);

create table if not exists Posse.Exercise (
	pk_id int primary key auto_increment,
    fk_movement int,
    exercise_name varchar(100) not null,
    exercise_type varchar(100),
    constraint fk_exercise_movements foreign key (fk_movement) references Movements(pk_id)
);

create table if not exists Posse.RutineDayExercise (
	pk_id int primary key auto_increment,
    fk_rutine int not null,
    fk_exercise int not null,
    series int not null,
    reps int ,
    weight int ,
    unit enum('LBs','KGs'),
    comments text,
    constraint fk_rutineDayExercise_rutineDay foreign key (fk_rutine) references RutineDay(pk_id),
    constraint fk_rutineDayExercise_exercise foreign key (fk_exercise) references Exercise(pk_id)
);

create table if not exists Posse.PRs (
	pk_id int primary key auto_increment,
    fk_exercise int not null,
    weight int not null,
    reps int not null,
    series int not null,
    comments text,
    unit enum('LBs','KGs') not null,
    constraint fk_prs_exercise foreign key (fk_exercise) references Exercise(pk_id)
);
							