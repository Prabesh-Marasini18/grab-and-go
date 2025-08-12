package Controller;

import DAO.FoodDAO;
import Model.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/CustomerDashboardServlet")
public class CustomerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FoodDAO foodDAO = new FoodDAO();
        Map<String, List<Food>> categorizedFoods = new LinkedHashMap<>(); 
        
       
        String[] categories = {"Main Course", "Dessert", "Appetizer", "Beverage", "Salad", "Soup"};
        
        try {
            for (String category : categories) {
                List<Food> items = foodDAO.getFoodByCategory(category);
                if (items != null && !items.isEmpty()) {
                    categorizedFoods.put(category, items);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            
        }
        
       
        request.setAttribute("categorizedFoods", categorizedFoods);
        
       
        request.getRequestDispatcher("customer-dashboard.jsp").forward(request, response);
    }
}
