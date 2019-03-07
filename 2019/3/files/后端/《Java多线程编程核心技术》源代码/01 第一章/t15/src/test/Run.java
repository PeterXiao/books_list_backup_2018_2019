package test;

import exthread.MyThread;

import exthread.MyThread;

public class Run {
	public static void main(String[] args) {
		MyThread thread = new MyThread();
		thread.start();
		thread.interrupt();
		System.out.println("end!");
	}
}
