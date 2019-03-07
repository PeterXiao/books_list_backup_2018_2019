package extthread;

import controller.LoginServlet;

public class ALogin extends Thread {
	@Override
	public void run() {
		LoginServlet.doPost("a", "aa");
	}
}
