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
<h1>Welcome to agro ecommerce app..</h1>
</header>
<nav>
<%@ include file="menu.jsp"%>
</nav>

<main>

<section class="info">
<div>
<label>Cart of Agro Products</label>
</div>
</section>



<section class="container mx-auto p-10 md:py-12 px-0 md:p-8 md:px-0">
    <h2 class="text-2xl font-bold mb-4">Displaying All Cart Items</h2>
    <table id="cart_table" class="table-auto w-full">
        <thead>
            <tr>
                <th class="px-4 py-2">Cart ID</th>
                <th class="px-4 py-2">Product</th>
                <th class="px-4 py-2">Quantity</th>
                <th class="px-4 py-2">Price/Unit</th>
                <th class="px-4 py-2">Discount</th>
                <th class="px-4 py-2">Total Price</th>
                <th class="px-4 py-2">Added Date</th>
                <th class="px-4 py-2">Image</th>
                <th class="px-4 py-2">Edit</th>
                <th class="px-4 py-2">Delete</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="grand_total" value="0"/>
        <c:forEach items="${cart_list }" var="cart">
        	<c:set var="total" value="${(cart.product.perUnitPrice - cart.product.discount)*cart.quantity}"/>
            <form action="${cp }/user/cart/edit/${cart.id}" method="get">
            		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	        <tr>
                <td class="border px-4 py-2">${cart.id }</td>
                <td class="border px-4 py-2">${cart.product.name }</td>
                <td class="border px-4 py-2">
                	<input class="mb-5" type="number" min="1" step="1" name="quantity" value="${cart.quantity}" required="required"/>
            	</td>
                <td class="border px-4 py-2">${cart.product.perUnitPrice}</td>
                <td class="border px-4 py-2">${cart.product.discount}</td>
                <td class="border px-4 py-2">${total}</td>
                <td class="border px-4 py-2">${cart.addedDate}</td>
                <td class="border px-4 py-2">
                <img src="${cp }/product_image/${cart.product.imageName}" height="120px" alt="${cart.product.name}"/>
                </td>
                <td class="border px-4 py-2">
                <button type="submit" class="flex items-center justify-center w-10 h-10 bg-orange-400 text-white transition-transform hover:scale-110"><i class="fas fa-edit"></i></button>
                <td class="border px-4 py-2"><a href="${cp }/user/cart/delete/${cart.id}" class="flex items-center justify-center w-10 h-10  bg-red-900 text-white transition-transform hover:scale-110"><i class="fas fa-trash"></i></a></td>
            </tr>
            </form>
            <c:set var="grand_total" value="${grand_total + total }"/>
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

<div class="mt-10 ml-10 mb-10">  
   <a href="#" onclick="openModal('modelConfirm')" class="justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
    Proceed to Checkout
   </a>

</div>

</main>
<aside>

</aside>
<footer>

</footer>

<div class="h-screen w-screen bg-gray-400">

    <!-- modal -->
    
<div id="modelConfirm" class="fixed hidden z-50 inset-0 bg-gray-900 bg-opacity-60 overflow-y-auto h-full w-full px-4 ">
        <div class="flex justify-end p-2">
            <button onclick="closeModal('modelConfirm')" type="button"
                class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
                <i class="fa-fas-fa-times"></i>
            </button>
        </div>
    
    <div class="fixed grid place-items-center backdrop-blur-sm top-0 right-0 left-0 z-50 w-full inset-0 h-modal h-full justify-center items-center">
        <div class="relative container m-auto px-6">
            <div class="m-auto md:w-7/12">
                <div class="rounded-xl bg-white dark:bg-gray-800 shadow-xl">
                    <div class="p-8">
                        <div class="space-y-4">
                            <img src="https://www.svgrepo.com/show/475643/dribbble-color.svg" loading="lazy"class="w-10">
                            <h2 class="mb-8 text-2xl text-cyan-900 dark:text-white font-bold">Proceed to checkout <br>
                                Choose your payment mode.
                            </h2>
                        </div>
                        <div class="mt-10 grid space-y-4">
                           
                                
                                <div class="relative flex items-center space-x-4 justify-center">
                                	 <a href="${cp }/user/pay/cod" class="group h-12 px-6 border-2 border-gray-300 rounded-full transition duration-300 hover:border-blue-400 focus:bg-blue-50 active:bg-blue-100">
                                    <img src="https://www.svgrepo.com/show/475656/google-color.svg"
                                        class="absolute left-0 w-5" alt="google logo">
                                    <span
                                        class="block w-max font-semibold tracking-wide text-gray-700 dark:text-white text-sm transition duration-300 group-hover:text-blue-600 sm:text-base">Continue
                                        Cash On Delivery
                                    </span>
                                     </a>
                                </div>
                         
                            <div class="relative flex items-center space-x-4 justify-center">
                             <a href="${cp }/user/pay/esewa"
                                class="group h-12 px-6 border-2 border-gray-300 rounded-full transition duration-300 hover:border-blue-400 focus:bg-blue-50 active:bg-blue-100">
                               
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                                        class="absolute left-0 w-5 text-gray-700" viewBox="0 0 16 16">
                                        <path
                                            d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z">
                                        </path>
                                    </svg>
                                    <span
                                        class="block w-max font-semibold tracking-wide text-gray-700 text-sm transition dark:text-white duration-300 group-hover:text-blue-600 sm:text-base">Continue
                                        Pay via eSewa
                                    </span>
                                     </a>
                                </div>
                           
                        </div>
                        <div class="mt-14 space-y-4 py-3 text-gray-600 dark:text-gray-400 text-center">
                            <p class="text-xs">By proceeding, you agree to our
                                <a href="/privacy-policy/" class="underline">Terms of Use</a>
                                and confirm you have read our
                                <a href="/privacy-policy/" class="underline">Privacy and Cookie Statement</a>.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    </div>
    </div>

</div>

<script type="text/javascript">
    window.openModal = function(modalId) {
        document.getElementById(modalId).style.display = 'block'
        document.getElementsByTagName('body')[0].classList.add('overflow-y-hidden')
    }

    window.closeModal = function(modalId) {
        document.getElementById(modalId).style.display = 'none'
        document.getElementsByTagName('body')[0].classList.remove('overflow-y-hidden')
    }

    // Close all modals when press ESC
    document.onkeydown = function(event) {
        event = event || window.event;
        if (event.keyCode === 27) {
            document.getElementsByTagName('body')[0].classList.remove('overflow-y-hidden')
            let modals = document.getElementsByClassName('modal');
            Array.prototype.slice.call(modals).forEach(i => {
                i.style.display = 'none'
            })
        }
    };
</script>
</body>
</html>