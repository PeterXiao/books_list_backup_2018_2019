package test;

import extthread.MyThread;

public class Run {
	public static void main(String[] args) {
		MyThread t = new MyThread();
		t.start();
	}
}
