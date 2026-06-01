package testcode.mybatis;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

public class MyBatisPlusDynamicSqlConcatTest {

    public void badCases() {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        String columnName = "user_name";
        String orderCol = "create_time";

        // ruleid:mybatis-plus-dynamic-sql-concat
        wrapper.eq(columnName + " = ", "test");

        // ruleid:mybatis-plus-dynamic-sql-concat
        wrapper.orderByAsc(orderCol + " ASC");

        // ruleid:mybatis-plus-dynamic-sql-concat
        wrapper.groupBy(orderCol + ", status");

        // ruleid:mybatis-plus-dynamic-sql-concat
        wrapper.orderByDesc("user" + columnName);
    }

    public void goodCases() {
        QueryWrapper<User> wrapper = new QueryWrapper<>();

        // ok:mybatis-plus-dynamic-sql-concat
        wrapper.eq("user_name", "admin");

        // ok:mybatis-plus-dynamic-sql-concat
        wrapper.orderByAsc("create_time");

        // ok:mybatis-plus-dynamic-sql-concat
        wrapper.groupBy("status", "type");

        // ok:mybatis-plus-dynamic-sql-concat
        wrapper.orderByDesc("id");
    }
}

class User {
    private Long id;
    private String name;
}
