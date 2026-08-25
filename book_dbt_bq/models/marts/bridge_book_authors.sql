select
    b.book_id,
    trim(author_name) as author_name
from {{ ref('int_books_cleaned') }} b,
    unnest(split(b.authors, ',')) as author_name