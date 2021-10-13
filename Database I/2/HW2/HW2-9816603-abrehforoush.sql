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
where
	A.language_id = B.language_id
group by
	A.film_id,
	B.language_id
having
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
	customer_id
from
	rental
where
	inventory_id in
	(
		select
			inventory_id
		from
			inventory
		where
			film_id in
			(
				select
					film_id
				from
					film_actor
				where
					actor_id in
					(
						select
							actor_id
						from
							actor
						where
							first_name = 'Ben'
							and
							last_name = 'Harris'
					)
			)
	)
group by
	customer_id
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



