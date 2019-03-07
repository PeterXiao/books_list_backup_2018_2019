package service;

public class Service {

	public void testMethod(Object lock) {
		try {
			synchronized (lock) {
				System.out.println("begin wait() ThreadName="
						+ Thread.currentThread().getName());
				lock.wait();
				System.out.println("  end wait() ThreadName="
						+ Thread.currentThread().getName());
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
