package service;

public class MyService {

	synchronized static public void serviceMethod() {
		try {
			System.out.println(Thread.currentThread().getName() + "进入了业务方法！");
			Thread.sleep(10000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
