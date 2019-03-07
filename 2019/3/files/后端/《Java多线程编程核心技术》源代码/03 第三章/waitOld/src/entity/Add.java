package entity;

//¼Ó·¨
public class Add {

	private String lock;

	public Add(String lock) {
		super();
		this.lock = lock;
	}

	public void add() {
		synchronized (lock) {
			ValueObject.list.add("anyString");
			lock.notifyAll();
		}
	}

}
