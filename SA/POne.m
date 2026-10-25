clear all; close all;
function result = min_value_per_plot(plots)
    result = zeros(2, size(plots, 1));
    for i = 1:size(plots, 1)
        plot_min = plots(i,1);
        best_x = 1;
        for j = 1:size(plots, 2)
            if(plots(i,j)<plot_min)
                best_x = j;
                plot_min = plots(i, j);
            end
        end
        result(1,i) = best_x;
        result(2,i) = plot_min;
    end
end
x = 1:1:100;
Start = 1;
Kernel = 10;
Simulation_Step = 0.25;
steepness_max = 4;
MSE = zeros(3/Simulation_Step, 100);
for Steepness = 1:Simulation_Step:4
    Noise = (rand(size(x))*2*Kernel) - Kernel; % [-1.5, 1.5]
    y = x * Steepness + Start;
    Data = y + Noise;

    Estimator = zeros(1, length(y));
    

    little=1000000;
    bestMemory=0;
    for Memory = 1:100
        for i = 1:length(x)
            Estimator(i) = (sum(Data(max(1, i - Memory):i))) / Memory;
        end
    
        MSE(ceil(Steepness/Simulation_Step),Memory) = mean((Estimator - y).^2); % E( (Theta^ - Theta*)^2 )
        
        if MSE(ceil(Steepness/Simulation_Step),Memory)<little 
            little = MSE(ceil(Steepness/Simulation_Step),Memory);
            bestMemory = Memory;
        end
    end

    for i = 1:length(x)
        Estimator(i) = (sum(Data(max(1, i - bestMemory):i))) / bestMemory;
    end

    %{
    figure
    hold on
    plot(x, y);
    scatter(x, Data);
    plot(x, Estimator);
    legend('True y', 'Data with Noise', 'Estimator');
    hold off
    %}
end
x_min = 2;
x_max = 30;
figure
plot(x_min:x_max, MSE(4:end ,x_min:x_max));
title('MSE vs Memory');
xlabel('Memory');
ylabel('MSE');
ylim([0 500]);
min_value_per_plot(MSE)

clear MSE;
kernel_min = 1;
kernel_max = 40;
Steepness = 1;
Simulation_Step = 2;
MSE = zeros(ceil((kernel_max-kernel_min)/Simulation_Step), 100);
for Kernel = kernel_min:Simulation_Step:kernel_max
    Noise = (rand(size(x))*2*Kernel) - Kernel; % [-1.5, 1.5]
    y = x * Steepness + Start;
    Data = y + Noise;

    Estimator = zeros(1, length(y));
    

    little=1000000;
    bestMemory=0;
    for Memory = 1:100
        for i = 1:length(x)
            Estimator(i) = (sum(Data(max(1, i - Memory):i))) / Memory;
        end
    
        MSE(ceil(Kernel/Simulation_Step),Memory) = mean((Estimator - y).^2); % E( (Theta^ - Theta*)^2 )
        
        if MSE(ceil(Kernel/Simulation_Step),Memory)<little 
            little = MSE(ceil(Kernel/Simulation_Step),Memory);
            bestMemory = Memory;
        end
    end

    for i = 1:length(x)
        Estimator(i) = (sum(Data(max(1, i - bestMemory):i))) / bestMemory;
    end

%{
    figure
    hold on
    plot(x, y);
    scatter(x, Data);
    plot(x, Estimator);
    legend('True y', 'Data with Noise', 'Estimator');
    hold off
%}
end
x_min = 2;
x_max = 30;
figure
plot(x_min:x_max, MSE(4:end ,x_min:x_max));
title('MSE vs Memory');
xlabel('Memory');
ylabel('MSE');
ylim([0 150]);
min_value_per_plot(MSE)
