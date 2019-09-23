package test;
import java.util.Scanner;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.StudentService;

public class UserMapperTest {
	Scanner in=new Scanner(System.in);
	@Test
	public void test() {
		ApplicationContext context=
				new ClassPathXmlApplicationContext("ApplicationContext.xml");
		StudentService studentService=(StudentService)context.getBean("userService");
	}
	
}
