% P48 2.4.1   Open Reaction Network 
 %% (a)Construct a differential equation model of the network.
syms a(t) b(t) c(t) d(t)
syms k1 k2 k3 k4 k5 k6
eqn1= diff(a,t) == k1-k2*a;
eqn2= diff(b,t) == k2*a-k3;
eqn3= diff(c,t) == k2*a-k4*c+k5*(d^2);
eqn4= diff(d,t) == k4*c-k5*(d^2)-k6*d;   %΢�ַ���ģ�ͽ������

%% (b)Determine the steady-state concentrations of all species as functions of the mass-action constants. 

%�������������ĳ�΢�ַ����麯����װ������δ��������⣨Unable to find explicit solution��
%  function [aSol, bSol, cSol, dSol] = ORN()
% syms a(t) b(t) c(t) d(t)
% syms k1 k2 k3 k4 k5 k6
% eqn1= diff(a,t) == k1-k2*a;
% eqn2= diff(b,t) == k2*a-k3;
% eqn3= diff(c,t) == k2*a-k4*c+k5*(d^2);
% eqn4= diff(d,t) == k4*c-k5*(d.^2)-k6*d;   %΢�ַ���ģ�ͽ������
% 
% eqns = [eqn1, eqn2, eqn3, eqn4];  %��ʼ����:Ũ�Ⱦ�Ϊ0
% Cond1 = a(0)==0;
% Cond2 = b(0)==0;
% Cond3 = c(0)==0;
% Cond4 = d(0)==0;
% InitCond = [Cond1,Cond2,Cond3,Cond4];
% 
% [aSol, bSol, cSol, dSol] = dsolve(eqns,InitCond);
% 
%  end

%% ��ֵ�����ģʽ

tspan = [0,1000];
y0 = [0,0,0,0]
[t,y] = ode45(@odefun,tspan,y0)
plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4))
function dydt = odefun(t,y)
dydt = zeros(4,1);
dydt(1) = k1-k2*y(1);                 
dydt(2) = k2*y(1)-k3;                 %ʵ�ʽ�ģ��ϣ������޷��ó������⣬���޷���֪���ʳ�����������ֹ
dydt(3) = k2*y(1)-k4*y(3)+k5*(y(4).^2);
dydt(4) = k4*y(3)-k5*(y(4).^2)-k6*y(4);
end

% COMPLETED BY PZW