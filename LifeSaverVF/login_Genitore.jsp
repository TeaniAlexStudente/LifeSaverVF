<!DOCTYPE html>

<html>
    <head>
        <title>LifeSaver - Login Genitore</title>
    </head>

    <body>
        <h1>Login effettuato correttamente, scegliere la funzione desiderata.</h1>

		<%
		out.println("Benvenuto "+session.getAttribute("nome"));		
		%>

		<br></br>
        <a href = "ricezione.jsp"> 
            <input type="button" value="Ricevi posizione"/> <br> <br> 
        </a>

        <a href = "logOut.jsp"> 
            <input type="button" value=" Log Out"/> <br> 
        </a>
    </body>
</html> 