
SELECT
    *
FROM
    {{ ref('src_listings') }}
WHERE minimum_nights < 1
LIMIT 10