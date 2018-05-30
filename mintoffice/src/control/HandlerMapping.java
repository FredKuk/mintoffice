package control;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommuteService;
import service.EmployeeService;
import service.MemoService;
import service.ScheduleService;
import service.Service;

public class HandlerMapping {
	private Service service =null;

	public String working(String className, HttpServletRequest request, HttpServletResponse response) {
		// 클래스이름(eg:ProductListController)으로
				// ProductListController.class을 찾아 JVM으로 로드
				// 클래스이름(eg:control.ProductDetailController)으로
				// control.ProductDetailController.class을 찾아 JVM으로 로드
				
		try {
			Class clazz = Class.forName(className);
			Object obj = null;
	
			Constructor[] constructors = clazz.getConstructors();
	
			// 생성자가 1개이고 매개변수가 없는 생성자인 경우
			// setter메서드호출로 ProductService주입
			if (constructors.length == 1 && constructors[0].getParameterCount() == 0) {
				System.out.println("생성자가 1개이고 매개변수가 없는 생성자인 경우");
				obj = clazz.newInstance();
				Method[] methods = clazz.getDeclaredMethods();
				for (Method m : methods) {
					String methodName = m.getName();
					if (methodName.startsWith("set") && m.getParameterCount() == 1) {
						if ("service.EmployeeService".equals(m.getParameterTypes()[0].getName())){
							service=EmployeeService.getInstance();
							m.invoke(obj, service);
							break;
						} else if ("service.ScheduleService".equals(m.getParameterTypes()[0].getName())) {
							service=ScheduleService.getInstance();
							m.invoke(obj, service);
							break;
						} else if ("service.MemoService".equals(m.getParameterTypes()[0].getName())) {
							service=MemoService.getInstance();
							m.invoke(obj, service);
							break;
						} else if ("service.CommuteService".equals(m.getParameterTypes()[0].getName())) {
							service=CommuteService.getInstance();
							m.invoke(obj, service);
							break;
						}
					}
				}
			} else if (constructors.length > 1) {
				System.out.println("매개변수가 1개이고 매개변수의 타입이 EmployeeService타입인 경우");
				// 매개변수가 1개이고
				// 매개변수의 타입이 employeeService타입인 경우
				for (Constructor constructor : constructors) {
					if (constructor.getParameterCount() == 1) {
						if ("service.EmployeeService".equals(constructor.getParameters()[0].getType().getName())) {
							service=EmployeeService.getInstance();
							System.out.println("EmployeeService Catch");
							obj = constructor.newInstance(service);
						} else if ("service.ScheduleService".equals(constructor.getParameters()[0].getType().getName())) {
							service=ScheduleService.getInstance();
							System.out.println("ScheduleService Catch");
							obj = constructor.newInstance(service);
						} else if ("service.MemoService".equals(constructor.getParameters()[0].getType().getName())) {
							service=MemoService.getInstance();
							System.out.println("MemoService Catch");
							obj = constructor.newInstance(service);
						} else if ("service.CommuteService".equals(constructor.getParameters()[0].getType().getName())) {
							service=CommuteService.getInstance();
							System.out.println("CommuteService Catch");
							obj = constructor.newInstance(service);
						}
						break;
					}
				}
			}
			System.out.println(clazz.toString());
	
			// execute메서드 호출방법 2
			Method m;
			// m = clazz.getDeclaredMethod("execute",HttpServletRequest.class,
			// HttpServletResponse.class);
			m = clazz.getDeclaredMethod("execute", HttpServletRequest.class, HttpServletResponse.class);
			return (String) m.invoke(obj, request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
