package com.amazonaws.lambda.demo;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import java.util.Calendar;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.simple.JSONObject;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.lambda.demo.Emp;
import com.amazonaws.lambda.demo.HibernateUtil;
import com.amazonaws.lambda.demo.Request;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.lambda.demo.*;

public class LambdaFunctionHandler implements RequestHandler < Request, String > {
  String dstBucket = System.getenv("bucketname");
  String host_name = System.getenv("host_name");
  String user_name = System.getenv("user_name");
  String password = System.getenv("password");
  String dbname = System.getenv("dbname");
  @Override

  public String handleRequest(Request request, Context context) {
    String s = " ";
    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    try (Session session = sessionFactory.openSession()) {
      int ctr = 0;
      Connection connect;
      connect = DriverManager.getConnection("jdbc:mysql://" + host_name + ":3306/" + dbname, user_name, password);
      int month = request.getMonth();
      int year = request.getYear();
      int overtime = request.getOvertime();
      int empid = request.getEmp_id();
      Calendar Year = Calendar.getInstance();
      int CurrentYear = Year.get(Year.YEAR);

      if ((request.getMonth() <= 12 && request.getMonth() >= 1)) {
        Statement statement = connect.createStatement();
        String query = "SELECT emp_name,emp_mail,manager_id FROM employee WHERE emp_id=" + empid;
        // ruleid: tainted-sqli
        ResultSet resultSet = statement.executeQuery(query);
        // ok: tainted-sqli
        ResultSet resultSet2 = statement.executeQuery("SELECT * FROM employee");
      }
    } catch (SQLException e) {
      e.printStackTrace();
      context.getLogger().log("error : " + e);
    }
    if (s == "") {
      s = "Sucess " + String.format("Added %s %s %s %s %s.", request.emp_id, request.month, request.year, request.overtime);
    }
    return s;
  }
}