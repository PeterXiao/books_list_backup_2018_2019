# USTBReport 文档类说明

效果见[这里](https://github.com/htharoldht/USTBReport/blob/master/USTBReport-demo.pdf)

本模板符合北京科技大学实验报告的模板, 并添加了一份计算机与通信工程学院的实验报告封面.
主要用于对实验报告的撰写, 提供一个实验报告的实现机制.
设置采用 xkeyval 包, 实现了键值对的方式指定常量.

## 接口

```
\USTBset{
  Course      = 微机原理与应用,  % 实验名称
  Instructor  = 万亚东,          % 指导老师
  Location    = 机电信息楼320,   % 实验地点
  School      = 计通学院,        % 学院
  Major       = 信息安全,        % 专业
  Class       = 信安1601,        % 班级
  Name        = 黄腾,            % 姓名
  Number      = 416245xx,        % 学号
  Year        = \the\year,       % 年
  Month       = \the\month,      % 月
  Day         = \the\day,        % 日
}
```

## 字体

- 衬线字体：
  本实验报告使用了思源黑体 Medium、DemiLight
- 非衬线字体：
  思源宋体 Bold、ExtraLight, Adobe 仿宋 Regular
- 等宽字体:
  文泉驿微米黑 Mono Light
以上字体均需要自行下载安装

## 代码

HTNotes-code 中使用了 minted 以及tcolorbox 排版. 具体使用方法见文件(感谢夜神的代码)

## 插图

- 插图初始定义了一系列文件夹, 用于图片的存放(在任一路径下均可)

- 子图采用的是较新的 subcaption 包

## 数学常见符号定义

见 HTNotes-math

## 其他见源代码

## TODO

- [ ] 制作一个说明文档
- [ ] 完善其余内容
