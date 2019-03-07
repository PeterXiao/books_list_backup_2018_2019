package test;

import service.HasSelfPrivateNum;
import extthread.ThreadA;
import extthread.ThreadB;

public class Run {

	public static void main(String[] args) {

		HasSelfPrivateNum numRef = new HasSelfPrivateNum();

		ThreadA athread = new ThreadA(numRef);
		athread.start();

		ThreadB bthread = new ThreadB(numRef);
		bthread.start();

	}

}
