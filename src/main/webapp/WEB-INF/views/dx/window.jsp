<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	var winD;
	function doInit(){
		var wins=new dhtmlXWindows();
		winD=wins.createWindow('winD',0,0,100,100);
	}
	window.addEventListener('load',doInit);
</script>
<body>

<div id="winD"></div>
</body>
</html>