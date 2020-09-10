% Cette fonction prend en entrée une image binaire et convertit cette image
% selon le modèle spécifié en entrée.
% Arguments:
%   image
%        image binaire
%   model
%        modèle selon lequel on modifie l'image:
%        model = 'ising' => pixels blancs valent -1,pixels noirs valent 1
%        model = 'rgb' => pixels blancs valent 0, pixels noirs valent 255


function image = model_conversion(image, model)

[m,n] = size(image);

if length(model) == 5   % model = 'ising'
    for i=1:m
        for j=1:n
            if image(i,j) == 255
                image(i,j) = 1;
            end
            if image(i,j) == 0
                image(i,j) = -1;
            end
        end
    end
else                    % model = 'rgb'
    for i=1:m
        for j=1:n
            if image(i,j) == 1
                image(i,j) = 255;
            else
                image(i,j) = 0;
            end
        end
    end
end
end