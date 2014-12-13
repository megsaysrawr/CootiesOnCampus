% Studio 13, functional code. D, n0, and l are the constants in the pde
% x and t are positions and times at which to have values
% For the values in part 2, do the following
% x = 0:.01:1
% t = linspace(0,1,11)
% Studio13PDE1(.1, 1, 1, x, t)
% Total dye is a constant (barring numerical error), which makes sense
% because we only added dye once
function res = pdepe_cooties(initial_u,infection_rate, diffusion_rate, recovery_rate, x, t)
m = 0;  % structure of pde, m = 0, 1, or 2 (we always use 0)

sol = pdepe(m,@pde_system,@pde1ic,@pde1bc,x,t);
% Extract the first solution component as u.
res = sol(:,:,1);

% --------------------------------------------------------------
function [c,f,s] = pde_system(x,t,u,DuDx)
c = 1/k;    % ??
f = [dHdX,dIdX,dRdX];
%THIS IS WHERE WE STOPPED WITH JOSH
s = 0;  % ??
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
