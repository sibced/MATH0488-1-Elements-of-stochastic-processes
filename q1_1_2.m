% Script de la question 1.1.2
close all; clear all;

% matrice transition
Q = [0 0.1 0.1 0.8;1 0 0 0;0.6 0 0.1 0.3;0.4 0.1 0.5 0];

% distribution stationnaire de 2 manières : 

    % 30è puissance de Q
    t = 30;
    Q_t = Q^t; 
    disp('Distribution stationnaire 1')
    distrib1 = Q_t(4,:)

    % vecteur propre a gauche de Q associé à valeur propre unitaire
    [~, eigen_values, left_eigen_vectors] = eig(Q);
    disp('Valeur propre unitaire') 
    valPropre = eigen_values(1,1)
    disp('Distribution stationnaire 2')
    distrib2 = left_eigen_vectors(:,1).'/sum(left_eigen_vectors(:,1)) %normalisation