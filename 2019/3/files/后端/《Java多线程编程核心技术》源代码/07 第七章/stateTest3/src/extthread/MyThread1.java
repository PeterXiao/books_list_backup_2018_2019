package extthread;

import service.MyService;

public class MyThread1 extends Thread {

	@Override
	public void run() {
		MyService.serviceMethod();
	}

}
