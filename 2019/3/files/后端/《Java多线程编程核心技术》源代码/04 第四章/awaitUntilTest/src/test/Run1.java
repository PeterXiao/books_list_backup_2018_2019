package test;

import service.Service;
import extthread.MyThreadA;
import extthread.MyThreadB;

public class Run1 {

	public static void main(String[] args) throws InterruptedException {
		Service service = new Service();
		MyThreadA myThreadA = new MyThreadA(service);
		myThreadA.start();
	}

}
