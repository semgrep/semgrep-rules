package testcode.sqli;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public class JpaSql {

    public void getUserByUsername(EntityManager em, String username) {
        // ruleid:jpa-sqli
        TypedQuery<UserEntity> q = em.createQuery(
                String.format("select * from Users where name = %s", username),
                UserEntity.class);

        UserEntity res = q.getSingleResult();
    }

    public void getUserByUsernameAlt2(EntityManager em, String username) {
        // ruleid:jpa-sqli
        TypedQuery<UserEntity> q = em.createQuery(
                "select * from Users where name = '" + username + "'",
                UserEntity.class);

        UserEntity res = q.getSingleResult();
    }

    public UserEntity getFirst(EntityManager em) {
        // ok:jpa-sqli
        TypedQuery<UserEntity> q = em.createQuery(
                "select * from Users",
                UserEntity.class);
        return q.getSingleResult();
    }

    public UserEntity getFirstAlt2(EntityManager em) {
        final String sql = "select * from Users";
        // ok:jpa-sqli
        TypedQuery<UserEntity> q = (TypedQuery<UserEntity>) em.createQuery(sql);
        return q.getSingleResult();
    }

    public void getUserWithNativeQueryUnsafe(EntityManager em, String password) {
        String sql = "select * from Users where user = 'admin' and password='"+password+"'";
        // ruleid:jpa-sqli
        em.createNativeQuery(sql);
        // ruleid:jpa-sqli
        em.createNativeQuery(sql,"testcode.sqli.UserEntity");
        // ruleid:jpa-sqli
        em.createNativeQuery(sql, UserEntity.class);

    }

    public void getUserWithNativeQuerySafe(EntityManager em) {
        String sql = "select * from Users where user = 'admin'";
        // ok:jpa-sqli
        em.createNativeQuery(sql);
        // ok:jpa-sqli
        em.createNativeQuery(sql,"testcode.sqli.UserEntity");
        // ok:jpa-sqli
        em.createNativeQuery(sql, UserEntity.class);
    }
}
