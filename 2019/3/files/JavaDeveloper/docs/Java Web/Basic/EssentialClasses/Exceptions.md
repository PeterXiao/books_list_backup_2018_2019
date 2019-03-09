# 概念
&emsp;&emsp;exception是“exceptional event”的缩写，是指执行程序中发生的事件，破坏了程序的正常执行流程。Java 异常处理机制使程序更加健壮易于调试，它可以告诉程序员三个问题：错误的类型、位置、原因，帮助程序员解决错误。

# 类别
&emsp;&emsp;Throwable是Java所有异常类的顶级父类，只有这个类的对象（或者其子类对象）才能被异常处理机制识别，也就是说JVM或者throw语句抛出的异常必须是Throwable或者子类对象，catch语句处理的异常类也是如此。

<div align=center><img src="http://img.blog.csdn.net/20180412095859859?"></div>

&emsp;&emsp;整体上来看，Java异常可以分为三类

 - 检查异常：除了Error、RuntimeException及其子类所表示的异常，其他都为检查异常，意味着编译器在编译源码时，会对此类异常的处理进行检查，如果没有做异常处理（try、catch、finally或者throws），编译无法通过。比如使用 java.io.FileReader 类读取指定文件，文件不存在会抛出 java.io.FileNotFoundException 异常，这个异常在编码时必须被处理。
 
 - 运行时异常：RuntimeException及其子类表示的异常，javac在编译时不会检查的异常，这类异常更多的是代码写的有问题，如除0错误ArithmeticException，这类异常应该修改代码，而不是使用异常处理器处理。

 - 错误：Error及其子类，代表了JVM本身的错误。错误不等于异常，不能被程序员通过代码处理。出现Error，程序通常无法恢复。

# 分析

&emsp;&emsp;世界上没有完美的程序，每个程序员都不可以避免的遇到异常信息，或者说“报错”，那么如何分析异常信息就成为了关键，先来看一个简单数组下标越界的异常：

    public class Test {
    	public static void main(String args[]){	   
    		test3();
    	}	
    private static void test3() {
    	int a[] = new int[2];
    	System.out.println("a[3]:" + a[3]);
    	}
    }
<br>
<div align=center><img src="http://img.blog.csdn.net/20180412110229958?"></div>

&emsp;&emsp;其中java.lang.ArrayIndexOutOfBoundsException为异常类型，表明了异常出现的大致原因，3是异常原因的说明，后面打印出的是异常追踪栈（StackTrace），因为函数是层级调用的，只要其中有一个函数出现了异常，它的所有调用者都会被异常影响。

&emsp;&emsp;通过查看异常，可以很容易得定位到错误发生在Test.test3()方法，第8行代码，原因是下标3越界了。

# 语法

&emsp;&emsp;	对于检查异常来说，通常有两种方式来处理异常，避免编译器检查不通过。

 - **try、catch、finally**
 		**try**语句块儿中包含可能出现异常的代码。**catch**语句块儿用于捕获和处理特定异常，允许存在多个catch块儿，括号中定义了异常类型与参数，JVM使用最先匹配到的catch块儿来处理异常。**finally**块儿是可选的，无论是否发生异常，是否匹配catch块儿，finally中的代码都会执行。主要做一些清理工作，如数据库连接的关闭。注意：try块儿不能单独出现，至少要有一个catch块儿或者finally块儿。当执行一个方法中的某条语句时发生异常，即使异常被处理，这条语句后面的代码也不会被执行，而是会顺序执行下一个方法。

    try {
    } 
    catch (Exception e) {
    } 
    finally {
    }

 - **throw、throws**
 抛出异常，方法自己不处理异常，仅仅是把异常抛给其调用者。使用throw处理异常通常的原因是：方法本身不知道如何处理异常，或者说让调用者处理更合适。

# 原则

&emsp;&emsp;为了更好的使用java的异常处理机制，Jim Cushing总结了三个原则：具体明确、及早抛出、延迟捕获。

 - **具体明确**
 
 在上文中，我们提到Java的异常类是一层一层继承而来的，为了使异常信息更加具体明确，通常使用其子类。如果需要更加具体的异常信息，也可以定义自己的异常类。比如相比于IOException，FileNotFoundException可以看做是一个更为具体化的异常。
 
```
File prefsFile = new File(prefsFilename);
	 
try{
	readPreferences(prefsFile);
}
catch (FileNotFoundException e){
	// 文件不存在
}
catch (IOException e){
	// IO异常
}
```
&emsp;&emsp;因此在捕获异常时，应该将子类异常放到前面，父类异常放到后面，这样程序可以尽可能的提供具体的异常信息，同时也有能力处理未预料到的其他异常。

 - **及早抛出**
