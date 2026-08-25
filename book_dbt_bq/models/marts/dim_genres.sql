select distinct
    trim(genre_name) as genre_name
from {{ ref('int_books_cleaned') }},
    unnest(split(genres, ',')) as genre_name
where trim(genre_name) != ''