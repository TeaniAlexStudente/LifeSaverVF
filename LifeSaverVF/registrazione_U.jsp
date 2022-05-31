<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Registrazione Utente</title>
    </head>
    <body>

        <h1>Registrazione Utente</h1>
        <form action= "registrazione_U.jsp" method="POST">
            <input type = "text" id = "cognome" name = "cognome" placeholder = "cognome">
            <input type = "text" id = "nome" name = "nome" placeholder = "nome">
            <input type= "text" id= "username" name= "username" placeholder= "username">
            <input type= "password" id= "password" name= "password" placeholder= "password">
            <input type = "text" id = "mail" name = "mail" placeholder = "mail">
            <input type="submit" id="button" name="button" value="Registrati">
        </form>

        <%
        String DRIVER = "net.ucanaccess.jdbc.UcanaccessDriver";
        
        String cognome = null;
        String nome = null;
        String username=null;
        String password=null;
        String mail = null;
               
        Connection connection=null;
        try{
            Class.forName(DRIVER);
        }
        catch (ClassNotFoundException e) {
            out.println("Errore nel caricare il Driver Ucanaccess");
        }
        try{
            
            cognome =request.getParameter("cognome");
            nome = request.getParameter("nome");
            username = request.getParameter("username");
            password = request.getParameter("password");
            mail = request.getParameter("mail");
            
            connection = DriverManager.getConnection("jdbc:ucanaccess://" + request.getServletContext().getRealPath("/") + "Dati.accdb");
            
            Statement st = connection.createStatement();
            String query2 = "SELECT * FROM Utenti WHERE email = '"+mail+"';";           
            String query = "INSERT INTO Utenti (username, password, email, nome, cognome) VALUES ('"+username+"', '"+password+"', '"+mail+"', '"+nome+"' , '"+cognome+"')";
            ResultSet result = st.executeQuery(query2);
            if(result.next()){
                out.println("<p>Esiste già un account con queste credenziali</p>");
            }else{
                st.executeUpdate(query);
                response.sendRedirect("login_U.jsp"); //red al login utenti
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