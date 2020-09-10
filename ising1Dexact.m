% Fonction qui calcule les probabilités exactes de tous les états
% d'un système de Ising à une seule dimension

% Arguments:
%   - N, le nombre de particules
%   - beta, la constante exprimant l'inverse de la température
%   - J, la constante de couplage
%   - H, la force du champs extérieur

% Valeurs renvoyées:
%   - seq: un tableau avec tous les états possibles (2^N)
%   - proba: un vecteur avec la probabilité exacte de tous les états
%   - avgmagn: la magnétisation moyenne
%   - Z: la fonction de partition

function [seq,proba,avgmagn,Z] = ising1Dexact(N,beta,J,H)
  
  seq = (dec2bin(0:2^N-1)-'0')*2-1;
  proba = zeros(size(seq,1),1);
  
  avgmagn = 0;
  avgenergy = 0;
  
  for i = 1:size(seq,1)
    Energy = -J*sum(seq(i,:).*circshift(seq(i,:),[0,1]))-H*sum(seq(i,:));
    proba(i) = exp(-beta*Energy);
    avgmagn = avgmagn + mean(seq(i,:)) * proba(i);
  end
  
  Z = sum(proba);
  avgmagn = avgmagn/Z;
  proba = proba/Z;
