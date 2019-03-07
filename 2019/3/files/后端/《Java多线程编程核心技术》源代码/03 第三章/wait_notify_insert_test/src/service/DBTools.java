package service;

public class DBTools {

	volatile private boolean prevIsA = false;

	synchronized public void backupA() {
		try {
			while (prevIsA == true) {
				wait();
			}
			for (int i = 0; i < 5; i++) {
				System.out.println("¡ï¡ï¡ï¡ï¡ï");
			}
			prevIsA = true;
			notifyAll();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	synchronized public void backupB() {
		try {
			while (prevIsA == false) {
				wait();
			}
			for (int i = 0; i < 5; i++) {
				System.out.println("¡î¡î¡î¡î¡î");
			}
			prevIsA = false;
			notifyAll();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
