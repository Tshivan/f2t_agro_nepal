<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

   <div class="fixed inset-y-0 left-0 w-64 bg-cordes-dark shadow-xl z-50">
        <div class="flex items-center justify-center h-16 bg-cordes-blue">
            <div class="flex items-center space-x-3">
                <div class="w-8 h-8 bg-white rounded-lg flex items-center justify-center">
                    <i class="fa-solid fa-leaf text-cordes-blue text-lg"></i>
                </div>
                <span class="text-white text-xl font-bold">Agro eCommerce</span>
            </div>
        </div>
        
        <nav class="mt-8 px-4">
            <div class="space-y-2">
                <a href="#" class="flex items-center px-4 py-3 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition-colors group">
                    <i class="fas fa-home mr-3 text-cordes-accent group-hover:text-white"></i>
                    Dashboard
                </a>
                <a href="${pageContext.request.contextPath }/admin/users/view" class="flex items-center px-4 py-3 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition-colors group">
                    <i class="fas fa-users mr-3 text-gray-400 group-hover:text-white"></i>
                    Users
                </a>
                <a href="#" class="flex items-center px-4 py-3 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition-colors group">
                    <i class="fas fa-chart-bar mr-3 text-gray-400 group-hover:text-white"></i>
                    Analytics
                </a>
                <a href="${pageContext.request.contextPath }/admin/order/show" class="flex items-center px-4 py-3 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition-colors group">
                    <i class="fas fa-shopping-cart mr-3 text-gray-400 group-hover:text-white"></i>
                    Orders
                </a>
                <a href="${pageContext.request.contextPath }/admin/product/add" class="flex items-center px-4 py-3 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition-colors group">
                    <i class="fas fa-box mr-3 text-gray-400 group-hover:text-white"></i>
                    Products
                </a>
                
                <a href="${pageContext.request.contextPath }/admin/category/show#category_table" class="flex items-center px-4 py-3 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition-colors group">
                    <i class="fas fa-bars mr-3 text-gray-400 group-hover:text-white"></i>
                    Category
                </a>
                
                <a href="#" class="flex items-center px-4 py-3 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition-colors group">
                    <i class="fas fa-cog mr-3 text-gray-400 group-hover:text-white"></i>
                    Settings
                </a>
            </div>
        </nav>
        
        <div class="absolute bottom-4 left-4 right-4">
            <div class="bg-gray-800 rounded-lg p-4">
                <div class="flex items-center space-x-3">
                    <img src="https://cdn-icons-png.flaticon.com/512/17003/17003310.png" alt="Admin" class="w-10 h-10 rounded-full">
                    <div>
                        <p class="text-white text-sm font-medium">${username }</p>
                        <p class="text-gray-400 text-xs">Administrator</p>
                    </div>
                </div>
            </div>
        </div>
    </div>