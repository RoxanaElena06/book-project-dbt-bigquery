select distinct
    book_id,
    trim(genre_name) as genre_name
from {{ ref('int_books_cleaned') }},
    unnest(split(genres, ',')) as genre_name
where trim(genre_name) in (
    select genre_name from {{ ref('dim_genres') }}
)