% Cette fonction prend en entrée une image binaire, passe sur chaque pixel 
% de cette image et change ce pixel de noir à blanc ou de blanc à noir avec
% une probabilité p fournie en entrée.
% 
% Arguments:
%    image
%        image binaire à bruiter
%    p
%        probabilité avec laquelle on change la couleur du pixel
% 
%  Sortie:
%    noisy_image
%        image binaire bruitée
 

function noisy_image = noise_generator(image, p)

 noisy_image = image;
 [m,n] = size(noisy_image);
 for i=1:m
     for j=1:n
             u = rand;  % nombre aléatoire entre 0 et 1
             if u < p   % si u < p, couleur du pixel considéré est changée
                 if noisy_image(i,j,:) == 0
                     noisy_image(i,j,:) = 255; % pixel noir devient blanc
                 else
                     noisy_image(i,j,:) = 0; % pixel blanc devient noir
                 end
             end
     end
 end
end