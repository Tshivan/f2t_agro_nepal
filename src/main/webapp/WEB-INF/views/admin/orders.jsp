<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath }"></c:set>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agro ${title } </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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
<body class="bg-gray-100 min-h-screen">
    <!-- Sidebar -->
 <%@ include file="sidebar.jsp" %>

    <!-- Main Content -->
    <div class="ml-64">
        <!-- Top Header -->
        <header class="bg-white shadow-sm border-b border-gray-200">
            <div class="px-6 py-4">
                <div class="flex items-center justify-between">
                    <div>
                        <h1 class="text-2xl font-semibold text-gray-900">Manage Orders</h1>
                        <p class="text-gray-600 text-sm mt-1">Order Processing..</p>
                    </div>
                    <div class="flex items-center space-x-4">
                        <div class="relative">
                            <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                            <input type="text" placeholder="Search..." class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-cordes-accent focus:border-transparent outline-none">
                        </div>
                        <div class="relative">
                            <button class="p-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-lg transition-colors">
                                <i class="fas fa-bell text-xl"></i>
                                <span class="absolute -top-1 -right-1 w-5 h-5 bg-red-500 text-white text-xs rounded-full flex items-center justify-center">3</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Dashboard Content -->
        <main class="p-6">
         
          	<section>
			<div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <h2 class="text-2xl font-bold mb-4">Displaying All Orders</h2>
    <table id="category_table" class="table-auto w-full">
        <thead>
            <tr>
                <th class="px-4 py-2">Order ID</th>
                <th class="px-4 py-2">Date</th>
                <th class="px-4 py-2">Amount</th>
                <th class="px-4 py-2">Status</th>
                <th class="px-4 py-2">Edit</th>
                <th class="px-4 py-2">View Detail</th>
            </tr>
        </thead>
        <tbody>
        
        <c:forEach items="${order_list}" var="order">
            <tr>
                <td class="border px-4 py-2">${order.id }</td>
                <td class="border px-4 py-2">${order.orderDate }</td>
                <td class="border px-4 py-2">${order.billAmount}</td>
                <td class="border px-4 py-2">
                <form action="${cp}/admin/order/update/${order.id}" method="get">
	                <select name="status" required>
	                <option value="PENDING" ${order.status eq 'PENDING'? 'selected':'' }> Pending </option>
	                <option value="PROCESSING" ${order.status eq 'PROCESSING'? 'selected':'' }> Processing </option>
	                <option value="IN_DELIVERY" ${order.status eq 'IN_DELIVERY'? 'selected':'' }> In Delivery</option>
	                <option value="COMPLETED" ${order.status eq 'COMPLETED'? 'selected':'' }> Completed </option>
	                <option value="CANCELLED" ${order.status eq 'CANCELLED'? 'selected':'' }> Cancelled </option>
	                </select>
	            </td>
                <td class="border px-4 py-2">
                <button type="submit" class="flex items-center justify-center w-10 h-10 bg-orange-400 text-white transition-transform hover:scale-110"><i class="fas fa-edit"></i></button>
                </td>
                </form>
                <td class="border px-4 py-2"><a href="${cp }/admin/order/detail/${order.id}" class="flex items-center justify-center w-10 h-10  bg-red-900 text-white transition-transform hover:scale-110"><i class="fas fa-eye"></i></a></td>
            </tr>
        </c:forEach>    
            
        </tbody>
    </table>
</div>

			</section>
         
         
        </main>
        
        <footer>
         <div class="px-6 py-4">
                <div class="text-center">
                        <p class="text-gray-600 text-sm mt-1">&copy;Agro eCommerce7 2025, Powered By Spring Boot..</p>
                </div>
            </div>
        </footer>
    </div>

    <script>
       

        // Add some interactive functionality
        document.addEventListener('DOMContentLoaded', function() {
            // Sidebar navigation active state
            const navLinks = document.querySelectorAll('nav a');
            navLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    navLinks.forEach(l => l.classList.remove('bg-gray-700', 'text-white'));
                    navLinks.forEach(l => l.classList.add('text-gray-300'));
                    this.classList.add('bg-gray-700', 'text-white');
                    this.classList.remove('text-gray-300');
                });
            });

            // Set dashboard as active by default
            navLinks[0].classList.add('bg-gray-700', 'text-white');
            navLinks[0].classList.remove('text-gray-300');

            // Notification bell animation
            const bellIcon = document.querySelector('.fa-bell');
            if (bellIcon) {
                setInterval(() => {
                    bellIcon.classList.add('animate-pulse');
                    setTimeout(() => {
                        bellIcon.classList.remove('animate-pulse');
                    }, 1000);
                }, 5000);
            }

        
        });
    </script>
</body>
</html>