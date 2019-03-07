package service;

public class Service {
	public static void print(String stringParam) {
		try {
			synchronized (stringParam) {
				while (true) {
					System.out.println(Thread.currentThread().getName());
					Thread.sleep(1000);
				}
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
