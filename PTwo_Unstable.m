clear; clc; close all;


W_true = [6; 4; 0; 8];
W_true_2 = [6; 4; 2; 8];
n = length(W_true);

lambda = 0.985;
P = 100 * eye(n);
W_hat = zeros(n, 1);
phi = zeros(n, 1);

sigma_z = 1;

figure('Name', 'Estymacja wag W z zapominaniem');
hold on; grid on;
colors = {'r', 'g', 'b', 'm'};
h_lines = gobjects(n, 1);

for i = 1:n
    h_lines(i) = animatedline('Color', colors{i}, 'LineWidth', 1.5);
    yline(W_true(i), '--', 'Color', colors{i}, 'LineWidth', 1);
end
yline(W_true_2(3), ':', 'Color', colors{3}, 'LineWidth', 1.5);


xlabel('Krok symulacji (k)');
ylabel('Wartość estymowanych wag W (Theta w notatkach)');
title(sprintf('Estymacja z zapominaniem (\\lambda = %.3f)', lambda));
legend('W_0 (cel: 6)', '', 'W_1 (cel: 4)', '', 'W_2 (0 -> 2)', '', 'W_3 (cel: 8)', '', 'Location', 'best');

k = 0;

while true
    k = k + 1;

     if k == 1000
        W_true = W_true_2;
    end

    u_k = randn();
    phi = [u_k; phi(1:end-1)];
    z_k = sigma_z * randn();
    y_k = W_true' * phi + z_k;

    P = (1 / lambda) * (P - (P * phi * phi' * P) / (lambda + phi' * P * phi));

    blad_predykcji = y_k - phi' * W_hat;
    W_hat = W_hat + P * phi * blad_predykcji;

   if mod(k, 10) == 0
        for i = 1:n
            addpoints(h_lines(i), k, W_hat(i));
        end
        drawnow limitrate;

   end

    pause(0.02);
end
