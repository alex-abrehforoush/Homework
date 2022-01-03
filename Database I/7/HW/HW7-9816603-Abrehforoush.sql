---- DATABASE DESIGN 1 @ IUT
---- YOUR NAME: Alireza Abrehforoush
---- YOUR STUDENT NUMBER: 9816603


---- Q1
---A
alter table
	rental
add column
	Customer_Rate integer default 50
;
alter table
	rental
add check
	(Customer_Rate between 0 and 100)
;
alter table
	film
add column
	Score numeric(4, 2)
;

---B
create function scoreUpdateFunction()
    returns trigger 
    language plpgsql
as
$$
begin
    update
    	film
	set
		score = 
		(
			select
				avg(A.Customer_Rate)
			from
				rental as A,
				inventory as B,
				film as C
			where
				A.inventory_id = B.inventory_id
				and B.film_id = C.film_id
		);
	return null;
end;
$$
;

create trigger scoreUpdateTrigger
	after update on rental
	execute procedure scoreUpdateFunction()
;

---C
--check average before update
select
	avg(A.Customer_Rate) as average_of_customer_rate
from
	rental as A,
	inventory as B,
	film as C
where
	A.inventory_id = B.inventory_id
	and B.film_id = C.film_id
;
--update customer_rate of rentals with rental_id like '%1'
update
	rental
set
	customer_rate = 100
where
	rental_id::varchar similar to '%1'
;
--check average after update
select
	avg(A.Customer_Rate) as average_of_customer_rate
from
	rental as A,
	inventory as B,
	film as C
where
	A.inventory_id = B.inventory_id
	and B.film_id = C.film_id
;


---- Q2
---A


---B



---- Q3
---A
--adding Rent_Count column to customer
alter table
	customer
add column
	Rent_Count integer default 0
;
--function for getting last five categories of a specific customer
create or replace function getLastFiveCategory(f_customer_id integer)
   returns table
   (
	   f_category_id smallint
   )
   language plpgsql
  as
$$
begin
	return query
	select
		A.category_id
	from
		film_category as A,
		customer as B,
		rental as C,
		inventory as D,
		film as E
	where
		C.inventory_id = D.inventory_id
		and D.film_id = E.film_id
		and B.customer_id = f_customer_id
		and B.customer_id = C.customer_id
		and E.film_id = A.film_id
	order by
		C.rental_date desc
	limit
		5
	;
end;
$$;
--function for getting the latest store id from which customer has rented film
create or replace function getLatestStoreId(g_customer_id integer)
   returns integer
   language plpgsql
  as
$$
declare
	s_id integer;
begin
	select
		A.store_id
	into
		s_id
	from
		store as A,
		staff as B,
		rental as C
	where
		A.store_id = B.store_id
		and B.staff_id = C.staff_id
		and C.customer_id = g_customer_id
	order by
		C.rental_date desc
	limit
		1
	;
	return
		s_id
	;
end;
$$;
--function for getting inventories of last five categories of a specific customer
create or replace function getInventoriesOfLastFiveCategory(h_customer_id integer)
   returns table
   (
	   h_inventory_id integer
   )
   language plpgsql
  as
$$
begin
	return query
	select
		A.inventory_id
	from
		inventory as A,
		film_category as B
	where
		A.film_id = B.film_id
		and B.category_id in
			(
			select
				*
			from
				getLastFiveCategory(h_customer_id)
			)
		and A.store_id = getLatestStoreId(h_customer_id)
	;
end;
$$;
--function for getting number of records in last function
create or replace function getCount(i_customer_id integer)
   returns integer
   language plpgsql
  as
$$
declare
	cnt integer;
begin
	select
		count(*)
	into
		cnt
	from
		getNewInventories(i_customer_id)
	;
	return
		cnt
	;
end;
$$;
--function to generate a rondom number between 0 and count
create or replace function getRand(j_customer_id integer)
   returns integer
   language plpgsql
  as
$$
declare
	rnd integer;
begin
	select
		floor(random() * (getCount(j_customer_id) - 1))::int
	into
		rnd
	;
	return
		rnd
	;
end;
$$;
--function to return all rented films of a customer
create or replace function getAllRentedFilms(k_customer_id integer)
   returns table
   (
	   k_film_id smallint
   )
   language plpgsql
  as
$$
begin
	return query
	select
		A.film_id
	from
		inventory as A,
		rental as D
	where
		A.inventory_id = D.inventory_id
		and D.customer_id = k_customer_id
	;
end;
$$;
--function to get new inventories
create or replace function getNewInventories(l_customer_id integer)
   returns table
   (
	   l_inventory_id integer
   )
   language plpgsql
  as
$$
begin
	return query
	select
		A.inventory_id
	from
		inventory as A,
		film_category as B
	where
		A.film_id = B.film_id
		and B.film_id not in (select * from getAllRentedFilms(l_customer_id))
		and A.inventory_id in (select * from getInventoriesOfLastFiveCategory(l_customer_id))
	;
end;
$$;
--function to recommend an inventory to a customer
create or replace function recommendInventory(m_customer_id integer)
   returns integer
   language plpgsql
  as
$$
declare
	m_inventory_id integer;
begin
	select
		*
	into
		m_inventory_id
	from
		getNewInventories(m_customer_id)
	limit
		1
	offset
		getRand(m_customer_id)
	;
	return
		m_inventory_id
	;
end;
$$;

---B

---- Q4



---- Q5
---A


---B










