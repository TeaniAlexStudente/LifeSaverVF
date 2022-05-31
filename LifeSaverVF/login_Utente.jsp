<!DOCTYPE html>

<html>
    <head>
        <title>LifeSaver - Login utente</title>
    </head>

    <body>
        <h1>Login effettuato correttamente, scegliere la funzione desiderata.</h1>


		<%
		out.println("Benvenuto "+session.getAttribute("nome"));
		
		%>
		<br>
		<br>

        <a href = "tracking.jsp"> 
            <input type="button" value="Avvia tracking"/> <br> <br> 
        </a>

        <a href = "logOut.jsp"> 
            <input type="button" value=" Log Out"/> <br> 
        </a>
    </body>
</html> 