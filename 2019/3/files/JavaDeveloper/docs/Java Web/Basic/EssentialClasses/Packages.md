# Packages
## 前言

&emsp;&emsp;Java是面向对象语言，其基础类库的使用贯穿整个学习、开发过程。以JDK1.8来讲，类库数量还是非常多的，当然这不表示我们需要了解每一个类，所以先要对所有类有个整体上的认识，再根据其重要性选择性的去学习。

## 包

&emsp;&emsp;查看[Java SE8的API文档](https://docs.oracle.com/javase/8/docs/api/)，根据包名基本上可以分为三类：

- java.*：标准类库，向后兼容
- javax.*：最早表示标准库的拓展（extension)，后来随着javax的发展，部分类变成了Java API，但是再把Javax中的类迁移到java包会对现在的代码造成很大的影响，于是放弃了。现在javax包的一些类也是标准类库的一部分。
- org.*：企业或组织提供的Java类库，常用的是w3c提供的对XML、网页等的操作类。

<br>
<div align=center><img src="https://raw.githubusercontent.com/Bboy-AJ/JavaDeveloper-SkillMap/master/images/Java Web/JavaPackagesMap.png"></div>

## 常见包

1. java.lang：核心类包，包含了Object类、Class类、String类、基本类型的包装类、基本数学类等等最基本的类，系统自动导入这个包，无需手动import。
1. java.util：实用工具类，包含了集合框架、旧的集合类、事件模型、日期和时间、国际化还有其他的一些通用类（比如字符串标记生成器，随机数生成器、位数组）。
1. java.io：提供了系统输入输出的常用类，包含数据流、序列化、文件系统三种方式。
1. java.net：网络编程的常用类。