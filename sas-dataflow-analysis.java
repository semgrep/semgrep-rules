import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import org.apache.commons.lang3.StringEscapeUtils;
import java.sql.*;
import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class
import java.util.logging.Logger;
import java.util.logging.Level;
import java.net.URLEncoder;
import java.sql.SQLException;

class Employee {
    String name;
    String address;
    String hobby;
//....
}

public class DBfunctions {

    private Statement stmt = null;
    private Connection conn = null;

    public DBfunctions() {
        final String USER = "billchu";
        final String PASSWORD = "hacker";
        try {
           conn=getDBConnection();
            conn = DriverManager.getConnection("jdbc:msql://localhost/EMP", USER, PASSWORD);
            stmt = conn.createStatement();
        } catch (SQLException sqle) {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            enterlog("sql initialization error" + dtf.format(now));
        }
    }

    public Employee searchEmployee(String idemployee) throws SQLException {
        try {
            // Prepared Statement SQL
            String searchEmployee = "SELECT * from EMPLOYEES WHERE IDEMPLOYEE=?";
            PreparedStatement stmt = conn.prepareStatement(searchEmployee);
            stmt.setString(1, idemployee);
            ResultSet rs = stmt.executeQuery();

////             Embedded SQL statement
//            String searchEmployeeSQL = "SELECT * from EMPLOYEES WHERE IDEMPLOYEE='" + idemployee + "'";
//            Statement s = conn.createStatement();
//            ResultSet r = s.executeQuery(searchEmployeeSQL);

            if (rs.next()) {
                Employee employee = new Employee();
                employee.name = rs.getString("employeename");
                employee.address = rs.getString("employeeaddress");
                return employee;
            } else {
                enterlog("no employee:" + idemployee);
            }
        } catch (SQLException sqle) {
            enterlog("sql error:" + idemployee);
        }


        return new Employee();
    }

    void enterlog(String s) {
        Logger logger = Logger.getLogger(DBfunctions.class.getName());
        logger.log(Level.SEVERE, s);

    }
}

class FirstServlet extends HttpServlet {
    private String idemployee,s;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        DBfunctions db = new DBfunctions();
        Employee employee,e;
        try {
            idemployee = request.getParameter("idemployee");
           String s = idemployee;
            PrintWriter out = response.getWriter();
            // secure code
            out.println(s);
            out.println("<html> <body> GET parameter:" + idemployee);
            e = db.searchEmployee(s);
            employee= db.searchEmployee(s);
            out.println("<html> <body> GET parameter:" + //StringEscapeUtils.escapeHtml4(employee.name));
            employee.name);
            out.println("<html> <body> GET parameter:" + StringEscapeUtils.escapeHtml4(employee.address));
            out.println("<html> <body> GET parameter:" + e.name);
           
            out.println("</body> </html>");

//            // Insecure code
//            out.println("<html> <body> GET parameter:" + idemployee );
//            employee = db.searchEmployee(idemployee);
//            out.println("<html> <body> GET parameter:" + employee.name);
//            out.println("<html> <body> GET parameter:" + employee.address);
//            out.println("</body> </html>");
        }
        catch (SQLException e){
            response.sendRedirect("/login.jsp?msg=DBERROR");
        }
    }
}


