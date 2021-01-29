package com.vogella.logger.test;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.vogella.logger.MyLogger;

public class TestLog1 {
  private final static Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ruleid: crlf-injection-logs
        String param = request.getParameter("param");
        log.info("foo"+param+"bar");
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}

public class TestLog2 {
  private final static Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);

  @Override
  public void doFilter(ServletRequest request, ServletResponse response,
    FilterChain chain) throws IOException, ServletException {
      HttpServletResponse httpServletResponse = (HttpServletResponse) response;
      // ruleid: crlf-injection-logs
      String param = request.getParameter("param");
      log.log(log.getLevel(), "foo"+param);
  }
}

public class TestLog3 {
  private final static Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // ruleid: crlf-injection-logs
      log.info("foo"+request.getParameter("param"));
      response.getWriter().append("Served at: ").append(request.getContextPath());
  }
}

public class TestLog4 {
  private final static Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);

  @Override
  public void doFilter(ServletRequest request, ServletResponse response,
    FilterChain chain) throws IOException, ServletException {
      HttpServletRequest httpServletReq = (HttpServletRequest) request;
      // ruleid: crlf-injection-logs
      String param = httpServletReq.getParameter("param");
      log.log(log.getLevel(), param);
  }
}

public class TestLog5 {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response,
    FilterChain chain) throws IOException, ServletException {
      Logger  log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
      HttpServletRequest httpServletReq = (HttpServletRequest) request;
      // ruleid: crlf-injection-logs
      String param = httpServletReq.getParameter("foo");
      log.log(log.getLevel(), param+"bar");
  }
}

public class OkTestLog1 {
  private final static NotLogger log = new NorLogger();

  @Override
  public void doFilter(ServletRequest request, ServletResponse response,
    FilterChain chain) throws IOException, ServletException {
      HttpServletRequest httpServletReq = (HttpServletRequest) request;
      // ok: crlf-injection-logs
      String param = httpServletReq.getParameter("param");
      log.info(param);
  }
}

public class OkTestLog2 {
  @Override
  public void doFilter(ServletRequest request, ServletResponse response,
    FilterChain chain) throws IOException, ServletException {
      Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
      HttpServletRequest httpServletReq = (HttpServletRequest) request;
      // ok: crlf-injection-logs
      String param = "foobar";
      log.log(log.getLevel(), param);
  }
}
