/*
Question: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrates on remote positions with specified salaries.
- Why? Targets skills that offer job securiry (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis.
*/

WITH skills_demand AS
(    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) AS demand_count
    FROM
        job_postings_fact
    JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location LIKE '%Israel%'
    GROUP BY
        skills_dim.skill_id
), average_salary AS
(    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact
    JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location LIKE '%Israel%'
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC, avg_salary DESC;

-- rewrite the same query more concisely
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%Israel%'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 1
ORDER BY
    demand_count DESC, avg_salary DESC;

/*
[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "17",
    "avg_salary": "92344"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "14",
    "avg_salary": "99807"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "6",
    "avg_salary": "93324"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "4",
    "avg_salary": "95091"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "2",
    "avg_salary": "108088"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "2",
    "avg_salary": "93196"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "2",
    "avg_salary": "82095"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "2",
    "avg_salary": "79007"
  }
]
*/