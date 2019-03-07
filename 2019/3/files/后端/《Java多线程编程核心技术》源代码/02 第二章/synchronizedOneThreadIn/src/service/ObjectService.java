package service;

public class ObjectService {

	public void serviceMethod() {
		try {
			synchronized (this) {
				System.out.println("begin time=" + System.currentTimeMillis());
				Thread.sleep(2000);
				System.out.println("end    end=" + System.currentTimeMillis());
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
