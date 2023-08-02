package testcode.sqli;

import org.springframework.jdbc.core.PreparedStatementCreatorFactory;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.*;
import java.sql.*;
import java.util.ArrayList;

public class SpringPreparedStatementCreatorFactory {
    public void queryUnsafe(String input) {
        String sql = "select * from Users where name = '" + input + "' id=?";
        // ruleid:spring-sqli
        new PreparedStatementCreatorFactory(sql);
        // ruleid:spring-sqli
        new PreparedStatementCreatorFactory(sql, new int[] {Types.INTEGER});
        // ruleid:spring-sqli
        new PreparedStatementCreatorFactory(sql, new ArrayList<SqlParameter>());
    }
}

public class SpringJdbcTemplate {

    public void query1(JdbcTemplate jdbcTemplate, String input) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.execute("select * from Users where name = '"+input+"'");
    }

    public void query2(JdbcTemplate jdbcTemplate, String input) throws DataAccessException {
        String sql = "select * from Users where name = '" + input + "'";
        // ruleid:spring-sqli
        jdbcTemplate.execute(sql);
    }

    public void query3(JdbcTemplate jdbcTemplate, String input) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.execute(String.format("select * from Users where name = '%s'",input));
    }

    public void query4(JdbcTemplate jdbcTemplate, String input) throws DataAccessException {
        String sql = "select * from Users where name = '%s'";
        // ruleid:spring-sqli
        jdbcTemplate.execute(String.format(sql,input));
    }

    public void querySafe(JdbcTemplate jdbcTemplate, String input) throws DataAccessException {
        String sql = "select * from Users where name = '1'";
        // ok:spring-sqli
        jdbcTemplate.execute(sql);
    }

    public void queryExecute(JdbcTemplate jdbcTemplate, String sql) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.execute(sql);
        // ruleid:spring-sqli
        jdbcTemplate.execute(new StoredProcCall(sql), new TestCallableStatementCallback());
        // ruleid:spring-sqli
        jdbcTemplate.execute(sql, (PreparedStatementCallback) new TestCallableStatementCallback());
        // ruleid:spring-sqli
        jdbcTemplate.execute(sql, new TestCallableStatementCallback());
    }

    public void queryBatchUpdate(JdbcTemplate jdbcTemplate, String sql, String taintedString) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.batchUpdate(sql);
        // ruleid:spring-sqli
        jdbcTemplate.batchUpdate(sql, sql);
        // ruleid:spring-sqli
        jdbcTemplate.batchUpdate("select * from dual", sql);
        // ruleid:spring-sqli
        jdbcTemplate.batchUpdate(sql, "select * from dual");
        // ruleid:spring-sqli
        jdbcTemplate.batchUpdate(sql, new TestBatchPreparedStatementSetter());
        // ruleid:spring-sqli
        jdbcTemplate.batchUpdate(sql, new ArrayList<UserEntity>(), 11, new TestParameterizedPreparedStatementSetter());
        // ruleid:spring-sqli
        jdbcTemplate.batchUpdate(sql, new ArrayList<Object[]>());

        // ok:spring-sqli
        jdbcTemplate.batchUpdate("SELECT foo FROM bar WHERE baz = 'biz'", new ArrayList<Object[]>(Arrays.asList(new Object[] {taintedString})));
        // ruleid:spring-sqli
        jdbcTemplate.batchUpdate(sql, new ArrayList<Object[]>(), new int[]{Types.INTEGER, Types.VARCHAR, Types.VARCHAR});
    }

    public void queryForObject(JdbcTemplate jdbcTemplate, String sql) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.queryForObject(sql, new TestRowMapper());
        // ruleid:spring-sqli
        jdbcTemplate.queryForObject(sql, new TestRowMapper(), "", "");
        // ruleid:spring-sqli
        jdbcTemplate.queryForObject(sql, UserEntity.class);
        // ruleid:spring-sqli
        jdbcTemplate.queryForObject(sql, UserEntity.class, "", "");
        // ruleid:spring-sqli
        jdbcTemplate.queryForObject(sql, new Object[0], UserEntity.class);
        // ruleid:spring-sqli
        jdbcTemplate.queryForObject(sql, new Object[0], new int[]{Types.INTEGER, Types.VARCHAR, Types.VARCHAR}, UserEntity.class);
        // ruleid:spring-sqli
        jdbcTemplate.queryForObject(sql, new Object[0], new int[]{Types.INTEGER, Types.VARCHAR, Types.VARCHAR}, new TestRowMapper());
        // ruleid:spring-sqli
        jdbcTemplate.queryForObject(sql, new Object[0], new TestRowMapper());
    }

    public void querySamples(JdbcTemplate jdbcTemplate, String sql) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new TestResultSetExtractor());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new TestRowCallbackHandler());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new TestRowMapper());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new TestPreparedStatementSetter(), new TestResultSetExtractor());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new TestPreparedStatementSetter(), new TestRowCallbackHandler());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new TestPreparedStatementSetter(), new TestRowMapper());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new Object[0], new TestRowMapper());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new Object[0], new TestRowCallbackHandler());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new Object[0], new TestResultSetExtractor());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new Object[0], new int[]{Types.VARCHAR}, new TestResultSetExtractor());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new Object[0], new int[]{Types.VARCHAR}, new TestRowMapper());
        // ruleid:spring-sqli
        jdbcTemplate.query(sql, new Object[0], new int[]{Types.VARCHAR}, new TestRowCallbackHandler());
    }

    public void queryForList(JdbcTemplate jdbcTemplate, String sql) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.queryForList(sql);
        // ruleid:spring-sqli
        jdbcTemplate.queryForList(sql, UserEntity.class);
        // ruleid:spring-sqli
        jdbcTemplate.queryForList(sql, new Object[0], UserEntity.class);
        // ruleid:spring-sqli
        jdbcTemplate.queryForList(sql, new Object[0], new int[]{Types.VARCHAR});
        // ruleid:spring-sqli
        jdbcTemplate.queryForList(sql, new Object[0], new int[]{Types.VARCHAR}, UserEntity.class);
        // ruleid:spring-sqli
        jdbcTemplate.queryForList(sql, new Object[0]);
    }

    public void queryForMap(JdbcTemplate jdbcTemplate, String sql) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.queryForMap(sql);
        // ruleid:spring-sqli
        jdbcTemplate.queryForMap(sql, new Object[0]);
        // ruleid:spring-sqli
        jdbcTemplate.queryForMap(sql, new Object[0], new int[]{Types.VARCHAR});
    }

    public void queryForRowSet(JdbcTemplate jdbcTemplate, String sql) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.queryForRowSet(sql);
        // ruleid:spring-sqli
        jdbcTemplate.queryForRowSet(sql, new Object[0]);
        // ruleid:spring-sqli
        jdbcTemplate.queryForRowSet(sql, new Object[0], new int[]{Types.VARCHAR});
    }

    public void queryForInt(JdbcTemplate jdbcTemplate, String sql) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.queryForInt(sql);
        // ruleid:spring-sqli
        jdbcTemplate.queryForInt(sql, new Object[0]);
        // ruleid:spring-sqli
        jdbcTemplate.queryForInt(sql, new Object[0], new int[]{Types.VARCHAR});
    }

    public void queryForLong(JdbcTemplate jdbcTemplate, String sql) throws DataAccessException {
        // ruleid:spring-sqli
        jdbcTemplate.queryForLong(sql);
        // ruleid:spring-sqli
        jdbcTemplate.queryForLong(sql, new Object[0]);
        // ruleid:spring-sqli
        jdbcTemplate.queryForLong(sql, new Object[0], new int[]{Types.VARCHAR});
    }

}

