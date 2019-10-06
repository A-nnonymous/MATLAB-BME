% P52 2.4.9   Quasi-Steady-State Approximation
[aSol, bSol] = QSS(1,11,8,0.2);
[aASol] = QSSA(1,0.2); 
syms t
%% ��ͼ1:Steady-state behavior 
subplot(2,2,1);                             
ts = linspace(0,10,1000);                  %0~10���ӵ���̬����
ya = subs(aSol,t,ts);               
yb = subs(bSol,t,ts);                   
ya = eval(ya);
yb = eval(yb);
plot(ts,ya,ts,yb);
legend('a(t)','b(t)');
xlabel('T/min');
ylabel('C/mMol')
title('Steady-state behavior')

%% ��ͼ2�� Transient-state behavior 
subplot(2,2,2);                              
ts2 = linspace(0,1,1000);                   %0~1min����̬����
ya = subs(aSol,t,ts2);
yb = subs(bSol,t,ts2);                   
ya = eval(ya);
yb = eval(yb);
plot(ts2,ya,ts2,yb);
legend('a(t)','b(t)');
xlabel('T/min');
ylabel('C/mMol')
title('Transient-state behavior')
%% ��ͼ3:Steady-state behavior (Approximation)
subplot(2,2,3);                             
ts = linspace(0,10,1000);                  %0~10���ӵ���̬����
ya = subs(aSol,t,ts);                                
ya = eval(ya);
plot(ts,ya);
legend('a(t)');
xlabel('T/min');
ylabel('C/mMol')
title('Steady-state behavior(Approximation)')

%% ��ͼ4�� Transient-state behavior (Approximation)
subplot(2,2,4);                              
ts2 = linspace(0,1,1000);                   %0~1min����̬����
ya = subs(aSol,t,ts2);
ya = eval(ya);
plot(ts2,ya);
legend('a(t)');
xlabel('T/min');
ylabel('C/mMol')
title('Transient-state behavior(Approximation)')


%% ��װԭ�����⺯��
function [aSol, bSol] = QSS(K0,K1,K1_,K2)        
syms a(t) b(t)
eqn1= diff(a,t) == K1_*b-K1*a+K0-K2;
eqn2= diff(b,t) == K1*a-K1_*b;
InitCond = [a(0) == 6,b(0) == 0]; 
eqns = [eqn1, eqn2];
[aSol, bSol] = dsolve(eqns, InitCond);
end
%% ��װ���ƽ����⺯��

function [aASol] = QSSA(K0,K2)        
syms a(t)
eqn1= diff(a,t) == K0-K2*a                  %��������P46�ģ�2.28��4ʽ����b��������ģ���
InitCond = [a(0) == 6]; 
eqns = [eqn1];
[aASol] = dsolve(eqns, InitCond);
end
% COMPLETED BY PZW