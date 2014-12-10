% iteration2
% Four year period, but people graduate
% Meg McCauley and Meghan Tighe
% Linearity 2 - Decemeber 10, 2014

T = 4;  % Time period in years

% Stocks
ma_boys = zeros(T,1);
ma_boys(1) = 60;        % set the intital number of ma_boys
healthy = zeros(T,1);
healthy(1) = 290;       % set the intital number of healthy
infected = zeros(T,1);
infected(1) = 0;        % set the intital number of infected

incoming_ma_boys = 15;
incoming_healthy = 70;

for t = 2 : T
    f = 2*ma_boys(t-1);  % function of newly infected each year
    ma_boys(t) = ma_boys(t-1) + incoming_ma_boys;
    infected(t) = infected(t-1) + f;
    healthy(t) = healthy(t-1) - f + incoming_healthy;
end

hold on;
plot(ma_boys + infected, '*-r');
plot(healthy,'*-b');
legend('Infected', 'Healthy');
xlabel('Years');
ylabel('Peeps');
title('Iteration 1');
