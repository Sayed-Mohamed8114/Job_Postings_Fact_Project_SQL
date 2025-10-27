/*
answer : wat are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- identify skills in high demand and associated with high average salaries for data analyst roles
- concentrates on remote positions with specified salaries 
- why ? targets skills that offer job security (high demand ) and financial benefits (high salaries),
       offering strategic insights for career developments in data analysis
*/

with skills_demand as(
    select 
           skills_dim.skill_id,
           skills_dim.skills,
           count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
    inner join skills_job_dim ON
    job_postings_fact.job_id=skills_job_dim.job_id 
    inner join skills_dim ON
    skills_job_dim.skill_id=skills_dim.skill_id
    where job_title_short = 'Data Analyst'
        and salary_year_avg is not null 
    and job_work_from_home = True 
    group by skills_dim.skill_id  
),average_salary as (
    select skills_job_dim.skill_id , round(avg(salary_year_avg),0) as avg_salary
    from job_postings_fact 
    INNER JOIN skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON
    skills_job_dim.skill_id=skills_dim.skill_id
    where job_title_short = 'Data Analyst'
    and salary_year_avg is not null 
    and job_work_from_home = True 
    group by skills_job_dim.skill_id
)

select 
    skills_demand.skill_id , 
    skills_demand.skills,
    demand_count,
    avg_salary
from skills_demand 
INNER JOIN average_salary on skills_demand.skill_id = average_salary.skill_id
where demand_count > 10
order by 
    avg_salary desc,
    demand_count desc 
limit 25;
