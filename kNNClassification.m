%ENGS 89
%Group 19
%3/1/2015

%load the training examples and their labels
Xtrain = load('Xtrain');
Ytrain = load('Ytrain');

Xtrain = Xtrain.X_dye;
Ytrain = Ytrain.Y_dye;

%indices with bilirubin/dye concentration <= 5

[row,col,~] = find(Ytrain<5);
%divide the observation into two classes: 1 if conc >=5, -1 else
Ytrain(:,:)= 1;
Ytrain(row,col) = -1;

%bByG = Xtrain(:,3)./Xtrain(:,2)
bByG = Xtrain;
%kNN classification
mdl = fitcknn(Xtrain(1:36,:),Ytrain(1:36,:),'NumNeighbors',12);%,'DistanceWeight','inverse','CrossVal','on','Prior','emperical');

% fraction of misclassifications from the prediction of test set
rloss = resubLoss(mdl)

%Construct a cross-validated classifier from the model
%cvmdl = crossval(mdl);
cv_error(1,1) = kfoldLoss(crossval(mdl));

% for i = 2:40
%    cvmdl = crossval(mdl,'kfold',i);
%     cross validation loss
%     kloss = kfoldLoss(cvmdl)
%    cv_error(1,i) = kfoldLoss(cvmdl);
% end

predictedY = predict(mdl,1.2*bByG(37:78,:));
notEqual_index = find(predictedY ~= Ytrain(37:78,:));
misclassificationRate = length(notEqual_index)/length(predictedY)

[x,y] = meshgrid(0:5:250,0:5:250);
x = x(:);
y = y(:);
predicted_grid_Y = predict(mdl,Xtrain(1:10,:));
gscatter([],predicted_grid_Y,'rgbcmk','osd*+x')
%testX = mean(X_dye);
%predict(mdl,X_dye)


%discriminant analysis
% gscatter(X_dye(:,3),X_dye(:,1), Y_dye,'rgbcmyk','osd*+x');
% xlabel('red');
% ylabel('blue');
% N = size(meas,1);

% [x,y] = meshgrid(0:5:250,0:5:250);
% x = x(:);
% y = y(:);
% bByG = Xtrain(:,3)./Xtrain(:,2);
% 
% r_col = Xtrain(1:36,1);
% g_col = Xtrain(1:36,2);
% b_col = Xtrain(1:36,3);
% 
% 
% jLDA = classify([x y],[Xtrain(:,1),Xtrain(:,3)],Ytrain);
% gscatter(x,y,jLDA,'rgbcmk','osd*+x')
% 
% xlabel('red channel intensity');
% ylabel('blue channel intensity');
% 
% ldaClass = classify(b_col./g_col,g_col,Ytrain(1:36,:));
% [~,misclassify_idx] = find(ldaClass ~= Ytrain(1:36,:));
% ldaResubErr = length(misclassify_idx) / 36;
% 
% 
% qdaClass = classify(b_col./g_col,g_col,Ytrain(1:36,:),'quadratic');
% [~,misclassify_idx] = find(qdaClass ~= Ytrain(1:36,:));
% qdaResubErr = length(misclassify_idx) / 36;


