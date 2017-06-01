clear all; close all; clc;
x1 = randn(200,1);
y1 = 0.5*randn(200,1)+1;
x2 = randn(200,1);
y2 = 0.3*randn(200,1)-2;
plot(x1,y1, 'ko'); hold on;
plot(x2,y2, 'ro'); hold off;
x = [x1;x2];
y = [y1;y2];
data = [x,y];
[idx,C] = kmeans(data,2,'Distance','cityblock','MaxIter',100);
figure;
plot(data(idx==1,1),data(idx==1,2),'r.','MarkerSize',12)
hold on
plot(data(idx==2,1),data(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','Centroids','Location','NW')
title 'Cluster Assignments and Centroids'
hold off
% rng default; % For reproducibility
% X = [randn(100,2)*0.75+ones(100,2);
%     randn(100,2)*0.5-ones(100,2)];
% 
% figure;
% plot(X(:,1),X(:,2),'.');
% title 'Randomly Generated Data';
% opts = statset('Display','final');%display results of final iteration
% [idx,C] = kmeans(X,2,'Distance','cityblock','Replicates',5,'Options',opts);
% figure;
% plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
% hold on
% plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
% plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3)
% legend('Cluster 1','Cluster 2','Centroids','Location','NW')
% title 'Cluster Assignments and Centroids'
% hold off