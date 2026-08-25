select
    user_id,
    book_id,
    rating,
    loaded_at
from {{ ref('stg_ratings') }}
where book_id in (select book_id from {{ ref('dim_books') }})  -- referential integrity direct în model