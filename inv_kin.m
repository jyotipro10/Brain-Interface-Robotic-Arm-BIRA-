function [t,alp,beta] = invkin(x,y,z)
t=atan(-x/y);
lambda=y/cos(t);
syms a b;
eq1=15*cos(a)+15*cos(a-b)==lambda;
eq2=15*sin(a)+15*sin(a-b)==z-5;
eq3=0<=b;
eq4=b<(2*pi)/3;
eq5=0<=a;
eq6=a<(2*pi)/3;
[alp,beta]=solve(eq1,eq2,eq3,eq4,eq5,eq6,a,b);
alp=vpa(alp);
beta=vpa(beta);
end
