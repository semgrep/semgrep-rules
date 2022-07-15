package com.r2c.tests;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.boot.autoconfigure.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


@RestController
@EnableAutoConfiguration
public class TestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(TestController.class);

    @RequestMapping(value = "/test1", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test1(@RequestBody String name) {
        // ruleid: tainted-sql-string
        String sql = "SELECT * FROM table WHERE name = " + name + ";";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs
    }

    @RequestMapping(value = "/test2", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test2(@RequestBody String name) {
        // ruleid: tainted-sql-string
        String sql = String.format("SELECT * FROM table WHERE name = %s;", name);
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs
    }

    @RequestMapping(value = "/test3", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test3(@RequestBody String name) {
        String sql = "SELECT * FROM table WHERE name = ";
        // ruleid: tainted-sql-string
        sql.concat(name + ";");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs
    }

    @RequestMapping(value = "/test4", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test4(@RequestBody String name) {
        StringBuilder sql = new StringBuilder("SELECT * FROM table WHERE name = ");
        // ruleid: tainted-sql-string
        sql.append(name + ";");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql.toString());
        return rs
    }

    @RequestMapping(value = "/test5", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test5(@RequestBody String name) {
        String sql = "SELECT * FROM table WHERE name = ";
        // ruleid: tainted-sql-string
        sql += name + ";";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs
    }

    @RequestMapping(value = "/ok1", method = RequestMethod.POST, produces = "plain/text")
    ResultSet ok1(@RequestBody String name) {
        // ok: tainted-sql-string
        String sql = "SELECT * FROM table WHERE name = 'everyone';";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs
    }

    @RequestMapping(value = "/ok2", method = RequestMethod.POST, produces = "plain/text")
    ResultSet ok2(@RequestBody String name) {
        String sql = "SELECT * FROM table WHERE name = 'everyone';";
        // ok: tainted-sql-string
        System.out.println(String.format("Got request from %s", name));
        // ok: tainted-sql-string
        System.out.println("select noise for tests using tainted name:" + name);
        // ok: tainted-sql-string
        Logger.debug("Create noise for tests using tainted name:" + name);
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs
    }
}
