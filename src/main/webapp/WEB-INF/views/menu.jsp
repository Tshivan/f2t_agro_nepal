<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<ul>
  <li><a href="${pageContext.request.contextPath }/home">Home</a></li>
  <li><a href="${pageContext.request.contextPath }/about">About</a></li>
  <li><a href="${pageContext.request.contextPath }/products">Products</a></li>
  <li><a href="${pageContext.request.contextPath }/services">Services</a></li>
  <li><a href="${pageContext.request.contextPath }/contact">Contact</a></li>
  <li><a href="${pageContext.request.contextPath }/blog">Blog</a></li>
   <s:authorize access="!isAuthenticated()">
	<li><a href="${pageContext.request.contextPath }/signup">Signup</a></li>
	<li><a href="${pageContext.request.contextPath }/login">Login</a></li>
  </s:authorize>
  <s:authorize access="isAuthenticated()">
	<li><a href="${pageContext.request.contextPath }/logout">Logout</a></li>
	<s:authorize access="hasRole('USER')">
	<li><a href="${pageContext.request.contextPath }/user/cart/show">Cart</a></li>
	</s:authorize>
  </s:authorize>
</ul>