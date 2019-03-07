package extthread;

import service.MyService;

public class MyThread2 extends Thread {

	@Override
	public void run() {
		MyService.serviceMethod();
	}

}
