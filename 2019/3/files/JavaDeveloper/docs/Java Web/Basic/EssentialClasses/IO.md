# Basic I/O

## 概念

&emsp;&emsp;I/O 即为输入/输出。从操作对象上来看，I/O是计算机内存与外设之间的数据交互，也可以说I/O问题是整个人机交互的核心问题，很容易成为性能瓶颈。Java提供的I/O操作类主要在java.io和java.nio包中，NIO即New IO（JDK1.4中引入），主要为提高I/O的操作效率。

## 类别

&emsp;&emsp;	java.io包中有很多接口以及相关类，大致上可以分为三类：数据流、对象、文件。

- 数据流：一组数据队列，根据传输格式可以分为字节流和字符流.
	
&emsp;&emsp;字节流：无论是磁盘还是网络传输，程序处理的最小数据单位都是字节，关于字节流的处理又可以分为两种相关类：InputStream、OutputStream。InputStream是所有输入字节流的父类，OutputStream是所有输出字节流的父类，它们都是抽象类。
	
&emsp;&emsp;字符流：通常我们在程序中直接操作的数据都是字符形式，为了操作方便，提供了常用的字符流处理类，可以分为Reader、Writer，它们分别是输入字符流和输出字符流的父类，同样都是抽象类。

<div align=center><img src="https://raw.githubusercontent.com/Bboy-AJ/JavaDeveloper-SkillMap/master/images/Java Web/JavaIOClassMap.png" width=700></div>


- 对象：Java对象关于I/O的操作称之为序列化和反序列化，序列化就是把对象转换为字节序列，可以很方便的传输和存储，反序列化刚好与之相反。序列化的类需要实现Serializable接口，但是此接口没有任何方法需要实现。
- 文件：Java中的File类用来表示文件和目录，而不包括文件内容，要读取文件内容还需要使用I/O流的相关类。

## 分析

&emsp;&emsp;java.io包中有很多类，但是归纳整理后会发现其实不复杂，以InputStream为例，搞清楚一个，其他都很容易理解。Java I/O中使用了两个设计模式：装饰者、适配器。
	


- 装饰者模式：
<br>
<div align=center><img src="https://raw.githubusercontent.com/Bboy-AJ/JavaDeveloper-SkillMap/master/images/Java Web/JavaIODecoratePattern.png" width=700></div>
<br>
&emsp;&emsp;InputStream 是抽象组件，FileInputStream 是 InputStream 的子类，属于具体组件，提供了字节流的输入操作。FilterInputStream 属于抽象装饰者，装饰者用于装饰组件，为组件提供额外的功能，例如 BufferedInputStream 为 FileInputStream 提供缓存的功能。
	
&emsp;&emsp;实例化一个具有缓存功能的字节流对象时，只需要在 FileInputStream 对象上再套一层 BufferedInputStream 对象即可。

`BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));`
	


- 适配器模式：InputStreamReader是从byte流到char流的一个桥梁，它读入byte数据并根据指定的编码将之翻译成char数据。InputStreamReader虽然叫“桥梁”，但它不是桥接模式，是适配器模式的应用。InputStreamReader是从byte输入流到char输入流的一个适配器。

`InputStreamReader input = new InputStreamReader(System.in);`