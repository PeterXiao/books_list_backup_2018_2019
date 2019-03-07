package test.run;

import extthread.MyThread;

public class Run {

	public static void main(String[] args) throws InterruptedException {
		MyThread t=new MyThread();
		t.start();
		Thread.sleep(2000);
		t.interrupt();
	}

}
