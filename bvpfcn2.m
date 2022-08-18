function dydx = bvpfcn2(x,y) % equation to solve
global P
dydx = zeros(2,1);
dydx = [y(2)
       -P*cos(y(1))];
end