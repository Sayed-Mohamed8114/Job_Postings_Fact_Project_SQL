# Introduction

📊 Dive into the data job market! focusing on data analyst roles, this project explores
💰 top-paying-jobs,in-demand skills,📈 where high demands meets high salary in data analystics 💡.

SQL queries ? check them out here : [project sql folder](/project_sql/)

# Background

Driven by a guest to navigate the data analyst job market more effectively , this project was born from a desire to pinpoint top-paid and in-demand skills, stremlinig others work to find optimal jobs.

### the question i answered through my sql queries were :

1. what are the top-paying data analyst jobs?
2. what skills are required fro these top-paying jobs?
3. what skills are most in demand for data analysts?
4. which skills are associated with higher salaries?
5. what are the most optimal skills to learn?

# Tools i used

for my deep dive into the data analysis job market, i harnessed the power of several key tools:

- **SQL**: the backbone of my analysis , allowing me to query the database and unearth critical insights.
- **PostgreSQL**: the chosen database management system , ideal for handling the job posting data.
- **Visual Studio Code**: My go-to for database management and executing SQL queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis , ensuring collaboration and project tracking.

# The Analysis

Each query for this project aimed at investigating specific aspects of the data analyst job market.
here's how i approached each question :

### 1.top paying data analyst jobs

to identify the highest-paying roles , i filtered the data anlyst positions by average yearly salary and location , focusing on remote jobs. this query highlights the high paying opportinuities in the field.

```sql
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
```

here's the breakdown of the top data analyst jobs in 2023 :

- **Wide salary range:** top 10 paying data analyst roles span from $184,000 to $650,000 ,including significant salary potential in the field.
- **Diverse Employers:** Companies like SmartAsset , Meta , and AT&T are among those offering high salacies m showing a broad interest across different industries.
- **Job Title Variety:** there's a high diversity in job titles , from Data Analyst to Director of Analytics , reflecting Varied roles and specializations within data analytics.

Bar graph visualizing the salary for the top 10 salaries for data analysts ; **i generated this with python libraries like matplotlib and pandas**

# What I Learned

through this adventure , i've turbocharged my SQL toolkit with some serious firepower:

- **complex query crafting:** mastered the art of advanced sql , merging tables like a pro and wielding with clauses for ninja-level temp table maneuvers.
- **Data aggregation:** got crazy with group by and turned aggregate functions like count()
  and avg() into my data-summarizing sidekicks.
- **Analytical wizardry:** leveled up my real-world puzzle-solving skills, turning questions into actinoable ,insightful sql queries .

# Conclusions

1. **Top-Paying Data Analyst jobs:**
   the highest-paying jobs for data analysts that allow remote work offer a wide range of salaries , the highest at $650,000.

2. **skills for top-paying jobs:** high-paying data analysts jobs require advanced proficiency in SQL , suggesting it's a critical skill for earning a top salary.

3. **Most in-demand skills:** SQL is also the most demand skill in the data analyst job market , thus making it essential for job seekers.

4. **skills with higher salaries:** specialized skills , such as SVN and solidity ,are associated with the highest average salaries , indicating a premium on niche expertise.

5.**optimal skills for job market value:** SQL leads in demand and offers for a high average salary , positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.
