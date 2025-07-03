<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
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
<label>New user registration here</label>
<p>Signup to use agro products..</p>
</div>
</section>

<div class="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
    <div class="sm:mx-auto sm:w-full sm:max-w-md">
        <img class="mx-auto h-10 w-auto" src="https://www.svgrepo.com/show/301692/login.svg" alt="Workflow">
        <h2 class="mt-6 text-center text-3xl leading-9 font-extrabold text-gray-900">
            Create a new account
        </h2>
        <p class="mt-2 text-center text-sm leading-5 text-gray-500 max-w">
            Or
            <a href="${cp }/login"
                class="font-medium text-blue-600 hover:text-blue-500 focus:outline-none focus:underline transition ease-in-out duration-150">
                login to your account
            </a>
        </p>
    </div>

    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
            <form method="POST" action="${cp }/signup">
           <!-- field required to submit secure form to protect against CSRF attack -->
              <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
            
                <div>
                    <label for="fname" class="block text-sm font-medium leading-5  text-gray-700">First Name</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input id="fname" name="firstName" placeholder="Enter first name" type="text" required="required"
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
                    </div>
                </div>
                <div>
                    <label for="lname" class="block text-sm font-medium leading-5  text-gray-700">Last Name</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input id="lname" name="lastName" placeholder="Enter last name" type="text" required="required"
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
                    </div>
                </div>
                <div>
                    <label for="email" class="block text-sm font-medium leading-5  text-gray-700">Email</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input id="email" name="email" placeholder="Enter your email" type="email" required="required"
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
                    </div>
                </div>
                <div>
                    <label for="phone" class="block text-sm font-medium leading-5  text-gray-700">Phone No</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input id="phone" name="phoneNo" placeholder="Enter your phone no." type="text" required="required"
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
                    </div>
                </div>
                <div>
                    <label for="address" class="block text-sm font-medium leading-5  text-gray-700">Address</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input id="address" name="address" placeholder="Enter your full address" type="text" required=""
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
                    </div>
                </div>
                
                <div>
                    <label for="authority" class="block text-sm font-medium leading-5  text-gray-700">Authority</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                    <select id="authority" name="authority" type="text" required="required"
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
                    	<option value="ROLE_GUEST" disabled="disabled" selected="selected">--Select Authority--</option>
                    	<option value="ROLE_ADMIN">Administrator</option>
                    	<option value="ROLE_VENDER">Supplier</option>
                    	<option value="ROLE_USER">User</option>
                    </select>
                    </div>
                </div>
                


                <div class="mt-6">
                    <label for="username" class="block text-sm font-medium leading-5 text-gray-700">Username</label>
                    <div class="mt-1 rounded-md shadow-sm">
                        <input id="username" name="username" placeholder="Enter username" type="text" required="required"
                             class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
                   </div>
                </div>

                <div class="mt-6">
                    <label for="password" class="block text-sm font-medium leading-5 text-gray-700">
                        Password
                    </label>
                    <div class="mt-1 rounded-md shadow-sm">
                        <input id="password" name="password" type="password" required="required"
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
                    </div>
                </div>

                <div class="mt-6">
                    <label for="password_confirmation" class="block text-sm font-medium leading-5 text-gray-700">
                        Confirm Password
                    </label>
                    <div class="mt-1 rounded-md shadow-sm">
                        <input id="password_confirmation" name="cpassword" type="password" required="required"
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 transition duration-150 ease-in-out sm:text-sm sm:leading-5">
                    </div>
                </div>

                <div class="mt-6">
                    <span class="block w-full rounded-md shadow-sm">
                        <button type="submit"
                            class="w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out">
                            Create account
                        </button>
                    </span>
                </div>
            </form>

        </div>
    </div>
</div>


</main>
<aside>

</aside>
<footer>

</footer>
</body>
</html>