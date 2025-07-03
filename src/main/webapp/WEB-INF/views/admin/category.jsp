<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agro ${title }</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
	
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
	<%@ include file="sidebar.jsp"%>

	<!-- Main Content -->
	<div class="ml-64">
		<!-- Top Header -->
		<header class="bg-white shadow-sm border-b border-gray-200">
			<div class="px-6 py-4">
				<div class="flex items-center justify-between">
					<div>
						<h1 class="text-2xl font-semibold text-gray-900">Category
							Management</h1>
						<p class="text-gray-600 text-sm mt-1">Manage category of
							agricultural products</p>
					</div>
					<div class="flex items-center space-x-4">
						<div class="relative">
							<i
								class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
							<input type="text" placeholder="Search..."
								class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-cordes-accent focus:border-transparent outline-none">
						</div>
						<div class="relative">
							<button
								class="p-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-lg transition-colors">
								<i class="fas fa-bell text-xl"></i> <span
									class="absolute -top-1 -right-1 w-5 h-5 bg-red-500 text-white text-xs rounded-full flex items-center justify-center">3</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</header>

		<!-- Main Dashboard Content -->
		<main class="p-6">

			<!--  page specific content -->
			<section class="bg-white p-1 xs:p-8">
			
			<c:choose >
			<c:when test="${edit ne true }">
			<!-- add category form -->
			<div
					class=" max-w-96 sm:max-w-4xl mx-auto border border-[#4D7C0F] rounded-lg p-8">
					<h2 class="sm:text-xl text-[12px] font-bold mb-6">Add New
						Category</h2>
					<form action="${pageContext.request.contextPath }/admin/category/save" method="post">
					
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						
						<div class="space-y-6">
							<div>
								<label for="name"
									class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">Category Name 
									<svg xmlns="http://www.w3.org/2000/svg" width="17"
										height="17" color="#9CA3AF" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="lucide lucide-circle-alert inline-block">
										<circle cx="12" cy="12" r="10"></circle>
										<line x1="12" x2="12" y1="8" y2="12"></line>
										<line x1="12" x2="12.01" y1="16" y2="16"></line></svg>
								</label>
								<input type="text" id="name"
									class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="name" placeholder="Enter category name" required="required">
							</div>
							
							
							<div>
								<label for="description"
									class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">Category Description
									<svg xmlns="http://www.w3.org/2000/svg" width="17"
										height="17" color="#9CA3AF" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="lucide lucide-circle-alert inline-block">
										<circle cx="12" cy="12" r="10"></circle>
										<line x1="12" x2="12" y1="8" y2="12"></line>
										<line x1="12" x2="12.01" y1="16" y2="16"></line></svg>
								</label>
								<textarea id="description" rows="5"
									class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="description" placeholder="Enter category descrition" required="required"></textarea>
							</div>
							
							
							
							<div class="grid sm:grid-cols-2 grid-cols-1 gap-6">
								<div>
									<label for="categoryParent"
										class="text-xs xs:text-sm font-medium text-gray-700 mb-1">Category
										<span class="font-light">(Optional)</span>
									</label><select name="categoryParent" id="categoryParent"
										class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2">
										<option value="0" disabled="disabled" selected="selected">Select a category</option>
										<option value="0">Main Category</option>
										
										<c:forEach items="${category_list }" var="cat">
											<c:if test="${cat.categoryParent eq 0 }">
												<option value="${ cat.id}">${cat.name }</option>
											</c:if>
										</c:forEach>
										</select>
								</div>
								
							</div>
						</div>
						<div class="mt-8 pt-6 border-t border-gray-200 flex justify-end">
							<button type="submit"
								class=" sm:w-[86px] w-full h-[50px] text-xs sm:text-base bg-[#4D7C0F] rounded-[5px] p-[13px_25px] gap-[10px] text-white">Next</button>
						</div>
					</form>
				</div>
			</c:when>
			<c:otherwise>
			<!-- edit category form -->
			<div class=" max-w-96 sm:max-w-4xl mx-auto border border-[#4D7C0F] rounded-lg p-8">
					<h2 class="sm:text-xl text-[12px] font-bold mb-6">Update Category</h2>
					<form action="${pageContext.request.contextPath }/admin/category/update" method="post">
					
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					 
					 <input type="hidden" name="id" value="${edit_category.id }">
						
						<div class="space-y-6">
							<div>
								<label for="name"
									class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">Category Name 
									<svg xmlns="http://www.w3.org/2000/svg" width="17"
										height="17" color="#9CA3AF" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="lucide lucide-circle-alert inline-block">
										<circle cx="12" cy="12" r="10"></circle>
										<line x1="12" x2="12" y1="8" y2="12"></line>
										<line x1="12" x2="12.01" y1="16" y2="16"></line></svg>
								</label>
								<input type="text" id="name"
									class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="name" value="${edit_category.name }" required="required">
							</div>
							
							
							<div>
								<label for="description"
									class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">Category Description
									<svg xmlns="http://www.w3.org/2000/svg" width="17"
										height="17" color="#9CA3AF" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="lucide lucide-circle-alert inline-block">
										<circle cx="12" cy="12" r="10"></circle>
										<line x1="12" x2="12" y1="8" y2="12"></line>
										<line x1="12" x2="12.01" y1="16" y2="16"></line></svg>
								</label>
								<textarea id="description" rows="5"
									class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="description" required="required">${edit_category.description }</textarea>
							</div>
							
							
							
							<div class="grid sm:grid-cols-2 grid-cols-1 gap-6">
								<div>
									<label for="parentCategory"
										class="text-xs xs:text-sm font-medium text-gray-700 mb-1">Category
										<span class="font-light">(Optional)</span>
									</label><select name="categoryParent" id="parentCategory"
										class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2">
										<option value="0" disabled="disabled" selected="selected">Select a category</option>
										<option value="0" ${edit_category.categoryParent eq 0 ? "selected" : "" }>Main Category</option>
										
										<c:forEach items="${category_list }" var="cat">
											<c:if test="${cat.categoryParent eq 0 }">
												<option value="${ cat.id}" ${edit_category.categoryParent eq cat.id ? "selected" : "" }>${cat.name }</option>
											</c:if>
										</c:forEach>
										</select>
								</div>
								
							</div>
						</div>
						<div class="mt-8 pt-6 border-t border-gray-200 flex justify-end">
							<button type="submit"
								class=" sm:w-[86px] w-full h-[50px] text-xs sm:text-base bg-[#4D7C0F] rounded-[5px] p-[13px_25px] gap-[10px] text-white">Next</button>
						</div>
					</form>
				</div>
			</c:otherwise>
			</c:choose>
			
				
			</section>
			
			
	<section>
			<div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <h2 class="text-2xl font-bold mb-4">Displaying All Categories</h2>
    <table id="category_table" class="table-auto w-full">
        <thead>
            <tr>
                <th class="px-4 py-2">Category ID</th>
                <th class="px-4 py-2">Name</th>
                <th class="px-4 py-2">Description</th>
                <th class="px-4 py-2">Parent Category</th>
                <th class="px-4 py-2">Edit</th>
                <th class="px-4 py-2">Delete</th>
            </tr>
        </thead>
        <tbody>
        
        <c:forEach items="${category_list }" var="category">
            <tr>
                <td class="border px-4 py-2">${category.id }</td>
                <td class="border px-4 py-2">${category.name }</td>
                <td class="border px-4 py-2">${category.description}</td>
                <td class="border px-4 py-2">${category.categoryParent eq 0 ? "Main Cateogry": "Sub Category" }</td>
                <td class="border px-4 py-2"><a href="${cp }/admin/category/edit/${category.id}" class="flex items-center justify-center w-10 h-10 bg-orange-400 text-white transition-transform hover:scale-110"><i class="fas fa-edit"></i></a></td>
                <td class="border px-4 py-2"><a href="${cp }/admin/category/delete/${category.id}" class="flex items-center justify-center w-10 h-10  bg-red-900 text-white transition-transform hover:scale-110"><i class="fas fa-trash"></i></a></td>
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
					<p class="text-gray-600 text-sm mt-1">&copy;Agro eCommerce7
						2025, Powered By Spring Boot..</p>
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
    
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function() {
        $('#category_table').DataTable({
            // Add any customization options here
        });
    });
</script>
</body>
</html>