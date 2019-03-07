package controller;

import extthread.MyThread;

public class Main1 {

	public static void main(String[] args) {
		MyThread t = new MyThread();
		t.start();
	}

}