```
public static  void readFile(String filename) throws FileNotFoundException {	
	InputStream in = new FileInputStream(filename); 
}
```
&emsp;&emsp;如果readFile所传的参数filename为null值，会出现如下异常：

```
Exception in thread "main" java.lang.NullPointerException
	at java.io.FileInputStream.<init>(Unknown Source)
	at java.io.FileInputStream.<init>(Unknown Source)
	at Test.readFile(Test.java:36)
	at Test.main(Test.java:9)
```
&emsp;&emsp;如上，最常见的空指针错误，却也是最让人奔溃的异常，通过上面的堆栈信息我们不能准确的定位到异常的位置，到底哪里是null。异常最早抛出点在java.io.FileInputStream，但是java.io.FileInputStream又是标准java类库的一部分，也就是说异常的原因很可能是我们的代码，而不是Java API。所以出现错误的位置应该在Test.readFile(Test.java:36)。如果代码进行如下修改：

```
public static  void readFile(String filename) throws FileNotFoundException {
	if (filename == null){
		throw new IllegalArgumentException("filename is null");
	}
	InputStream in = new FileInputStream(filename); 
}
```
&emsp;&emsp;异常信息会变为：

```
Exception in thread "main" java.lang.IllegalArgumentException: filename is null
	at Test.readFile(Test.java:34)
	at Test.main(Test.java:9)
```
&emsp;&emsp;提前抛出异常，异常信息会变得准确而又清晰。通过在检测到错误时立刻抛出异常来实现迅速失败，可以有效避免不必要的对象构造或资源占用，比如上面的文件字节读取流（FileInputStream），出现文件名为null的异常后，不会打开流，同样也无需关闭。

 - **延迟捕获**
 
 既然有抛出异常，就需要捕获异常，大多数情况下我们可能都是提前捕获异常（编译器会进行异常检查，会提示捕获或者抛出异常），常见的做法就是try catch一下。

<br>
<div align=center><img src="http://img.blog.csdn.net/20180412111705764?"></div>

&emsp;&emsp;上面读取文件的代码可能会变成这样：

```
public static  void readFile(String filename) throws FileNotFoundException {
	if (filename == null){
		throw new IllegalArgumentException("filename is null");
	}
	InputStream in = null;
	try {
		in = new FileInputStream(filename);
	} catch (FileNotFoundException e) {
		e.printStackTrace();
	}
}
```

&emsp;&emsp;延迟捕获指的是：不要在程序或者用户有能力处理异常之前捕获它，就像上面的FileNotFoundException异常，如果在readFile方法中捕获，又该如何处理异常。最不应该的是什么都不做，空的catch块儿等于把整个异常丢进黑洞，所有的异常信息都会丢失。打印到日志是一种方法，但是只有程序员能够看懂。最好的方式是延迟捕获，把异常抛给它的调用者，最后根据异常给用户少量但是清晰的提示，比如文件未找到，重新选择文件。

# 异常链

&emsp;&emsp;	在大型的软件开发中，往往会有方法的层级调用，一旦底层方法出现异常，其调用者也出现异常，进而导致一连串的异常，像多米诺骨牌一样。

&emsp;&emsp;假设B模块完成自己的逻辑需要调用A模块的方法，如果A模块发生异常，则B也将不能完成而发生异常，但是B在抛出异常时，会将A的异常信息掩盖掉，这将使得异常的根源信息丢失。异常的链化可以将多个模块的异常串联起来，使得异常信息不会丢失，保留每个异常的信息。

&emsp;&emsp;什么？没见过异常链，Caused by不陌生吧，下面就是一个异常链信息：

```
Exception in thread "main" java.lang.Exception: 文件名为null
	at Test.main(Test.java:12)
Caused by: java.lang.IllegalArgumentException: filename is null
	at Test.readFile(Test.java:18)
	at Test.main(Test.java:9)
```
&emsp;&emsp;异常链的构建也很简单，只需要把异常信息作为参数向上抛出即可，新的异常信息就会包含之前的异常信息。

```
public class Test {
	public static void main(String args[]) throws Exception{	   
		try {
			readFile(null);
		}
		catch (IllegalArgumentException e) {
			throw new Exception("文件名为null",e);
		}
	}
	public static  void readFile(String filename)  {
		if (filename == null){
		     throw new IllegalArgumentException("filename is null");
		}
	}
}
```


