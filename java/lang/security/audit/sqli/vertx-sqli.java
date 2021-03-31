package testcode.sqli;

import io.vertx.sqlclient.SqlClient;
import io.vertx.sqlclient.SqlConnection;

public class VertxSqlClient {

    public void injection1(SqlClient client, String injection) {
        // ruleid: vertx-sqli
        client.query(injection);
    }

    public void injection2(SqlClient client, String injection) {
        // ruleid: vertx-sqli
        client.preparedQuery(injection);
    }

    public void injection3(SqlConnection conn, String injection) {
        // ruleid: vertx-sqli
        conn.prepare(injection);
    }

    public void injection4(SqlConnection conn, String injection) {
        // ruleid: vertx-sqli
        conn.prepare(injection, null);
    }

    public void falsePositive1(SqlClient client) {
        String constantValue = "SELECT * FROM test";
        // ok: vertx-sqli
        client.query(constantValue);
    }

    public void falsePositive2(SqlConnection conn) {
        String constantValue = "SELECT * FROM test";
        // ok: vertx-sqli
        conn.query(constantValue);
    }
}
