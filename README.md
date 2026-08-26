# 📚 Book Insights — Data Platform (ELT + Analytics)
Project built on the [goodbooks-10k](https://github.com/zygmuntz/goodbooks-10k) dataset (~10,000 books, millions of ratings), showcasing a modern ELT pipeline, dimensional modeling, automated testing, orchestration and an BI dashboard.

## 🏗️ Architecture
CSV files → BigQuery (RAW) → dbt (staging → intermediate → marts) → BigQuery (CURATED) → Power BI

| Layer | Tool |
|---|---|
| Data warehouse | Google BigQuery|
| Transformation | dbt Core |
| Orchestration | GitHub Actions (scheduled daily) |
| Testing & documentation | dbt tests + dbt docs |
| Visualization | Power BI |

** 📖 Full dbt documentation & lineage graph:** [https://roxanaelena06.github.io/book-project-dbt-bigquery/](https://roxanaelena06.github.io/book-project-dbt-bigquery/)

## 🔄 Why this stack (migration story)
This project originally used **Matillion + Snowflake** for a low-code ELT approach — see [book-project-snowflake-matillion](https://github.com/RoxanaElena06/book-project-snowflake-matillion.git) for that version. It was migrated to **dbt + BigQuery** to:
- Avoid paid trial limitations (Matillion trial expired, Snowflake credits) with a genuinely free, permanent stack
- Practice a tool (dbt) that is significantly more in demand in the current data job market

Same star schema, same business logic — more production-realistic tooling.

## ⭐ Data model
- **`dim_books`** — book details (title, rating, pages, publication year, decade)
- **`dim_authors`** / **`bridge_book_authors`** — authors, linked many-to-many to books
- **`dim_genres`** / **`bridge_book_genres`** — curated genre list, linked many-to-many to books
- **`fact_ratings`** — individual user ratings

## ✅ Data quality
Automated dbt tests enforce:
- Uniqueness and non-null constraints on primary keys
- Referential integrity between `fact_ratings` and `dim_books`
- Valid rating range (1–5)

## ⏰ Orchestration
The pipeline runs automatically every day via **GitHub Actions** [`.github/workflows/dbt_run.yml`]([.github/workflows/dbt_run.yml](https://github.com/RoxanaElena06/book-project-dbt-bigquery/actions/workflows/dbt_run.yml)), executing `dbt run` and `dbt test` against BigQuery using a service account.

## 📊 Dashboard
Built in Power BI, across two pages:
**Overview** — high-level trends: rating by genre, ratings volume by genre, rating trend by publication year, top authors by book count.
**Details** — interactive exploration: most popular genre (treemap), top books by page count, author "polarization" analysis (rating variance) and a searchable book lookup showing rating counts.
The full interactive report is available as a `.pbix` file at [`powerbi/book_insights.pbix`](powerbi/book_insights.pbix) — open it in the free [Power BI Desktop](https://www.microsoft.com/en-us/power-platform/products/power-bi/downloads) to explore it live. PDF exports are also available in [`docs/`](docs/).