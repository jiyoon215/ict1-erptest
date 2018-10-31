package com.ict.erp.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.erp.dao.NaverTransDAO;

//@ControllerAdvice
public class ExceptionControllerAdvice {
	private static final Logger log = LoggerFactory.getLogger(ExceptionControllerAdvice.class);
	
	@Autowired
	private NaverTransDAO ntd;
	
	@ExceptionHandler(value=SQLException.class)
	public @ResponseBody ResponseEntity<Map<String,String>> SQLExceptionHandler(SQLException ex) throws IOException{
		log.error("error=>{}", ex);
		Map<String,String> map=new HashMap<String, String>();
		map.put("errorMsg", ntd.getText(ex.getMessage()));
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(map);
	}
}
