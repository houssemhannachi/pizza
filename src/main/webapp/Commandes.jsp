<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Commandes</title>
</head>
<style>
   table, th, td {
     border:1px solid black;
   }
   
</style>
<body>
	<%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import= "projetPizza.Pizza" %>
    <%@ page import= "projetPizza.Commande" %>
	<% ArrayList<Commande> listCommande; %>
	<% listCommande = (ArrayList<Commande>) application.getAttribute("commandes");	%>
	
	<table>
		<tr>
			 <th>Nom</th>
			 <th>Prenom</th>
			 <th>Adresse</th>
			 <th>Prix total</th>
		</tr>
		<%for(Commande comm:listCommande) { %>
		<tr>
			 <td><%= comm.getNom() %></td>
			 <td><%= comm.getPrenom() %></td>
			 <td><%= comm.getAdresse() %></td>
			<td> <% out.println("<a href = \"http://localhost:8080/projetPizza/AfficheCommande.jsp?id="+listCommande.indexOf(comm)+"\" >"+comm.getPrixTotal()); %>€</td>
		</tr>
		<%} %>
	</table>
	<br>
	<br>
	<form action="http://localhost:8080/projetPizza/Sauvegarder" method = "POST">
		<button type = "submit">Sauvegarder</button>
	</form>
	
	
</body>
</html>