%Defines all variables and calls pdepe_cooties
function result = pdepe_cooties_runner()
% Defining contstants
infection_rate = .1;
diffusion_rate = .5;
recovery_rate = .01;
x = 0:1:25;    % Position in meters
t = 0:15:360;    % Time in minutes - first hour of party

[H, I, R] = pdepe_cooties(@find_initial_u, infection_rate, diffusion_rate, recovery_rate, x, t);

    function [u_healthy, u_infected, u_recovered] = find_initial_u(x)
        u_healthy = .1;
        u_infected = .7;
        u_recovered = 0;
    end
clf;
surface(x,t,I)
xlabel('Distance (m)');
ylabel('Time (minutes)');
colorbar;

end