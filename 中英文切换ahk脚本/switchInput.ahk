; ����ı������Ҫ��GBK
switchInput(){
	Send {Lshift DOWN}
	Send {Left}
	Send {Lshift UP}
	send, ^x

	cont = %clipboard%

	tmp = cont

	;��̫��ahk����ôƥ�任�з��ģ����������Ȼcont�Ǹ���ֵ
	while (!RegExMatch(cont, "\s+") && cont != ""){
		;msgbox 11%cont%22
		Send {Lshift DOWN}
		Send {Left}
		Send {Lshift UP}
		send, ^x

		cont = %clipboard%
		clipboard =  ;���ճ����,��Ȼ��ǰ��ֵʱ�����ظ�ȡ֮ǰ��ճ��ֵ
	}
	; ���������ѭ����Ե�һ���հף��������ﲹ��һ��
	; �����׵�ʱ����������
	if(cont == ""){
		send {Space}
	}
	
	if (tmp == "��"){
		Send {Lshift}
		send, $
	} else if ( cont == "��") {
		;�������������md��ת���� `֮��Ҫ������������״̬������Ҫ����LShift
		Send {Lshift}
		send ``````
		Send {Lshift}
	} else{
		Send {Lshift}
	}
}
;f6::switchInput()
^Backspace::switchInput() ;���ó�Ctrl + Del���ܷ���ϰ�ߣ�����ÿ�δ��Ҫdel������ֻ�����Ǽӵ���