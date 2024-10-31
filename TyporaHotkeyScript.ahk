; Typora
; 快捷增加字体颜色
; SendInput {Text} 解决中文输入法问题

#IfWinActive ahk_exe typora.exe
{
    ; Ctrl+Alt+win+Shift+o 橙色
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
    ; 保存当前剪贴板内容
    ClipSaved := ClipboardAll
    Clipboard := ""  ; 清空剪贴板
    
    ; 发送 Ctrl+C 复制
    Send {CtrlDown}c{CtrlUp}
    ClipWait, 1  ; 等待剪贴板更新

    if (Clipboard != "") && (StrLen(Clipboard) != 0) && !RegExMatch(Clipboard, "^[\r\n]+$")  {
      ; MsgBox, 选中了文本: %Clipboard%
      SendInput {TEXT}<font style="color:%color%">
      Send {CtrlDown}v{CtrlUp} ; 粘贴
      if WinActive("ahk_exe Typora.exe"){ ; 判断当前窗口是否是Tpora.exe
          SendInput {TEXT}</  ; 如果是，Typora中自动补全标签
      }else{
          SendInput {TEXT}</font> ; 如果不是，输入完整标签
      }
    } else {
        MsgBox, 没有选中任何文本.
        return
    }
}
