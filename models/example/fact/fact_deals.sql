SELECT
    dcd.company_domain,
    dd.deal_stage,
    COUNT(*) AS deal_count,
    SUM(dd.amount) AS total_deal_amount,
    MIN(dd.close_date) AS first_close_date,
    MAX(dd.close_date) AS last_close_date
FROM {{ ref('dim_deals') }} dd
JOIN {{ ref('dim_companies') }} dcd
    ON dd.original_deal_domain = dcd.company_domain
GROUP BY
    dcd.company_domain,
    dd.deal_stage
