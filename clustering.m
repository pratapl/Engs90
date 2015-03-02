%Group 19, ENGS 90
%Algorithm


%load the training examples and their labels
Xtrain = load('Xtrain');
Ytrain = load('Ytrain');

Xtrain = Xtrain.X_dye;
Ytrain = Ytrain.Y_dye;

%clustering
%idx3 = kmeans(blueByGreen_Dye,2,'Distance','cityblock');
[label,centroid] = kmeans([Xtrain(1:36,2:3),Ytrain(1:36,:)],6,'Distance','cosine',...
                    'start','cluster');
figure;
subplot(1,2,1);
[silh3,h] = silhouette([Xtrain(1:36,1:2),Ytrain(1:36,:)],label,'correlation');
h = gca;
h.Children.EdgeColor = [.8 .8 1];
xlabel 'Silhouette Value';
ylabel 'Cluster';


subplot(1,2,2)
ptsymb = {'bs','r^','md','go','c+'};
for i = 1:6
    [~,clust] = find(label==i);
    plot3(Xtrain(clust,1),Xtrain(clust,2),Ytrain(clust,1),ptsymb{i});
    hold on
end
plot3(cmeans2(:,1),cmeans2(:,2),cmeans2(:,3),'ko');
plot3(cmeans2(:,1),cmeans2(:,2),cmeans2(:,3),'kx');
hold off
xlabel('Sepal Length');
ylabel('Sepal Width');
zlabel('Petal Length');
view(-137,10);
grid on




