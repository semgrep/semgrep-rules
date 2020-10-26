package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;

public class Cls extends HttpServlet
{
    private static org.apache.log4j.Logger log = Logger.getLogger(Register.class);

    // ruleid:find-sql-string-concatenation
    protected void danger(String ean) {
        Session session = this.sessionFactory.openSession();

        String query = "select foo from bar where" + ean + " limit 1";
        try {
            PreparedStatement ps = session.connection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer item = rs.getInt("foo");
            }
        } catch (SQLException e) {
            logger.error("Error!", e);
        } finally {
            session.close();
        }
    }
    // ruleid:find-sql-string-concatenation
    protected void danger2(String biz) {
        String query = "select foo from bar where" + biz + " limit 1";
        Session session = this.sessionFactory.openSession();
        try {
            PreparedStatement ps = session.connection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer item = rs.getInt("foo");
            }
        } catch (SQLException e) {
            logger.error("Error!", e);
        } finally {
            session.close();
        }
    }

    // ok:find-sql-string-concatenation
    protected void ok(String foo) throws ServletException, IOException {
        String query = "select foo from bar where ? limit 1";
        Session session = this.sessionFactory.openSession();
        try {
            PreparedStatement ps = session.connection().prepareStatement(query);
            ps.setString(1,foo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("foo");
            }
        } catch (SQLException e) {
            logger.error("Error!", e);
        } finally {
            session.close();
        }
    }
}
