package test;

import mytask.Task;
import mythread.MyThread1;
import mythread.MyThread2;

public class Run {

	public static void main(String[] args) throws InterruptedException {
		Task task = new Task();

		MyThread1 thread1 = new MyThread1(task);
		thread1.start();

		Thread.sleep(100);

		MyThread2 thread2 = new MyThread2(task);
		thread2.start();
	}
}
