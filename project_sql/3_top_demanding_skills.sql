/*
Question: What are the most in-demand skills for data analyst?
- Join job postings to inner join table similar to query 2.
- Identify the top 10 in-demand skills for a data analyst.
- Focus on job posting location within Israel.
- Why? Retrieves the top 10 skills with the highest demand in the job market,
     providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    count(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location LIKE '%Israel%'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10;

/*
[
  {
    "skills": "sql",
    "demand_count": "628"
  },
  {
    "skills": "python",
    "demand_count": "395"
  },
  {
    "skills": "tableau",
    "demand_count": "243"
  },
  {
    "skills": "excel",
    "demand_count": "171"
  },
  {
    "skills": "power bi",
    "demand_count": "118"
  },
  {
    "skills": "looker",
    "demand_count": "94"
  },
  {
    "skills": "r",
    "demand_count": "85"
  },
  {
    "skills": "pandas",
    "demand_count": "60"
  },
  {
    "skills": "aws",
    "demand_count": "46"
  },
  {
    "skills": "snowflake",
    "demand_count": "45"
  }
]
*/
