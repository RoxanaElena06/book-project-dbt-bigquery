select distinct
    book_id,
    trim(title) as title,
    authors,
    genres,
    publication_year,
    average_rating,
    ratings_count,
    pages,
    language_code,
    description
from {{ ref('stg_books') }}
where book_id is not null
  and average_rating between 0 and 5