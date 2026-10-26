clear all; close all; clc;

x = 1:1:150;
Start = 5;
memory_range= 1:100;

% Stwierdzilam, ze latwiej bedzie jesli mamy for()
cases = struct(...
    'name', {'Case 1: Dane przykladowe', 'Case 2: Wieksze nachylenie', 'Case 3: Wieksza wariancja'}, ...
    'steepness', {0.2, 2.0, 0.2}, ...
    'kernel', {10, 10, 20} ...
);

best_memories = zeros(1, 3);
min_mse = zeros(1, 3);
all_mse = zeros(3, length(memory_range));

data_store = struct();

for c = 1:3
    Steepness = cases(c).steepness;
    Kernel= cases(c).kernel;
    
    y = x*Steepness + Start;
    Noise = (rand(size(x))*2*Kernel) - Kernel; % [-Kernel, Kernel]
    Data= y + Noise;
    
    for Memory = memory_range
        Estimator = zeros(1, length(x));
        for i = 1:length(x)
            Estimator(i) = sum(Data(max(1, i - Memory):i)) / Memory;
        end
        all_mse(c, Memory) = mean((Estimator-y).^2);
    end
    
    [min_mse(c), best_memories(c)] = min(all_mse(c, :));
    
    best_mem = best_memories(c);
    best_estimator = zeros(1, length(x));
    for i = 1:length(x)
        best_estimator(i) = sum(Data(max(1, i -best_mem):i)) / best_mem;
    end
    
    data_store(c).y = y;
    data_store(c).Data = Data;
    data_store(c).Estimator = best_estimator;
end

%-----------------------------------------------------------------------------
figure('Name', 'Signal Fits with Best Estimator Memory', 'NumberTitle', 'off');

for c = 1:3
    subplot(3, 1, c);
    hold on;
    plot(x, data_store(c).y, 'k-', 'LineWidth', 1.8);
    scatter(x, data_store(c).Data, 15, 'b', 'filled', 'MarkerFaceAlpha', 0.5);
    plot(x, data_store(c).Estimator, 'r-', 'LineWidth', 1.5);
    hold off;
    
    grid on;
    title(sprintf('%s (Best Memory = %d)', cases(c).name, best_memories(c)));
    xlabel('x');
    ylabel('y');
    legend('True y', 'Data with Noise', sprintf('Estimator (Memory = %d)', best_memories(c)), ...
           'Location', 'northwest');
end

%-----------------------------------------------------------------------------
figure('Name', 'MSE vs Memory (Separate Subplots)', 'NumberTitle', 'off');

colors = {'b', 'g', 'r'};

for c = 1:3
    subplot(3, 1, c);
    plot(memory_range, all_mse(c, :), 'Color', colors{c}, 'LineWidth', 1.5);
    hold on;
    % Highlight best memory point
    plot(best_memories(c), min_mse(c), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 8);
    hold off;

    grid on;
    title(sprintf('%s - MSE vs Memory (Min MSE = %.2f at Memory = %d)', ...
        cases(c).name, min_mse(c), best_memories(c)));
    xlabel('Memory Window');
    ylabel('MSE');
    legend('MSE Curve', 'Optimal Memory', 'Location', 'northeast');
end
