function [coord] = simu(t,tlas,a,alas,b,blas)%a for alpha b for beta
and t for theta
for tim=0:10
t=t+(tlas-t)*(tim/10);
a=a+(alas-a)*(tim/10);
b=blas+(blas-b)*(tim/10);
endpos=[0 15 0 1]';
mat10=[cos(t) -sin(t) 0 0;%matxy means transformation matrix of x
wrt to y coordinate system.
sin(t) cos(t) 0 0;
0 0 1 0;
0 0 0 1];
mat21=[1 0 0 0;
0 1 0 0;
0 0 1 5;
0 0 0 1];
mat32=[1 0 0 0;
0 cos(a) -sin(a) 0;
0 sin(a) cos(a) 0;
0 0 0 1];
mat43=[1 0 0 0;
0 1 0 15;
0 0 1 0;
0 0 0 1];
mat54=[1 0 0 0;
0 cos(b) sin(b) 0;
0 -sin(b) cos(b) 0;
0 0 0 1];
coord=mat10*mat21*mat32*mat43*mat54*endpos;
xend=coord(1);%xend=[xend,0,0,0];
yend=coord(2);%yend=[yend,0,0,0];
zend=coord(3);%zend=[zend,0,0,0];
%sldr=[0,0,5];
crdel=mat10*mat21*mat32*mat43*[0,0,0,1]';
xel=crdel(1);
yel=crdel(2);
zel=crdel(3);
plot3([0,0,xel,xend],[0,0,yel,yend],
[0,5,zel,zend],'o-','LineWidth',1.5);
grid on;
axis([-35 35 -35 35 -40 40]);
pause(0.5)
end
end
