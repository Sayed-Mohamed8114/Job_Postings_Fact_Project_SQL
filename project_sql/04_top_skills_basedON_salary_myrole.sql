/*
answer : what are the top skills based on salary ?
- look at the avgerage salary associated with each skill 
for data analyst postion 
- focuses on roles with specified salaries,regardless of location 
- why ? it reveals how different akills impact salary levels for data analyst and 
        helps identify the most financially rewarding skills to acquire or improve
*/

select skills  , round(avg(salary_year_avg) ,2)  as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where  job_title_short='Data Analyst' 
    and salary_year_avg IS NOT NULL
    and job_work_from_home = True 
group by skills
ORDER BY avg_salary desc
limit 25;

/*
Big Data & Cloud tools (PySpark, Databricks, Airflow, GCP) dominate — analysts who manage large-scale data pipelines earn the highest salaries.

Machine Learning & Python ecosystems (Pandas, Scikit-learn, DataRobot) boost pay — blending analysis with AI is in high demand.

DevOps & engineering crossover skills (GitLab, Jenkins, Kubernetes) are increasingly valuable — analysts who automate and deploy data workflows are paid more.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172.25"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189154.50"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.00"
  },
  {
    "skills": "watson",
    "avg_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.50"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500.00"
  },
  {
    "skills": "swift",
    "avg_salary": "153750.00"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152776.50"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821.33"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000.00"
  },
  {
    "skills": "golang",
    "avg_salary": "145000.00"
  },
  {
    "skills": "numpy",
    "avg_salary": "143512.50"
  },
  {
    "skills": "databricks",
    "avg_salary": "141906.60"
  },
  {
    "skills": "linux",
    "avg_salary": "136507.50"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500.00"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131161.80"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000.00"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103.00"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781.25"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436.33"
  },
  {
    "skills": "notion",
    "avg_salary": "125000.00"
  },
  {
    "skills": "scala",
    "avg_salary": "124903.00"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123878.75"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500.00"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619.25"
  }
]
*/