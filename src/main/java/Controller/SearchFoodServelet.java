package Controller;

import DAO.FoodDAO;
import Model.Food;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/SearchFoodServelet")
public class SearchFoodServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SearchFoodServelet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	 String keyword = request.getParameter("search");

    	    try { 
    	        FoodDAO foodDAO = new FoodDAO();
    	        List<Food> searchResults = foodDAO.searchFoodItems(keyword); 
    	        request.setAttribute("searchResults", searchResults);
    	        request.setAttribute("searchKeyword", keyword);

    	        RequestDispatcher dispatcher = request.getRequestDispatcher("search-results.jsp");
    	        dispatcher.forward(request, response);

    	    } catch (Exception e) {
    	        e.printStackTrace();
    	        request.setAttribute("errorMessage", "Error searching food items.");
    	        request.getRequestDispatcher("menu.jsp").forward(request, response);
    	    }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response); 
    }
}
