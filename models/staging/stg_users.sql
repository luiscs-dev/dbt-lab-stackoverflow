{{ config(materialized="incremental") }}

with
    source as (
        select
            id as user_id,
            age,
            creation_date,
            website_url,
            round(
                timestamp_diff(current_timestamp(), creation_date, day) / 365
            ) as user_tenure
        from 
            {{ source("raw", "users") }}
    )

select 
    *
from 
    source
{% if is_incremental() %}
-- this filter will only be applied on an incremental run
    where creation_date > (select max(creation_date) from {{ this }})
{% endif %}
