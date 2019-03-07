package extthread;

public class MyThread extends Thread {
	@Override
	public void run() {
		String username = null;
		System.out.println(username.hashCode());
	}

}
