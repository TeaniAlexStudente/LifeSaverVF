<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Tracking</title>
    </head>
    <body>

        <h1>Collegamento con LifeSaver</h1>
        <form action= "tracking.jsp" method="POST">
            <input type = "text" id = "testo" name = "testo" placeholder = "inserire eventuali appunti">
        </form>

        <%
        String DRIVER = "net.ucanaccess.jdbc.UcanaccessDriver";
        
        String testo = null;
               
        Connection connection=null;
        try{
            Class.forName(DRIVER);
        }
        catch (ClassNotFoundException e) {
            out.println("Errore nel caricare il Driver Ucanaccess");
        }
        try{
            
            testo =request.getParameter("testo");
            
            
            connection = DriverManager.getConnection("jdbc:ucanaccess://" + request.getServletContext().getRealPath("/") + "Dati.accdb");
            
            Statement st = connection.createStatement();           
            String query = "";
            
           
                        
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














		<a href = "index.html"> 
            <input type="button" value="Torna alla home"/> <br> 
        </a>