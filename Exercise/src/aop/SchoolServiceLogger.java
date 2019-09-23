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
		System.out.println("欢迎进入校园查询系统");
	}

	@AfterReturning(pointcut = "pointcut()", returning = "result")
	public void afterReturning(JoinPoint jp, Object result) {
		System.out.println("调用" + jp.getTarget() + "的" + jp.getSignature()
				+ "方法,方法返回值:" + result);
	}

	@AfterThrowing(pointcut="pointcut()",throwing="e")
	public void afterThrowing(JoinPoint jp, RuntimeException e) {
		System.out.println(jp.getSignature().getName() + "方法发生异常:" + e);
	}
}
