<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	ProductDAO dao = new ProductDAO();
	ProductDTO dto =  dao.select(id);
	if(dto==null){
		out.write("검색 결과가 없습니다.");
	}else{
		out.write(dto.toString());
	}
%>
