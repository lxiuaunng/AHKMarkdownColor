; 仅限 typora.exe 和 obsidian.exe 窗口中使用
if WinActive("ahk_exe Typora.exe") or WinActive("ahk_class obsidian.exe")
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
    
    SendInput, ^c              ; 发送 Ctrl+C 复制当前选中的文本
    ClipWait, [1, 1]           ; 等待剪贴板更新。第一个参数表示最多等待时间，可以为小数，为空则无限期等待；第二个参数可以为0或1，0表示只等待文本或文件，1表示等待任何类型的数据

    ; 判断剪切板是否为空，并且剪切板中不能只有换行符
    if (Clipboard != "") && (StrLen(Clipboard) != 0) && !RegExMatch(Clipboard, "^[\r\n]+$")  {
        ; MsgBox, 选中了文本: %Clipboard%
        SendInput, {Text}<font style="color:%color%">   ; 输出font标签
        SendInput, ^v                                   ; 粘贴剪切板文本。SendInput {CtrlDown}v{CtrlUp}
        Sleep, 50                                       ; 等待粘贴这个步骤走完
        if WinActive("ahk_exe Typora.exe"){             ; 判断当前窗口是否是 Tpora.exe
            SendInput, {Text}</                         ; 如果是，仅需要需要输出 "</"，Typora会自动补全标签
        }else if WinActive("ahk_exe obsidian.exe"){     ; 判断当前窗口是否是 obsidian.exe
            Sleep, 500                                  ; 等待 obsidian.exe 粘贴完成，不知道为什么在 obsidian 里</font>总是在字符串之前，好像粘贴需要更多的时间
            SendInput, {Text}</font>                    ; 输入完整标签
        }else{
            SendInput, {Text}</font>                    ; 如果都不是，输入完整标签
        }   
    }
    ; 如果剪切板为空，则提示“未选中任何文本”
    else {
        MsgBox, No text is selected.            
    }
    SendInput, {Blind}{AltDown}{AltUp}          ; 释放alt键，因为如果第二个键比alt键（物理上）提前释放，则会导致alt键物理释放后逻辑上仍然处于按下的状态
    return
}
