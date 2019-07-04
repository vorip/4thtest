<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String[] info = request.getParameter("product").split(",");
ProductDAO dao = new ProductDAO();
dao.delete(Integer.parseInt(info[0].trim()));
response.sendRedirect("select.html");
%>


</body>
</html>