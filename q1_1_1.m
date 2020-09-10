% Script de la question 1.1.1
close all; clear all;

% matrice transition
Q = [0 0.1 0.1 0.8;1 0 0 0;0.6 0 0.1 0.3;0.4 0.1 0.5 0];

% distrib. initiales
state_0_a = [1/4,1/4,1/4,1/4];
state_0_b = [0,0,1,0];

P_a = zeros(30,4); % distributions
P_b = zeros(30,4); 
T = 1:1:30; % temps

P_a(1,:) = state_0_a;
for i = 2 : 30 
    P_a(i,:) = P_a(i-1,:)*Q; 
end

P_b(1,:) = state_0_b;
for i = 2 : 30 
    P_b(i,:) = P_b(i-1,:)*Q; 
end

figure
hold on
plot(T,P_a(:,1));
plot(T,P_a(:,2));
plot(T,P_a(:,3));
plot(T,P_a(:,4));
xlabel('Instant t');title('Évolution de P(X_t) avec distribution initiale uniforme discrète')
ylabel('Distribution de probabilité P(X_t)');

figure
hold on
plot(T,P_b(:,1));
plot(T,P_b(:,2));
plot(T,P_b(:,3));
plot(T,P_b(:,4));
xlabel('Instant t');title('Évolution de P(X_t) avec distribution initiale déterministe \delta_{x3}')
ylabel('Distribution de probabilité P(X_t)');
