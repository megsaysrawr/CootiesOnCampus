%Defines all variables and calls pdepe_cooties
function res = pdepe_cooties_runner()
% Defining contstants
infection_rate = .11;
diffusion_rate = .2;
recovery_rate = .01;
x = 0:.01:25;    % Position in meters
t = 0:.1:60;    % Time in minutes - first hour of party

pdepe_cooties(@find_initial_u, infection_rate, diffusion_rate, recovery_rate, x, t);

    function [u_healthy, u_infected, u_recovered] = find_initial_u(x)
        u_healthy = .7;
        u_infected = .1;
        u_recovered = 0;
    end

end