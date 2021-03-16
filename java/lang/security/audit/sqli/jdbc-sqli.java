package testcode.sqli;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Jdbc {

    Connection con;

    public void query1(String input) throws SQLException {
        Statement stmt = con.createStatement();
        // ruleid: jdbc-sqli
        ResultSet rs = stmt.executeQuery("select * from Users where name = '"+input+"'");
    }

    public void query2(String input) throws SQLException {
        Statement stmt = con.createStatement();
        String sql = "select * from Users where name = '" + input + "'";
        // ruleid: jdbc-sqli
        ResultSet rs = stmt.executeQuery(sql);
    }

    public void query3(String input) throws SQLException {
        Statement stmt = con.createStatement();
        // ruleid: jdbc-sqli
        ResultSet rs = stmt.executeQuery(String.format("select * from Users where name = '%s'",input));
        // ok: jdbc-sqli
        ResultSet rs2 = stmt.executeQuery("select * from Users where name = '123'");
    }

    public void query4(String input) throws SQLException {
        Statement stmt = con.createStatement();
        String sql = "select * from Users where name = '%s'";
        // ruleid: jdbc-sqli
        ResultSet rs = stmt.executeQuery(String.format(sql,input));
    }

    public void executeQuerySamples(String sql) throws SQLException {
        Statement stmt = con.createStatement();
        // ruleid: jdbc-sqli
        stmt.executeQuery(sql);
        // ruleid: jdbc-sqli
        stmt.execute(sql);
        // ruleid: jdbc-sqli
        stmt.execute(sql, Statement.RETURN_GENERATED_KEYS);
        // ruleid: jdbc-sqli
        stmt.execute(sql, new int[]{1, 2, 3});
        // ruleid: jdbc-sqli
        stmt.execute(sql, new String[]{"firstname", "middlename", "lastname"});
    }

    public void executeUpdateSamples(String sql) throws SQLException {
        Statement stmt = con.createStatement();
        // ok: jdbc-sqli
        stmt.executeUpdate("select * from Users where name = '123'");
        // ruleid: jdbc-sqli
        stmt.executeUpdate(sql);
        // ruleid: jdbc-sqli
        stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
        // ruleid: jdbc-sqli
        stmt.executeUpdate(sql, new int[]{1, 2, 3});
        // ruleid: jdbc-sqli
        stmt.executeUpdate(sql, new String[]{"firstname", "middlename", "lastname"});
    }


    public void executeExecuteLargeUpdateSamples(String sql) throws SQLException {
        Statement stmt = con.createStatement();
        // ruleid: jdbc-sqli
        stmt.executeLargeUpdate(sql);
        // ruleid: jdbc-sqli
        stmt.executeLargeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
        // ruleid: jdbc-sqli
        stmt.executeLargeUpdate(sql, new int[]{1, 2, 3});
        // ruleid: jdbc-sqli
        stmt.executeLargeUpdate(sql, new String[]{"firstname", "middlename", "lastname"});
    }

    public void otherSamples(String sql) throws SQLException {
        con.nativeSQL(sql);
        Statement stmt = con.createStatement();
        // ruleid: jdbc-sqli
        stmt.addBatch(sql);
        String sqlString = "select * from Users where name = '123'";
        // ok: jdbc-sqli
        stmt.addBatch(sqlString);
    }

}