public class SpringBatchUpdateUtils {

    JdbcOperations jdbcOperations;

    public void queryBatchUpdateUnsafe(String input) {
        String sql = "UPDATE Users SET name = '"+input+"' where id = 1";
        // ruleid:spring-sqli
        BatchUpdateUtils.executeBatchUpdate(sql, new ArrayList<Object[]>(),new int[] {Types.INTEGER}, jdbcOperations);
    }

    public void queryBatchUpdateSafe(String input) {
        String sql = "UPDATE Users SET set = '"+ (input != NULL) +"' where id = 1";
        // ok:spring-sqli
        BatchUpdateUtils.executeBatchUpdate(sql, new ArrayList<Object[]>(),new int[] {Types.INTEGER}, jdbcOperations);
    }

    public void queryNamedParamBatchUpdateUnsafe(String input) {
        String sql = "UPDATE Users SET name = '"+input+"' where id = 1";
        // ruleid:spring-sqli
        NamedParameterBatchUpdateUtils.executeBatchUpdate(sql, new ArrayList<Object[]>(),new int[] {Types.INTEGER}, jdbcOperations);
    }

    public void queryNamedParameterBatchUpdateUtilsSafe() {
        String sql = "UPDATE Users SET name = 'safe' where id = 1";
        // ok:spring-sqli
        NamedParameterBatchUpdateUtils.executeBatchUpdate(sql, new ArrayList<Object[]>(), new int[]{Types.INTEGER}, jdbcOperations);
    }
}
