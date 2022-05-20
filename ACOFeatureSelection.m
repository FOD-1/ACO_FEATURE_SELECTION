function [sfeatindex , sfeat, fitness] = ACOFeatureSelection(X,y,dim,n_ant,...
    n_feat,bestFit,tau, alpha,eta, beta, rho,numFolds) 

fit = zeros(1,n_ant);

iter = 1;
while (1)
    iter = iter +1;
%     feat = zeros(n_ant,n_feat);
    featindex = CreateRoute(dim, n_ant, n_feat, tau, alpha, eta,beta);
    for i = 1: n_ant
        fit(i) = objfunction(X,y,featindex,numFolds);
        if fit(i) < bestFit
           bestfeat = featindex(i,:);
           bestFit = fit(i);
        end
    end
    tour = bestfeat;
    tour = [tour(1:end),tour(1)];
    tau = pheromoneUpdate(tour,rho,tau, bestFit);
    fprintf('\nIteration = %d BestFitness = %f', iter, bestFit);
end % while

sfeatindex = unique(bestfeat);
sfeat = X(:, sfeatindex);

end
