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
create table uni_data
(
	stu_id			varchar(20),
	stu_name		varchar(20),
	stu_dept_name	varchar(20),
	year			numeric(4),
	semester		varchar(6),
	course_name		varchar(50),
	score			numeric(3),
	is_rank			bool
)

---B
insert into
	uni_data
select
	student.id,
	student.name,
	student.dept_name,
	section.year,
	section.semester,
	course.title,
	case takes.grade
		when 'A+' then 100
		when 'A' then 95
		when 'A-' then 90
		when 'B+' then 85
		when 'B' then 80
		when 'B-' then 75
		when 'C+' then 70
		when 'C' then 65
		when 'C-' then 60
		else 0
	end,
	case takes.grade
		when 'A+' then 1
		when 'A' then 1
		when 'A-' then 1
		when 'B+' then 1
		when 'B' then 1
		when 'B-' then 1
		else 0
	end
from
	student,
	section,
	course,
	takes
where
	student.id = takes.id and
	section.course_id = course.course_id and
	course.course_id = takes.course_id

---C
update
	uni_data
set
	score = 
	case
		when uni_data.score < 75 then uni_data.score + 10
		else uni_data.score + 15
	end
where
	uni_data.stu_dept_name = 'Physics'

---D
with
	dept_score (dept_name, score) as
	(
	select
		uni_data.stu_dept_name,
		avg(uni_data.score)
	from
		uni_data
	group by
		uni_data.stu_dept_name
	)
delete from
	uni_data
where
	uni_data.score < 
		(
		select
			dept_score.score
		from
			dept_score
		where
			uni_data.stu_dept_name = dept_score.dept_name
		) and
	uni_data.stu_name like 'T%'



---- Q4
---A


---B


---C





---- Q5
---A
select
	production.product.name,
	sales.salesorderdetail.salesorderid
from
	production.product left outer join sales.salesorderdetail on production.product.productid = sales.salesorderdetail.productid

---B
select
	production.product.name,
	sales.salesorderdetail.salesorderid
from
	production.product left outer join sales.salesorderdetail on production.product.productid = sales.salesorderdetail.productid
where
	sales.salesorderdetail.productid is null

---C
select
	sales.customer.customerid,
	production.product.name
from
	(
		(
			sales.customer inner join
			sales.salesorderheader on sales.customer.customerid = sales.salesorderheader.customerid
		) inner join
		sales.salesorderdetail on sales.salesorderheader.salesorderid = sales.salesorderdetail.salesorderid
	) inner join
	production.product on sales.salesorderdetail.productid = production.product.productid

---D
select
	sales.customer.customerid,
	sales.salesorderheader.salesorderid,
	sales.salesterritory.name
from
	sales.salesorderheader right outer join
	(
		sales.customer inner join
		sales.salesterritory on sales.customer.territoryid = sales.salesterritory.territoryid
	) on sales.salesorderheader.customerid = sales.customer.customerid


---- Q6



---- Q7

	
	
---- Q8







