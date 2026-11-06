{{ config( materialized = 'incremental' ) }}
{# this is the modular way of loading , in bookings its just for understanding jinja #}

SELECT * FROM {{ source('staging','hosts') }}

{% if is_incremental() %}
    WHERE CREATED_AT > (SELECT COALESCE(MAX( CREATED_AT ),'1900-01-01') FROM {{ this }})
{% endif %}