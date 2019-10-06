% P52 2.4.8 Rapid Equilibrium Approximation
%  (a) Construct a differential equation model of the system.
%% Simulate your model with initial conditions (in mM) of A(0)=1.5,  B(0)=3,  C(0)=2. 
% 1.Plot the transient and steady-state behavior of the system.
% 2.Make two plots to capture all of the dynamics (i.e., two different window sizes). 
[aSol, bSol, cSol] = RE(0.05,0.005,0.7,0.4);
[bASol,cASol] = REA(0.05,0.005,0.7,0.4);
syms t
%% 子图1:Steady-state behavior 
subplot(2,2,1);                             
ts = linspace(0,50,1000);                  %0~50分钟的稳态分析
ya = subs(aSol,t,ts);               
yb = subs(bSol,t,ts);                   
yc = subs(cSol,t,ts);
ya = eval(ya);
yb = eval(yb);
yc = eval(yc);
plot(ts,ya,ts,yb,ts,yc);
legend('a(t)','b(t)','c(t)');
xlabel('T/min');
ylabel('C/mMol')
title('Steady-state behavior')
%% 子图2： Transient-state behavior 
subplot(2,2,2);                              
ts2 = linspace(0,6,1000);                   %0~6min的暂态分析
ya = subs(aSol,t,ts2);
yb = subs(bSol,t,ts2);                   
yc = subs(cSol,t,ts2);
ya = eval(ya);
yb = eval(yb);
yc = eval(yc);
plot(ts2,ya,ts2,yb,ts2,yc);
legend('a(t)','b(t)','c(t)');
xlabel('T/min');
ylabel('C/mMol')
title('Transient-state behavior')

%% 子图3:Steady-state behavior (Approximation)
subplot(2,2,3);                             
ts = linspace(0,50,1000);                  %0~50分钟的稳态分析               
yb = subs(bASol,t,ts);                   
yc = subs(cASol,t,ts);
yb = eval(yb);
yc = eval(yc);
plot(ts,yb,ts,yc);
legend('b(t)','c(t)');
xlabel('T/min');
ylabel('C/mMol')
title('Steady-state behavior(Approximation)')

%% 子图4： Transient-state behavior (Approximation)
subplot(2,2,4);                              
ts2 = linspace(0,6,1000);                   %0~6min的暂态分析
yb = subs(bSol,t,ts2);                   
yc = subs(cSol,t,ts2);
yb = eval(yb);
yc = eval(yc);
plot(ts2,yb,ts2,yc);
legend('b(t)','c(t)');
xlabel('T/min');
ylabel('C/mMol')
title('Transient-state behavior(Approximation)')
                                   
 %% 封装原解析解函数 
function [aSol, bSol, cSol] = RE(K1,K1_,K2,K2_)       
syms a(t) b(t) c(t)
eqn1= diff(a,t) == K1_*b-K1*a;
eqn2= diff(b,t) == K1*a-K1_*b+K2_*c-K2*b;
eqn3= diff(c,t) == K2*b-K2_*c;
InitCond = [a(0) == 1.5,...
            b(0) == 3,... 
            c(0) == 2]; 
eqns = [eqn1, eqn2, eqn3];
[aSol, bSol, cSol] = dsolve(eqns, InitCond);

end
%% 封装近似解析解函数
function [bASol, cASol] = REA(K1,K1_,K2,K2_)       
syms b(t) c(t)
eqn1= diff(b,t) == K1*4.5-(K1_+K1)*b+K2_*c-K2*b;            %根据书上P33页的（2.12）式，简化a变量，建模完毕
eqn2= diff(c,t) == K2*b-K2_*c;
InitCond = [b(0) == 3,... 
            c(0) == 2]; 
eqns = [eqn1, eqn2];
[bASol, cASol] = dsolve(eqns, InitCond);

end
% COMPLETED BY PZW