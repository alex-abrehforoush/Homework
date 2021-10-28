---- DATABASE DESIGN 1 @ IUT
---- YOUR NAME: Alireza Abrehforoush
---- YOUR STUDENT NUMBER: 9816603


---- Q1
---A
select
	dept_total.dept_name
from
	(
	select
		B.dept_name,
		sum(B.salary) as value
	from
		instructor as B
	group by
		B.dept_name
	) as dept_total,
	(
	select
		avg(value) as value
	from
		(
		select
			B.dept_name,
			sum(B.salary) as value
		from
			instructor as B
		group by
			B.dept_name
		) as C
	) as dept_total_avg
where
	dept_total.value >= dept_total_avg.value

---B
with
	InsTeachCount (id, TeachCount) as
	(
	select
		B.id,
		count(*)
	from
		teaches as A,
		instructor as B
	where
		A.id = B.id and
		A.year = 2003
	group by
		B.id
	),
	InsTeachCountAvg (value) as
	(
	select
		avg(TeachCount)
	from
		InsTeachCount
	)
select
	instructor.name,
	count(*)
from
	instructor,
	InsTeachCount,
	InsTeachCountAvg
where
	instructor.id = InsTeachCount.id and
	InsTeachCount.TeachCount > InsTeachCountAvg.value
group by
	instructor.id

---- Q2
---A


---B


---C


---D




---- Q4
---A


---B


---C





---- Q5
---A


---B


---C


---D



---- Q6



---- Q7

	
	
---- Q8







