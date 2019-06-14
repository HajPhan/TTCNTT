create table employee
(
    id       serial primary key,
    fullname varchar(255),
    sex      char(5),
    birthday timestamp,
    address  varchar(255),
    phone    varchar(15)
);

-- ##################################################################################################################

create or replace function sp_WhileLoop()
    returns double precision as
$$
declare
    x   int default 0;
    str varchar(25555);
    time_tart timestamp default null;
    time_stop timestamp default null;
    time_total double precision default 0.0;
begin
    x := 1;
    time_tart := clock_timestamp();
    while x <= 1000000
        LOOP
            str := RPAD('+849', 12, cast(FLOOR(random() * 100000000) as text));
            insert into employee(fullname, sex, birthday, address, phone)
            values ('a', 'male', '2019-01-01', 'ha noi', str);
            x := x + 1;
        end LOOP;
    time_stop := clock_timestamp();
    time_total := 1000*(extract(epoch from time_stop) - extract(epoch from time_tart));
    RAISE  NOTICE 'Duration int milisecs=%',time_total;
    return time_total;
end ;
$$ language plpgsql;

select sp_WhileLoop();

-- truncate employee;

select *from employee where phone='+84955076755';

-- ##################################################################################################################

select clock_timestamp();
select now();

select rpad('phanhai', 1, 'a');

select floor(random() * 10 + 1);
-- ##################################################################################################################


-- ##################################################################################################################

