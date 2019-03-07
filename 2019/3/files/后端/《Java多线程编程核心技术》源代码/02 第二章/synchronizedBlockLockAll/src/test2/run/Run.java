package test2.run;

import test2.extobject.MyObject;
import test2.extthread.ThreadA;
import test2.extthread.ThreadB;
import test2.service.Service;

public class Run {

	public static void main(String[] args) throws InterruptedException {
		Service service = new Service();
		MyObject object = new MyObject();

		ThreadA a = new ThreadA(service, object);
		a.setName("a");
		a.start();

		Thread.sleep(100);

		ThreadB b = new ThreadB(object);
		b.setName("b");
		b.start();
	}

}
