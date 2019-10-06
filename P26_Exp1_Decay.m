% P26 Example I: Decay
%% 要求①da(t)/dt，求解过程实现
%      ②不同k下曲线对比，为什么叫decay rate

%%
%①：题目意思存在模糊，暂且理解为求解该方程下a(t)函数与da(t)/dt函数：
syms k a(t) A0
eqn = diff(a,t) == -k*a;
InitCond = [a(0)==A0];               %未知初始浓度条件设置为A0
aSol(t) = dsolve(eqn, InitCond)
adtSol(t) = diff(aSol(t), t)        %至此，该方程下a(t)函数与da(t)/dt函数已解出，分别存至aSol和adtSol两个符号函数中

%%
%②:默认对比不同k下的a(t)曲线
at1 = Decay(1)
at2 = Decay(3)
at3 = Decay(9)
t=linspace(0,10,100);
y1 = at1(t);
y2 = at2(t);
y3 = at3(t);
plot(t,y1,t,y2,t,y3)
legend('k=1','k=3','k=9')
function aSol = Decay(k)       %封装函数以便多次复用
syms a(t) 
eqn = diff(a,t) == -k*a;
initcond = [a(0)==1];               %未给出初始浓度条件，为了作图不妨设置为1
aSol(t) = dsolve(eqn, initcond);
adtSol(t) = diff(aSol(t), t) ;
end


% COMPLETED BY PZW