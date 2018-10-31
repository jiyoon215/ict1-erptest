<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<script>

//같은 onload를 2개 해주면 마지막onload만 실행됨.
/* window.onload=function(){	
	var liBody=document.querySelector('#liBody');
	alert(liBody);
	alert("서버 다녀오는 작업해야함.");
}
window.onload=function(){
	alert("난 새로운 onload야");
} */


//두개를 모두 나오게 하고싶으면 addEventListener를 사용해주면 둘다 실행됨.
/* window.addEventListener('load',function(){
	var liBody=document.querySelector('#liBody');
	alert(liBody);
	alert("서버 다녀오는 작업해야함.");
})
window.addEventListener('load',function(){
	alert("새로 정의된 아이. 재정의")
}) */


//위의 내용을 아래처럼 사용할수 있음.
/* window.addEventListener('load',onload);
window.addEventListener('load',function(){
	alert("새로 정의된 아이. 재정의")
})
function onload(){
	var liBody=document.querySelector('#liBody');
		alert(liBody);
		alert("서버 다녀오는 작업해야함.");
} */

// 위 내용의 주의사항은 아래 내용은 위처럼 사용할 수 없다.
// 이유는 funcion onload()는 메모리가 먼저 읽혀져 실행이 가능하나 
// 아래 var onload는 실행될때 메모리가 읽혀져 위 내용의 window.구문에서는 찾을수가 없다.
/* var onload =function(){
		var liBody=document.querySelector('#liBody');
		alert(liBody);
		alert("서버 다녀오는 작업해야함.");
} */

//--공통으로 사용할 수 있는 부분
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
//공통으로 사용할 수 있는 부분--

window.addEventListener('load',function(){
	var conf={url:'/levelinfo',
			  success:function(res){
				res=JSON.parse(res);
				var html='';
				for(var li of res){
					html += '<tr id="lv'+li.linum+'">';
					html += '<td>'+ li.linum +'</td>';
					html += '<td><input type="text" id="lilevel'+li.linum+'" value="'+li.lilevel+'"></td>';
					html += '<td><input type="text" id="liname'+li.linum+'" value="'+li.liname+'"></td>';
					html += '<td><input type="text" id="lidesc'+li.linum+'" value="'+li.lidesc+'"></td>';
					html += '<td><button onclick="updateLevel('+ li.linum +')">수정</button> <button onclick="deleteLevel('+li.linum+')">삭제</button></td>';
					html += '</tr>';					
				}
				document.querySelector('#liBody').insertAdjacentHTML('beforeend',html);
			}			
	}
	var au=new AjaxUtil(conf);
	au.send();
});

</script>
<body>
	레벨명: <input type="text" name="liname">
	<button>검 색</button>

	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>레벨</th>
				<th>레벨명</th>
				<th>레벨설명</th>
				<th>버튼</th>
			</tr>
		</thead>
		<tbody id="liBody">			
		
		</tbody>
	</table>
	<button onclick="insertLevel()">추가</button>
	<script>
	
	function insertLevel(){
			var html = '<tr>';
			html += '<td>&nbsp;</td>';
			html += '<td><input type="text" id="lilevel" value=""></td>';
			html += '<td><input type="text" id="liname" value=""></td>';
			html += '<td><input type="text" id="lidesc" value=""></td>';
			html += '<td><button onclick="saveLevel()">저장</button></td>';
			html += '</tr>';
			document.querySelector('#liBody').insertAdjacentHTML('beforeend',html);
	}
	
	function saveLevel(){
		var lilevel=document.querySelector('#lilevel').value;
		var liname=document.querySelector('#liname').value;
		var lidesc=document.querySelector('#lidesc').value;
		var params={lilevel:lilevel,liname:liname,lidesc:lidesc};
		params=JSON.stringify(params);
			
			
	var conf={url:'/levelinfo/',
			method:'POST',
			param: params,
			success:function(res){
			  if(res=='1'){
				alert("저장완료");
				location.href='/url/levelinfo:list';
			  }
			}
	}
	
	var au=new AjaxUtil(conf);
	au.send();	
	}
	
	function updateLevel(linum){
		var lilevel=document.querySelector('#lilevel'+linum).value;
		var liname=document.querySelector('#liname'+linum).value;
		var lidesc=document.querySelector('#lidesc'+linum).value;
		var params={lilevel:lilevel,liname:liname,lidesc:lidesc, linum:linum};
		params=JSON.stringify(params);
			
			
	var conf={url:'/levelinfo/'+linum,
			method:'PUT',
			param: params,
			success:function(res){
			  alert(res);
			}
	}
	
	var au=new AjaxUtil(conf);
	au.send();	
			
	}
		
		/* function deleteLevel(linum){
			var xhr=new XMLHttpRequest();
			var url="/levelinfo/" + linum;
			var method="delete";
			xhr.open(method,url);
			xhr.onreadystatechange=function(){
				if(xhr.readyState==xhr.DONE){
					if(xhr.status=="200"){
						if(xhr.responseText=='1'){
							alert("삭제 성공");
							location.href='/levelinfo';
						}
					}else{
						alert("삭제 실패");
					}
				}
			}
			xhr.send();
		} */
		
	function deleteLevel(linum){			
		var conf={url:'/levelinfo/'+linum,
				method:'DELETE',
				success:function(res){
				if(res=='1'){
					alert("삭제 성공");
					location.href='/url/levelinfo:list';
				}		  
				}
		
		}
		var au=new AjaxUtil(conf);
		au.send();	
	}
	</script>
</body>
</html>