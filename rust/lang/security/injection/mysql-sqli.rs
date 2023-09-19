fn mysql_query_first() {
    //due to the inside rule not working we will need to come back to this
    //todoruleid: mysql-sqli
    conn.query_first(format!("SELECT {} from tmp", "x"));
}

fn mysql_query_first1() {
    //ruleid: mysql-sqli
    conn.query_first(x + y);
}
