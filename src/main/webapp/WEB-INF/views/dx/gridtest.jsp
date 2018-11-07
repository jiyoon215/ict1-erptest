<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${skyPath}/dhtmlx.css"/>
</head>
<script>

var dxGrid,dxMenu;

 function doInit(){
	dxMenu=new dhtmlXMenuObject();
	dxMenu.setIconsPath("../common/images/");
	dxMenu.renderAsContextMenu();	
	dxGrid=new dhtmlXGridObject('dxGrid');
	dxGrid.setImagePath('${skyPath}/imgs/');
	dxGrid.setHeader('번호,레벨,이름,설명');
	dxGrid.setColumnIds('linum,lilevel,liname,lidesc');
	dxGrid.setColTypes('ro,ed,ed,ed'); //ro=read only ed=edit
	dxGrid.enableContextMenu(dxMenu);
	dxGrid.init();
	dhx.ajax.get('/levelinfo',function(res){
		var data=JSON.parse(res.xmlDoc.responseText);
		dxGrid.parse(data,'js');
	})	
	}

window.addEventListener('load',doInit);
</script>
<body>
<div id="dxGrid" style="width:400px;height:300px;"></div>

</body>
</html>