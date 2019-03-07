package test1.run;

import test1.extobject.MyObject;
import test1.extthread.ThreadA;
import test1.extthread.ThreadB;
import test1.service.Service;

public class Run1_1 {

	public static void main(String[] args) {
		Service service = new Service();
		MyObject object = new MyObject();

		ThreadA a = new ThreadA(service, object);
		a.setName("a");
		a.start();

		ThreadB b = new ThreadB(service, object);
		b.setName("b");
		b.start();
	}

}
