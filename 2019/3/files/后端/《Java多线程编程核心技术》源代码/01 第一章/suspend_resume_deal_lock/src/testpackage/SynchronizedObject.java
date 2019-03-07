package testpackage;

public class SynchronizedObject {

	synchronized public void printString() {
		System.out.println("begin");
		if (Thread.currentThread().getName().equals("a")) {
			System.out.println("aœﬂ≥Ã”¿‘∂ suspend¡À£°");
			Thread.currentThread().suspend();
		}
		System.out.println("end");
	}

}
