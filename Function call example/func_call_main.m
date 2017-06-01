x= 0:0.1:4*pi;
% offset = 5;
[y1,y2] = func_sin_cos(x);
subplot(2,1,1)
plot(x,y1)
subplot(2,1,2)
plot(x,y2)