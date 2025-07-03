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
						<h1 class="text-2xl font-semibold text-gray-900">Product
							Management</h1>
						<p class="text-gray-600 text-sm mt-1">Manage agricultural products</p>
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
			<!-- add product form -->
			<div
					class=" max-w-96 sm:max-w-4xl mx-auto border border-[#4D7C0F] rounded-lg p-8">
					<h2 class="sm:text-xl text-[12px] font-bold mb-6">Add New
						Product</h2>
					<form action="${cp}/admin/product/save" method="post" enctype="multipart/form-data">
					
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						
						<div class="space-y-6">
							<div>
								<label for="name" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Product Name 
								</label>
								<input type="text" id="name" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="name" placeholder="Enter product name" required="required">
							</div>
							<div>
								<label for="description" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">Product Description
								</label>
								<textarea id="description" rows="5" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="description" placeholder="Enter product descrition" required="required"></textarea>
							</div>
							<div>
								<label for="price" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Per unit Price
								</label>
								<input type="text" id="price" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="perUnitPrice" placeholder="Enter product price" required="required">
							</div>
							<div>
								<label for="discount" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Discount Rate 
								</label>
								<input type="text" id="discount" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="discount" placeholder="Enter discount rate" >
							</div>
							<div>
								<label for="harvest_date" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Product Harvest Date 
								</label>
								<input type="date" id="harvest_date" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="harvestDate" placeholder="Enter harvest date" required="required">
							</div>
							<div>
								<label for="shelf_life" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Product Shelf Life (Days)
								</label>
								<input type="text" id="shelf_life" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="shelfLife" placeholder="Enter product shelf life" required="required">
							</div>
							<div>
								<label for="available_stock" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Available Stock 
								</label>
								<input type="text" id="available_stock" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="availableStock" placeholder="Enter available stock" required="required">
							</div>
							<div>
								<label for="image" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Product Image
								</label>
								<input type="file" id="image" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="image" placeholder="Enter product image" required="required">
							</div>
							<div>
								<label for="farm_name" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Producer Farm Name
								</label>
								<input type="text" id="farm_name" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="farmName" placeholder="Enter farm name" >
							</div>
							<div>
								<label for="processing_method" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Processing Method
								</label>
								<div class="h-[50px] text-xs xs:text-sm w-full px-2 py-2">
								<input type="radio" id="processingMethod"  name="processingMethod" value="organic" > &nbsp; Organic &nbsp; &nbsp;
								<input type="radio" id="pm"  name="processingMethod" value="semiorganic" > &nbsp; Semi-Organic &nbsp; &nbsp;
								</div>
							</div>	
							<div>
								<label for="farm_name" class="text-xs xs:text-sm font-medium text-gray-700 mb-1 ">
								Product Seasonality
								</label>
								<input type="text" id="seasonality" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2"
									name="seasonality" placeholder="Enter product seasonality" >
							</div>						
							<div class="grid sm:grid-cols-2 grid-cols-1 gap-6">
								<div>
									<label for="categoryParent"
										class="text-xs xs:text-sm font-medium text-gray-700 mb-1">Category
										<span class="font-light">(Optional)</span>
									</label>
									<select name="category" id="category" class="h-[50px] rounded-[5px] text-xs xs:text-sm border border-[#D1D5DB] w-full px-2">
										<option value="0" disabled="disabled" selected="selected">Select a category</option>
										<c:forEach items="${category_list }" var="cat">
											<option value="${ cat.id}">${cat.name }</option>
										</c:forEach>
										</select>
								</div>
								
							</div>
						</div>
						<div class="mt-8 pt-6 border-t border-gray-200 flex justify-end">
							<button type="submit"
								class=" sm:w-[86px] w-full h-[50px] text-xs sm:text-base bg-[#4D7C0F] rounded-[5px] p-[13px_25px] gap-[10px] text-white">Save</button>
						</div>
					</form>
				</div>
			</c:when>
			<c:otherwise>
			<!-- edit category form -->
			
			</c:otherwise>
			</c:choose>
			
				
			</section>
			
			
	<section>
			<div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <h2 class="text-2xl font-bold mb-4">Displaying All Products</h2>
    <table id="product_table" class="table-auto w-full">
        <thead>
            <tr>
                <th class="px-4 py-2">ProductID</th>
                <th class="px-4 py-2">Name</th>
                <th class="px-4 py-2">Description</th>
                <th class="px-4 py-2">UnitPrice</th>
                <th class="px-4 py-2">Discount</th>
                <th class="px-4 py-2">HarvestDate</th>
                <th class="px-4 py-2">ShelfLife</th>
                <th class="px-4 py-2">AvaialbleStock</th>
                <th class="px-4 py-2">Image</th>
                <th class="px-4 py-2">Farm</th>
                <th class="px-4 py-2">Processing</th>
                <th class="px-4 py-2">Season</th>
                <th class="px-4 py-2">Category</th>
                <th class="px-4 py-2">Edit</th>
                <th class="px-4 py-2">Delete</th>
            </tr>
        </thead>
        <tbody>
        
        <c:forEach items="${product_list }" var="product">
            <tr>
                <td class="border px-4 py-2">${product.id }</td>
                <td class="border px-4 py-2">${product.name }</td>
                <td class="border px-4 py-2">${product.description}</td>
                <td class="border px-4 py-2">${product.perUnitPrice}</td>
               <td class="border px-4 py-2">${product.discount }</td>
                <td class="border px-4 py-2">${product.harvestDate }</td>
                <td class="border px-4 py-2">${product.shelfLife}</td>
                <td class="border px-4 py-2">${product.availableStock}</td>
               <td class="border px-4 py-2"><img src="${cp}/product_image/${product.imageName }" height="120px" alt="${product.imageName }"></td>
                <td class="border px-4 py-2">${product.farmName }</td>
                <td class="border px-4 py-2">${product.processingMethod}</td>
                <td class="border px-4 py-2">${product.seasonality}</td>
                <td class="border px-4 py-2">${product.category.name }</td>
                <td class="border px-4 py-2"><a href="${cp }/admin/product/edit/${product.id}" class="flex items-center justify-center w-10 h-10 bg-orange-400 text-white transition-transform hover:scale-110"><i class="fas fa-edit"></i></a></td>
                <td class="border px-4 py-2"><a href="${cp }/admin/product/delete/${product.id}" class="flex items-center justify-center w-10 h-10  bg-red-900 text-white transition-transform hover:scale-110"><i class="fas fa-trash"></i></a></td>
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