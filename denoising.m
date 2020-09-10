%% Impl�mentation de l'algorithme de Metropolis-Hastings
clear all; close all; 

%% Param�tres
image_name = 'c250-220.png';
%image_name = 'c620-545.png'; 
%image_name = 'felix.png'; 

p = 0.1;  % probabilit� de bruitage

beta = 1; % inverse de la "temp�rature"

T = 3000000;  % nombre d'it�rations

%% D�bruitage 

I = imread(image_name);   % lecture de l'image
I = im2bw(I);             % transformation de l'image en image binaire 2D
I = double(I);            % transformation de la mat uint8 en double

figure
imshow(I)
title('Image originale')

I_noisy = noise_generator(I, p);
figure
imshow(I_noisy)
title('Image bruit�e')

J = 1;       % constante de couplage

[m,n] = size(I_noisy); % taille de l'image

I_noisy = model_conversion(I_noisy, 'ising');
I = model_conversion(I, 'ising');

c(1) = corr2(I_noisy,I); % vecteur de coeff de corr�lation
s(1) = ssim(I_noisy,I);  % vecteur de SSIM

for t=1:T
    
    i = randsample(m,1); % selection d'un pixel
    j = randsample(n,1);  
    
    alpha = min(1, (p/(1-p)) * exp(-2*beta*I_noisy(i,j)*J*sum(eight_neighbors(i,j,I_noisy))) );
    
    u = rand;
    if u < alpha
        I_noisy(i,j) = -I_noisy(i,j); % changement du pixel 
    end
    
    % calcul des coefficients toutes les 100000� it�rations
    if rem(t,100000) == 0
        c(t/100000+1) = corr2(I_noisy,I);
        s(t/100000+1) = ssim(I_noisy,I);
    end
end

I_noisy = model_conversion(I_noisy, 'rgb');
I = model_conversion(I, 'rgb');

figure
imshow(I_noisy)
title(strcat('Image d�bruit�e (\beta=', num2str(beta),')'));

figure
plot(c)
hold on
plot(s)
legend('corr�lation','SSIM')
xlabel('Nombre it�rations/10^5')
ylabel('Valeur des coefficients')
title(strcat('�volution de la corr�lation et du SSIM (\beta = ', num2str(beta),')'))
