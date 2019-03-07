package mythread;

public class MyThread extends Thread {

	private int count=5;
	
	@Override
	synchronized public void run() {
		super.run();
			count--;
			System.out.println("”… "+this.currentThread().getName()+" º∆À„£¨count="+count);
	}
}
