clear all; close all;

x = 1:1:100;
Start = 1;
Kernel = 10;
for Steepness = 1:3
    Noise = (rand(size(x))*2*Kernel) - Kernel; % [-1.5, 1.5]
    y = x * Steepness + Start;
    Data = y + Noise;

    Estimator = zeros(1, length(y));
    MSE = zeros(1, 100);

    little=1000000;
    bestMemory=0;

    for Memory = 1:100
        for i = 1:length(x)
            Estimator(i) = (sum(Data(max(1, i - Memory):i))) / Memory;
        end
        
        MSE(Memory) = mean((Estimator - y).^2); % E( (Theta^ - Theta*)^2 )
        
        if MSE(Memory)<little 
            little = MSE(Memory);
            bestMemory = Memory;
        end
    end

    for i = 1:length(x)
        Estimator(i) = (sum(Data(max(1, i - bestMemory):i))) / bestMemory;
    end

    figure
    plot(1:100, MSE);
    title('MSE vs Memory');
    xlabel('Memory');
    ylabel('MSE');

    figure
    hold on
    plot(x, y);
    scatter(x, Data);
    plot(x, Estimator);
    legend('True y', 'Data with Noise', 'Estimator');
    hold off
end
