select
    id as post_id,
    creation_date as created_at,
    'answer' as type,
    title,
    body,
    owner_user_id,
    cast(parent_id as string) as parent_id
from 
    {{ source("raw", "posts_answers") }}
where 
    creation_date >= timestamp("2022-09-01")
