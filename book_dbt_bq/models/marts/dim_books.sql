select
    book_id,
    title,
    publication_year,
    average_rating,
    ratings_count,
    pages,
    language_code,
    cast(floor(publication_year / 10) * 10 as int64) as decade_published
from {{ ref('int_books_cleaned') }}