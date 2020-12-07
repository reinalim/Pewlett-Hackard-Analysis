
#Deliverable 1
--Create retirement title table 

SELECT DISTINCT ON (e.emp_no) e.emp_no,
       e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_title
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'

--Create unique title table

SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title
INTO unique_titles
FROM retirement_titles as r
ORDER BY emp_no, to_date DESC

SELECT COUNT (title) count;
  title
INTO retirement_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

#Deliverable 2

--Create mentorship eligibility table
SELECT DISTINCT ON(e.emp_no) e.emp_no,
         e.first_name,
         e.last_name,
		 e.birth_date,
		 d.from_date,
		 d.to_date,
		 ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN depemployee as d
ON e.emp_no = d.emp_no

LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no 
WHERE (d.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibility;