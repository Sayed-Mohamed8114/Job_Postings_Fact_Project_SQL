-- it must have the same number of the columns 
-- without the duplicates 
select * from january_jobs 
union
select * from february_jobs 
union
select * from march_jobs;

-- with the duplicates 
select * from january_jobs 
union all
select * from february_jobs 
union all
select * from march_jobs

limit 10;
