package testcode.mybatis;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

public class MyBatisPlusApplyTest {

    public void badCases() {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        String dateFunc = "DATE_FORMAT(create_time,'%Y-%m-%d')";

        // ruleid:mybatis-plus-apply-user-input
        wrapper.apply(dateFunc);

        // ruleid:mybatis-plus-apply-user-input
        wrapper.apply("status = " + getStatus());

        String customSql = "id IN (SELECT id FROM other_table)";
        // ruleid:mybatis-plus-apply-user-input
        wrapper.apply(customSql);

        // ruleid:mybatis-plus-apply-user-input
        new QueryWrapper<User>().apply(getDynamicCondition());
    }

    public void goodCases() {
        QueryWrapper<User> wrapper = new QueryWrapper<>();

        // ok:mybatis-plus-apply-user-input
        wrapper.apply("DATE_FORMAT(create_time,'%Y-%m-%d') = '2024-01-01'");

        // ok:mybatis-plus-apply-user-input
        wrapper.apply("status = 1");

        // ok:mybatis-plus-apply-user-input
        new QueryWrapper<User>().apply("1 = 1");
    }

    private String getStatus() { return "ACTIVE"; }
    private String getDynamicCondition() { return "deleted = 0"; }
}

class User {
    private Long id;
    private String name;
}
