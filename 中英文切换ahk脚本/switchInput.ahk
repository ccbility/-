; ����ı������Ҫ��GBK
switchInput(){
	Send {Lshift DOWN}
	Send {Left}
	Send {Lshift UP}
	send, ^x
	cont = %clipboard%
	clipboard =
	last = cont
	;msgbox 11%cont%22

	;��̫��ahk����ôƥ�任�з��ģ��������һ����ʱ�ǻ���֮��ģ���ʱ�ǿ�
	while (!RegExMatch(cont, "\s+") && last != ""){
		;msgbox 11%cont%22
		Send {Lshift DOWN}
		Send {Left}
		Send {Lshift UP}
		send, ^x

		last := clipboard
		;msgbox 11%clipboard%22
		cont := clipboard cont
		clipboard =  ;���ճ����,��Ȼ��ǰ��ֵʱ�����ظ�ȡ֮ǰ��ճ��ֵ
	}
	; ���������ѭ����Ե�һ���հף��������ﲹ��һ��
	; �����׵�ʱ����������
	
	if(last == " "){
		;msgbox 11%last%22
		;send {Space}
	}
	
	Send {Lshift}
	;�����滻�����ַ�
	;Ī�������������У���ô����еĻ���ֻ����һ������ʽ�Ͳ�����
	;���˾�����д���ܵ㾦����Ȼ������������ƥ�䣬��ô�Ҿ͵�����ƥ�����ٽ��в���
	bool := false
	if(RegExMatch(cont, "[����]+$")){
		;�������������md��ת���� `֮��Ҫ������������״̬������Ҫ����LShift
		;msgbox herer
		;Send {Lshift}
		bool := true
	}
	cont := RegExReplace(cont, "(\s)+", "$1") 
	cont := StrReplace(cont, "��", "$") 
	cont := StrReplace(cont, "��", "[") 
	cont := StrReplace(cont, "��", "]") 
	cont := StrReplace(cont, "��", "(") 
	cont := StrReplace(cont, "��", ")") 
	cont := StrReplace(cont, "��", ":")
	cont := StrReplace(cont, "��", "``````")
	cont := StrReplace(cont, "��", "/")
	
	send, %cont%
	if(bool){
		Send {Lshift}
	}
}
;f6::switchInput()
;^+Backspace::switchInput()
!Backspace::switchInput()