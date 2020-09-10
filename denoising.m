%% Implémentation de l'algorithme de Metropolis-Hastings
clear all; close all; 

%% Paramètres
image_name = 'c250-220.png';
%image_name = 'c620-545.png'; 
%image_name = 'felix.png'; 

p = 0.1;  % probabilité de bruitage

beta = 1; % inverse de la "température"

T = 3000000;  % nombre d'itérations

%% Débruitage 

I = imread(image_name);   % lecture de l'image
I = im2bw(I);             % transformation de l'image en image binaire 2D
I = double(I);            % transformation de la mat uint8 en double

figure
imshow(I)
title('Image originale')

I_noisy = noise_generator(I, p);
figure
imshow(I_noisy)
title('Image bruitée')

J = 1;       % constante de couplage

[m,n] = size(I_noisy); % taille de l'image

I_noisy = model_conversion(I_noisy, 'ising');
I = model_conversion(I, 'ising');

c(1) = corr2(I_noisy,I); % vecteur de coeff de corrélation
s(1) = ssim(I_noisy,I);  % vecteur de SSIM

for t=1:T
    
    i = randsample(m,1); % selection d'un pixel
    j = randsample(n,1);  
    
    alpha = min(1, (p/(1-p)) * exp(-2*beta*I_noisy(i,j)*J*sum(eight_neighbors(i,j,I_noisy))) );
    
    u = rand;
    if u < alpha
        I_noisy(i,j) = -I_noisy(i,j); % changement du pixel 
    end
    
    % calcul des coefficients toutes les 100000è itérations
    if rem(t,100000) == 0
        c(t/100000+1) = corr2(I_noisy,I);
        s(t/100000+1) = ssim(I_noisy,I);
    end
end

I_noisy = model_conversion(I_noisy, 'rgb');
I = model_conversion(I, 'rgb');

figure
imshow(I_noisy)
title(strcat('Image débruitée (\beta=', num2str(beta),')'));

figure
plot(c)
hold on
plot(s)
legend('corrélation','SSIM')
xlabel('Nombre itérations/10^5')
ylabel('Valeur des coefficients')
title(strcat('Évolution de la corrélation et du SSIM (\beta = ', num2str(beta),')'))
