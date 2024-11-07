; Typora
; 快捷增加字体颜色
; SendInput {Text} 解决中文输入法问题

; 仅限 typora.exe 窗口中使用
#IfWinActive ahk_exe typora.exe
{
    ; Ctrl: ^
    ; Alt: !
    ; win: #
    ; Shift: +
    ; 可根据需要自行添加，如下
    ; ^!#+o:: addFontColor("orange")

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
return
}

; 快捷增加字体颜色
addFontColor(color){
    ClipSaved := ClipboardAll  ; 保存当前剪贴板内容
    Clipboard := ""            ; 清空剪贴板
    
    Send {CtrlDown}c{CtrlUp}   ; 发送 Ctrl+C 复制当前选中的文本
    ClipWait, 1                ; 等待剪贴板更新

    ; 判断剪切板是否为空，并且剪切板中不能只有换行符
    if (Clipboard != "") && (StrLen(Clipboard) != 0) && !RegExMatch(Clipboard, "^[\r\n]+$")  {
      ; MsgBox, 选中了文本: %Clipboard%
      SendInput {TEXT}<font style="color:%color%"> ; 输出font标签
      Send {CtrlDown}v{CtrlUp}             ; 粘贴剪切板文本
      if WinActive("ahk_exe Typora.exe"){  ; 判断当前窗口是否是Tpora.exe
          SendInput {TEXT}</               ; 如果是，仅需要需要输出 "</"，Typora会自动补全标签
      }else{
          SendInput {TEXT}</font>          ; 如果不是，输入完整标签
      }
    } else {
        MsgBox, No text is selected.       ; 未选中任何文本
        return
    }
    return
}
