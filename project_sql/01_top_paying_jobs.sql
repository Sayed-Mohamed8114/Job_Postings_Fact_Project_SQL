/*
question : 
what are the top-paying data analyst job?
- identify the top 10 highest-paying data analyst role that are available remotly 
- focuses on job positions with specified salaries (remove nulls)
- why? highlight the top-paying opportunities for data analysts , 
    offering insights into the avg_year salary and limit it to 10 only 
*/

SELECT
    job_id ,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location='Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg Desc
LIMIT 10 ;
