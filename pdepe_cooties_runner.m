%Defines all variables and calls pdepe_cooties
function result = pdepe_cooties_runner()
% Defining contstants

rRate = 0:.01:.25;
rResult = zeros(1,length(rRate));

iRate = 0:.005:.15;
iResult = zeros(1,length(iRate));

dRate = 0:.05:3;
dResult = zeros(1,length(dRate));
infection_rate = .01;
diffusion_rate = .5;
recovery_rate = .05;
x = 0:1:25;    % Position in meters
t = 0:5:240;    % Time in minutes - first hour of party
for i = 1: length(dRate)
    [H, I, R] = pdepe_cooties(@find_initial_u, infection_rate, dRate(i), recovery_rate, x, t);
    dResult(i) = mean(I(:,end));
end

plot(dRate, dResult, 'LineWidth',3);
xlabel('Diffusion Rate');
ylabel('Average Density of Infected People');
title('Spread based on Diffusion Rate');
%[H, I, R] = pdepe_cooties(@find_initial_u, infection_rate, diffusion_rate, recovery_rate, x, t);

    function [u_healthy, u_infected, u_recovered] = find_initial_u(x)
        u_healthy = .1;
        u_infected = .7;
        u_recovered = 0;
    end
% clf;
% surface(x,t,I)
% xlabel('Location (meters)');
% ylabel('Time (minutes)');
% title('Recovery Rate = .05');
% colorbar;

end