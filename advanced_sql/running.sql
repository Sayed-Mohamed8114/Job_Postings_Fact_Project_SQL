-- an example of the ::date
select job_title_short as title, 
       job_location as location , 
       job_posted_date::date as date 
 FROM job_postings_fact;

-- at time zone 
select job_title_short as title, 
       job_location as location , 
       job_posted_date at time zone 'utc' AT TIME ZONE 'est' as date 
 FROM job_postings_fact;


-- the extract function 
select job_title_short as title, 
       job_location as location , 
       job_posted_date at time zone 'utc' AT TIME ZONE 'est' as date ,
       extract(month from job_posted_date) as month_date ,
       extract(year from job_posted_date) as year_date 
 FROM job_postings_fact;


-- to select the job that posted in one time the count of it
SELECT 
      count(job_id) as job_posted_count
       ,EXTRACT(MONTH from job_posted_date) as month_date
      from job_postings_fact
      where job_title_short = 'Data Analyst'
      GROUP BY month_date
      order by job_posted_count desc;


