---- DATABASE DESIGN 1 @ IUT
---- YOUR NAME: Alireza Abrehforoush
---- YOUR STUDENT NUMBER: 9816603


---- Q4-A

select
	A.title,
	A.length
from
	film as A,
	film_category as B,
	category as C
where
	A.title like 'C%' and
	A.film_id = B.film_id and
	B.category_id = C.category_id and
	C.name = 'Action'
order by
	A.length desc

---- Q4-B

select
	A.title,
	B.name
from
	film as A,
	language as B
group by
	A.film_id,
	B.language_id
having
	A.language_id = B.language_id and
	A.rental_rate >
	(
		select
			avg(rental_rate)
		from
			film
	)
order by
	A.rental_rate desc
limit
	5

---- Q4-C

select
	A.customer_id
from
	rental as A,
	inventory as B,
	film_actor as C,
	actor as D
where
	A.inventory_id = B.inventory_id and
	B.film_id = C.film_id and
	C.actor_id = D.actor_id and
	D.first_name = 'Ben' and
	D.last_name = 'Harris'
group by
	A.customer_id
having
	count(*) >= 3

---- Q4-D



---- Q4-E



---- Q4-F



---- Q5-A



---- Q5-B



---- Q5-C



---- Q5-D



---- Q5-E



---- Q5-F

	
	
---- Q5-G



---- Q5-H



