select 
    id as badge_id, 
    name as badge_name, 
    date as award_timestamp, 
    user_id
from 
    {{ source("raw", "badges") }}
