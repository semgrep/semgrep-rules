import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import java.io.IOException;

import com.mongodb.util.JSON;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.DB;
import com.mongodb.DBCollection;

import java.net.UnknownHostException;

class NoSQLInjectionServlet extends HttpServlet {

    private DBCollection testCollection;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taintedInput = request.getParameter("input");

        MongoClient mongoClient = new MongoClient();
        DB testDB = mongoClient.getDB("testDB");
        testCollection = testDB.getCollection("testCollection");

        String taintedQueryString = "{ 'input' : '" + taintedInput + "'}";
        // ruleid:tainted-nosqli-from-http-request
        DBObject taintedQuery = (DBObject) JSON.parse(taintedQueryString);

        DBCursor result = testCollection.find(taintedQuery);

    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taintedInput = request.getParameter("input");

        DBCursor result = findInsecure(taintedInput);

    }

    private DBCursor findInsecure(String taintedInput) throws UnknownHostException {
        MongoClient mongoClient = new MongoClient();
        DB testDB = mongoClient.getDB("testDB");
        testCollection = testDB.getCollection("testCollection");

        String taintedQueryString = "{ 'input' : '" + taintedInput + "'}";
        // ruleid:tainted-nosqli-from-http-request
        DBObject taintedQuery = (DBObject) JSON.parse(taintedQueryString);

        DBCursor result = testCollection.find(taintedQuery);

        return result;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taintedInput = request.getParameter("input");

        DBCursor result = findSecure(taintedInput);

    }

    private DBCursor findSecure(String taintedInput) throws UnknownHostException {
        MongoClient mongoClient = new MongoClient();
        DB testDB = mongoClient.getDB("testDB");
        testCollection = testDB.getCollection("testCollection");

        // ok:tainted-nosqli-from-http-request
        BasicDBObject safeQuery = new BasicDBObject("input", taintedInput);

        DBCursor result = testCollection.find(safeQuery);

        return result;
    }
}
