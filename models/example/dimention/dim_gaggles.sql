SELECT
    rg.id AS gaggle_id,
    rg.name AS gaggle_name,
    rg.created_at AS gaggle_created_at
FROM {{ source('jaffle_gaggle', 'raw_gaggle') }} rg
