import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;

public interface UserMapper {

    // ruleid: mybatis-sqli
    @Select("SELECT * FROM users WHERE name = '${name}'")
    List<User> findByName(String name);

    // ruleid: mybatis-sqli
    @Update("UPDATE users SET role = ${role} WHERE id = #{id}")
    int updateRole(Long id, String role);

    // ruleid: mybatis-sqli
    @Delete("DELETE FROM ${table} WHERE id = #{id}")
    int deleteFrom(String table, Long id);

    // ruleid: mybatis-sqli
    @Select({
            "SELECT * FROM users",
            "WHERE status = ${status}"
    })
    List<User> findByStatus(String status);

    // ruleid: mybatis-sqli
    @Insert("INSERT INTO audit(note) VALUES ('${note}')")
    int insertNote(String note);

    // ok: mybatis-sqli
    @Select("SELECT * FROM users WHERE name = #{name}")
    List<User> safeFindByName(String name);

    // ok: mybatis-sqli
    @Update("UPDATE users SET role = #{role} WHERE id = #{id}")
    int safeUpdateRole(Long id, String role);

    // ok: mybatis-sqli
    @Select("SELECT id, name, role FROM users ORDER BY id")
    List<User> safeFindAll();

    // ok: mybatis-sqli
    @Delete("DELETE FROM users WHERE id = #{id}")
    int safeDelete(Long id);

    // Spring property placeholder uses the same ${} token but is not a
    // MyBatis mapper annotation and must not be flagged.
    // ok: mybatis-sqli
    @Value("${app.default.role}")
    String defaultRole = null;
}
