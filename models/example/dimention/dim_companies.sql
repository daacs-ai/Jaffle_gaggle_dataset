SELECT DISTINCT
    regexpExtract(user_email, '@(.*)$') AS company_domain
FROM {{ ref('dim_users') }}

UNION DISTINCT

SELECT DISTINCT
    new_domain AS company_domain
FROM {{ source('jaffle_gaggle', 'merged_company_domain') }}

-- This model builds a master list of all company domains found from:

-- Extracted domains from users (via dim_users)