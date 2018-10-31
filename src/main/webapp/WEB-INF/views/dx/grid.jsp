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
var mData=[{id:'delete',text:'delete'},{id:'add',text:'Add Row'}];

var dxGrid,dxMenu;
var newRowId=[];

function doInit(){
	dxMenu=new dhtmlXMenuObject();
	dxMenu.setIconsPath("../common/images/");
	dxMenu.renderAsContextMenu();
	dxMenu.attachEvent("onClick",function(mId,type){
		console.log(mId);
		console.log(type);
		if(mId=='delete'){
			var rId=dxGrid.getSelectedRowId();
			if(!rId){
				alert('삭제할 데이터를 선택해주세요');
				return;
			}
			var cIdx=dxGrid.getColIndexById('linum');
			var linum=dxGrid.cells(rId,cIdx).getValue();
			dhx.ajax.del('/levelinfo/'+linum);  
			alert(linum+"번 삭제완료");
			doInit();
		}else if(mId=='add'){
			dhx.ajax.get('/linum',function(res){
				var data=JSON.parse(res.xmlDoc.responseText);
				var rId=dxGrid.uid();
				newRowId[newRowId.length]=rId;
				dxGrid.addRow(rId,[data],dxGrid.getRowsNum());
				dxGrid.setRowAttribute(rId,"st","new");
			})
		}
	});	
	
	dxMenu.loadStruct(mData);
	dxGrid=new dhtmlXGridObject('dxGrid');
	dxGrid.setImagePath('${skyPath}/imgs/');
	dxGrid.setHeader('번호,레벨,이름,설명');
	dxGrid.setColumnIds('linum,lilevel,liname,lidesc');
	dxGrid.setColTypes('ro,ed,ed,ed'); //ro=read only ed=edit
	dxGrid.enableContextMenu(dxMenu);
	dxGrid.init();
	//dxGrid.parse(data,'js');
	dhx.ajax.get('/levelinfo',function(res){
		var data=JSON.parse(res.xmlDoc.responseText);
		dxGrid.parse(data,'js');
	})
	
	dxGrid.attachEvent('onEditCell',function(stage,rId,cInd,nValue,oValue){ //rId=rowId cInd=columnIndex nValue=바뀐값 oValue=oldValue전값
		if(stage==2){
			if(dxGrid.getRowAttribute(rId,"st")=='new'){
				return true;
			}
			if(nValue!=oValue){
				var rData=dxGrid.getRowData(rId);
				
				var ajaxUtil=new AjaxUtil({
					url:'/levelinfo/'+rData.linum,
					method:'PUT',
					param:JSON.stringify(rData),
					success:function(res){
						alert('수정성공');
						doInit();
					}
				})
				ajaxUtil.send();
			}
		}
	})	
}

function save(){
	var addRow=[];
	
	for(var i=0;i<newRowId.length;i++){
	if(dxGrid.getRowAttribute(newRowId[i],"st")=='new'){
		addRow[addRow.length]=dxGrid.getRowData(newRowId[i]);
	}
	}
	var ajaxUtil=new AjaxUtil({
		url:'/levelinfo2',
		method:'POST',
		param:JSON.stringify(addRow),
		success:function(res){
			alert('추가등록성공');
			newRowId=[];
			doInit();
		}
	})
	ajaxUtil.send();
}

function makeParams(data){
	var params='';
	for(var key in data){
		params +=key+'='+data[key]+'&';
	}
	return params.substring(0,params.length-1);
}
window.addEventListener('load',doInit);
</script>
<body>
<div id="dxGrid" style="width:400px;height:300px;"></div>
<button onclick="save()">저장</button>

</body>
</html>