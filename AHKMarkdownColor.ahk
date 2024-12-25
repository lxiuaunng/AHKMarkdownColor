#HotIf WinActive("ahk_exe typora.exe") or WinActive("ahk_exe obsidian.exe")
; alt+r 红色
!r:: addFontColor("red")

; alt+o 橙色
!o:: addFontColor("orange")

; alt+y 黄色
!y:: addFontColor("yellow")

; alt+g 灰色
!g:: addFontColor("grey")

; alt+c 浅蓝色
!c:: addFontColor("cornflowerblue")

; alt+s 天蓝色
!s:: addFontColor("skyblue")

; alt+p 紫色
!p:: addFontColor("purple")

; alt+t 透明度
!t:: addFontColor("rgba(0,0,0,0)")

; 快捷增加字体颜色
addFontColor(color)
{
    ClipSaved := ClipboardAll()      ; 保存当前剪贴板内容
    A_Clipboard := ""                ; 清空剪贴板，准备捕获复制的内容\
    output := ""                     ; 输出文本
    Send "^c"                        ; 按下 Ctrl+C 复制选中的文本
    if !ClipWait(0.5)                ; 最多等待 0.5 秒，检测是否复制成功
    {
        MsgBox "No text is selected."  ; 如果为空，则提示没有选中任何文本
        return
    }

    if (RegExMatch(A_Clipboard, "^[\r\n]+$")) {    ; 判断剪贴板中是否只有回车和换行符
        MsgBox "Typora no text is selected."         ; 如果是，则提示没有选中任何文本
        return
    }

    ; 拼接字符串
    output := "<font style=`"color:" color "`">" A_Clipboard "</font>"
    SendText output                         ; 输出拼接好的字符串

    A_Clipboard := ClipSaved                ; 恢复剪贴板内容
    Send "{Blind}{Alt Down}{Alt Up}"        ; 修复 Alt 键未释放的问题
    return
}