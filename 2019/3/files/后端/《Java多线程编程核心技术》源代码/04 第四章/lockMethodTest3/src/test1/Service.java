package test1;

import java.util.concurrent.locks.ReentrantLock;

public class Service {

	private ReentrantLock lock;

	public Service(boolean isFair) {
		super();
		lock = new ReentrantLock(isFair);
	}

	public void serviceMethod() {
		try {
			lock.lock();
			System.out.println("公平锁情况：" + lock.isFair());
		} finally {
			lock.unlock();
		}
	}

}
