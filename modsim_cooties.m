T = 0:240; %time in minutes

%set rate variables
infection_rate = .01;
recovery_rate = .05;

%vectors for healthy, infected and recovered
H = zeros(1,length(T));
I = zeros(1,length(T));
R = zeros(1,length(T));

%initial numbers for healthy, infected and recovered
H(1) = 50;
I(1) = 50;
R(1) = 0;

for i = 2: T(end)
    newly_infected = infection_rate * H(i-1) * I(i-1);
    newly_recovered = recovery_rate * I(i-1);
    H(i) = H(i-1) - newly_infected;
    I(i) = I(i-1) + newly_infected - newly_recovered;
    R(i) = R(i-1) + newly_recovered;
end

hold on;
plot(T, H, 'k','LineWidth',3);
plot(T, I, 'r','LineWidth',3);
plot(T, R, 'g','LineWidth',3);
legend('Healthy', 'Infected', 'Recovered');
xlabel('Time (minutes)');
ylabel('People');
title('Cootie Spread by Difference Equations');

