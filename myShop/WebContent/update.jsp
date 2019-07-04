<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function() {
	$("#submit").click(function() {
		if($("#contentV").val().trim()!=""&&$("#priceV").val().trim()!=""){
			alert("수정이 완료되었습니다.");
		}else{
			alert("값과 설명을 모두 입력해주세요!");
			return false;
		}
	})
})
</script>
<body>
<%
	String[] info = request.getParameter("product").split(",");
%>
<a href="insert.html">상품등록</a> | <a href="select.html">상품 검색</a>
<div id="container">
	<h3>상품 정보 수정</h3>
	<form action="update2.jsp">
		<p>아이디 : <%=info[0] %></p><input type = "hidden" name = "id"value="<%= info[0].trim() %>">
		<p>상품 이름 : <%=info[1] %></p>
		상품 설명 : <input id="contentV" type = "text" name = "content" value="">
		상품 가격 : <input id="priceV"type = "text" name = "price" value="">
		<button id="submit"type="submit">수정완료!</button>
	</form>
</div>

</body>
</html>