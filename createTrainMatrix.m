%ENGS 89, Group 19
%This script makes a data matrix by combining various samples from 
%different experiments. The data corresponding to these experiments have
%been analyzed and saved as a .mat extension. 

%ENGS 89
%Group 19
%3/1/2015

%-------------------------------------------------------------------------
%load the data object storing average r,g,b values for phantoms with dye
%images taken on 2-14
averageRed_Dye = load('average_RedIntensity_Dye');
averageGreen_Dye = load('average_GreenIntensity_Dye');
averageBlue_Dye = load('average_BlueIntensity_Dye');

%load the actual matrix
averageRed_Dye = averageRed_Dye.average_RedIntensity;
averageGreen_Dye = averageGreen_Dye.average_GreenIntensity;
averageBlue_Dye = averageBlue_Dye.average_BlueIntensity;

%-------------------------------------------------------------------------
%load the data matrix of images taken on 2-20
averageRed_Dye_1to5 = load('average_RedIntensity_Dye_1to5');
averageGreen_Dye_1to5 = load('average_GreenIntensity_Dye_1to5');
averageBlue_Dye_1to5 = load('average_BlueIntensity_Dye_1to5');

%load the actual matrix
averageRed_Dye_1to5 = averageRed_Dye_1to5.average_RedIntensity;
averageGreen_Dye_1to5 = averageGreen_Dye_1to5.average_GreenIntensity;
averageBlue_Dye_1to5 = averageBlue_Dye_1to5.average_BlueIntensity;
%-------------------------------------------------------------------------

%reshape matrix to [1 x 36] row wise
red_Dye = reshape(averageRed_Dye',36,1); 
green_Dye = reshape(averageGreen_Dye',36,1); 
blue_Dye = reshape(averageBlue_Dye',36,1);

red_Dye_1to5  = reshape(averageRed_Dye_1to5',42,1); 
green_Dye_1to5 = reshape(averageGreen_Dye_1to5',42,1); 
blue_Dye_1to5  = reshape(averageBlue_Dye_1to5',42,1);

%dye concentration 
dye_con = repmat([0,2,4,6,8,10],6,1);
Y_dye = reshape(dye_con,36,1);

%dye concentration for 1to5
dye_con_2 = repmat([0,1,2,3,4,5,15],6,1);
Y_dye(37:36+42,:) = reshape(dye_con_2,42,1);


%create Data matrix
X_dye = zeros(36,3); %36 data points; r,g,b and bilirubin values
for i = 1 :36
    X_dye(i,1) = red_Dye(i,1);
    X_dye(i,2) = green_Dye(i,1);
    X_dye(i,3) = blue_Dye(i,1);
end
for i = 37 : (36+42)
    X_dye(i,1) = red_Dye_1to5(i-36,1);
    X_dye(i,2) = green_Dye_1to5(i-36,1);
    X_dye(i,3) = blue_Dye_1to5(i-36,1);
end
save('Xtrain','X_dye');
save('Ytrain','Y_dye');



%kNN classification
mdl = fitcknn(X_dye,Y_dye,'NumNeighbors',30,'DistanceWeight','inverse');

% fraction of misclassifications from the prediction of test set
rloss = resubLoss(mdl)

%Construct a cross-validated classifier from the model
%cvmdl = crossval(mdl);
cvmdl = crossval(mdl,'kfold',2);

%cross validation loss
kloss = kfoldLoss(cvmdl)

testX = mean(X_dye);
%predict(mdl,X_dye)


%discriminant analysis
% gscatter(X_dye(:,3),X_dye(:,1), Y_dye,'rgbcmyk','osd*+x');
% xlabel('red');
% ylabel('blue');
% N = size(meas,1);

[x,y] = meshgrid(0:5:250,0:5:250);
x = x(:);
y = y(:);
bByG = X_dye(:,3)./X_dye(:,2);

r_col = X_dye(:,1);
g_col = X_dye(:,2);
b_col = X_dye(:,3);

jLDA = classify([x y],[X_dye(:,1),X_dye(:,3)],Y_dye);
gscatter(x,y,jLDA,'rgbcmk','osd*+x')

xlabel('red channel intensity');
ylabel('blue channel intensity');

ldaClass = classify(b_col,g_col,Y_dye);
[~,misclassify_idx] = find(ldaClass ~= Y_dye);
ldaResubErr = length(misclassify_idx) / length(Y_dye)


qdaClass = classify(b_col,g_col,Y_dye,'quadratic');
[~,misclassify_idx] = find(qdaClass ~= Y_dye);
qdaResubErr = length(misclassify_idx) / length(Y_dye)


