package extthread;

import controller.LoginServlet;

public class BLogin extends Thread {
	@Override
	public void run() {
		LoginServlet.doPost("b", "bb");
	}
}
