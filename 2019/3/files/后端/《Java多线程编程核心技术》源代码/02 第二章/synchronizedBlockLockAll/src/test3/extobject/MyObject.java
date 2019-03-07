package test3.extobject;

public class MyObject {
	public void speedPrintString() {
		synchronized (this) {
			System.out.println("speedPrintString ____getLock time="
					+ System.currentTimeMillis() + " run ThreadName="
					+ Thread.currentThread().getName());
			System.out.println("-----------------");
			System.out.println("speedPrintString releaseLock time="
					+ System.currentTimeMillis() + " run ThreadName="
					+ Thread.currentThread().getName());
		}
	}
}
