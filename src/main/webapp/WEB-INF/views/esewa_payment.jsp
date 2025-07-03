<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eSewa Payment</title>
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
    <h2 class="text-2xl font-bold mb-4">Payment Details</h2>
    
    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
           
            <form action="https://rc-epay.esewa.com.np/api/epay/main/v2/form" method="POST">
           
                <div>
                    <label for="amount" class="block text-sm font-medium leading-5  text-gray-700">Amount</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input type="text" id="amount" name="amount" value="${payment.amount }"  class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5" required>
                    </div>
                </div>
                
                <div>
                    <label for="tax_amount"  class="block text-sm font-medium leading-5  text-gray-700">Tax Amount</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input type="text" id="tax_amount" name="tax_amount" value="${payment.taxAmount }"  class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5" required>
                    </div>
                </div>
                
                <div>
                    <label for="total_amount"  class="block text-sm font-medium leading-5  text-gray-700">Total Amount</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input type="text" id="total_amount" name="total_amount" value="${payment.totalAmount }"  class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5" required>
                    </div>
                </div>
                
                <div>
                    <label for="transaction_uuid"  class="block text-sm font-medium leading-5  text-gray-700">Transaction ID</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input type="text" id="transaction_uuid" name="transaction_uuid" value="${payment.transactionUUID }"  class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5" required>
                    </div>
                </div>
                
                <div>
                    <label for="product_code"  class="block text-sm font-medium leading-5  text-gray-700">Product Code</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input type="text" id="product_code" name="product_code" value="${payment.productCode }"  class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5" required>
                    </div>
                </div>
                
                <div>
                    <label for="product_service_charge"  class="block text-sm font-medium leading-5  text-gray-700">Service Charge</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input type="text" id="product_service_charge" name="product_service_charge" value="${payment.psc }"  class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5" required>
                    </div>
                </div>
                
                <div>
                    <label for="product_delivery_charge"  class="block text-sm font-medium leading-5  text-gray-700">Delivery Charge</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input type="text" id="product_delivery_charge" name="product_delivery_charge" value="${payment.pdc }"  class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5" required>
                    </div>
                </div>
                
              
        
 <input type="text" id="success_url" name="success_url" value="${payment.successURL }" readonly required><br/>
 <input type="text" id="failure_url" name="failure_url" value="${payment.failureURL }" readonly required><br/>
 <input type="text" id="signed_field_names" name="signed_field_names" value="${payment.signedFieldNames }" readonly required> <br/>
 <input type="text" id="signature" name="signature" value="${payment.signature }" readonly required><br/>
  <input value="Submit" type="submit">
 </form>
 
 
  </div>
  </div>
</section>

</main>
<aside>

</aside>
<footer>

</footer>

</body>
</html>