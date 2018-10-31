<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
<th colspan="2">로그인</th>
</tr>
<tr>
<th>아이디: </th> 
<td><input type="text" id="id"></td>
</tr>
<tr>
<th>비밀번호: </th> 
<td><input type="password" id="pwd"></td>
</tr>
</table>
<button id="btn-login">로그인</button>

<script>
var id=document.querySelector('#id');
var pwd=document.querySelector('#pwd');

$.ajax({
	url:'/user/login',
	method:'POST',
	datatype:'JSON',
	param:{id:id,pwd:pwd},
	success:function(res){
		if(res!=null){
			alert("로그인 성공");
		}else{
			alert("로그인 실패");
		}
	},
	error:function(res){
		consol.log(res);
	}	
})
</script>
</body>
</html>