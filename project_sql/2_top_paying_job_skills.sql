/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from the first query.
- Add a specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS 
(   SELECT
        job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim 
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location LIKE '%Israel%'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM 
    top_paying_jobs
JOIN skills_job_dim
    ON top_paying_jobs.job_id = skills_job_dim.job_id
JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg;

/*
Key Insights & Skill Breakdown
1. Core Technical Languages Lead the Pack
Python (90% demand): Python appears in 9 out of 10 job postings, making it the single most requested skill in this dataset.
SQL (70% demand): SQL is required in 7 out of 10 postings, reinforcing its position as the foundational baseline for querying databases.

2. Business Intelligence & Data Visualization
Tableau (30% demand): Leads among BI tools in this dataset, appearing in 3 job postings.
Looker & Power BI (10% each): Each appears once across the listings, showing diversity in organization-specific BI stacks.

3. Specialized & Niche Skills
Statistical Programming: R appears in 2 job listings (20%).
Backend / Systems: Go appears in 2 job listings (20%).
Data Engineering & Libraries: Pandas, NumPy, Snowflake, and compliance standards like GDPR each appear once.
[
  {
    "job_id": 158336,
    "job_title": "Machine Learning Data Analyst",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 17:29:48",
    "company_name": "Hello Heart",
    "skills": "python"
  },
  {
    "job_id": 158336,
    "job_title": "Machine Learning Data Analyst",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 17:29:48",
    "company_name": "Hello Heart",
    "skills": "r"
  },
  {
    "job_id": 158336,
    "job_title": "Machine Learning Data Analyst",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 17:29:48",
    "company_name": "Hello Heart",
    "skills": "pandas"
  },
  {
    "job_id": 158336,
    "job_title": "Machine Learning Data Analyst",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 17:29:48",
    "company_name": "Hello Heart",
    "skills": "numpy"
  },
  {
    "job_id": 190436,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-09 13:48:42",
    "company_name": "AppsFlyer",
    "skills": "looker"
  },
  {
    "job_id": 473092,
    "job_title": "Business/Data Analyst - Wix Marketing",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-14 12:51:10",
    "company_name": "Wix",
    "skills": "sql"
  },
  {
    "job_id": 473092,
    "job_title": "Business/Data Analyst - Wix Marketing",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-14 12:51:10",
    "company_name": "Wix",
    "skills": "python"
  },
  {
    "job_id": 473092,
    "job_title": "Business/Data Analyst - Wix Marketing",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-14 12:51:10",
    "company_name": "Wix",
    "skills": "tableau"
  },
  {
    "job_id": 473092,
    "job_title": "Business/Data Analyst - Wix Marketing",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-14 12:51:10",
    "company_name": "Wix",
    "skills": "power bi"
  },
  {
    "job_id": 1219044,
    "job_title": "Data Analyst Student - Part Time Position",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-04-25 13:36:19",
    "company_name": "BigID",
    "skills": "gdpr"
  },
  {
    "job_id": 1183340,
    "job_title": "Senior Threat Intelligence & Data analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-05 13:34:47",
    "company_name": "Armis Security",
    "skills": "python"
  },
  {
    "job_id": 182605,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-05 14:55:01",
    "company_name": "Riskified",
    "skills": "sql"
  },
  {
    "job_id": 182605,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-05 14:55:01",
    "company_name": "Riskified",
    "skills": "python"
  },
  {
    "job_id": 182605,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-05 14:55:01",
    "company_name": "Riskified",
    "skills": "r"
  },
  {
    "job_id": 190436,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-09 13:48:42",
    "company_name": "AppsFlyer",
    "skills": "sql"
  },
  {
    "job_id": 461074,
    "job_title": "Partner Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-16 16:28:01",
    "company_name": "AppsFlyer",
    "skills": "python"
  },
  {
    "job_id": 461074,
    "job_title": "Partner Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-16 16:28:01",
    "company_name": "AppsFlyer",
    "skills": "go"
  },
  {
    "job_id": 349773,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-13 17:27:00",
    "company_name": "Armis Security",
    "skills": "sql"
  },
  {
    "job_id": 349773,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-13 17:27:00",
    "company_name": "Armis Security",
    "skills": "python"
  },
  {
    "job_id": 198545,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-01-26 20:40:06",
    "company_name": "Similarweb",
    "skills": "sql"
  },
  {
    "job_id": 198545,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-01-26 20:40:06",
    "company_name": "Similarweb",
    "skills": "python"
  },
  {
    "job_id": 1210541,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-05 04:26:32",
    "company_name": "At-Bay",
    "skills": "sql"
  },
  {
    "job_id": 1210541,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-05 04:26:32",
    "company_name": "At-Bay",
    "skills": "python"
  },
  {
    "job_id": 1210541,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-05 04:26:32",
    "company_name": "At-Bay",
    "skills": "snowflake"
  },
  {
    "job_id": 1210541,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-05 04:26:32",
    "company_name": "At-Bay",
    "skills": "tableau"
  },
  {
    "job_id": 461074,
    "job_title": "Partner Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-16 16:28:01",
    "company_name": "AppsFlyer",
    "skills": "sql"
  },
  {
    "job_id": 190436,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-09 13:48:42",
    "company_name": "AppsFlyer",
    "skills": "python"
  },
  {
    "job_id": 190436,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-09 13:48:42",
    "company_name": "AppsFlyer",
    "skills": "go"
  },
  {
    "job_id": 190436,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-09 13:48:42",
    "company_name": "AppsFlyer",
    "skills": "tableau"
  }
]
*/