import java.sql.*;
import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class
import java.util.logging.Logger;
import java.util.logging.Level;
import java.net.URLEncoder;

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
//            conn=getDBConnection();
            stmt = conn.createStatement();
            conn = DriverManager.getConnection("jdbc:msql://localhost/EMP", USER, PASSWORD);
        } catch (SQLException sqle) {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            enterlog("sql initialization error" + dtf.format(now));
        }
    }

    public Employee searchEmployee(String idemployee) throws SQLException {
        try {
            String searchEmployee = "SELECT * from EMPLOYEES WHERE IDEMPLOYEE=?";
            PreparedStatement stmt = conn.prepareStatement(searchEmployee);
            stmt.setString(1, idemployee);
            ResultSet rs = stmt.executeQuery();

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
        logger.log(Level.SEVERE, URLEncoder.encode(s));
    }
}


