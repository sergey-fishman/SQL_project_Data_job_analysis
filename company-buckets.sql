/*
Determine the size category ('Small', 'Medium' or 'Large') for each company by first identifying
the number of job postings they have. Use a subquery to calculate the total job postings per company.
A company is considered 'Small' if it has less than 10 job postings, 'Medium' if the number of job postings
is between 10 and 50, and 'Large' if it has more than 50 job postings.
Implement a subquery to aggregate job counts per company before classifying them based on size.
*/

WITH company_buckets AS 
    (
    SELECT
        company_id,
        count(job_id),
        CASE
            WHEN count(job_id) < 10 THEN 'Small Company'
            WHEN count(job_id) BETWEEN 10 AND 50 THEN 'Medium Company'
            ELSE 'Large Company'
        END AS company_category
    FROM
        job_postings_fact
    GROUP BY
        company_id
    )

SELECT
    name,
    company_category
FROM
    company_dim
LEFT JOIN company_buckets
    ON company_dim.company_id = company_buckets.company_id;