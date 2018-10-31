<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
<c:if test="${!empty iCnt}">
<script>
if(${iCnt}==1){
	alert("등록 성공");
	location.href="/levelinfo";
}
</script>	
</c:if>

<form action="/levelinfo" method="post">
<table border="1">
<tr>
<th>레벨코드</th>
<td><input type="text" name="lilevel"></td><br>
</tr>
<tr>
<th>레벨명</th>
<td><input type="text" name="liname"></td><br>
</tr>
<tr>
<th>레벨설명</th>
<td><input type="text" name="lidesc"></td><br>
</tr>
</table>
<button>등 록</button>
</form>
</body>
</html>