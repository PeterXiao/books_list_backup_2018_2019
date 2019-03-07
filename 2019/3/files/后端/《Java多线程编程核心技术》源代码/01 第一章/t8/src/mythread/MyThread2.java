package mythread;

public class MyThread2 extends Thread {
	@Override
	public void run() {
		try {
			System.out.println("run threadName="
					+ this.currentThread().getName() + " begin ="
					+ System.currentTimeMillis());
			Thread.sleep(2000);
			System.out.println("run threadName="
					+ this.currentThread().getName() + " end   ="
					+ System.currentTimeMillis());
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
