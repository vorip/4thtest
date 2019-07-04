<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="product.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	ProductDAO dao = new ProductDAO();
	dao.insert(dto);
	out.write("<script>alert('완료되었습니다.')</script>");
	response.sendRedirect("insert.html");
%>

</body>
</html>