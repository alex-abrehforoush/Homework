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

select
	A.address,
	sum(B.amount)
from
	address as A,
	payment as B,
	store as C
where
	A.address_id = C.address_id and
	B.staff_id = C.manager_staff_id
group by
	C.store_id, A.address_id
order by
	sum(B.amount) asc
limit
	1

---- Q4-E

select distinct
	A.rating,
	count(*)
from
	film as A,
	inventory as B,
	rental as C
where
	A.film_id = B.film_id and
	B.inventory_id = C.inventory_id
group by
	A.rating

---- Q4-F



---- Q5-A

select
	A.id,
	A.name
from
	student as A
where
	A.name like 'M%a'

---- Q5-B

select
	A.title
from
	course as A,
	teaches as B
where
	A.dept_name like '%Eng.' and
	A.course_id = B.course_id and
	B.semester = 'Fall' and
	B.year = 2009

---- Q5-C

select
	A.name,
	B.title
from
	student as A,
	course as B,
	takes as C
where
	A.id = C.id and
	B.course_id = C.course_id
group by
	A.id,
	B.course_id
having
	count(*) >= 3

---- Q5-D

select
	A.course_id,
	sum(C.credits)
from
	course as A,
	prereq as B,
	course as C
where
	A.course_id = B.prereq_id and
	B.course_id = C.course_id
group by
	A.course_id
having
	sum(C.credits) > 4
order by
	sum(C.credits) desc

---- Q5-E

select
	A.room_number
from
	classroom as A,
	section as B,
	time_slot as C
where
	A.room_number = B.room_number and
	B.time_slot_id = C.time_slot_id and
	B.semester = 'Spring' and
	B.year = 2008
group by
	A.room_number, A.building
having
	sum(C.end_hr - C.start_hr) >= 2

---- Q5-F

	
	
---- Q5-G



---- Q5-H



