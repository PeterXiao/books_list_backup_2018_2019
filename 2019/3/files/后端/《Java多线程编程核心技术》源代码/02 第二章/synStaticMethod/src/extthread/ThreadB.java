package extthread;

import service.Service;

public class ThreadB extends Thread {
	@Override
	public void run() {
		Service.printB();
	}
}
