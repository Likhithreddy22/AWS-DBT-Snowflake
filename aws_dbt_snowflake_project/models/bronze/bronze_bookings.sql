{# {% set incremental_flag = 1 %} 
initializing incremental_flag

{% set incremental_col = 'CREATED_AT' %} 
initializing incremental_col and setting its value for created_at col

SELECT * FROM {{ source('staging','bookings') }}
it is the select statement , it will load all the data when the where clause below satisifies

{% if incremental_flag ==1 %}
    WHERE {{ incremental_col }} > (SELECT COALESCE(MAX({{ incremental_col }}),'1900-01-01') FROM {{ this }})
{% endif %} #}

{{ config( materialized = 'incremental' ) }}

SELECT * FROM {{ source('staging', 'bookings') }}

{% if is_incremental() %}
    WHERE CREATED_AT > (SELECT COALESCE(MAX( CREATED_AT ),'1900-01-01') FROM {{ this }})
{% endif %}