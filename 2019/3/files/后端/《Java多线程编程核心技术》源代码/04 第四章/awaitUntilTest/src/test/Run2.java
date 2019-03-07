package test;

import service.Service;
import extthread.MyThreadA;
import extthread.MyThreadB;

public class Run2 {

	public static void main(String[] args) throws InterruptedException {
		Service service = new Service();
		MyThreadA myThreadA = new MyThreadA(service);
		myThreadA.start();

		Thread.sleep(2000);

		MyThreadB myThreadB = new MyThreadB(service);
		myThreadB.start();
	}

}
