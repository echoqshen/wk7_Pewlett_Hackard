---Challenges:
----delivable 1:
---create retirement_titles table
drop table retirement_titles;
SELECT e.emp_no, e.first_name, e.last_name,  t.title, t.from_date, t.to_date
into retirement_titles
from employees as e
inner join titles as t
on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;
select * from retirement_titles limit 10;
--
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--use count() for retiring titles table
select count(title), title
into retiring_titles
from unique_titles
group by title
order by count(title) DESC;

