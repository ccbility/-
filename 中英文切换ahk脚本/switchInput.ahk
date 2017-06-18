; 这里的编码很重要，GBK
switchInput(){
	Send {Lshift DOWN}
	Send {Left}
	Send {Lshift UP}
	send, ^x
	cont = %clipboard%
	clipboard =
	last = cont
	;msgbox 11%cont%22

	;不太懂ahk是怎么匹配换行符的，而且最后一个有时是换行之类的，有时是空
	while (!RegExMatch(cont, "\s+") && last != ""){
		;msgbox 11%cont%22
		Send {Lshift DOWN}
		Send {Left}
		Send {Lshift UP}
		send, ^x

		last := clipboard
		;msgbox 11%clipboard%22
		cont := clipboard cont
		clipboard =  ;清空粘帖板,不然当前无值时，会重复取之前的粘帖值
	}
	; 由于上面的循环会吃掉一个空白，所以这里补上一个
	; 在行首的时候会出现问题
	
	if(last == " "){
		;msgbox 11%last%22
		;send {Space}
	}
	
	Send {Lshift}
	;各种替换特殊字符
	;莫名会有两个换行，那么如果有的话，只保留一个，样式就不会乱
	;个人觉得这写法很点睛，既然不能在正则中匹配，那么我就当你先匹配上再进行操作
	bool := false
	if(RegExMatch(cont, "[·、]+$")){
		;这种情况是中文md，转换成 `之后还要保持中文输入状态，所以要两次LShift
		;msgbox herer
		;Send {Lshift}
		bool := true
	}
	cont := RegExReplace(cont, "(\s)+", "$1") 
	cont := StrReplace(cont, "￥", "$") 
	cont := StrReplace(cont, "【", "[") 
	cont := StrReplace(cont, "】", "]") 
	cont := StrReplace(cont, "（", "(") 
	cont := StrReplace(cont, "）", ")") 
	cont := StrReplace(cont, "：", ":")
	cont := StrReplace(cont, "·", "``````")
	cont := StrReplace(cont, "、", "/")
	
	send, %cont%
	if(bool){
		Send {Lshift}
	}
}
;f6::switchInput()
;^+Backspace::switchInput()
!Backspace::switchInput()