function res = bcfcn2(ya,yb) % boundary conditions
global P M
res = [ya(1)
       yb(2)-M];
end