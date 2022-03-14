<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 고객관리 프로그램 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" >
$(function(){
	//검색버튼 눌렸을 때
	$('#btnSelect').click(function(){ 
		$.ajax({
			type : 'get',
			url : "DataSelect.jsp",
			dataType : 'xml',
			success : selectResult
		});
		function selectResult(result){
			//console.log(result)
		 	let person = $(result).find('person');
		 	
		 	
		 	$('tbody#tbd').empty();//싹다날리고 다시 만들기위해
			person.each(function(){
				let name = $(this).find('name').text();
				let age = $(this).find('age').text();
				let tel = $(this).find('tel').text();
				let addr = $(this).find('addr').text();
				
				$('tbody#tbd').append('<tr>' +'<td>'+ name +'</td>'+
												'<td>'+ age +'</td>'+
												'<td>'+ tel +'</td>'+
												'<td>'+ addr +'</td>'+'</tr>');
				
			})
		}
	});
	//입력버튼 눌렸을 때
	$('#btnInsert').click(function(){
		
		let memory = {name : $('#name').val(),
					age : $('#age').val(),
					tel : $('#tel').val(),
					addr : $('#addr').val()
					};
		
		$.ajax({
			type : 'get',
			url : "DataInput.jsp",
			data : memory,
			success : function(memory){
				if(memory.trim() == '1'){
					alert('디비입력성공');
					$('#name').val('');
					$('#age').val('');
					$('#tel').val('');
					$('#addr').val('');
					//입력필드 비우기
				}
			},
			error : function(err){
				alert('error');
				console.log(err);
			}
		}); 
	})
});
</script>

</head>


<!-- <body> -->
<body>

<h2> 고객정보 입력 </h2>

<form name="inForm" method="post">
<table border = 1>
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tr>
		<td align="center"><input type="text" size="8" name="name" id="name"></td>
		<td align="center"><input type="text" size="4" name="age" id="age"></td>
		<td align="center"><input type="text" size="12" name="tel" id="tel"></td>
		<td align="center"><input type="text" size="30" name="addr" id="addr"></td>
	</tr>
	<tr>
		<td colspan="4" align="center"> 
			<input type="button" id='btnInsert' value="입력">
		</td>
	</tr>
</table>

<br>
<hr>

<h2> 고객정보 목록보기  </h2>
<table border='0' width="510"> 
	<tr>
		<td align="right"><input type="button"  id='btnSelect' value="가져오기"></td>
	</tr>
</table>
<table border = 1 id="listTable">
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tbody id='tbd'></tbody>
</table>
<div id="myDiv"> </div>

</form>
</body>
</html>