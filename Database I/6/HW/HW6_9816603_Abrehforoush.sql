---- DATABASE DESIGN 1 @ IUT Homework6
---- YOUR NAME: Alireza Abrehforoush
---- YOUR STUDENT NUMBER: 9816603


---- Q1



---- Q2




---- Q3




---- Q5



---- Q6



---- Q7
---A


---B


---C



---D	
	
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