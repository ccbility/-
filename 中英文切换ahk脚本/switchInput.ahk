; 这里的编码很重要，GBK
switchInput(){
	Send {Lshift DOWN}
	Send {Left}
	Send {Lshift UP}
	send, ^x

	cont = %clipboard%

	tmp = cont

	while (StrLen(cont) > 0){
		;msgbox %cont%
		Send {Lshift DOWN}
		Send {Left}
		Send {Lshift UP}
		send, ^x

		cont = %clipboard%
	}
	; 由于上面的循环会吃掉一个空白，所以这里补上一个
	; 在行首的时候会出现问题
	send {Space}
	
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
f6::switchInput()