{{
  config(
    materialized = 'incremental',
    unique_key = 'BOOKING_ID',
    incremental_stratergy = 'merge'
    )
}}

SELECT 
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    {{ multiply('NIGHTS_BOOKED','BOOKING_AMOUNT',2) }} AS TOTAL_BOOKING_AMOUNT,
    CLEANING_FEE,
    SERVICE_FEE, 
    BOOKING_STATUS,
    CREATED_AT
FROM 
    {{ ref('bronze_bookings') }}

{% if is_incremental() %}

WHERE NOT EXISTS (
    SELECT 1
    FROM {{ this }} AS TARGET
    WHERE TARGET.BOOKING_ID = bronze_bookings.BOOKING_ID
)

{% endif %}