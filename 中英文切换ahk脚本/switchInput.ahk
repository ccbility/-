; ����ı������Ҫ��GBK
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
	; ���������ѭ����Ե�һ���հף��������ﲹ��һ��
	; �����׵�ʱ����������
	send {Space}
	
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
f6::switchInput()