% giving desired pos
% calling inv_kin to get the angles between the links
% applying f_kin to move to the final pos 
function [] = reach2pos(x,y,z)
[t,alp,beta]=inv_kin(x,y,z);
f_kin(0,t,0,alp,0,beta);
end
