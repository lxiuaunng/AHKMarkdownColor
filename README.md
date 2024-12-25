---
title: AHKMarkdownColor
tags:
  - github
  - typora
  - obsidian
  - AutoHotkey
create: 2024-12-25
update: 2024-12-25
publish: true
remotely: https://github.com/lxiuaunng/AHKMarkdownColor
---

# [AHKMarkdownColor](../../../B_代码炼金术/B3_已归档/其他/工具/AHKMarkdownColor.md)

> [!note]
>
> 【v1.2 已解决】复制、粘贴和文本输出这三件事是异步进行的，CPU 执行效率高，内存交换数据较慢，因此顺序时常错乱，需要用`Sleep`来确保时间顺序一定，但无疑效率低下。
>
> 解决方法：用拼接字符串的方式输出

> [!note]
>
> 【v1.1 已解决】注意：使用热键的时候不能提释放前缀键（`Alt`)，否则会出现 bug：`Alt`物理上释放后，逻辑上仍处于按下的状态，接下来键盘的所有键都会变成以`Alt`为前缀键的热键，直到再次单击`Alt`才会释放。
>
> 详情解决方法请看：
>
> - [使用 ahk 的用户是否遇到过 alt 物理上释放(松开按键), 但逻辑上还是按下的状态 Topic is solved](https://www.autohotkey.com/boards/viewtopic.php?style=17&f=27&t=111295)
> - [如何使用 AutoHotkey 解决 Alt 键被卡住的问题](https://zhuanlan.zhihu.com/p/585645321)

> [!note]
>
> 【v1.0 已解决】Typora 在复制空字符串，也就是未选中任何字符时按下 Ctrl+c，此时剪贴板中会存在回车和换行符：
>
> ```
> `n`r
> ```
>
> 这样会导致剪贴板中看不到任何实质性内容，却不为空。_详情请看：[A_Clipboard - 定义 & 使用 | AutoHotkey v2](https://wyagd001.github.io/v2/docs/lib/A_Clipboard.htm)_
>
> 解决方法：
>
> ```ahk
> if (RegExMatch(A_Clipboard, "^[\r\n]+$")) {
> 	; 剪贴板中只有回车和换行符的情况，执行代码
>     MsgBox "Typora no text is selected."
>     return
> }
> ```
>
> `A_Clipboard`为剪贴板文本，整个表达式表示剪贴板内容必须由一个或多个回车或换行符组成。

---

## 使用方法：

双击`exe`文件后使用以下快捷键自动为选中文本添加`<font>`标签，如`<font style="color:red">红色文本</font>`。

- alt+r 红色
- alt+o 橙色
- alt+y 黄色
- alt+g 灰色
- alt+c 浅蓝色
- alt+s 天蓝色
- alt+p 紫色
- alt+t 透明度为 0

将`.exe`文件放在`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup`目录下可实现开机自启动。

---

## 自定义按键

详情请参考[Autohotkey 中文文档](https://autohotkey.top/)

1. 下载[AutoHotkey v2.0](https://www.autohotkey.com/download/ahk-v2.exe)和[AHKMarkdownColor.ahk](https://github.com/lxiuaunng/AHKMarkdownColor/releases/download/v1.2/AHKMarkdownColor.ahk)
2. 使用 VSCode 打开`.ahk`文件，并安装可支持插件：AHK++、AutoHotkey v2 Language Support。
3. 按照注释和[文档](https://wyagd001.github.io/v2/docs/index.htm)修改
4. 使用 ./Compiler/Ahk2Exe.exe 将 `.ahk` 转为`.exe`可执行文件
