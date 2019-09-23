package aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SchoolServiceLogger {

	@Pointcut("execution(* service.UserService.*(..))")
	public void pointcut() { };

	@Before("pointcut()")
	public void before(JoinPoint jp) {
		System.out.println("��ӭ����У԰��ѯϵͳ");
	}

	@AfterReturning(pointcut = "pointcut()", returning = "result")
	public void afterReturning(JoinPoint jp, Object result) {
		System.out.println("����" + jp.getTarget() + "��" + jp.getSignature()
				+ "����,��������ֵ:" + result);
	}

	@AfterThrowing(pointcut="pointcut()",throwing="e")
	public void afterThrowing(JoinPoint jp, RuntimeException e) {
		System.out.println(jp.getSignature().getName() + "���������쳣:" + e);
	}
}
