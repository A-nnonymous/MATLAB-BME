% P35 Exercise 2.1.9  

syms k a(t) A0
eqn = diff(a,t)==-2*k*a^2;           %微分方程建模
initcond = [a(0)==A0];               %未知初始浓度条件设置为A0
aSol(t) = dsolve(eqn, initcond)      %至此，浓度-时间曲线方程解毕


% COMPLETED BY PZW