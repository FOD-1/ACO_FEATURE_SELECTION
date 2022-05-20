function featindex = CreateRoute(dim, n_ant, n_feat, tau, alpha, eta,beta)

featx = zeros(n_ant,n_feat);
for ant = 1: n_ant
    featx(ant,1) = randi([1, dim]);
    pathx = [];
    for step = 2:n_feat
        pathx = [pathx(1:end), featx(ant,step-1)];
        prob = probability(path, tau,alpha, eta, beta);
%         p = tau(pathx(end),:).^alpha .*eta(pathx(end),:).^beta;
%         p(pathx) = 0;
%         prob = p./sum(p(:));
        route = rouletteSelection(prob);
        featindex(ant,step-1) = route;
    end%for
end %for

end %function