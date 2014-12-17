%Defines all variables and calls pdepe_cooties
function result = pdepe_cooties_runner()
% Defining contstants
infection_rate = .8;
diffusion_rate = .2;
recovery_rate = 0;
x = 0:1:25;    % Position in meters
t = 0:1:120;    % Time in minutes - first hour of party

[H, I, R] = pdepe_cooties(@find_initial_u, infection_rate, diffusion_rate, recovery_rate, x, t)

    function [u_healthy, u_infected, u_recovered] = find_initial_u(x)
        u_healthy = .7;
        u_infected = .1;
        u_recovered = 0;
    end

% PLOT THREE DIFFERENT SETS OF LINES
% clf;
% for i = 1:length(t)
%     hold on;
%     concentrationH = H(i,:);
%     plot(x,concentrationH,'--b')
% end
% for i = 1:length(t)
%     hold on;
%     concentrationI = I(i,:);
%     plot(x,concentrationI,'-g')
% end
% for i = 1:length(t)
%     hold on;
%     concentrationR = R(i,:);
%     plot(x,concentrationR,'-k')
% end
% 
% xlabel('Distance (m))');
% ylabel('Concentration of People');

surf(x,t,H)
xlabel('Distance (m)');
ylabel('Time (minutes)');
colorbar;

% MAKES A WEIRD SURF PLOT I DON'T UNDERSTAND
% surf(u);
% xlabel('Distance m');
% ylabel('Time in minutes');
% zlabel('Concentration of People');
% colorbar;

end