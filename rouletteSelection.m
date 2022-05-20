function route = rouletteSelection(prob)

c = cumsum(prob);
p = rand();

for i = 1: length(c)
    if c(i) > p
        route = i;
        break;
    end
end

end