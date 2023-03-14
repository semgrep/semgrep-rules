public class FirstServlet extends HttpServlet { 
	private static final ong serialVersionUID =1L;
	private String idemployee;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException
	{       
		DBfunctions db;
		Employee employee;

		idemployee = request.getParameter("idemployee"); 
		PrintWriter out=response.getWriter();
		out.println("<html> <body> GET parameter:" + idemployee);
		employee = db.searchEmployee(idemployee);
		out.println("<html> <body> GET parameter:" + employee.name);
		out.println("<html> <body> GET parameter:" + employee.address);
		out.println("</body> </html>");
		
	}
