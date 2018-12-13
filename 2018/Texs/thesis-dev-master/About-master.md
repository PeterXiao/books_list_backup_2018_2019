# 硕士和博士模板

代码部分来自　https://code.google.com/archive/p/sysuthesis/

由于各个学院的要求可能不一样，目前采用了定义一些变量，当他们取值不一样，比如 0 1 2 3 并同时也建立这些变量，使用`\ifx \var  \zero | \one | \two | \three`的方式来改变一些样式，未来可以定义不同学院学科的变量，把这些变量再做一次封装，达到用户友好.

`master.sty` 是硕士和博士模板的定义的文件，具体是提供了一些硕士和博士才会用到的环境比如`resume`个人简历环境,`publications`发表论文介绍环境，并定义了硕士和博士模板的具体要求.

`command.sty` 是提供了一些共有的命令，具体可以看第五章的，文章为双面打印格式还是电子版格式也在该文件实现，并提供了一个中英文题注的命令`\captionce`, 效果可以看第5章的图.

###　相应的变量说明

`englishtitle` 值可以为 `0 1`, 其中 `0` 代表没有英文的封面, `1`代表有英文的封面, 效果如下图

![](http://ow3kig4i4.bkt.clouddn.com/thesis/englishtitle.png)

`typetitle` 值可以为 `0 1 2`, 改变封面的效果, 其中 `0` 的效果为:

![](http://ow3kig4i4.bkt.clouddn.com/thesis/title0.png)

其中 `1` 的效果为:

![](http://ow3kig4i4.bkt.clouddn.com/thesis/title1.png)


`disclaim` 值可以为 `0 1 2`, 改变学术声明和保密协议的效果, 其中 `0` 的效果为:

![](http://ow3kig4i4.bkt.clouddn.com/thesis/disclaim0.png)

其中 `1` 的效果为:

![](http://ow3kig4i4.bkt.clouddn.com/thesis/disclaim1.png)


`head` 值可以为 `0 1 2`, 改变页眉的效果, 其中 `0` 的效果为:

![](http://ow3kig4i4.bkt.clouddn.com/thesis/head0.png)

其中 `1` 的效果为:

![](http://ow3kig4i4.bkt.clouddn.com/thesis/head1.png)

其中 `2` 的效果为:

![](http://ow3kig4i4.bkt.clouddn.com/thesis/head2.png)


### 一些问题

表格题注应该位于表上方

可以使用`latexmk`在根目录新建`latexmkrc`，内容如下

```
$pdf_mode = 1;
$pdflatex = "mkdir temp&&cd temp&&mkdir docs&&cd ..;xelatex %O %S -o %D;";
$recoder = 1;
#连续编译模式
$preview_continuous_mode = 1;
$pdf_previewer = 'open';
$pdf_update_method = 0;
$clean_ext = "synctex.gz acn acr alg aux bbl bcf blg brf fdb_latexmk glg glo gls idx ilg ind ist lof log lot out run.xml toc dvi";
$bibtex_use = 2;
@default_files = ('main.tex');
#指定生成PDF文件的文件名，可以与LaTeX主文件名不一致
$jobname = "thesis";

##
#输出其他文件夹会导致参考文献显示不了，因为调用其他参考文献格式　以及main.bib不匹配
## out_dir="./temp"
```