<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Order</title>
<link rel="stylesheet" href="${cp }/css/app_style.css"/>
<script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'cordes-blue': '#1e40af',
                        'cordes-dark': '#1e293b',
                        'cordes-light': '#f8fafc',
                        'cordes-accent': '#3b82f6'
                    }
                }
            }
        }
    </script>

</head>
<body>
<header>
<h1>Welcome to agro ecommerce app..</h1>
</header>
<nav>
<%@ include file="menu.jsp"%>
</nav>

<main>

<section class="info">
<div>
<label>Your Order's of Agro Products</label>
</div>
</section>



<section class="container mx-auto p-10 md:py-12 px-0 md:p-8 md:px-0">
    <h2 class="text-2xl font-bold mb-4">Displaying All Cart Items</h2>
    <table id="cart_table" class="table-auto w-full">
        <thead>
            <tr>
                <th class="px-4 py-2">Order ID</th>
                <th class="px-4 py-2">Product</th>
                <th class="px-4 py-2">Quantity</th>
                <th class="px-4 py-2">Price/Unit</th>
                <th class="px-4 py-2">Discount</th>
                <th class="px-4 py-2">Total Price</th>
                <th class="px-4 py-2">Order Date</th>
                <th class="px-4 py-2">Payment Mode</th>
               <th class="px-4 py-2">Status</th>
                <th class="px-4 py-2">Delete</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${order_list }" var="order">
        	<c:forEach items="${order.orderedProducts }" var="orderProduct">
        	
        	<c:set var="total" value="${(orderProduct.product.perUnitPrice - orderProduct.product.discount)*orderProduct.quantity}"/>
              <tr>
              
                <td class="border px-4 py-2">${order.id }</td>
                <td class="border px-4 py-2">${orderProduct.product.name }</td>
                <td class="border px-4 py-2">${orderProduct.quantity}</td>
                <td class="border px-4 py-2">${orderProduct.product.perUnitPrice}</td>
                <td class="border px-4 py-2">${orderProduct.product.discount}</td>
                <td class="border px-4 py-2">${total}</td>
                <td class="border px-4 py-2">${order.orderDate}</td>
                <td class="border px-4 py-2">${order.paymentMode}</td>
                <td class="border px-4 py-2">${order.status}</td>
                <td class="border px-4 py-2">
                <c:if test="${order.status.contains('PENDING')}"> 
                <a href="http://localhost:9090/user/order/delete/${order.id}" class="flex items-center justify-center w-10 h-10  bg-red-900 text-white transition-transform hover:scale-110"><i class="fas fa-trash"></i></a>
                </c:if>
                </td>
            </tr>
            </c:forEach>
           
        </c:forEach>    
        </tbody>
        <tfoot>
        <tr>
        <th> </th>
        <th colspan="4">Grand Total</th>
        <th>${grand_total }</th>
        <th colspan="4"> </th>
        </tr>
        </tfoot>
    </table>
        
  
</section>

</main>
<aside>

</aside>
<footer>

</footer>

</body>
</html>