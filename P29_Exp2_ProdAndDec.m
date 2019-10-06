% P29 Example II: Production and Decay
%29ҳexample �󣬶�̬�������
sol = Pro_N_De(4,3);                    %��k0Ϊ4��k1Ϊ3����ͼ��ͽ̿����ϵ�����--ƽ������������
t = linspace(0,10,100);
y = sol(t);
plot(t,y)

function [aSol,adtSol] = Pro_N_De(k0,k1)       %��װ����
syms a(t) 
eqn = diff(a,t) ==k0 -k1*a;
InitCond = [a(0)==1];               %δ������ʼŨ��������Ϊ����ͼ��������Ϊ1
aSol(t) = dsolve(eqn, InitCond);
adtSol(t) = diff(aSol(t), t) ;
end


% COMPLETED BY PZW