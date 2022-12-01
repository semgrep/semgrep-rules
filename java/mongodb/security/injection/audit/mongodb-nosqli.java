package testcode.sqli;

import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBObjectBuilder;

public class ContactsService {

  private MongoDatabase db = MongoClientUtil.mongoClient.getDatabase("test");
  private MongoCollection<Document> collection = db.getCollection("contacts");

  public InsecureContactsService() {
    }

  public ArrayList<Document> basicDBObjectPut(String userName, String email) {
    BasicDBObject query = new BasicDBObject();
    // ruleid: mongodb-nosqli
    query.put("$where", "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"");

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectPut(String userName, String email) {
    BasicDBObject query = new BasicDBObject();
    // ok: mongodb-nosqli
    query.put("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"");

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectPut(String userName, String email) {
    BasicDBObject query = new BasicDBObject();
    // ok: mongodb-nosqli
    query.put("sharedWith", userName);
    query.put("email", email);

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectPutAll(String userName, String email) {
    BasicDBObject query = new BasicDBObject();
    HashMap<String, String> paramMap = new HashMap<>();
    // ruleid: mongodb-nosqli
    paramMap.put("$where", "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"");
    query.putAll(paramMap);

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectPutAll(String userName, String email) {
    BasicDBObject query = new BasicDBObject();
    HashMap<String, String> paramMap = new HashMap<>();
    // ok: mongodb-nosqli
    paramMap.put("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"");
    query.putAll(paramMap);

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectPutAll(String userName, String email) {
    BasicDBObject query = new BasicDBObject();
    HashMap<String, String> paramMap = new HashMap<>();
    // ok: mongodb-nosqli
    paramMap.put("sharedWith", userName);
    paramMap.put("email", email);
    query.putAll(paramMap);

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectAppend(String userName, String email) {
    BasicDBObject query = new BasicDBObject();
    // ruleid: mongodb-nosqli
    query.append("$where", "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"");

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectAppend(String userName, String email) {
    BasicDBObject query = new BasicDBObject();
    // ok: mongodb-nosqli
    query.append("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"");

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectAppend(String userName, String email) {
    BasicDBObject query = new BasicDBObject();
    // ok: mongodb-nosqli
    query.append("sharedWith", userName);
    query.append("email", email);

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectConstructorKv(String userName, String email) {
    // ruleid: mongodb-nosqli
    BasicDBObject query = new BasicDBObject("$where",
        "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"");

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectConstructorKv(String userName, String email) {
    // ok: mongodb-nosqli
    BasicDBObject query = new BasicDBObject("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"");

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectConstructorKv(String userName, String email) {
    BasicDBObject query = new BasicDBObject("sharedWith", userName);
    // ok: mongodb-nosqli
    query.append("email", email);

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectConstructorMap(String userName, String email) {
    HashMap<String, String> paramMap = new HashMap<>();
    // ruleid: mongodb-nosqli
    paramMap.put("$where", "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"");
    BasicDBObject query = new BasicDBObject(paramMap);

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectConstructorMap(String userName, String email) {
    HashMap<String, String> paramMap = new HashMap<>();
    // ok: mongodb-nosqli
    paramMap.put("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"");
    BasicDBObject query = new BasicDBObject(paramMap);

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectConstructorMap(String userName, String email) {
    HashMap<String, String> paramMap = new HashMap<>();
    // ok: mongodb-nosqli
    paramMap.put("sharedWith", userName);
    paramMap.put("email", email);
    BasicDBObject query = new BasicDBObject(paramMap);

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectParse(String userName, String email) {
    HashMap<String, String> paramMap = new HashMap<>();
    // ruleid: mongodb-nosqli
    paramMap.put("$where", "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"");
    String json = new JSONObject(paramMap).toString();
    BasicDBObject query = new BasicDBObject().parse(json);

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectParse(String userName, String email) {
    HashMap<String, String> paramMap = new HashMap<>();
    // ok: mongodb-nosqli
    paramMap.put("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"");
    String json = new JSONObject(paramMap).toString();
    BasicDBObject query = new BasicDBObject().parse(json);

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectParse(String userName, String email) {
    HashMap<String, String> paramMap = new HashMap<>();
    // ok: mongodb-nosqli
    paramMap.put("sharedWith", userName);
    paramMap.put("email", email);
    String json = new JSONObject(paramMap).toString();
    BasicDBObject query = new BasicDBObject().parse(json);

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderAdd(String userName, String email) {
    // ruleid: mongodb-nosqli
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start()
        .add("$where", "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"")
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderAdd(String userName, String email) {
    // ok: mongodb-nosqli
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start()
        .add("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"")
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderAdd(String userName, String email) {
    // ok: mongodb-nosqli
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start()
        .add("sharedWith", userName)
        .add("email", email)
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderAppend(String userName, String email) {
    // ruleid: mongodb-nosqli
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start()
        .append("$where", "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"")
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderAppend(String userName, String email) {
    // ok: mongodb-nosqli
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start()
        .append("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"")
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderAppend(String userName, String email) {
    // ok: mongodb-nosqli
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start()
        .append("sharedWith", userName)
        .append("email", email)
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderStartKv(String userName, String email) {
    // ruleid: mongodb-nosqli
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start("$where", "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"")
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderStartKv(String userName, String email) {
    // ok: mongodb-nosqli
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"")
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderStartKv(String userName, String email) {
    // ok: mongodb-nosqli
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start("sharedWith", userName)
        .append("email", email)
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderStartMap(String userName, String email) {
    HashMap<String, String> paramMap = new HashMap<>();
    // ruleid: mongodb-nosqli
    paramMap.put("$where", "this.sharedWith == \"" + userName + "\" && this.email == \"" + email + "\"");
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start(paramMap)
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderStartMap(String userName, String email) {
    HashMap<String, String> paramMap = new HashMap<>();
    // ok: mongodb-nosqli
    paramMap.put("$where", "this.sharedWith == \"CONSTANT\" && this.email == \"CONSTANT\"");
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start(paramMap)
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();

    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }

  public ArrayList<Document> basicDBObjectBuilderStartMap(String userName, String email) {
    HashMap<String, String> paramMap = new HashMap<>();
    // ok: mongodb-nosqli
    paramMap.put("sharedWith", userName);
    paramMap.put("email", email);
    BasicDBObject query = (BasicDBObject) BasicDBObjectBuilder
        .start(paramMap)
        .get();

    MongoCursor<Document> cursor = collection.find(query).iterator();
    ArrayList<Document> results = new ArrayList<>();
    while (cursor.hasNext()) {
      Document doc = cursor.next();
      results.add(doc);
    }

    return results;
  }
}
