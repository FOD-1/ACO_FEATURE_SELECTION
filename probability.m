function prob = probability(path, tau,alpha, eta, beta)

p = tau(path(end),:).^alpha .*eta(path(end),:).^beta;
p(path) = 0;
prob = p./sum(p(:));

end