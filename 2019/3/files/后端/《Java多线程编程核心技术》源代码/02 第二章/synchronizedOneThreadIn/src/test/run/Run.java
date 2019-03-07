package test.run;

import service.ObjectService;
import extthread.ThreadA;
import extthread.ThreadB;

public class Run {

	public static void main(String[] args) {
		ObjectService service = new ObjectService();

		ThreadA a = new ThreadA(service);
		a.setName("a");
		a.start();

		ThreadB b = new ThreadB(service);
		b.setName("b");
		b.start();
	}

}
