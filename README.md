> [!note] 
>
> 【已解决】~~注意：使用热键的时候不能提释放前缀键（`Alt`)，否则会出现 bug：`Alt`物理上释放后，逻辑上仍处于按下的状态，接下来键盘的所有键都会变成以`Alt`为前缀键的热键，直到再次单击`Alt`才会释放。~~
>
> 详情解决方法请看：
>
> - [使用 ahk 的用户是否遇到过 alt 物理上释放(松开按键), 但逻辑上还是按下的状态 Topic is solved](https://www.autohotkey.com/boards/viewtopic.php?style=17&f=27&t=111295)
> - [如何使用 AutoHotkey 解决 Alt 键被卡住的问题](https://zhuanlan.zhihu.com/p/585645321)

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

1. 下载[AutoHotkey v1.1](https://www.autohotkey.com/download/ahk-install.exe)和[AHKMarkdownColor.ahk](https://github.com/lxiuaunng/AHKMarkdownColor/releases/download/v1.1/AHKMarkdownColor.ahk)
2. 使用 VSCode 打开`.ahk`文件，并安装可支持插件：AHK++、AutoHotkey v2 Language Support。
3. 按照注释和官方文档修改
4. 使用 Compiler/Ahk2Exe.exe 将 `.ahk` 转为`.exe`可执行文件
