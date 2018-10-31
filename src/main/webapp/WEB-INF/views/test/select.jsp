<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sPage=request.getParameter("select");
if(sPage != null){
 sPage = "/WEB-INF/views/test/"+sPage+ ".jsp";;
}else{ 
	sPage = "/WEB-INF/views/test/r1.jsp";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<style>
.container{
padding: 50;
	margin: 50;
}
#left{
 		width:40%;
        height:20px;
        float:left;
        background-color:black;
}
#right{
        width:40%;
        height:20px;
        float:right;
        background-color:purple;
    }

</style>

<body>
	<div class="container">
		<div id="left">
			<jsp:include page="/WEB-INF/views/test/left.jsp" />
		</div>
		<div id="right">
			<jsp:include page="<%=sPage %>" />
			
		</div>
	</div>
</body>
</html>