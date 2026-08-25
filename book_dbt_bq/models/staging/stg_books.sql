select
    cast(book_id as int64) as book_id,
    title,
    regexp_replace(authors, r"[\[\]']", "") as authors,      -- ex: "Bill O'Reilly, Martin Dugard"
    regexp_replace(genres, r"[\[\]']", "") as genres,       -- ex: "history, nonfiction, biography"
    cast(original_publication_year as int64) as publication_year,
    cast(average_rating as float64) as average_rating,
    cast(ratings_count as int64) as ratings_count,
    cast(pages as int64) as pages,
    language_code,
    description
from {{ source('raw', 'books_raw') }}