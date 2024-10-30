- alt+r 红色
- alt+o 橙色
- alt+y 黄色
- alt+g 灰色
- alt+c 浅蓝色
- alt+s 天蓝色
- alt+p 紫色
- alt+t 透明度为0

  ---

详情请参考[Autohotkey中文文档](https://autohotkey.top/)

  ## 自定义组合键

通常快捷键组合由可选的前缀/修饰键(Ctrl, Alt, Shift 和 LWin/RWin) 和单个后缀键组成。

两个按键(包括鼠标, 但不包括控制器按钮) 的自定义组合热键可以使用 "&" 来定义。因为它们是为与前缀键一起使用而设计的，所以自定义组合有以下特殊行为：

- 除非前缀键是标准的修饰键或可切换键(如 CapsLock)，否则前缀键将失去其原来的功能。简而言之就是设置热键`a & b`后，字母“a”将无法正常输出。
- 如果前缀键还用作另一个热键中的后缀, 则默认情况下, 该热键在释放时触发, 如果它用于激活自定义组合, 则根本不会触发. 如果同时有 key-down 热键和 [key-up](https://autohotkey.top/AutoHotkey2.0/docs/Hotkeys.htm#keyup) 热键, 两个热键将同时被触发. 如果[波浪号前缀](https://autohotkey.top/AutoHotkey2.0/docs/Hotkeys.htm#Tilde)

> **注意:** 对于带有标准修饰键的组合, 通常最好使用标准语法. 例如, 使用 `<+s::` 而不是 `LShift & s::`.

在下面的例子中, 你可以按住 Numpad0, 然后按下第二个按键来触发热键:

```ahk
Numpad0 & Numpad1::MsgBox "You pressed Numpad1 while holding down Numpad0."
Numpad0 & Numpad2::Run "Notepad"
```

**前缀键会失去它原有的功能:** 在上面的例子中, Numpad0 为 *前缀键*; 但是这也让 Numpad0 在被按下时失去了它原有/自带的功能. 为了避免此问题, 脚本中可以配置 Numpad0 执行新的动作, 例如下列热键的其中一个:

```ahk
Numpad0::WinMaximize "A"   ; 最大化活动/前端窗口.
Numpad0::Send "{Numpad0}"  ; 让 Numpad0 释放 时产生 Numpad0 键击. 请参阅下面的注释.
```

**释放时触发:** 使用上面的其中一个自定义组合热键可以在 *释放* Numpad0 时执行指定的动作, 但不包括按住 Numpad0 时您又按下了其他按键的情况. 可以在其中某个热键前使用[颚化符(波浪号) 前缀](https://autohotkey.top/AutoHotkey2.0/docs/Hotkeys.htm#Tilde)来避免这种行为.

**修饰:** 与普通热键不同的是, 自定义组合在默认情况下表现得就像拥有一个[通配符(*)](https://autohotkey.top/AutoHotkey2.0/docs/Hotkeys.htm#wildcard) 修饰一样. 例如, `1 & 2::` 当按下 1 和 2 时, 无论 Ctrl 或 Alt 是否被按住都会触发, 然而 `^1::` 仅在 Ctrl+1 组合键时触发, 而 Ctrl+Alt+1 不会触发.

不支持组合三个或更多的键. 一般来说组合键支持你键盘上物理存在的所有按键, 都可以用 [#HotIf](https://autohotkey.top/AutoHotkey2.0/docs/lib/_HotIf.htm) 和 [GetKeyState](https://autohotkey.top/AutoHotkey2.0/docs/lib/GetKeyState.htm) 探测状态, 但是也可能出现不一致的情况. 例如:

```ahk
; 以任何顺序按下 AppsKey 和 Alt, 然后按下反斜杠键(/).
#HotIf GetKeyState("AppsKey", "P")
Alt & /::MsgBox "Hotkey activated."

; 如果对调 AppsKey 和 Alt, 则必须先按下 Alt(一次按一个):
#HotIf GetKeyState("Alt", "P")
AppsKey & /::MsgBox "Hotkey activated."

; 同时按下这三个键: [ & ] & \::
#HotIf GetKeyState("[") && GetKeyState("]")
\::MsgBox
```

**键盘钩子:** 涉及键盘键的自定义的组合键总是使用键盘钩子, 使用前缀键作为后缀的任何热键也是如此. 例如, `a & b::` 导致 `^a::` 总是使用键盘钩子.
