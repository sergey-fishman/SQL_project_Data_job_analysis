/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available within Israel.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment opportunities.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
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
LIMIT 10;

/*
Here are a few quick insights from the top 10 data analyst jobs in Israel:

Geographic Concentration in Central High-Tech Hubs: 70% of the postings are concentrated in Tel Aviv-Yafo, 
with the remaining 30% located in nearby central tech hubs (Herzliya and Ramat Hasharon).

Dominance of Cybersecurity & Scale-Up Unicorns: Leading Israeli tech scale-ups and cybersecurity giants dominate hiring for these roles,
 with AppsFlyer and Armis Security accounting for multiple top positions, alongside major players like Wix, Riskified, and Similarweb.

Highly Standardized Compensation Packages: 9 out of 10 listings share an identical annual salary benchmark of $111,175, 
indicating a tightly standardized compensation band across these top-tier Israeli roles regardless of specific domain focus (ranging from threat intelligence to marketing analytics).
[
  {
    "job_id": 190436,
    "job_title": "Data Analyst",
    "job_location": "Herzliya, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-09 13:48:42",
    "company_name": "AppsFlyer"
  },
  {
    "job_id": 473092,
    "job_title": "Business/Data Analyst - Wix Marketing",
    "job_location": "Ramat Hasharon, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-14 12:51:10",
    "company_name": "Wix"
  },
  {
    "job_id": 1219044,
    "job_title": "Data Analyst Student - Part Time Position",
    "job_location": "Tel Aviv-Yafo, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-04-25 13:36:19",
    "company_name": "BigID"
  },
  {
    "job_id": 1183340,
    "job_title": "Senior Threat Intelligence & Data analyst",
    "job_location": "Tel Aviv-Yafo, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-05 13:34:47",
    "company_name": "Armis Security"
  },
  {
    "job_id": 182605,
    "job_title": "Data Analyst",
    "job_location": "Tel Aviv-Yafo, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-05 14:55:01",
    "company_name": "Riskified"
  },
  {
    "job_id": 461074,
    "job_title": "Partner Data Analyst",
    "job_location": "Herzliya, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-16 16:28:01",
    "company_name": "AppsFlyer"
  },
  {
    "job_id": 349773,
    "job_title": "Data Analyst",
    "job_location": "Tel Aviv-Yafo, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-13 17:27:00",
    "company_name": "Armis Security"
  },
  {
    "job_id": 198545,
    "job_title": "Data Analyst",
    "job_location": "Tel Aviv-Yafo, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-01-26 20:40:06",
    "company_name": "Similarweb"
  },
  {
    "job_id": 1210541,
    "job_title": "Data Analyst",
    "job_location": "Tel Aviv-Yafo, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-05 04:26:32",
    "company_name": "At-Bay"
  },
  {
    "job_id": 158336,
    "job_title": "Machine Learning Data Analyst",
    "job_location": "Tel Aviv-Yafo, Israel",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 17:29:48",
    "company_name": "Hello Heart"
  }
]
*/