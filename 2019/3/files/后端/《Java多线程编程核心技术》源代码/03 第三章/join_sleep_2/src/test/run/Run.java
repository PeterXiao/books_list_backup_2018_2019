package test.run;

import extthread.ThreadA;
import extthread.ThreadB;
import extthread.ThreadC;

public class Run {

	public static void main(String[] args) {

		try {
			ThreadB b = new ThreadB();

			ThreadA a = new ThreadA(b);
			a.start();

			Thread.sleep(1000);

			ThreadC c = new ThreadC(b);
			c.start();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
