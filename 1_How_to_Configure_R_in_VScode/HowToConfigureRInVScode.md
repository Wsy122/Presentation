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

- 要实现自动补齐还需要安装：Languageserver

- 将下面的命令复制到 R 中，然后回车执行
`
install.packages("languageserver")
`

![image w:600 h:300](https://mmbiz.qpic.cn/mmbiz_png/XEicwVA08daAs8lRYDzvFG4v3hbbFbVKYNDTp3ske8uOdzcT4VAmicUejZVwAxfXts6QxD1hVSDyDT8NibaBYAylw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)


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

![image w:100 h:100](https://github.com/Wsy122/Presentation/blob/master/1_How_to_Configure_R_in_VScode/images/84f44327acc0a1b2cac39b6d558d91c.png?raw=true)
  

---
**2. 安装 R Debugger 插件**
用于对R包调试

**3. 安装 R LSP Client 插件**
R LSP Client 插件依托于 Language Server Protocol，LSP 可以使编程语言在编辑器上得到语法支持。提供自动补全，代码格式化，帮助文档等功能

**安装方法**
打开插件市场 (Extensions)，搜索相应插件，点击 "install" 即可安装

---

## 3 配置环境

- 打开 VS code 设置
    - 输入 r.rpath 根据系统版本输入 R.exe 所在的路径
    - 输入 r.plot.usehttpgd，勾选
- 注：若不追求终端语法高亮显示和输出的美观程度，到此就基本配置好 R 的运行环境
- 以下为配置 radian 
  
---

**radian**
- 官网称 radian 是一款21世纪的R语言编辑器，纠正了官方 R 终端的许多缺陷，并支持诸如语法高亮和自动补全等许多功能。
- 说明：
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

- 打开 VS code 设置
  - 输入 r.rterm，在 "R›Rterm"，根据系统版本输入 radina.exe 的完整路径
  - 输入 r.br ，选中 Bracketed Paste 
    - 不勾选，Radian 不会启用
  - 输入 r.rterm.option，删除--no-save,--no-restore，添加--no-site-file
    - 原因见 <https://sspai.com/post/47386>
  - 输入r.sessionWatcher，勾选
    - 可以实现绘图IDE，查看dataframe。如果想用原生绘图，取消勾选即可。

---

## 4 修改快捷键

1. 在Rstudio中，使用 "alt+-" 组合键可以输出 "<- "，使用 "ctrl+shift+m" 组合键可以输出 "%>%" 。在 VS Code，我们需要对快捷键进行配置后才可以输出。
2. 使用 "Ctrl+Shift+P" 打开命令面板，输入"open keyboard shortcuts (JSON)" 打开快捷键配置文件 keybindings.json：
  ![image w:700](https://pic3.zhimg.com/v2-8fb04c11c052b546d7eea449036e5b44_1440w.jpg)

  ---

3. 在文件末尾添加
  
 ```r
   {
    "key": "alt+-",
    "command": "type",
    "args": {
      "text": " <- "
    },
    "when": "editorTextFocus && editorLangId == 'r'"
  },
  {
    "key": "ctrl+shift+m",
    "command": "editor.action.insertSnippet",
    "when": "editorTextFocus && editorLangId == 'r'",
    "args": {
      "snippet": " %>% "
    }
  }
```
---

## 5 可能遇到的问题

1. radian安装后无法查看路径，如


---

## 尾巴

诚然，在完成大型的 R 项目中，VS Code 可能打不过 RStudio，譬如整合的图形显示、帮助文档查询等等。
但是寻找一个新的选择，并在其中学得更多东西，固然不是一件坏事；在不同的场景下使用不同的工具，也可以带来意想不到的效果。