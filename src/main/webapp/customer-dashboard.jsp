<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, Model.Food" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grab & Go – Customer Dashboard</title>
    <link rel="stylesheet" href="css/customer-dashboard.css">
</head>
<body>

<section class="hero" style="background-image: url('${pageContext.request.contextPath}/images/herofood.png');">
    <div class="hero-overlay"></div>
    <div class="hero-content">
        <h1>Satisfy Your Cravings,</h1>
        <p>Order Online, Grab Hot and Fresh!</p>
        <a href="MenuServlet" class="hero-btn">Browse Menu</a>
    </div>	
</section>

<%
    Map<String, List<Food>> categorizedFoods = (Map<String, List<Food>>) request.getAttribute("categorizedFoods");
    if (categorizedFoods != null && !categorizedFoods.isEmpty()) {
        for (Map.Entry<String, List<Food>> entry : categorizedFoods.entrySet()) {
            String category = entry.getKey();
            List<Food> items = entry.getValue();
            if (items != null && !items.isEmpty()) {
%>
<section class="featured-menu">
    <h2 class="section-title"><%= category %></h2>
    <div class="menu-grid">
        <%
            int count = 0;
            for (Food food : items) {
                if (count >= 3) break;
                count++;
        %>
        <a href="FoodDetailsServlet?foodId=<%= food.getFoodId() %>" class="menu-item">
            <div class="menu-content">
                <img src="<%= request.getContextPath() + "/" + food.getImagePath() %>" alt="<%= food.getFoodName() %>">
                <h3><%= food.getFoodName() %></h3>
                <p><%= food.getFoodDescription() %></p>
            </div>
            <span class="price">$<%= food.getFoodPrice() %></span>
        </a>
        <%
            }
        %>
    </div>
</section>
<%
            }
        }
    } else {
%>
    <p style="text-align:center; margin-top: 50px;">No food items available right now.</p>
<%
    }
%>

<%@ include file="footer.jsp" %>
</body>
</html>
