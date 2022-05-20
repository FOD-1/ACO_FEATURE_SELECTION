clear,clc;
load Healty_Endometrial.mat;
numFolds = 5;

n_ant = 10;
n_feat = 5;
maxiter = 200;
tau = 1;
eta = 1;
alpha = 1;
beta = 1;
rho = 0.5;

dim = size(X,2);
tau = tau*ones(dim,dim);
eta = eta*ones(dim,dim);

bestFit = inf;

[sfeatindex , sfeat, fitness] = ACOFeatureSelection(X,y,dim,n_ant,...
    n_feat,bestFit,tau, alpha,eta, beta, rho, numFolds);
plot(1:maxiter,bestFit)
xlabel('Number of Iteration');
ylabel('Fitness Value');
title('Feature Selection with ACO');
grid on;