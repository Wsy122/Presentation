---
marp: true
theme: default
paginate: true
---

# VS code 配置 R 语言


---

## 1 安装 R 与 VS Code

**1.1 安装 VS Code**
- VS Code的安装和其他软件安装一样，到官网下载安装包后打开点击安装即可，注意选择对应的操作相同版本。

- 地址：<https://code.visualstudio.com/>

**1.2 安装 R 语言**
- 在官网下载 R 语言的安装包，然后安装即可，注意选择对应的版本。
  
- 地址：<https://cran.r-project.org/bin/windows/base/>

   
---

## 2 安装 R 包

**1. 在 R 中安装 languageserver**

- 将下面的命令复制到 R 中，然后回车执行

`
install.packages("languageserver")
`
<center>
    <img src="https://mmbiz.qpic.cn/mmbiz_png/XEicwVA08daAs8lRYDzvFG4v3hbbFbVKYNDTp3ske8uOdzcT4VAmicUejZVwAxfXts6QxD1hVSDyDT8NibaBYAylw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1" width ="400">
</center>

---

**2. 在 R 中安装 httpgd**

- httpgd: 一个R包，提供一个图形设备，通过HTTP和WebSockets异步提供SVG图形。这个包是VS Code的R扩展中交互式绘图查看器所需的。使用httpgd可以在VS Code中轻松地查看和交互式地探索绘图结果。
- 在 R 中执行下面的命令:

`
install.packages("httpgd")
`

---

## 3 在 VS Code 中安装插件

**1. 安装 R 插件**
这是在 VS Code 运行 R 语言的核心插件
  
**2. 安装 R Debugger 插件**
用于对R包调试

**3. 安装 R LSP Client 插件**
R LSP Client 插件依托于 Language Server Protocol，LSP 可以使编程语言在编辑器上得到语法支持。提供自动补全，代码格式化，帮助文档等功能

**安装方法**
打开插件市场 (Extensions)，搜索相应插件，点击 "install" 即可安装

---

## 3 配置环境
1. 打开 VS Code 的设置，进入扩展选项下的 R， 在选项 "R›Rpath"，根据系统版本输入 R.exe 所在的路径
2. 同样打开设置面板，搜索r.plot.usehttpgd，开启即可
- 注：若不追求终端语法高亮显示和输出的美观程度，到此就基本配置好 R 的运行环境
- 以下为配置 radian 
  
---

**radian**
- 官网称 radian 是一款21世纪的R语言编辑器，纠正了官方 R 终端的许多缺陷，并支持诸如语法高亮和自动补全等许多功能。
- 提示：
  - 不安装也能运行 R
  - 安装后可能会出现终端乱码的情况（radian 编码和 R 原生编码冲突），如果出现这种情况，可以尝试设置 radian 的 language，具体教程见：<https://blog.csdn.net/qq_56883244/article/details/129528093>
  - radian 无法在 VS Code 插件市场找到，需要先自行下载后在 VS Code 中配置，并且需要 Python 环境

---

1. 安装
- 这里使用 pip 包管理器下载：`pip install radian`
- 安装完成之后，输入radian，进入下面界面，说明安装成功：

![image](https://mmbiz.qpic.cn/mmbiz_png/XEicwVA08daAs8lRYDzvFG4v3hbbFbVKYicEqZMTnWQbic9Piah0ib2NAzgHr6pHSxesFqLcCIMSoecMbYnibibtdGrEw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

---

2. 配置
- 找到 radian 安装的完整路径
  - 可以在终端下可以使用`where.exe radian`命令查看：

![image](https://pic4.zhimg.com/v2-5e0424b7be049c17e5fac79a7ed5f2a1_1440w.jpg)

- 打开  VScode设置，在 "R›Rterm"，根据系统版本输入 radina.exe 的完整路径