package com.ict.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class URIController {
	@RequestMapping(value="/uri/{path}",method=RequestMethod.GET)
	public String goPage(@PathVariable String path) {
		System.out.println(path);		
		path = path.replace(":","/");
		System.out.println(path);
		return path;
	}
	
	/*//
	@RequestMapping(value="/url/{path}/{path2}",method=RequestMethod.GET)
	public String goPage(@PathVariable String path,@PathVariable String path2) {
		System.out.println(path);
		return path+"/"+path2;		
	}*/
}
