select
    cast(user_id as int64) as user_id,
    cast(book_id as int64) as book_id,
    cast(rating as int64) as rating,
    current_timestamp() as loaded_at
from {{ source('raw', 'ratings_raw') }}