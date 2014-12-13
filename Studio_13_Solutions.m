% Studio 13, functional code. D, n0, and l are the constants in the pde
% x and t are positions and times at which to have values
% For the values in part 2, do the following
% x = 0:.01:1
% t = linspace(0,1,11)
% Studio13PDE1(.1, 1, 1, x, t)
% Total dye is a constant (barring numerical error), which makes sense
% because we only added dye once
function res = Studio_13_Solutions(D, n0, l, x, t)
m = 0; 
k = D;
n0 = n0;
for i=x
    disp([i,pde1ic(i)])
end

sol = pdepe(m,@pde1pde,@pde1ic,@pde1bc,x,t);
% Extract the first solution component as u.
res = sol(:,:,1);
disp res
% A solution profile.
figure
for i = 1:length(t)
    hold on;
    concentration = res(i,:);
    plot(x,concentration)
end
title('Solutions for all t')
xlabel('Distance x')
ylabel('u(x,:)')
total_dye = sum(res, 2)*max(x)/length(x)
figure
plot(t, total_dye)
axis([0,max(t),0,n0*max(x)/5])
title('Total Dye for all t')
xlabel('Time t')
ylabel('Total Dye')
% --------------------------------------------------------------
function [c,f,s] = pde1pde(x,t,u,DuDx)
c = 1/k;
f = DuDx;
s = 0;
end
% --------------------------------------------------------------
function u0 = pde1ic(x)
if ((x<.55*l) && (x>.45*l)) 
u0 = n0;
else
    u0 = 0;
end
end
     
% --------------------------------------------------------------
function [pl,ql,pr,qr] = pde1bc(xl,ul,xr,ur,t)
pl = 0; %p is coefficient of the concentration
ql = 1; %q coefficient of the flux
pr = 0; %l is the left side, r is the right side.
qr = 1;
end
end
