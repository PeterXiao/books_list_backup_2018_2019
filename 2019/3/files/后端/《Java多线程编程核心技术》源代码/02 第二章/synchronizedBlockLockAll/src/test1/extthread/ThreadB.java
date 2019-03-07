package test1.extthread;

import test1.extobject.MyObject;
import test1.service.Service;

public class ThreadB extends Thread {
	private Service service;
	private MyObject object;

	public ThreadB(Service service, MyObject object) {
		super();
		this.service = service;
		this.object = object;
	}

	@Override
	public void run() {
		super.run();
		service.testMethod1(object);
	}

}
