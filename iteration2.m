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
total = zeros(T,1);

incoming_ma_boys = 15;
incoming_healthy = 70;


for t = 2 : T
    f = 2*ma_boys(t-1);  % function of newly infected each year
    
    % Graduating 1/4 of each stock
    grad_ma_boys = 1/4*ma_boys(t-1);
    grad_infect = 1/4*infected(t-1);
    grad_health = 1/4*healthy(t-1);
    
    % Updating numbers after graduation
    ma_boys(t) = ma_boys(t-1) - grad_ma_boys;
    infected(t) = infected(t-1) - grad_infect;
    healthy(t) = healthy(t-1) - grad_health;
    
    ma_boys(t) = ma_boys(t) + incoming_ma_boys;
    infected(t) = infected(t) + f;
    healthy(t) = healthy(t) - f + incoming_healthy;
    total = ma_boys + healthy + infected;
end

clf;
hold on;
plot(ma_boys, '*-k');
plot(infected, '*-r');
plot(healthy,'*-b');
plot(ma_boys + infected + healthy, '*-g')
legend('MA Boys','Infected', 'Healthy', 'Total');
xlabel('Years');
ylabel('Peeps');
title('Iteration 2');
