package test.run;

import extthread.MyThread;

public class Run {

	public static void main(String[] args) {
		MyThread t1 = new MyThread();
		t1.start();
	}

}
