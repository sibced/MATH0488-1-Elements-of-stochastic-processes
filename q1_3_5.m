% Script de la question 1.3.5
close all; clear all;

N=10;
J=1;
beta1=0.2;

s = rand(1,N);
for i=1:10
    if s(i) < 0.5
        s(i) = -1;
    else
        s(i) = 1;
    end
end

x(1,:) = s;
magn(1) = sum(s)/N;
magn_m = magn(1);
magn_m1 = zeros(1,40);
T=10000;
for H =-20:20
    for t = 2:T
        i = randsample(N,1); %sélection d'une particule aléatoirement avec une probabilité uniforme q = 1/N
         if i == 1
             alpha = min(1, exp( -2*beta1*s(1)*(J*(s(N)+s(2) ) + H) ) );
         elseif i == N
             alpha = min(1, exp( -2*beta1*s(N)*(J*(s(N-1)+s(1) ) + H) ) );
         else
             alpha = min(1, exp( -2*beta1*s(i)*(J*(s(i-1)+s(i+1) ) + H) ) );
         end
        u = rand; %nombre généré uniformément entre 0 et 1
        if u < alpha
            s(i) = -s(i);
            x(t,:) = s;    %on accepte le nouvel état  
        else
            x(t,:) = x(t-1,:);  %on rejette le nouvel état, on recopie l'ancien
        end
        magn(t) = magn(t-1) + sum(s)/N; %magnétisation
        magn_m(t) = magn(t)/t; %magnétisation moyenne
    end
magn_m1(H+21) = magn_m(T);   %on prend la magnétisation moyenne pour t=10000
end
h = -20:1:20;
figure
plot(h,magn_m1); title('Évolution de la magnétisation moyenne en fonction de H (\beta=0.2)')
xlabel('H')
hold on

for i=1:41
    [~,~,exact_magn1(i),~] = ising1Dexact(N,beta1,J,h(i) );
end
plot(h, exact_magn1);
legend('estimation en t=10000','ising1DExact')
diff1 = abs(magn_m1 - exact_magn1);
accuracy1 = max(diff1)



beta2=0.02;
magn_m2 = zeros(1,40);

for H =-20:20
    for t = 2:T
        i = randsample(N,1); %sélection d'une particule aléatoirement avec une probabilité uniforme q = 1/N
         if i == 1
             alpha = min(1, exp( -2*beta2*s(1)*(J*(s(N)+s(2) ) + H) ) );
         elseif i == N
             alpha = min(1, exp( -2*beta2*s(N)*(J*(s(N-1)+s(1) ) + H) ) );
         else
             alpha = min(1, exp( -2*beta2*s(i)*(J*(s(i-1)+s(i+1) ) + H) ) );
         end
        u = rand; %nombre généré uniformément entre 0 et 1
        if u < alpha
            s(i) = -s(i);
            x(t,:) = s;    %on accepte le nouvel état  
        else
            x(t,:) = x(t-1,:);  %on rejette le nouvel état, on recopie l'ancien
        end
        magn(t) = magn(t-1) + sum(s)/N; %magnétisation
        magn_m(t) = magn(t)/t; %magnétisation moyenne
    end
magn_m2(H+21) = magn_m(T);
end
h = -20:1:20;
figure
plot(h,magn_m2); title('Évolution de la magnétisation moyenne en fonction de H (\beta=0.02)')
xlabel('H')
hold on

for i=1:41
    [~,~,exact_magn2(i),~] = ising1Dexact(N,beta2,J,h(i) );
end
plot(h, exact_magn2);
legend('estimation en t=10000','ising1DExact')
diff2 = abs(magn_m2 - exact_magn2);
accuracy2 = max(diff2)