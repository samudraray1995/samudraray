% From: https://in.mathworks.com/help/matlab/ref/bvp4c.html?searchHighlight=bvp4c&s_tid=srchtitle_bvp4c_1
clc
clear all
global P M
P=1; % Pbar
M=1; % Mbar
n=100; % total no of data points
xmesh = linspace(0,1,n); % creation of mesh
solinit = bvpinit(xmesh, @guess2);%Form initial guess for boundary value problem solver, guess2 is the initial guess function
sol = bvp4c(@bvpfcn2, @bcfcn2, solinit);%bvp4c: Solve boundary value problem — fourth-order method

%bvpfcn2: the second order differential equation is expressed as two first
%order differential equation
%bcfcn2: the boundary condition defining function


phi1=sol.y(1,:); % the angle phi in radians


del=1/(n-1);  % the non-dimensional (with respect to length) distance between two consecutive nodes


s=0:1/(n-1):1; % discretizing along the beam of non-dimensional length 1
x2 = cumtrapz(s,cos(phi1)); % numerical integration to obtain x coordinate
y2=-cumtrapz(s,sin(phi1));  % numerical integration to obtain w coordinate (of paper)

plot(x2,y2)% the deflected profile of the beam is plotted herein

%%%%%%%%%% To write the data into the file100.txt%%%%%%%%%%%%%
% MM=zeros(n,2);
% MM(:,1)=x2;
% MM(:,2)=y2;
% dlmwrite('file100.txt',MM) 