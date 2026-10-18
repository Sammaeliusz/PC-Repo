function ret = mse(est, tru)
    ret = sum((est-tru).^2)/length(est);
end
x = 1:0.1:20;
zaklocenia = rand(size(x));
steepness = 1;
estymator = zeros(1,191);
MSE = zeros(1,100);
for d_historii=1:100
    y = steepness*x+zaklocenia;
    for time=1:191
        estymator(time) = 1/d_historii*(sum(y(max(1, time-d_historii):time)));
    end
    MSE(d_historii) = mse(estymator,x);
end
min_v = 1;
max_v = 100;
figure
plot(min_v:max_v, MSE(min_v:max_v));
min(MSE)
figure
hold on
plot(x, y);
plot(x, estymator);
