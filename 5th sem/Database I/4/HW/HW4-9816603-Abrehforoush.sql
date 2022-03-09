---- DATABASE DESIGN 1 @ IUT
---- YOUR NAME: Alireza Abrehforoush
---- YOUR STUDENT NUMBER: 9816603

---- Q7
---A
alter table
	student
add column
	GPA NUMERIC
---B
with table1(id, total_score) as
(
select
	takes.id,
	sum
	( 
	case takes.grade
		when 'A+' then 4
		when 'A ' then 4
		when 'A-' then 4
		when 'B+' then 3
		when 'B ' then 3
		when 'B-' then 3
		when 'C+' then 2
		when 'C ' then 1
		else 0
	end
 * (select
		course.credits
	from
		course
	WHERE
		course.course_id = takes.course_id)
	)
FROM
	takes 
GROUP BY
	takes.id
),
table2(id, total_credit) as
(
select
	id,
	sum(credits)
from
	takes INNER JOIN course ON course.course_id = takes.course_id
group by
	id
)
update
	student 
set
	GPA = (
		select
			scores / credits
		from sum_scores as S INNER JOIN sum_credits as C ON S.id = C.id
		WHERE
			C.id = student."id"
		);