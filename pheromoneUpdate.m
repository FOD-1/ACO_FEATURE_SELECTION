function tau = pheromoneUpdate(tour,rho,tau, bestFit)

for step = 1:length(tour)-1
    startloc = tour(step);
    stoploc = tour(step+1);
    Dtau = 1/bestFit;
    tau(startloc,stoploc) = (1-rho)*tau(startloc,stoploc)+ Dtau;
end