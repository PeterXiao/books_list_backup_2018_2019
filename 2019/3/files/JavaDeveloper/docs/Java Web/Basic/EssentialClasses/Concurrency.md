# Concurrency
## 概念

- 并发：在同一时间间隔内做多件事，我们在自己的电脑上希望同时做很多事，比如一边编辑着文档，一边听着音乐，那么对于用户来讲这些工作是同时进行的，但是计算机是单核CPU的话，实际上在某一时间点处理器只能做一件事。
- 并行：同一时间点做多件事，对于多核处理器来讲，同一时间点可以做多件事。

&emsp;&emsp;并发编程中，有两个基本的执行单元：进程和进程，Java语言中并发编程更多关注的是线程。

## 线程状态

&emsp;&emsp;在学习如何多线程编程之前，我们先来看看Java中线程的状态以及其生命周期。

<br>
<div align=center><img src="https://raw.githubusercontent.com/Bboy-AJ/JavaDeveloper-SkillMap/master/images/Java Web/Life_cycle_of_a_Thread_in_Java.jpg"></div>
<br>

&emsp;&emsp;需要注意到的是，上图所描述的是JVM中线程的状态，而不是直接映射到操作系统中的线程状态。整体上来看，Java  线程可以分为四个状态：New、Runnable、Non-runnable、Terminated，实际上在java.lang.Thread类中，定义了一个State的枚举类，包含了以下六个状态：

1. NEW-新创建的线程，还未开始。
1. RUNNABLE-正在运行或者正在等待CPU时间片，包含了操作系统线程状态中的Running和Ready。
1. BLOCKED-阻塞，等待获取一个排它锁，如果其他线程释放了锁，此状态结束。
1. WAITING-无限期等待，除非被其他线程显示唤醒，否则一直等待。
1. TIMED_WAITING-限期等待，一定时间后会自动唤醒，比如常见的sleep(time)。
1. TERMINATED-线程完成任务正常结束或者产生异常导致结束。

## 线程对象

&emsp;&emsp;在Java多线程编程中，Thread类可以看做是一个基础类，每一个线程都与Thread类的实例对象相关联。根据Thread类的使用策略，这里可以分为两类：

- 直接控制Thread类的创建与管理，多线程的基础用法，相关类主要在java.lang包中，例如Thread类和Runnable接口。
- 不直接参与Thread类的创建、管理，而是交给专门的类来处理，多线程的高级用法，相关类主要在java.util.concurrent包中，比如Executor接口。

## 基础用法

### 线程创建
&emsp;&emsp;这里有两种方式来创建并启动一个线程：


- **Thread**

&emsp;&emsp;继承Thread类，重写run()方法，即可创建一个线程类。

		public class HelloThread extends Thread {
		
		    public void run() {
		        System.out.println("Hello from a thread!");
		    }
		
		    public static void main(String args[]) {
		        (new HelloThread()).start();
		    }
		
		}
		
- **Runnable**

&emsp;&emsp;实现Runnalbe接口，定义run()方法，通过Thread类的构造函数创建线程。

		public class HelloRunnable implements Runnable {
		
		    public void run() {
		        System.out.println("Hello from a thread!");
		    }
		
		    public static void main(String args[]) {
		        (new Thread(new HelloRunnable())).start();
		    }
		
		}
&emsp;&emsp;以上两种方式都是通过调用Thread.Start来启动一个新线程，最终都是通过Thread类来实现的。


- **Runnable VS Thread**

	- 如果是开发规模很小的应用，直接继承Thread的方式操作简单，但是在Java中，只支持单继承。这意味着如果已经继承了Thread类的话，就无法再继承其他类。
 
	- Runnable把线程中要执行的任务与Thread对象分离，通过把任务类传递给Thread类，使用的是组合而不是继承，实现更为灵活。并且在后面的高级线程管理中会用到。

&emsp;&emsp;总的来说，实际开发中更推荐使用Runable的方式。