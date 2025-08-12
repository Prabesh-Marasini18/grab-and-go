<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${food.foodName} - Grab & Go</title>
   <link rel="stylesheet" type="text/css" href="css/food-details.css">
</head>
<body>

<div class="item-container">
    <img src="${food.imagePath}" alt="${food.foodName}" class="item-img" />
    <div class="item-details">
        <h1>${food.foodName}</h1>
        <p>${food.foodDescription}</p>
        <div class="price">$${food.foodPrice}</div>

        <form action="cart" method="post">
            <input type="hidden" name="action" value="add" />
            <input type="hidden" name="foodId" value="${food.foodId}" />
            <input type="hidden" name="foodName" value="${food.foodName}" />
            <input type="hidden" name="price" value="${food.foodPrice}" />

            <div class="quantity">
                <label for="qty">Quantity:</label>
                <input type="number" id="qty" name="quantity" value="1" min="1" max="${food.quantity}" />
            </div>

            <button type="submit" class="btn-add">Add to Cart</button>
        </form>
    </div>
</div>

</body>
</html>
