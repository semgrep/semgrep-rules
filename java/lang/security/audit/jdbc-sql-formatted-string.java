import java.lang.Runtime;

import org.springframework.jdbc.core.JdbcTemplate;

class TestClass {

    public TestClass() {
        System.out.println("Hello");
    }

    public void unsafe_jdbc_queryForObject_1(String paramName) {
        JdbcTemplate jdbc = new JdbcTemplate();
        System.out.println("Hello");
        // ruleid:jdbc-sql-formatted-string
        int count = jdbc.queryForObject("select count(*) from Users where name = '"+paramName+"'", Integer.class);
    }

    public void unsafe_jdbc_queryForObject_2(String paramName) {
        JdbcTemplate jdbc = new JdbcTemplate();
        System.out.println("Hello");
        // ruleid:jdbc-sql-formatted-string
        String query = "select count(*) from Users where name = '"+paramName+"'";
        int count = jdbc.queryForObject(query, Integer.class);
    }

    public void unsafe_jdbc_queryForObject_3(String paramName) {
        JdbcTemplate jdbc = new JdbcTemplate();
        System.out.println("Hello");
        // ruleid:jdbc-sql-formatted-string
        StringBuilder query = new StringBuilder("select count(*) from Users");
        query.append( "where name = '"+paramName+"'");
        int count = jdbc.queryForObject(query, Integer.class);
    }

    public void unsafe_jdbc_queryForList_1(String paramName) {
        JdbcTemplate jdbc = new JdbcTemplate();
        System.out.println("Hello");
        List<Users> users = new ArrayList<>();
        // ruleid:jdbc-sql-formatted-string
        String query = "select count(*) from Users where name = '"+paramName+"'";
        List<Map<String, Object>> rows =  jdbc.queryForList(query);
    }

    public void unsafe_jdbc_queryForList_2(String paramName) {
        JdbcTemplate jdbc = new JdbcTemplate();
        System.out.println("Hello");
        List<Users> users = new ArrayList<>();
        // ruleid:jdbc-sql-formatted-string
        List<Map<String, Object>> rows =  jdbc.queryForList("select count(*) from Users where name = '"+paramName+"'");
    }

    public void unsafe_jdbc_update(String paramName, String paramSalary) {
        JdbcTemplate jdbc = new JdbcTemplate();
        System.out.println("Hello");
        // ruleid:jdbc-sql-formatted-string
        String updateQuery = "update Users set salary = '"+paramSalary+"' where name = '"+paramName+"'";
        jdbc.update(updateQuery);
    }
    public void safe(String paramName) {
        JdbcTemplate jdbc = new JdbcTemplate();
        // ok:jdbc-sql-formatted-string
        int count = jdbc.queryForObject("select count(*) from Users where name = ?", Integer.class, paramName);
    }
}
