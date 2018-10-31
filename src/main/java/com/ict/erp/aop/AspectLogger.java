package com.ict.erp.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@Service
@Aspect
public class AspectLogger {
	private static final Logger logger = LoggerFactory.getLogger(AspectLogger.class);
	private long sTime;
	
	@Before("execution(* com.ict.erp.controller.*.*(..))")
	public void beforeLog(JoinPoint jp) {
		logger.debug("jp=>{}",jp);  //실행순서2
		sTime=System.currentTimeMillis();
	}
	
	@Around("execution(* com.ict.erp.controller.*.*(..))")
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		String sigName=pjp.getSignature().getName();
		String targetName=pjp.getTarget().toString();
		Object[] params=pjp.getArgs();
		logger.debug("{}.{}({})",new Object[] {targetName,sigName,params}); //실행순서1 (proceed를 기준으로 위의 로그 실행함.)
		Object obj= pjp.proceed();
		logger.debug("result=> {}",obj);  //실행순서3
		return obj;
	}
	
	@After("execution(* com.ict.erp.controller.*.*(..))")
	public void afterLog(JoinPoint jp) {
		logger.debug("end=>{}",jp);  //실행순서4
		logger.debug("execution time => {}ms",(System.currentTimeMillis()-sTime));
	}
}
