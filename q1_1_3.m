% Script de la question 1.1.3
close all; clear all;

% matrice transition
Q = [0 0.1 0.1 0.8;1 0 0 0;0.6 0 0.1 0.3;0.4 0.1 0.5 0];

t = 3000000;
Q_t = Q^t;

% on établi les graduations de l'échelle
disp('Distribution stationnaire : ')
Q_t(1,:)
first = Q_t(1,1);   
second = Q_t(1,1) + Q_t(1,2); 
third = Q_t(1,1) + Q_t(1,2) + Q_t(1,3);   
forth = Q_t(1,1) + Q_t(1,2) + Q_t(1,3) + Q_t(1,4);

% on place dans R la suite d'états générés selon la distrib. stat.
T = t; 
for i=1 : T
    x = rand;
    if x < first
        R(i) = 1;
    elseif x < second
        R(i) = 2;
    elseif x < third
        R(i) = 3;
    elseif x < forth
        R(i) = 4;
    end
end

% fréquences d'apparition des états
freq_1 = length(find(R==1))/T;
freq_2 = length(find(R==2))/T;
freq_3 = length(find(R==3))/T;
freq_4 = length(find(R==4))/T;
disp('fréquences d''apparition des etats')
freq = [ freq_1, freq_2, freq_3, freq_4 ]

histogram(R); 
xlabel('x'); title('Distribution en t = T')
yt = get(gca, 'YTick');                    
set(gca, 'YTick',yt, 'YTickLabel',yt*(1/T));