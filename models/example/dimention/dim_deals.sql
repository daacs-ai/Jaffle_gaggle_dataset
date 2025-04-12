SELECT
    deal_name,
    deal_stage,
    close_date,
    CAST(REPLACE(amount, '$', '') AS Float64) AS amount,
    regexpExtract(email, '@(.*)$') AS original_deal_domain
FROM {{ source('jaffle_gaggle', 'deals') }}
