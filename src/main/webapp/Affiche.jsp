<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import= "projetPizza.Pizza" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   table, th, td {
     border:1px solid black;
   }
   
</style>
<body>
    <% if (session.getAttribute("pizzas")==null){
    	session.setAttribute("pizzas", new ArrayList<Pizza>());
    }
    %>
    <h2>SOUHAITEZ-VOUS COMMANDER ?</h2>
    
    <table style="width:100%">
      <tr>
        <th>Pizzas</th>
        <th>Prix</th>
      </tr>
      
  
      <% List <Pizza> pizzas = new ArrayList<>();
		pizzas = (List<Pizza>) session.getAttribute("pizzas"); %>
		<% int prix = 0; %>
			
		
		<% for(Pizza pizza:pizzas){
			prix = prix + pizza.getPrix();%>
      <tr>
     
        <td><%= pizza.getNom() %>
        
        <% out.println("<a href=\"http://localhost:8080/projetPizza/Supprimer?id="+pizzas.indexOf(pizza)+"\">supprimer</a>"); %>
        </td>
        <td><%= pizza.getPrix() %>€</td>
      </tr>
      <% } %>
    </table>
    <strong>Le prix total à payer : <%= prix %>€</strong> <br>
    <a href="http://localhost:8080/projetPizza/formulaire.html"><button type="button">Valider</button></a>
    <a href="http://localhost:8080/projetPizza/menu.html"><button type="button">Afficher Menu</button></a>
</body>

</html>