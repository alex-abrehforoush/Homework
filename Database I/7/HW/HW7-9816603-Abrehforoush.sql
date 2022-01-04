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
--function to return a new rental_id
create or replace function generateNewRentalId()
   returns integer
   language plpgsql
  as
$$
declare
	rnt_id integer;
begin
	select
		max(A.rental_id) + 1
	into
		rnt_id
	from
		rental as A

	;
	return
		rnt_id
	;
end;
$$;
--function to return Rent_Count of a customer
create or replace function getRentCount(n_customer_id integer)
   returns integer
   language plpgsql
  as
$$
declare
	rnt_cnt integer;
begin
	select
		A.Rent_Count
	into
		rnt_cnt
	from
		customer as A
	where
		A.customer_id = n_customer_id
	;
	return
		rnt_cnt
	;
end;
$$;
--trigger to update rent_count or insert recommended film
create function rentCountUpdateFunction()
    returns trigger 
    language plpgsql
as
$$
begin
    if (getRentCount(new.customer_id) < 4) then
		update
			customer
		set
			Rent_Count = Rent_Count + 1
		where
			customer_id = new.customer_id
		;
	
	else
		update
			customer
		set
			Rent_Count = -1
		where
			customer_id = new.customer_id
		;
		insert into
			public.rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update, customer_rate)
		values
			(generateNewRentalId(), now(), recommendInventory(new.customer_id), new.customer_id, null, new.staff_id, now(), 50)
		;
	end if
	;
	return null
	;
end;
$$
;
--trigger to update rent_count
create trigger rentCountUpdateTrigger
	after insert on rental
	execute procedure rentCountUpdateFunction()
;


---B
insert into
	public.rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update, customer_rate)
values
	(generateNewRentalId(), now(), '196', '524', null, '1', now(), 50)
insert into
	public.rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update, customer_rate)
values
	(generateNewRentalId(), now(), '197', '524', null, '1', now(), 50)
insert into
	public.rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update, customer_rate)
values
	(generateNewRentalId(), now(), '198', '524', null, '1', now(), 50)
insert into
	public.rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update, customer_rate)
values
	(generateNewRentalId(), now(), '199', '524', null, '1', now(), 50)

---- Q4




---- Q5
select
	A.rating,
	date_part('year', D.payment_date),
	date_part('month', D.payment_date),
	sum(D.amount) over
						(
							partition by
								date_part('month', D.payment_date)
							order by
								D.payment_date
							range between '1 month' preceding and '1 month' following
						)
from
	film as A,
	inventory as B,
	rental as C,
	payment as D
where
	A.film_id = B.film_id
	and B.inventory_id = C.inventory_id
	and C.rental_id = D.rental_id
group by
	A.rating
order by
	D.payment_date

---- Q6
---A
select
	A.film_id,
	H.city_id,
	F.store_id,
	E.staff_id,
	avg(A.rental_rate) as rental_rate_avg 
from
	film as A,
	inventory as B,
	rental as C,
	payment as D,
	staff as E,
	store as F,
	address as G,
	city as H
where
	A.film_id = B.film_id
	and B.inventory_id = C.inventory_id
	and C.rental_id = D.rental_id
	and D.staff_id = E.staff_id
	and E.store_id = F.store_id
	and F.address_id = G.address_id
	and G.city_id = H.city_id
group by
	A.film_id,
	cube(H.city_id, F.store_id, E.staff_id)
order by
	rental_rate_avg desc

---B
select
	A.film_id,
	H.city_id,
	F.store_id,
	E.staff_id,
	avg(A.rental_rate) as rental_rate_avg 
from
	film as A,
	inventory as B,
	rental as C,
	payment as D,
	staff as E,
	store as F,
	address as G,
	city as H
where
	A.film_id = B.film_id
	and B.inventory_id = C.inventory_id
	and C.rental_id = D.rental_id
	and D.staff_id = E.staff_id
	and E.store_id = F.store_id
	and F.address_id = G.address_id
	and G.city_id = H.city_id
group by
	grouping sets
		(
			(A.film_id, H.city_id, F.store_id, E.staff_id),
			(A.film_id, H.city_id, F.store_id),
			(A.film_id, F.store_id, E.staff_id),
			(A.film_id, E.staff_id, H.city_id),
			(A.film_id, H.city_id),
			(A.film_id, F.store_id),
			(A.film_id, E.staff_id),
			(A.film_id)
		)
order by
	rental_rate_avg desc
