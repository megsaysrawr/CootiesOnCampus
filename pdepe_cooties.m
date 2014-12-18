% Studio 13, functional code. D, n0, and l are the constants in the pde
% x and t are positions and times at which to have values
% For the values in part 2, do the following
% x = 0:.01:1
% t = linspace(0,1,11)
% Studio13PDE1(.1, 1, 1, x, t)
% Total dye is a constant (barring numerical error), which makes sense
% because we only added dye once
function [H, I, R] = pdepe_cooties(initial_u,infection_rate, diffusion_rate, recovery_rate, xmesh, tspan)
m = 0;  % structure of pde, m = 0, 1, or 2 (we always use 0)
% initial_H = initial_u(1);
% initial_I = initial_u(2);
% initial_R = initial_u(3);
D = diffusion_rate;
r = recovery_rate;
beta = infection_rate;
sol = pdepe(m,@pde_system,@pde1ic,@pde1bc,xmesh,tspan);
% Extract the first solution component as u.
H = sol(:,:,1);
I = sol(:,:,2);
R = sol(:,:,3);

% --------------------------------------------------------------
function [c,f,s] = pde_system(x,t,u,DuDx)
c = [1;1;1];
f = [D*DuDx(1);D*DuDx(2);D*DuDx(3)];
s = [- beta * u(1) * u(2); beta * u(1) * u(2)- (r * u(2)); r * u(2)];
end
% --------------------------------------------------------------
function u0 = pde1ic(x)
    i0 = x/25 * .8; % initial density of infected people
    h0 = .8 -i0;    % initial density of healthy people
    r0 = 0;         % initial density of recovered people
    
    u0 = [h0; i0; r0];
    
% if (x>20) 
%     u0 = [0;0;.8];
% else
%     u0 = [.8;0;0];
% end
end
     
% --------------------------------------------------------------
function [pl,ql,pr,qr] = pde1bc(xl,ul,xr,ur,t)
    %each vector includes H, I, R
pl = [0;0;0]; %p is coefficient of the concentration
ql = [1;1;1]; %q coefficient of the flux
pr = [0;0;0]; %l is the left side, r is the right side.
qr = [1;1;1];
end
end
