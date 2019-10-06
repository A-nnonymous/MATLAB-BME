% P26 Example I: Decay
%% Ҫ���da(t)/dt��������ʵ��
%      �ڲ�ͬk�����߶Աȣ�Ϊʲô��decay rate

%%
%�٣���Ŀ��˼����ģ�����������Ϊ���÷�����a(t)������da(t)/dt������
syms k a(t) A0
eqn = diff(a,t) == -k*a;
InitCond = [a(0)==A0];               %δ֪��ʼŨ����������ΪA0
aSol(t) = dsolve(eqn, InitCond)
adtSol(t) = diff(aSol(t), t)        %���ˣ��÷�����a(t)������da(t)/dt�����ѽ�����ֱ����aSol��adtSol�������ź�����

%%
%��:Ĭ�϶ԱȲ�ͬk�µ�a(t)����
at1 = Decay(1)
at2 = Decay(3)
at3 = Decay(9)
t=linspace(0,10,100);
y1 = at1(t);
y2 = at2(t);
y3 = at3(t);
plot(t,y1,t,y2,t,y3)
legend('k=1','k=3','k=9')
function aSol = Decay(k)       %��װ�����Ա��θ���
syms a(t) 
eqn = diff(a,t) == -k*a;
initcond = [a(0)==1];               %δ������ʼŨ��������Ϊ����ͼ��������Ϊ1
aSol(t) = dsolve(eqn, initcond);
adtSol(t) = diff(aSol(t), t) ;
end


% COMPLETED BY PZW