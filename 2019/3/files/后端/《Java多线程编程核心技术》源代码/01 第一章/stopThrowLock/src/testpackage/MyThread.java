package testpackage;

public class MyThread extends Thread {

	private SynchronizedObject object;

	public MyThread(SynchronizedObject object) {
		super();
		this.object = object;
	}

	@Override
	public void run() {
		object.printString("b", "bb");
	}
}
