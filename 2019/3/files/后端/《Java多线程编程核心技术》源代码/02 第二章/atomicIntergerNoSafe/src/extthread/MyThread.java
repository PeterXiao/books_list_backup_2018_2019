package extthread;

import service.MyService;

public class MyThread extends Thread {
	private MyService mySerivce;

	public MyThread(MyService mySerivce) {
		super();
		this.mySerivce = mySerivce;
	}

	@Override
	public void run() {
		mySerivce.addNum();
	}

}
