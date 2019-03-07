package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class Run2Later {

	private static Timer timer = new Timer();

	static public class MyTask1 extends TimerTask {
		@Override
		public void run() {
			try {
				System.out.println("1 begin 运行了！时间为：" + new Date());
				Thread.sleep(20000);
				System.out.println("1   end 运行了！时间为：" + new Date());
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	static public class MyTask2 extends TimerTask {
		@Override
		public void run() {
			System.out.println("2 begin 运行了！时间为：" + new Date());
			System.out.println("运行了！时间为：" + new Date());
			System.out.println("2   end 运行了！时间为：" + new Date());
		}
	}

	public static void main(String[] args) {
		try {
			MyTask1 task1 = new MyTask1();
			MyTask2 task2 = new MyTask2();

			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String dateString1 = "2014-10-12 11:33:00";
			String dateString2 = "2014-10-12 11:33:10";

			Date dateRef1 = sdf1.parse(dateString1);
			Date dateRef2 = sdf2.parse(dateString2);

			System.out.println("字符串1时间：" + dateRef1.toLocaleString() + " 当前时间："
					+ new Date().toLocaleString());
			System.out.println("字符串2时间：" + dateRef2.toLocaleString() + " 当前时间："
					+ new Date().toLocaleString());

			timer.schedule(task1, dateRef1);
			timer.schedule(task2, dateRef2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
