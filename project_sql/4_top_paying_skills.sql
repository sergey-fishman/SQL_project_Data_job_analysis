/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries in Israel.
- Why? It reveals how different skills impact salary levels for Data Analyst and
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location LIKE '%Israel%'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
Here are 3 key insights into the top-paying data analyst skills in Israel:
Enterprise Compliance & Cloud Warehousing Command Top Dollar: Governance and cloud infrastructure lead the market, with GDPR and Snowflake tied at the highest average salary ($111,175), reflecting high compensation for data privacy compliance and enterprise architecture.
Data Science & Python Ecosystem Outpaces Traditional BI: Programmatic and statistical tools (R at $108,088, Pandas/NumPy at $105,000, and Python at $99,807) consistently pay more than traditional reporting tools like Tableau ($93,324), Power BI ($93,196), SQL ($92,344), and Excel ($79,007).
High Salary Floor for Core Analytics vs. Utility Cloud Terms: Most specialized data tools cluster firmly between $80,000 and $111,000, while broad cloud keywords like AWS and BigQuery sit at the lower end ($53,014), likely due to their frequent inclusion in lower-level or junior job descriptions.
[
  {
    "skills": "gdpr",
    "avg_salary": "111175"
  },
  {
    "skills": "snowflake",
    "avg_salary": "111175"
  },
  {
    "skills": "r",
    "avg_salary": "108088"
  },
  {
    "skills": "numpy",
    "avg_salary": "105000"
  },
  {
    "skills": "pandas",
    "avg_salary": "105000"
  },
  {
    "skills": "jupyter",
    "avg_salary": "100500"
  },
  {
    "skills": "python",
    "avg_salary": "99807"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "98500"
  },
  {
    "skills": "go",
    "avg_salary": "95091"
  },
  {
    "skills": "tableau",
    "avg_salary": "93324"
  },
  {
    "skills": "power bi",
    "avg_salary": "93196"
  },
  {
    "skills": "sql",
    "avg_salary": "92344"
  },
  {
    "skills": "looker",
    "avg_salary": "82095"
  },
  {
    "skills": "excel",
    "avg_salary": "79007"
  },
  {
    "skills": "nosql",
    "avg_salary": "72000"
  },
  {
    "skills": "aws",
    "avg_salary": "53014"
  },
  {
    "skills": "bigquery",
    "avg_salary": "53014"
  }
]
*/