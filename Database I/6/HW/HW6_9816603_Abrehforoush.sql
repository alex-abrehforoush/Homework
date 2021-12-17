---- DATABASE DESIGN 1 @ IUT Homework6
---- YOUR NAME: Alireza Abrehforoush
---- YOUR STUDENT NUMBER: 9816603


---- Q1
create table if not exists public.trader
(
    trader_id integer,
    trader_name character varying(45),
    birth_date timestamp without time zone,
    Joined_date timestamp without time zone,
	Salary numeric(15, 2),
	check(Salary >= 1000),
	check(birth_date >= '01-01-1900'),
	check(Joined_date >= birth_date)
)


---- Q2
alter table
	public.section 
add constraint
	section_time_slot_id_check 
check
	(time_slot_id != 'A');


---- Q3
select
	A.first_name,
	A.last_name,
	B.title,
	E.payment_date - C.rental_date
from
	customer as A,
	film as B,
	rental as C,
	inventory as D,
	payment as E
where
	C.customer_id = A.customer_id
	and C.inventory_id = D.inventory_id
	and B.film_id = D.film_id
	and C.rental_id = E.rental_id
	and E.payment_date - C.rental_date > '1 year 3 months 15 days'


---- Q5
create index myIdx ON film using btree (title);


---- Q6
select
	A.indexname,
	A.tablename,
	A.indexdef
from
	pg_indexes as A
where
	A.schemaname = 'sales'


---- Q7
---A
create role role1;
grant select on instructor to role1 with grant option;


---B
create role role2;
grant role1 to role2;
grant update, delete, insert on course, student to role2;


---C
create role role3;
grant update (dept_name) on student to role3;
revoke update (dept_name) on student from role3;


---D	
create role role4;
create or replace view v1 as
	(
	select
		A.name,
		B.title
	from
		student as A,
		course as B,
		takes as C
	where
		A.id = C.id
		and B.course_id = C.course_id
		and (A.dept_name = 'Elec. Eng.' or A.dept_name = 'Comp. Sci.')
	);
grant select on v1 to role4;


---- Q8
---A


---B


---C


---Q9
create or replace function
	myFunc(dis_name varchar(20))
	returns table
	(
		first_name varchar(45),
		last_name varchar(45),
		lstttl varchar(255)
	)
	language plpgsql
as $$
begin
	return query
	(
	select
		A.first_name,
		A.last_name,
		table3.lstttl
	from
		customer as A,
		(
		select
			B.customer_id as cid,
			A.district as dis
		from
			address as A,
			customer as B
		where
			A.address_id = B.address_id
			and A.district = myFunc.dis_name
		)as table1,
		(
		select
			A.customer_id as cid,
			B.title as lstttl
		from
			customer as A,
			film as B,
			rental as C,
			inventory as D,
			(
			select
				A.customer_id as cid,
				max(C.rental_date) as rntdt
			from
				customer as A,
				rental as C
			where
				A.customer_id = C.customer_id
			group by
				A.customer_id
			)as table2
		where
			A.customer_id = C.customer_id
			and C.customer_id = table2.cid
			and B.film_id = D.film_id
			and C.inventory_id = D.inventory_id
			and C.rental_date = table2.rntdt
		)as table3
	where
		A.customer_id = table1.cid
		and table1.cid = table3.cid
	order by
		A.customer_id
	);
end;$$


---Q10
create or replace procedure
	myProc(ttl1 varchar(255), ttl2 varchar(255))
	language plpgsql
as $$
declare
	tmp_rt mpaa_rating;
begin
	tmp_rt := 
	(
		select
			A.rating
		from
			film as A
		where
			A.title = myProc.ttl1
	)
	begin;
		update
			film
		set
			rating = 
			(
				select
					A.rating
				from
					film as A
				where
					A.title = myProc.ttl2
			)
		where
			title = myProc.ttl1
		;
		update
			film
		set
			rating = tmp_rt
		where
			title = myProc.ttl2
		;
	commit;
end;$$

