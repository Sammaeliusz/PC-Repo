x = 1:0.1:20;
z = rand(size(x));
a = 1;
theta_z_daszkiem = zeros(1,191)
MSE = zeros(1,100);
for h=1:100
    y = a*x+z;
    for t=1:191
        theta_z_daszkiem(t) = 1/h*(sum(y(max(1, t-h):t)));
    end
    MSE(h) = mse(theta_z_daszkiem,x);
end
min_v = 1;
max_v = 100;
figure
plot(min_v:max_v, MSE(min_v:max_v));
min(MSE)
figure
hold on
plot(x, y);
plot(x, theta_z_daszkiem);
