/**
 * author : Yoon
 * desc: Util for Ajax object
 * ex : 
 * 	var au=new AjaxUtil({
 * 	url: targetUrl,
 * 	success: success function for success,
 * 	error: success function for error,
 * 	method: http method,
 * 	type: callback response type(json,html,text)
 * 	param: parameters for targetUrl
 * }); 
 */

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