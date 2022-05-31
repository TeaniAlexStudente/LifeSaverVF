<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
   <head>
        <title>Log Out</title>
   </head>

	<%
			session.invalidate();			
     %>
    <body>
        <h1>Log Out eseguito correttamente</h1>
        <a href = "index.html"> 
            <input type="button" value="Torna alla home"/> <br> 
        </a>

    </body>
</html> 