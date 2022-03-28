import org.apache.log4j.Logger;

import java.io.*;
import java.util.*;

public class VulnerableLog4jExampleHandler implements HttpHandler {

  static Logger log = Logger.getLogger(log4jExample.class.getName());

  public void handle(HttpExchange he) throws IOException {
    string userAgent = he.getRequestHeader("user-agent");
    // ruleid: log4j-message-lookup-injection
    log.info("Request User Agent:" + userAgent);

  }
}
