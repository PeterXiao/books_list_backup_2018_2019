package test;

public class MyObject {

	// 内部类方式
	private static class MyObjectHandler {
		private static MyObject myObject = new MyObject();
	}

	private MyObject() {
	}

	public static MyObject getInstance() {
		return MyObjectHandler.myObject;
	}

}
