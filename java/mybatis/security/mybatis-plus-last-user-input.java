package testcode.mybatis;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

public class MyBatisPlusLastTest {

    public void badCases() {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        String sortField = "create_time";
        String limit = "0,10";

        // ruleid:mybatis-plus-last-user-input
        wrapper.last("limit " + limit);

        // ruleid:mybatis-plus-last-user-input
        wrapper.last(sortField + " DESC");

        // ruleid:mybatis-plus-last-user-input
        new QueryWrapper<User>().last("order by " + sortField);

        String orderBy = "id ASC";
        // ruleid:mybatis-plus-last-user-input
        wrapper.last(orderBy);
    }

    public void goodCases() {
        QueryWrapper<User> wrapper = new QueryWrapper<>();

        // ok:mybatis-plus-last-user-input
        wrapper.last("limit 10");

        // ok:mybatis-plus-last-user-input
        wrapper.last("ORDER BY create_time DESC");

        // ok:mybatis-plus-last-user-input
        new QueryWrapper<User>().last("LIMIT 1");
    }
}

class User {
    private Long id;
    private String name;
}
