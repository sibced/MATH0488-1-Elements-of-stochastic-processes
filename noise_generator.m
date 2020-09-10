% Cette fonction prend en entr�e une image binaire, passe sur chaque pixel 
% de cette image et change ce pixel de noir � blanc ou de blanc � noir avec
% une probabilit� p fournie en entr�e.
% 
% Arguments:
%    image
%        image binaire � bruiter
%    p
%        probabilit� avec laquelle on change la couleur du pixel
% 
%  Sortie:
%    noisy_image
%        image binaire bruit�e
 

function noisy_image = noise_generator(image, p)

 noisy_image = image;
 [m,n] = size(noisy_image);
 for i=1:m
     for j=1:n
             u = rand;  % nombre al�atoire entre 0 et 1
             if u < p   % si u < p, couleur du pixel consid�r� est chang�e
                 if noisy_image(i,j,:) == 0
                     noisy_image(i,j,:) = 255; % pixel noir devient blanc
                 else
                     noisy_image(i,j,:) = 0; % pixel blanc devient noir
                 end
             end
     end
 end
end