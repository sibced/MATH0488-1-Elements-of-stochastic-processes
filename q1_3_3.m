% Script de la question 1.3.3
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

figure
plot(magn_m); title('Évolution de la magnétisation moyenne')
xlabel('Instant t')