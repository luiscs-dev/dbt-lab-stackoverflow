select
    id as post_id,
    creation_date as created_at,
    'question' as type,
    title,
    body,
    accepted_answer_id,
    answer_count,
    owner_user_id,
    parent_id,
    tags
from 
    {{ source("raw", "posts_questions") }}
where 
    creation_date >= timestamp("2022-09-01")
