<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%
	String fileName = request.getParameter("FileName");
	response.setContentType("text/html");
	InputStream in = null;
        try {
            in = new BufferedInputStream (new FileInputStream(fileName));
            int ch;
            while ((ch = in.read()) !=-1) {
                out.print((char)ch);
            }
        }
	catch(FileNotFoundException fe){
 		out.print("<html> <body> <P> File Not Found !! </P></body></html>");	    
	}
        finally {
            if (in != null) in.close();  // very important
        }

%>
