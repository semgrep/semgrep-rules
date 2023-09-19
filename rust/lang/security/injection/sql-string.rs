use std::env;

use sqlx::postgres::PgPool;

//todoruleid: sql-string
fn main() -> Result<(), sqlx::Error> {
    let a = requests::get("http://example.org/get").unwrap();
    let pool = PgPoolOptions::new()
        .max_connections(5)
        .connect(&env::var("DATABASE_URL")?)
        .await?;

    let row: (i64,) = sqlx::query_as("SELECT $1").bind(a).fetch_one(&pool).await?;

    assert_eq!(row.0, 150);

    Ok(())
}
