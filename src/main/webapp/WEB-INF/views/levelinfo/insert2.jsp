<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
<script>
var AjaxUtil = function(conf){
	var xhr=new XMLHttpRequest();
	var url= conf.url;
	var method= conf.method?conf.method:'GET' ;
	var param= conf.param?conf.param:'{}';

	var success=conf.success?conf.success:function(res){
		alert(res);
	}
	var error=conf.error?conf.error:function(res){
		alert(res);
	}
	
	xhr.onreadystatechange=function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status=='200'){
				success(xhr.responseText);
			}else{
				error(xhr.responseText);
			}
		}
	}
	xhr.open(method,url);
	if(method!='GET'){
		xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
	}
	this.send=function(){
		xhr.send(param);
	}
};
</script>

<table border="1">
<tr>
<th>레벨코드</th>
<td><input type="text" id="lilevel"></td><br>
</tr>
<tr>
<th>레벨명</th>
<td><input type="text" id="liname"></td><br>
</tr>
<tr>
<th>레벨설명</th>
<td><input type="text" id="lidesc"></td><br>
</tr>
</table>
<button onclick="saveLevel()">등 록</button>

<script>
function saveLevel(){	
	var lilevel=document.querySelector('#lilevel').value;
	var liname=document.querySelector('#liname').value;
	var lidesc=document.querySelector('#lidesc').value;	
	
	if(lilevel.trim().length>3){
		alert("3자리 이하로 입력해주세요.");
		lilevel="";
		return false;
	}
	if (liname.trim().length > 10) {
		alert("이름을 10글자 미만으로 입력하세요");
		liname = "";
		return false;
	}
	if (lidesc.trim().length > 5) {
		alert("300자 미만으로 입력하세요");
		lidesc = "";
		return false;
	}
	
	var params={lilevel:lilevel,liname:liname,lidesc:lidesc};
	params=JSON.stringify(params);	
		
		
var conf={url:'/levelinfo',
		method:'POST',
		param: params,
		success:function(res){
		  if(res=='1'){
			alert("저장완료");
			location.href='/url/levelinfo:list2';
		  }
		}
}

var au=new AjaxUtil(conf);
au.send();	
}
</script>
</body>
</html>