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
Here are a few quick insights from the top 10 data analyst jobs in Israel:

Geographic Concentration in Central High-Tech Hubs: 70% of the postings are concentrated in Tel Aviv-Yafo, 
with the remaining 30% located in nearby central tech hubs (Herzliya and Ramat Hasharon).

Dominance of Cybersecurity & Scale-Up Unicorns: Leading Israeli tech scale-ups and cybersecurity giants dominate hiring for these roles, 
with AppsFlyer and Armis Security accounting for multiple top positions, alongside major players like Wix, Riskified, and Similarweb.

Highly Standardized Compensation Packages: 9 out of 10 listings share an identical annual salary benchmark of $111,175, 
indicating a tightly standardized compensation band across these top-tier Israeli roles regardless of specific domain focus 
(ranging from threat intelligence to marketing analytics).
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
