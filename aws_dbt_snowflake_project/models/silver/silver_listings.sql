{{
  config(
    materialized = 'incremental',
    unique_keys = 'LISTING_ID',
    incremental_stratergy = 'merge'
    )
}}

SELECT
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
    {{ tag('CAST(PRICE_PER_NIGHT AS INT)') }} as PRICE_PER_NIGHT_TAG,
    CREATED_AT
FROM
    {{ ref('bronze_listings') }}

{% if is_incremental() %}

WHERE NOT EXISTS (
    SELECT 1
    FROM {{ this }} AS TARGET
    WHERE TARGET.LISTING_ID = bronze_listings.LISTING_ID
)

{% endif %}