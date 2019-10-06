% P35 Exercise 2.1.9(Steady State) 
sol = ss(1,3)           %初始浓度3，k为1
t = linspace(0,10,100);
y = sol(t);
plot(t,y)               %事实证明，双分子衰变在此模型中不具有稳态趋势，但收敛于0

function aSol = ss(k,A0)
syms a(t)
eqn = diff(a,t)==-2*k*a^2;          
initcond = [a(0)==A0];               %未知初始浓度条件设置为A0
aSol(t) = dsolve(eqn, initcond)
end
% COMPLETED BY PZW

