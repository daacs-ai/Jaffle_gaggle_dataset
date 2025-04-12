SELECT DISTINCT
    regexpExtract(user_email, '@(.*)$') AS company_domain
FROM {{ ref('dim_users') }}

UNION DISTINCT

SELECT DISTINCT
    new_domain AS company_domain
FROM {{ source('jaffle_gaggle', 'merged_company_domain') }}
