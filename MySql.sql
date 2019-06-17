select *from employee;

drop procedure if exists sp_WhileLoop;
create procedure sp_WhileLoop()
begin
    declare x int default 0;
    declare str varchar(25555);
    declare time_start datetime;
    declare time_stop datetime;
    declare time_total double;
    set x = 1;
    set str = '';
    set time_start = now();
    while x <= 1000000 do
    Set str = RPAD('+849', 12, FLOOR(RAND() * 100000000));
    insert into employee(fullname, sex, birthday, address, phone)
        value ('a', 'male', '2019-01-01', 'ha noi', str);
    set x = x + 1;
    end while;
    set time_stop = now();
    set time_total = time_stop - time_start;
    select TIMESTAMPDIFF(SECOND ,time_start,time_stop),time_start,time_stop,time_total;
end;



call sp_WhileLoop();

select *from employee;

select @x;
truncate employee;