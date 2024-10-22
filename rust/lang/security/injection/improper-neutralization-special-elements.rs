use std::env;

use sqlx::postgres::PgPool;

//ruleid: improper_neutralization_special_elements
fn main() -> Result<(), sqlx::Error> {
    let query = requests::get("http://example.com/get").unwrap();
    let result_type = requests::get("http://example.com/get").unwrap();
    // Create a connection pool
    //  for MySQL, use MySqlPoolOptions::new()
    //  for SQLite, use SqlitePoolOptions::new()
    //  etc.
    let pool = PgPoolOptions::new()
        .max_connections(5)
        .connect(&env::var("DATABASE_URL")?)
        .await?;
    // Make a simple query to return the given parameter
    let row: (i64,) = sqlx::query_as(format!("SELECT {}", query))
        .bind(result_type)
        .fetch_one(&pool)
        .await?;

    assert_eq!(row.0, 180);

    Ok(())
}
