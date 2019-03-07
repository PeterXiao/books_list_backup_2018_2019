package extthread;

public class ThreadB extends Thread {
	@Override
	synchronized public void run() {
		try {
			System.out.println("begin B ThreadName="
					+ Thread.currentThread().getName() + "  "
					+ System.currentTimeMillis());
			Thread.sleep(5000);
			System.out.println("  end B ThreadName="
					+ Thread.currentThread().getName() + "  "
					+ System.currentTimeMillis());
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
