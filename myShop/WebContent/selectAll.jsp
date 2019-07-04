<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = null;
	ArrayList<ProductDTO> list = dao.selectAll();
	if(list==null){
		out.write("등록된 상품이 없습니다.");
	}else{
		for(int i = 0;i<list.size();i++){
			if(i==list.size()-1){
				out.write(list.get(i).toString());				
			}else{
				out.write(list.get(i).toString()+":");
			}
		}
	}
%>