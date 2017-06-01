clear all; close all; clc;
f11 = randn(200,1);      %feature#1 class#1
f21 = 0.5*randn(200,1)+1;%feature#2 class#1
f12 = randn(200,1);      %feature#1 class#2
f22 = 0.3*randn(200,1)-0.5;%feature#2 class#2
plot(f11,f21, 'bo'); hold on;
plot(f12,f22, 'ro');
f1 = [f11;f12]; %feature#1
f2 = [f21;f22]; %feature#2
class = [ones(200,1);-ones(200,1)];
data = [f1,f2,class];
mdl = fitcknn(data(:,1:2),data(:,3),'Distance','cityblock','NumNeighbors',5);
test = [0,1;1,-1];
label = predict(mdl,test);
for i=1:length(label)
    switch label(i)
        case 1
            plot(test(i,1),test(i,2),'k^','MarkerSize',10,'LineWidth',3)%black triangle represents class 1
        case -1
            plot(test(i,1),test(i,2),'ks','MarkerSize',10,'LineWidth',3)%black square represents class -1
    end
end
legend('Training Class 1','Training Class -1',['Predicted Class ',num2str(label(1))],['Predicted Class ',num2str(label(2))],'Location','NW')
title('KNN Classification')
hold off;


% %another example
% %Generate some data
% N1 = 100; N2 = 30; % Class sizes
% x = [randn(N1,2);randn(N2,2)+3];
% t = [zeros(N1,1);ones(N2,1)];
% N = size(x,1);
% %plot the data
% ma = {'ko','ks'};
% fc = {[0 0 0],[1 1 1]};
% tv = unique(t);
% figure(1); hold off
% for i = 1:length(tv)
%     pos = find(t==tv(i));
%     plot(x(pos,1),x(pos,2),ma{i},'markerfacecolor',fc{i});
%     hold on
% end
% %Generate the decision boundaries for various values of K
% [Xv, Yv] = meshgrid(min(x(:,1)):0.1:max(x(:,1)),min(x(:,2)):0.1:max(x(:,2)));
% % Loop over test points
% 
% Kvals = [1 2 3 5 10 15 20 30 59];
% for kv = 1:length(Kvals)
%     classes = zeros(size(Xv));
%     K = Kvals(kv);
%     for i = 1:length(Xv(:))
%         this = [Xv(i) Yv(i)];
%         dists = sum((x - repmat(this,N,1)).^2,2);
%         [d, I] = sort(dists,'ascend');
%         [a,b] = hist(t(I(1:K)));
%         pos = find(a==max(a));
%         if length(pos)>1
%             order = randperm(length(pos));
%             pos = pos(order(1));
%         end
%         classes(i) = b(pos);
%     end
%     figure(1); hold off
%     for i = 1:length(tv)
%         pos = find(t==tv(i));
%         plot(x(pos,1),x(pos,2),ma{i},'markerfacecolor',fc{i});
%         hold on
%     end
%     contour(Xv,Yv,classes,[0.5 0.5],'k')
%     ti = sprintf('K = %g',K);
%     title(ti);
% end