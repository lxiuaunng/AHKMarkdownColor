; Typora
; 快捷增加字体颜色
; SendInput {Text} 解决中文输入法问题

; #IfWinActive ahk_exe Typora.exe
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

    ; c+b 浅蓝色
    !b:: addFontColor("cornflowerblue")
    ; s+b 天蓝色
    ; !b:: addFontColor("skyblue")

    ; alt+c 青色
    !c:: addFontColor("cyan")

    ; alt+p 紫色
    !p:: addFontColor("purple")

    ; alt+t 透明度
    !t:: addFontColor("rgba(0,0,0,0)")

}

; 快捷增加字体颜色
addFontColor(color){
    clipboard := "" ; 清空剪切板
    Send {ctrl down}c{ctrl up} ; 复制
    SendInput {TEXT}<font color='%color%'>
    SendInput {ctrl down}v{ctrl up} ; 粘贴
    if WinActive("ahk_exe Typora.exe"){ ; 判断当前窗口是否是Tpora.exe
        SendInput {TEXT}</font>  ; 如果是，Typora中自动补全标签
    }else{
        SendInput {TEXT}</font123> ; 如果不是，输入完整标签
    }
}

; ; 快捷增加字体颜色
; addFontColor(color){
;     clipboard := "" ; 清空剪切板
;     Send {ctrl down}c{ctrl up} ; 复制
;     SendInput {TEXT}<font color='%color%'>
;     SendInput {ctrl down}v{ctrl up} ; 粘贴
;     If(clipboard = ""){
;         SendInput {TEXT}</font> ; Typora 在这不会自动补充
;     }else{
;         SendInput {TEXT}</ ; Typora中自动补全标签
;     }
; }
