% P35 Exercise 2.1.9(Steady State) 
sol = ss(1,3)           %��ʼŨ��3��kΪ1
t = linspace(0,10,100);
y = sol(t);
plot(t,y)               %��ʵ֤����˫����˥���ڴ�ģ���в�������̬���ƣ���������0

function aSol = ss(k,A0)
syms a(t)
eqn = diff(a,t)==-2*k*a^2;          
initcond = [a(0)==A0];               %δ֪��ʼŨ����������ΪA0
aSol(t) = dsolve(eqn, initcond)
end
% COMPLETED BY PZW

