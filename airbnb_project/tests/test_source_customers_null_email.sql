SELECT *
FROM {{ source('sales_db', 'customers') }}
WHERE email IS NULL