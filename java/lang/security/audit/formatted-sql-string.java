// cf. https://www.baeldung.com/sql-injection

package sql.injection;

import com.biz.org.AccountDTO;
import com.biz.org.DB;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;

public class SqlExample {
    public void staticQuery() throws SQLException {
        Connection c = DB.getConnection();
        // ok:formatted-sql-string
        ResultSet rs = c.createStatement().executeQuery("SELECT * FROM happy_messages");
    }

    public void getAllFields(String tableName) throws SQLException {
        Connection c = DB.getConnection();
        // ruleid:formatted-sql-string
        ResultSet rs = c.createStatement().executeQuery("SELECT * FROM " + tableName);
    }

    public void findAccountsById(String id) throws SQLException {
        String sql = "SELECT * "
            + "FROM accounts WHERE id = '"
            + id
            + "'";
        Connection c = DB.getConnection();
        // ruleid:formatted-sql-string
        ResultSet rs = c.createStatement().executeQuery(sql);
    }

    public void findAccountsById(String id, String field) throws SQLException {
        String sql = "SELECT ";
        sql += field;
        sql += " FROM accounts WHERE id = '";
        sql += id;
        sql += "'";
        Connection c = DB.getConnection();
        // ruleid:formatted-sql-string
        ResultSet rs = c.createStatement().executeQuery(sql);
    }
}

public class SqlExample2 {
    public void getAllFields(String tableName) throws SQLException {
        Connection c = db.getConnection();
        // ruleid:formatted-sql-string
        ResultSet rs = c.createStatement().execute("SELECT * FROM " + tableName);
    }

    public void findAccountsById(String id) throws SQLException {
        String sql = "SELECT * "
            + "FROM accounts WHERE id = '"
            + id
            + "'";
        Connection c = db.getConnection();
        // ruleid:formatted-sql-string
        ResultSet rs = c.createStatement().execute(sql);
    }

    public List<AccountDTO> findAccountsById(String id) {
        String jql = "from Account where id = '" + id + "'";
        EntityManager em = emfactory.createEntityManager();
        // ruleid:formatted-sql-string
        TypedQuery<Account> q = em.createQuery(jql, Account.class);
        return q.getResultList()
        .stream()
        .map(this::toAccountDTO)
        .collect(Collectors.toList());
    }
}

public class SQLExample3 {
    public void getAllFields(String tableName) throws SQLException {
        Connection c = db.getConnection();
        // ruleid:formatted-sql-string
        ResultSet rs = c.createStatement().execute(String.format("SELECT * FROM %s", tableName));
    }

    public void findAccountsById(String id) throws SQLException {
        String sql = String.format("SELECT * FROM accounts WHERE id = '%s'", id);
        Connection c = db.getConnection();
        // ruleid:formatted-sql-string
        ResultSet rs = c.createStatement().execute(sql);
    }

    public List<AccountDTO> findAccountsById(String id) {
        String jql = String.format("from Account where id = '%s'", id);
        EntityManager em = emfactory.createEntityManager();
        // ruleid: formatted-sql-string
        TypedQuery<Account> q = em.createQuery(jql, Account.class);
        return q.getResultList()
        .stream()
        .map(this::toAccountDTO)
        .collect(Collectors.toList());
    }

    public void findAccountsByIdOk() throws SQLException {
        String id = "const";
        String sql = String.format("SELECT * FROM accounts WHERE id = '%s'", id);
        Connection c = db.getConnection();
        // ok:formatted-sql-string
        ResultSet rs = c.createStatement().execute(sql);
    }

}

public class tableConcatStatements {
    public void tableConcat() {
        // ok:formatted-sql-string
        stmt.execute("DROP TABLE " + tableName);
        stmt.execute(String.format("CREATE TABLE %s", tableName));
    }
}

// This whole operation has nothing to do with SQL
public class FalsePositiveCase {
    private ApiClient apiClient; // imagine an ApiClient class that contains a method named execute

    public void test(String parameter) throws ApiException {
        com.squareup.okhttp.Call call = constructHttpCall(parameter); // Create OKHttp call using parameter from outside
        // ok: formatted-sql-string
        apiClient.execute(call);
        // ok: formatted-sql-string
        apiClient.execute(call);
        apiClient.run(call); // proof that 'execute' name is causing the false-positive
    }

    public List<Student> addWhere(String name, CriteriaQuery Query)
    {
        EntityManager em = emfactory.createEntityManager();
    	CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		// ok: formatted-sql-string
        List<Student> students = em.createQuery(Query.where(criteriaBuilder.equal(studentRoot.get("name"), name ))).getResultList();
        return students;
    }
}
