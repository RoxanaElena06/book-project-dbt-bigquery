select distinct
    trim(author_name) as author_name
from {{ ref('int_books_cleaned') }},
    unnest(split(authors, ',')) as author_name