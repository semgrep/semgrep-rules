import java.lang.Runtime;

import org.springframework.jdbc.core.JdbcTemplate;

class TestClass {

    public TestClass() {
        System.out.println("Hello");
    }
    
    public void unsafe(String paramName) {
        JdbcTemplate jdbc = new JdbcTemplate();
        System.out.println("Hello");
        // ruleid:jdbc-sql-formatted-string
        int count = jdbc.queryForObject("select count(*) from Users where name = '"+paramName+"'", Integer.class);
    }

    public void safe(String paramName) {
        JdbcTemplate jdbc = new JdbcTemplate();
        // ok
        int count = jdbc.queryForObject("select count(*) from Users where name = ?", Integer.class, paramName);
    }
}