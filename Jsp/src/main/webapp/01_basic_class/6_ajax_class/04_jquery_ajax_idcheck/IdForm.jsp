<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(function(){
	//$('#id_check').click(function(){
	$('.userinput').keyup(function(){ //입력창에 키를 눌러서 띄었을때	서버에 데이터를 계속왓다갓다함
										//->데이터를 너무 많이 잡아먹어 요새는 사용안함
	}
		$.ajax({
			type : 'get',
			url : "IdCheck.jsp",
			data : { id : $(".userinput").val() },
			success : function(data){
				//alert(data);
				/*
				넘어온 데이터가 'YES' 라면 아이디가 idmessage 인 태그에
				"이미 사용중인 아이디가 있습니다"라고 출력
				그렇지않고 'NO' 라면 아이디가 idmessage 인 태그에
				"사용가능한 아이디입니다"라고 출력
				*/
				let idm = $('div#idmessage')
				if(data.trim() == "YES"){
					//idm.css('display', '')
					idm.show();
					idm.text("이미 사용중인 아이디가 있습니다");
					
				}else if(data.trim() == "NO"){
					idm.css('display', 'block');
					idm.text("사용가능한 아이디입니다");	
				
				}
			},
			error : function(err){
				alert("에러발생");
				console.log(err);
				
			}
		});
	})
})
</script>

</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;"></div>

</body>
</html>