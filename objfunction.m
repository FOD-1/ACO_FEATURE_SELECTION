function fit = objfunction(X,y,feat,numFolds)


cost = knn_classifier( X(:,feat) ,y, numFolds);

% fit = -log(cost);
fit = 1-cost;