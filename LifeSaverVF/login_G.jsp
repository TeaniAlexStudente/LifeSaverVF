<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
   <head>
        <title>Login Genitore</title>
   </head>

    <body>
        <h1>Login Genitore</h1>
        <form action="login_G.jsp" method="POST">
            <input type="text" id="username" name="username" placeholder="username">
            <input type="password" id="password" name="password" placeholder="password">
            <input type="submit" id="button" name="button" value="Accedi">
        </form>

        <a href = "index.html"> 
            <input type="button" value="Torna alla home"/> <br> 
        </a>

        <%
        String DRIVER = "net.ucanaccess.jdbc.UcanaccessDriver";
        
        String username=null;
        String password=null;
        Connection connection=null;
        try{
            Class.forName(DRIVER);
        }
        catch (ClassNotFoundException e) {
            out.println("Errore nel caricare il Driver Ucanaccess");
        }
        try{
            username=request.getParameter("username");
            password=request.getParameter("password");
            connection = DriverManager.getConnection("jdbc:ucanaccess://" + request.getServletContext().getRealPath("/") + "Dati.accdb");
            String query = "SELECT username FROM Genitori WHERE username = '"+username+"'AND password = '"+password+"';"; 
            
            Statement st = connection.createStatement();
            ResultSet result = st.executeQuery(query);			
			
          if(result.next()){  
				session.setAttribute("nome",username);
                response.sendRedirect(request.getContextPath()+"/login_Genitore.jsp"); 
            }
            else{
                if((username != null) && (password != null)){
                    out.println("<p>Le credenziali inserite sono errate.</p>");
					out.println("<p>Controlla di aver inserito correttamente i dati o di essere registrato.</p>");
                }              
            }
        }
        catch(Exception e){
            out.println(e);
        }
        finally{
            if(connection != null){
                try{
                    connection.close();
                }
                catch(Exception e){out.println("La connessione non è stata chiusa correttamente...");}
            }
        }
        %>
    </body>
</html> 