var script = document.createElement('script');
script.src = 'http://code.jquery.com/jquery.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);
	$(function(){
		$("#insertButton").click(function() {
			if($("#id").val().trim()==""||$("#pName").val().trim()==""||$("#price").val().trim()==""||$("#content").val().trim()==""){
				alert("모든 정보를 입력해야합니다!!");
				return false;
			}
		})
		$("button").click(function() {
			$(this).each(function() {
				if($(this).val()=="selectAll"){
					$.ajax({
						url : "selectAll.jsp",
						datatype : "html",
						success : (function(result) {
							$("#productDiv").empty();
							var allPro=result.split(":");
							for(var i=0;i<allPro.length;i++){
								$("#productDiv").append(allPro[i]+"<form action='update.jsp'><input class='product' name= 'product'type='hidden' value='"+allPro[i]+"'><button class='update' type='button'value='"+allPro[i]+"'>수정</button><button type='button' class='delete'>삭제</button></form>");
							}
							$(".update").click(function() {
								$(this).each(function() {
									location.href="update.jsp?product="+$(this).prev().val().trim();
								})
							})
							$(".delete").click(function() {
								$(this).each(function() {
									location.href="delete.jsp?product="+$(this).prev().val().trim();
								})
							})
						})
					})
				}
			})
		})
		
		$("button").click(function() {
			$(this).each(function() {
				if($(this).val()=="selectButton"){
					if($("#id").val().trim()!=""){
						var id = $("#id").val().trim()*1;
						$.ajax({
							url : "select.jsp",
							data : {
								"id" : id
							},
							success :(function(result) {
								$("#productDiv").empty();
								$("#productDiv").text(result);
								$("#productDiv").append("<form action='update.jsp'><button type='submit'>수정</button><input class='product' name= 'product'type='hidden'></form><form action='delete.jsp'><input name='product' id='me' type='hidden'><button type='submit'>삭제</button></form>")
								$("#me").val(result);
								$(".product").val(result);
							})
						})
					}else{
						alert("id를 입력해주세요!");
					}
				}
			})
		})
	})