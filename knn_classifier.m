function cost = knn_classifier(X, y, numFolds)

% mdl = fitcknn(X, y, "NumNeighbors",1);
mdl = fitcsvm( X, y);
cvmdl = crossval(mdl,'KFold',numFolds);
yFit = kfoldPredict(cvmdl);
% confusionchart(yFit,y');
val = confusionmat(yFit,y');%shg
TP = val(1,1);
TN = val(2,2);
FP = val(2,1);
FN = val(1,2);
cost = (TP+TN)/(TP+TN+FP+FN);