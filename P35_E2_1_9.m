% P35 Exercise 2.1.9  

syms k a(t) A0
eqn = diff(a,t)==-2*k*a^2;           %΢�ַ��̽�ģ
initcond = [a(0)==A0];               %δ֪��ʼŨ����������ΪA0
aSol(t) = dsolve(eqn, initcond)      %���ˣ�Ũ��-ʱ�����߷��̽��


% COMPLETED BY PZW