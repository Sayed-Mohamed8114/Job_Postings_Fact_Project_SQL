/*  create tables from anohther tables
create 3 tables jan 2023 jobs , feb, mar
*/

-- this query will return all the job applied in jan
-- January
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date::date) = 1;

-- February
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date::date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date::date) = 3;


select * from january_jobs limit 10;
select * from february_jobs limit 10;
select * from march_jobs limit 10;


