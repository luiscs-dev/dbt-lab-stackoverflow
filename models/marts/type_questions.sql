select
    extract(year from created_at) year_question,
    if(title like '%?', 'ends with ?', 'does not') ends_with_question,
    round(count(accepted_answer_id) * 100 / count(*), 2) as answered,
    round(avg(answer_count), 3) as avg_answers
from 
    {{ ref("stg_posts_questions") }}
where
    created_at < (select max(created_at) from {{ ref("stg_posts_questions") }})
group by 
    1, 2
order by 
    1, 2
