package extthread;

public class MyThread extends Thread {
	public static int count;

	synchronized private static void addCount() {
		for (int i = 0; i < 100; i++) {
			count++;
		}
		System.out.println("count=" + count);
	}

	@Override
	public void run() {
		addCount();
	}

}
