package testcode.sqli;

import javax.jdo.Extent;
import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;
import java.util.ArrayList;

public class JdoSqlFilter {

    private static final PersistenceManagerFactory pmfInstance =
            JDOHelper.getPersistenceManagerFactory("transactions-optional");

    public static PersistenceManager getPM() {
        return pmfInstance.getPersistenceManager();
    }

    public void testJdoUnsafeFilter(String filterValue) {
        PersistenceManager pm = getPM();
        Query q = pm.newQuery(UserEntity.class);
        // ruleid: jdo-sqli
        q.setFilter("id == "+filterValue);
    }

    public void testJdoSafeFilter(String filterValue) {
        PersistenceManager pm = getPM();
        Query q = pm.newQuery(UserEntity.class);
        // ok: jdo-sqli
        q.setFilter("id == 1");
    }

    public void testJdoSafeFilter2(String filterValue) {
        PersistenceManager pm = getPM();
        Query q = pm.newQuery(UserEntity.class);
        // ok: jdo-sqli
        q.setFilter("id == userId");
        q.declareParameters("int userId");

    }

    private static final String FIELD_TEST = "test";

    public void testJdoUnsafeGrouping(String groupByField) {
        PersistenceManager pm = getPM();
        Query q = pm.newQuery(UserEntity.class);
        // ruleid: jdo-sqli
        q.setGrouping(groupByField);
    }

    public void testJdoSafeGrouping() {
        PersistenceManager pm = getPM();
        Query q = pm.newQuery(UserEntity.class);
        // ok: jdo-sqli
        q.setGrouping(FIELD_TEST);
    }
}

public class JdoSql {

    private static final PersistenceManagerFactory pmfInstance =
            JDOHelper.getPersistenceManagerFactory("transactions-optional");


    public static PersistenceManager getPM() {
        return pmfInstance.getPersistenceManager();
    }

    public void testJdoQueries(String input) {
        PersistenceManager pm = getPM();
        // ruleid: jdo-sqli
        pm.newQuery("select * from Users where name = " + input);
        // ruleid: jdo-sqli
        pm.newQuery("sql", "select * from Products where name = " + input);

        // ok: jdo-sqli
        pm.newQuery("select * from Config");

        final String query = "select * from Config";
        // ok: jdo-sqli
        pm.newQuery(query);
        // ok: jdo-sqli
        pm.newQuery("sql", query);
    }

    public void testJdoQueriesAdditionalMethodSig(String input) {
        PersistenceManager pm = getPM();
        // ruleid: jdo-sqli
        pm.newQuery(UserEntity.class,new ArrayList(),"id == "+ input);
        // ok: jdo-sqli
        pm.newQuery(UserEntity.class,new ArrayList(),"id == 1");
        // ruleid: jdo-sqli
        pm.newQuery(UserEntity.class,"id == "+ input);
        // ok: jdo-sqli
        pm.newQuery(UserEntity.class,"id == 1");
        // ruleid: jdo-sqli
        pm.newQuery((Extent) null,"id == "+input);
        // ok: jdo-sqli
        pm.newQuery((Extent) null,"id == 1");
    }

}
