package com.bitc.fin.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class AspectAdvice {
	
	@Around("execution(* com.bitc.fin.*.controller.*.*(..))")
	public Object checkControllerObj(ProceedingJoinPoint pjp)throws Throwable {

		log.info("----------- Advice CheckController Start");
		log.info("target : {}", pjp.getTarget());
		log.info("args : "+ Arrays.toString(pjp.getArgs()));
		
		Object o = pjp.proceed();
		
		log.info("returns : " + o);
		log.info("----------- Advice CheckController Start");
		
		return o;
	}
	
	@Around("execution(* com.bitc.fin.*.service.*.*(..))")
	public Object checkServiceObject(ProceedingJoinPoint pjp) throws Throwable{
		
		log.info("----------- Advice CheckService Start");
		log.info("target : {}", pjp.getTarget());
		log.info("args : "+ Arrays.toString(pjp.getArgs()));
		
		Object o = pjp.proceed();
		
		log.info("returns : " + o);
		log.info("----------- Advice CheckService Start");
		
		return o;
	}
	
}
