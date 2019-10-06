% P29 Example II: Production and Decay
%29页example Ⅲ，动态过程求解
sol = Pro_N_De(4,3);                    %令k0为4，k1为3，让图像和教科书上的上升--平稳型曲线相似
t = linspace(0,10,100);
y = sol(t);
plot(t,y)

function [aSol,adtSol] = Pro_N_De(k0,k1)       %封装函数
syms a(t) 
eqn = diff(a,t) ==k0 -k1*a;
InitCond = [a(0)==1];               %未给出初始浓度条件，为了作图不妨设置为1
aSol(t) = dsolve(eqn, InitCond);
adtSol(t) = diff(aSol(t), t) ;
end


% COMPLETED BY PZW