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
        return rs;
    }

    @RequestMapping(value = "/test2", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test2(@RequestBody String name) {
        // ruleid: tainted-sql-string
        String sql = String.format("SELECT * FROM table WHERE name = %s;", name);
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
    }

    @RequestMapping(value = "/test3", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test3(@RequestBody String name) {
        String sql = "SELECT * FROM table WHERE name = ";
        // ruleid: tainted-sql-string
        sql.concat(name + ";");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
    }

    @RequestMapping(value = "/test4", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test4(@RequestBody String name) {
        StringBuilder sql = new StringBuilder("SELECT * FROM table WHERE name = ");
        // ruleid: tainted-sql-string
        sql.append(name + ";");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql.toString());
        return rs;
    }

    @RequestMapping(value = "/test5", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test5(@RequestBody String name) {
        String sql = "SELECT * FROM table WHERE name = ";
        // ruleid: tainted-sql-string
        sql += name + ";";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
    }

    @RequestMapping(value = "/test5", method = RequestMethod.POST, produces = "plain/text")
    ResultSet test5(@RequestBody String name) {
        try {
            // ok: tainted-sql-string
            throw new Exception(String.format("Update request from %s to %s isn't allowed",
            name, bar
            ));
        }
        catch (NullPointerException e) {
            System.out.println("Caught inside fun().");
            throw e; // rethrowing the exception
        }
    }

    @RequestMapping(value = "/ok1", method = RequestMethod.POST, produces = "plain/text")
    ResultSet ok1(@RequestBody String name) {
        // ok: tainted-sql-string
        String sql = "SELECT * FROM table WHERE name = 'everyone';";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
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
        return rs;
    }

    @RequestMapping(value = "/testok3", method = RequestMethod.POST, produces = "plain/text")
    ResultSet ok3(@RequestBody Integer name) {
        String sql = "SELECT * FROM table WHERE name = ";
        // ok: tainted-sql-string
        sql += name + ";";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
    }

    @RequestMapping(value = "/testok4", method = RequestMethod.POST, produces = "plain/text")
    ResultSet ok4(@RequestBody Boolean name) {
        String sql = "SELECT * FROM table WHERE name = ";
        // ok: tainted-sql-string
        sql += name + ";";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
    }

    @RequestMapping(value = "/testok5", method = RequestMethod.POST, produces = "plain/text")
    ResultSet ok5(@RequestBody String name) {
        String sql = "SELECT * FROM table WHERE name = ";
        // ok: tainted-sql-string
        sql += (name.substring(2,3) != "hello".substring(2,3)) + ";";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
    }

    @RequestMapping(value = "/testok6", method = RequestMethod.POST, produces = "plain/text")
    ResultSet ok6(@RequestBody String name) {
        String sql = "SELECT * FROM table WHERE name = ";
        // ok: tainted-sql-string
        sql += ("hello".substring(2,3) == name.substring(2,3)) + ";";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
    }
}

class Bar {
  int x;

  public int getX() {
    return x;
  }
}

class Foo {
  List<Bar> bars;

  public List<Bar> getBars(String name) {
    return bars;
  }
}

class Test {
  @RequestMapping(value = "/testok6", method = RequestMethod.POST, produces = "plain/text")
  public ResultSet ok7(@RequestBody String name, Foo foo) {
        var v = foo.getBars(name).get(0).getX();
        String sql = "SELECT * FROM table WHERE name = ";
        // ruleid: deepok: tainted-sql-string
        sql += v + ";";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
  }
}

@Getter
@Setter
public class SiteModel {
	private List<PrefixSiteIds> prefixes;
    public List<PrefixSiteIds> getPrefixes(String name) {
        return prefixes;
    }
}

@Getter
@Setter
public class PrefixSiteIds {

	public SiteIds sites;
}
@Getter
@Setter
public class SiteIds {
	public Set<Integer> ids = new HashSet<>();
}

class Test2 {
  @RequestMapping(value = "/testok8", method = RequestMethod.POST, produces = "plain/text")
  public ResultSet ok8(@RequestBody String name, SiteModel sitemodel) {
        var v = sitemodel.getPrefixes(name).sites.ids.get(0);
        String sql = "SELECT * FROM table WHERE name = ";
        // ruleid: deepok: tainted-sql-string
        sql += v + ";";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.execute(sql);
        return rs;
  }
}
