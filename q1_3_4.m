% Script de la question 1.3.4 
close all; clear all;

N=10;
J=1;
H=3;
beta=0.2;

s = rand(1,N);
for i=1:10
    if s(i) < 0.5
        s(i) = -1;
    else
        s(i) = 1;
    end
end

%x(1,:) = s;
magn(1) = sum(s)/N;  %magnétisation
T=10000;
magn_m = magn(1);    %magnétisation moyenne
mean_m = zeros(1,T); %moyenne des magnétisations moyennes
for n =1:100
for t = 2:T
    i = randsample(N,1);
     if i == 1
         alpha = min(1, exp( -2*beta*s(1)*(J*(s(N)+s(2) ) + H) ) );
     elseif i == N
         alpha = min(1, exp( -2*beta*s(N)*(J*(s(N-1)+s(1) ) + H) ) );
     else
         alpha = min(1, exp( -2*beta*s(i)*(J*(s(i-1)+s(i+1) ) + H) ) );
     end
     
    u = rand; %nombre généré uniformément entre 0 et 1
    if u < alpha
        s(i) = -s(i);
        %x(t,:) = s;    %on accepte le nouvel état  
    else
        %x(t,:) = x(t-1,:);  %on rejette le nouvel état, on recopie l'ancien
    end
    magn(t) = magn(t-1) + sum(s)/N; %magnétisation
    magn_m(t) = magn(t)/t; %magnétisation moyenne
end
    mean_m = mean_m + magn_m;
end
mean_m = mean_m/100;    %moyenne des magnétisations moyennes

figure
plot(mean_m); title('Moyenne des magnétisations moyennes')
xlabel('Instant t')
ylim([0.65 0.7])
prc5 = prctile(mean_m, 5)
prc95 = prctile(mean_m, 95)
yline(prc5, '-.b', '5ème centile');
yline(prc95, '-.r', '95ème centile');