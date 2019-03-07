package test;

import service.MyService;
import extthread.ThreadA;

public class Run {

	public static void main(String[] args) {

		MyService service = new MyService();

		ThreadA a = new ThreadA(service);
		a.start();

	}

}
