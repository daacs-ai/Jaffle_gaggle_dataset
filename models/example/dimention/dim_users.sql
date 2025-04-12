SELECT
    ru.id AS user_id,
    ru.name AS user_name,
    COALESCE(mu.new_email, ru.email) AS user_email,
    ru.gaggle_id,
    ru.created_at AS user_created_at
FROM {{ source('jaffle_gaggle', 'raw_user') }} ru
LEFT JOIN {{ source('jaffle_gaggle', 'merged_user') }} mu
    ON ru.email = mu.old_email
