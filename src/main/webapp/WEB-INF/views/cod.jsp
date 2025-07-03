<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Cart</title>
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
<h1>Checkout</h1>
</header>
<nav>
<%@ include file="menu.jsp"%>
</nav>

<main>

<section class="info">
<div>
<label>Bill of Agro Products</label>
</div>
</section>



<section class="container mx-auto p-10 md:py-12 px-0 md:p-8 md:px-0">
    <h2 class="text-2xl font-bold mb-4">Billing</h2>
    <table id="cart_table" class="table-auto w-full">
        <thead>
            <tr>
                <th class="px-4 py-2">S.No.</th>
                <th class="px-4 py-2">Product</th>
                <th class="px-4 py-2">Quantity</th>
                <th class="px-4 py-2">Price/Unit</th>
                <th class="px-4 py-2">Discount</th>
                <th class="px-4 py-2">Total Price</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="grand_total" value="0"/>
        <c:set var="sn" value="1"/>
        <c:forEach items="${cart_list }" var="cart">
        	<c:set var="total" value="${(cart.product.perUnitPrice - cart.product.discount)*cart.quantity}"/>
            <tr>
                <td class="border px-4 py-2">${sn }</td>
                <td class="border px-4 py-2">${cart.product.name }</td>
                <td class="border px-4 py-2">${cart.quantity}</td>
                <td class="border px-4 py-2">Rs ${cart.product.perUnitPrice}</td>
                <td class="border px-4 py-2">Rs ${cart.product.discount}</td>
                <td class="border px-4 py-2">Rs ${total}</td>
             </tr>
          	 <c:set var="sn" value="${sn + 1 }"/>
            <c:set var="grand_total" value="${grand_total + total }"/>
        </c:forEach>    
        </tbody>
        <tfoot>
        <tr>
        <th> </th>
        <th colspan="4">Product Delivery Charge</th>
        <th>${pdc }</th>
        </tr>
        <tr>
        <th> </th>
        <th colspan="4">Grand Total</th>
        <th>${grand_total + pdc}</th>
        </tr>
        </tfoot>
    </table>
</section>

<div class="mt-10 ml-10 mb-10">  
   <a href="${cp }/user/order/save"  class="justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
    Click to Confirm Order
   </a>
</div>

</main>
<aside>

</aside>
<footer>

</footer>


</body>
</html>