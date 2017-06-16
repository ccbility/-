; 这里的编码很重要，GBK
switchInput(){
	Send {Lshift DOWN}
	Send {Left}
	Send {Lshift UP}
	send, ^x

	cont = %clipboard%

	tmp = cont

	;不太懂ahk是怎么匹配换行符的，而且这里居然cont是个空值
	while (!RegExMatch(cont, "\s+") && cont != ""){
		;msgbox 11%cont%22
		Send {Lshift DOWN}
		Send {Left}
		Send {Lshift UP}
		send, ^x

		cont = %clipboard%
		clipboard =  ;清空粘帖板,不然当前无值时，会重复取之前的粘帖值
	}
	; 由于上面的循环会吃掉一个空白，所以这里补上一个
	; 在行首的时候会出现问题
	if(cont == ""){
		send {Space}
	}
	
	if (tmp == "￥"){
		Send {Lshift}
		send, $
	} else if ( cont == "·") {
		;这种情况是中文md，转换成 `之后还要保持中文输入状态，所以要两次LShift
		Send {Lshift}
		send ``````
		Send {Lshift}
	} else{
		Send {Lshift}
	}
}
;f6::switchInput()
^Backspace::switchInput() ;设置成Ctrl + Del，很符合习惯，反正每次打错都要del，这里只不过是加点料