<!-- cf. https://github.com/nirmaldhara/Jsp-hello-world/blob/master/WebContent/index.jsp -->
<!-- ok: no-scriptlets -->
<%@ page import="java.util.*,java.io.*"%>
<!-- ruleid: no-scriptlets -->
<% %>
<html>
<body>
<!-- declaration  -->
<!-- ruleid: no-scriptlets -->
<%!String msg="Hello World"; %>
<!-- 1.	scriptlet  -->
<!-- ruleid: no-scriptlets -->
<%
out.println("From scriptlet   "+msg);
%>

<br>
<!-- expression  -->
<!-- ruleid: no-scriptlets -->
<%="From expression   "+msg %>
</body>
</html>
