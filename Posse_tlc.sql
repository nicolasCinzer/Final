use Posse;

select @@autocommit;
set @@autocommit = 0;
set SQL_SAFE_UPDATES = 0;

select * from prs;
start transaction;

delete from prs where weight > 150;

rollback;
commit;

start transaction;

insert into posse.movements (movement_name) values ('Snatch');
insert into posse.movements (movement_name) values ('Power Clean');
insert into posse.movements (movement_name) values ('Press Militar');
insert into posse.movements (movement_name) values ('Hollow');
savepoint sp1;

insert into posse.movements (movement_name) values ('Muscle Up');
insert into posse.movements (movement_name) values ('Handstand');
insert into posse.movements (movement_name) values ('Front Lever');
insert into posse.movements (movement_name) values ('Flag');
savepoint sp2;

release savepoint sp1;