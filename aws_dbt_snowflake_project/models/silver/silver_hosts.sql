{{ config( materialized = 'incremental', unique_key = 'HOST_ID', incremental_stratergy = 'merge') }}

SELECT
    HOST_ID,
    REPLACE(HOST_NAME,' ','_') AS HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CASE 
        WHEN RESPONSE_RATE > 95 THEN 'VERY GOOD'
        WHEN RESPONSE_RATE > 80 THEN 'GOOD'
        WHEN RESPONSE_RATE > 60 THEN 'FAIR'
        ELSE 'POOR'
    END AS RESPONSE_RATE_QUALITY,
    CREATED_AT
FROM
    {{ ref('bronze_hosts') }}

{% if is_incremental() %}

WHERE NOT EXISTS (
    SELECT 1
    FROM {{ this }} AS TARGET
    WHERE TARGET.HOST_ID = bronze_hosts.HOST_ID
)

{% endif %}