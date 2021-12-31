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


---- Q4



---- Q5
---A


---B










