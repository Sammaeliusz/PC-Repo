Kernel = 10;
x = 1:100;
Noise = (rand(size(x))*2*Kernel) - Kernel;
True_Theta = [6,6,0,8];
U = [0,0,0,0];
y = U*True_Theta'+Noise;
