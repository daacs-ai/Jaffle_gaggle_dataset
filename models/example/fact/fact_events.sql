SELECT
    u.user_id,
    u.user_email,
    u.gaggle_id,
    e.event_name,
    COUNT(*) AS event_count,
    MIN(e.timestamp) AS first_event_time,
    MAX(e.timestamp) AS last_event_time
FROM {{ source('jaffle_gaggle', 'raw_event') }} e
LEFT JOIN {{ ref('dim_users') }} u
    ON e.user_id = u.user_id
GROUP BY
    u.user_id,
    u.user_email,
    u.gaggle_id,
    e.event_name
