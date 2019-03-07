package extthread;

import service.Service;

public class ThreadA extends Thread {
	@Override
	public void run() {
		Service.printA();
	}

}
