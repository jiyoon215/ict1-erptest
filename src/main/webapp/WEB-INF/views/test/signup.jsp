<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
<form onsubmit="return check()">
<table border="1">
<tr>
<th colspan="2">회원가입</th>
</tr>
<tr>
<th>아이디: </th> 
<td><input type="text" id="id" name="id" required></td>
</tr>
<tr>
<th>비밀번호:</th>
<td><input type="password" id="pwd" name="pwd" required></td>
</tr>
<tr>
<th>비밀번호확인:</th>
<td><input type="password" id="pwdChk" name="pwdChk" required></td>
</tr>
<tr>
<th>나이:</th>
<td> <input type="number" id="age" name="age" required></td>
</tr>
<tr>
<th>이메일:</th>
<td> <input type="email" id="email" name="email" required></td>
</tr>
</table>
<button>회원가입</button>
</form>
<script>
	var id=document.querySelector('#id');
	var pwd=document.querySelector('#pwd');
	var pwdChk=document.querySelector('#pwdChk');
	var age=document.querySelector('#age');
	var email=document.querySelector('#email');

	function check(){
		if(id.value.trim().length<5){
			alert("id를 5자 이상 입력해주세요");
			id.value="";
			id.focus();
			return false;
		}
		if(pwd.value.trim().length<8){
			alert("비밀번호를 8자 이상 입력해주세요");
			pwd.value="";
			pwd.focus();
			return false;
		}
		if(pwd.value!=pwdChk.value){
			alert("비밀번호를 확인 후 다시 입력해주세요");
			pwdChk.value="";
			pwdChk.focus();
			return false;
		}
		if(age.value.trim()<0 || age.value.trim()>130){
			alert("나이는 0세부터 130세 이하까지 입력 가능합니다.");
			age.value="";
			age.focus();
			return false;
		}
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(exptext.test(email.value)==false){
			alert("이메일 형식에 맞게 입력해주세요.");
			email.value = "";
			email.focus();
			return false;
		}
		
	}
</script>
</body>
</html>