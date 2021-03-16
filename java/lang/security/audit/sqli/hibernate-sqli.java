package testcode.sqli;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.StandardBasicTypes;
import org.hibernate.type.Type;

public class HibernateSql {

    public void testQueries(SessionFactory sessionFactory, String input) {

        Session session = sessionFactory.openSession();

        Criteria criteria = session.createCriteria(UserEntity.class);

        // ruleid: hibernate-sqli
        criteria.add(Restrictions.sqlRestriction("test=1234" + input + "zzz"));
        // ruleid: hibernate-sqli
        session.createQuery("select t from UserEntity t where id = " + input);
        // ruleid: hibernate-sqli
        session.createSQLQuery(String.format("select * from TestEntity where id = %s ", input));
        // ruleid: hibernate-sqli
        criteria.add(Restrictions.sqlRestriction("param1  = ? and param2 = " + input,input, StandardBasicTypes.STRING));
        // ruleid: hibernate-sqli
        criteria.add(Restrictions.sqlRestriction("param1  = ? and param2 = " + input,new String[] {input}, new Type[] {StandardBasicTypes.STRING}));

        // ok: hibernate-sqli
        criteria.add(Restrictions.sqlRestriction("test=1234"));

        final String localSafe = "where id=1337";
        // ok: hibernate-sqli
        session.createQuery("select t from UserEntity t " + localSafe);

        final String localSql = "select * from TestEntity " + localSafe;
        // ok: hibernate-sqli
        session.createSQLQuery(localSql);

        // ok: hibernate-sqli
        criteria.add(Restrictions.sqlRestriction("param1  = ?",input, StandardBasicTypes.STRING));
        // ok: hibernate-sqli
        criteria.add(Restrictions.sqlRestriction("param1  = ? and param2 = ?", new String[] {input}, new Type[] {StandardBasicTypes.STRING}));

    }
}
