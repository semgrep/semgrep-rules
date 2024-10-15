fn sqlx_sqli() {
    //todoruleid: sqlx-sqli
    sqlx::query!(format!("SELECT {} from tmp", "x"));
}

fn sqlx_sqli1() {
    //ruleid: sqlx-sqli
    sqlx::query!(x + y);
}
