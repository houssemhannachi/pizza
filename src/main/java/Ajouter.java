

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import projetPizza.Pizza;

/**
 * Servlet implementation class Ajouter
 */
@WebServlet("/Ajouter")
public class Ajouter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ajouter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Enumeration <String> names =   request.getParameterNames();
		HashMap<String, Integer> pizzaMap = new HashMap<String, Integer>();
		pizzaMap.put("MARGHERITA",10);
		pizzaMap.put("SALMON",12);
		pizzaMap.put("NAPOLITAINE",12);
		pizzaMap.put("FORMAGGI",12);
		pizzaMap.put("BOLOGNAISE",13);
		pizzaMap.put("TONO",12);
		pizzaMap.put("FRUTTI DI MARE",12);
		
		List <Pizza> pizzas = new ArrayList<>();
		
		while (names.hasMoreElements()) {
			String value = request.getParameter(names.nextElement());
			if (value!=null) {
				Pizza pizza = new Pizza();
				pizza.setNom(value);
				pizza.setPrix(pizzaMap.get(value).intValue());
				pizzas.add(pizza);
			}
		}
	
		if(session.getAttribute("pizzas") != null) {
			pizzas.addAll((ArrayList<Pizza>)session.getAttribute("pizzas"));
		}
		session.setAttribute("pizzas", pizzas);
		
		
		response.sendRedirect("/projetPizza/menu.html");
		
	}

}
