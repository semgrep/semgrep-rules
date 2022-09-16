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

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        String image = request.getParameter("image");
        // ruleid:httpservlet-path-traversal
        File file = new File("static/images/", image);

        if (!file.exists()) {
            log.info(image + " could not be created.");
            response.sendError();
        }

        response.sendRedirect("/index.html");
    }

    public void ok(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        // ok:httpservlet-path-traversal
        String image = request.getParameter("image");
        File file = new File("static/images/", FilenameUtils.getName(image));

        if (!file.exists()) {
            log.info(image + " could not be created.");
            response.sendError();
        }

        response.sendRedirect("/index.html");
    }
}

/**
 * OWASP Benchmark v1.2
 *
 * <p>This file is part of the Open Web Application Security Project (OWASP) Benchmark Project. For
 * details, please see <a
 * href="https://owasp.org/www-project-benchmark/">https://owasp.org/www-project-benchmark/</a>.
 *
 * <p>The OWASP Benchmark is free software: you can redistribute it and/or modify it under the terms
 * of the GNU General Public License as published by the Free Software Foundation, version 2.
 *
 * <p>The OWASP Benchmark is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
 * PURPOSE. See the GNU General Public License for more details.
 *
 * @author Dave Wichers
 * @created 2015
 */
package org.owasp.benchmark.testcode;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/pathtraver-00/BenchmarkTest00045")
public class BenchmarkTest00045 extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // some code
        response.setContentType("text/html;charset=UTF-8");

        String[] values = request.getParameterValues("BenchmarkTest00045");
        String param;
        if (values != null && values.length > 0) param = values[0];
        else param = "";

        String fileName = org.owasp.benchmark.helpers.Utils.TESTFILES_DIR + param;

        try (
        // Create the file first so the test won't throw an exception if it doesn't exist.
        // Note: Don't actually do this because this method signature could cause a tool to find
        // THIS file constructor
        // as a vuln, rather than the File signature we are trying to actually test.
        // If necessary, just run the benchmark twice. The 1st run should create all the necessary
        // files.
        // new java.io.File(org.owasp.benchmark.helpers.Utils.TESTFILES_DIR +
        // param).createNewFile();

        // ruleid: httpservlet-path-traversal
        java.io.FileOutputStream fos = new java.io.FileOutputStream(new java.io.FileInputStream(fileName).getFD()); ) {
            response.getWriter()
                    .println(
                            "Now ready to write to file: "
                                    + org.owasp.esapi.ESAPI.encoder().encodeForHTML(fileName));

        } catch (Exception e) {
            System.out.println("Couldn't open FileOutputStream on file: '" + fileName + "'");
        }
    }
}
