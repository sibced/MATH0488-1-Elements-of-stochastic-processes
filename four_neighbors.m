% Cette fonction prend en entrée une image binaire et les coordonnées d'un
% de ses pixels
% Arguments:
%   image
%        image binaire
%   i, j 
%        coordonnées du pixel 
%
% Sortie:
%   v
%        un vecteur contenant les valeurs des pixels voisins
%        MAXIMUM 4 VOISINS
%


function v = four_neighbors(i,j,image)
[m,n] = size(image);
    if i == 1 && j==1
        v= [image(i+1,j) image(i,j+1)];
    elseif i == 1 && j==n
        v = [image(i+1,j) image(i,j-1)];
    elseif i == m && j==1
        v = [image(i-1,j) image(i,j+1)];
    elseif i == m && j==n
        v = [image(i-1,j) image(i,j-1)];
    elseif i == 1
        v = [image(i,j-1) image(i,j+1) image(i+1,j)];
    elseif i == m
        v = [image(i-1,j) image(i,j+1) image(i,j-1)];
    elseif j == 1
        v = [image(i+1,j) image(i-1,j) image(i,j+1)];
    elseif j == n
        v = [image(i-1,j) image(i+1,j) image(i,j-1)];
    else
        v = [image(i-1,j) image(i+1,j) image(i,j+1) image(i,j-1)];
    end
end
