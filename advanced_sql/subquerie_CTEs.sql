-- the normal way of making it 
SELECT * FROM(
        SELECT * from job_postings_fact 
        where EXTRACT(MONTH from job_posted_date) =4 
    )
    as april_jobs 
    limit 100;

-- the ctes --> define a temporary (table)result set that you can reference 
-- can reference with --> select , insert , update,delete
-- define with with 
-- work instead of the subquery to make the code more readable 
with april_jobs as (
    select * from job_postings_fact
    where EXTRACT(MONTH from job_posted_date) =4
)

select * from april_jobs;


select company_dim.name as combany_name
 from company_dim  
 where company_id in (
    select company_id
    from job_postings_fact 
    where job_no_degree_mention = true
)

-- problem 
/* 
find the company that have the most job openeings . 
get the total number of jobs postings per company id (job_posting_fact)
return the total number of jobs with the company name (company_dim)
*/

select company_id, count(*) 
from job_postings_fact
group by company_id;

with company_job_count as (
    select company_id,count(*) 
    from job_postings_fact GROUP BY company_id

)

select * from company_job_count;

-- select the company names from compnay_dim even if it don't have any jobs 
-- and calculating how many jobs from job_postings_fact
-- if the company don't have any data it will be displayed because we use the left join 

with company_job_count as(
    select company_id,count(*) as total_jobs
    from job_postings_fact GROUP BY
    company_id
)

select company_dim.name as company_name,
       company_job_count.total_jobs
 from company_dim 
left join company_job_count on 
company_job_count.company_id=company_dim.company_id
order by total_jobs desc;

