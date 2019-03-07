package extthread;

import myservice.Main;
import myservice.Sub;

public class MyThread extends Thread {
	@Override
	public void run() {
		Sub sub = new Sub();
		sub.operateISubMethod();
	}

}
