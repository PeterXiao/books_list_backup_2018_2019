package extthread;

public class SelfRun extends Object implements Runnable {
	private Thread selfThread;
	private volatile boolean isContinueRun = true;

	public SelfRun() {
		selfThread = new Thread(this);
		selfThread.start();
	}

	public void run() {
		while (isContinueRun) {
			try {
				System.out.println("我在运行！" + Thread.currentThread().getName());
				Thread.sleep(1000);
			} catch (InterruptedException x) {
				x.printStackTrace();
			}
		}
	}

	public void stopRun() {
		isContinueRun = false;
	}

}