<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/app_style.css"/>
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
<label>Popular Agro Products</label>
<p>We have a range of popular agructural products.</p>
</div>
</section>

</main>
<aside>

</aside>
<footer>

</footer>
</body>
</html>