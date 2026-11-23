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
sample_size = 500;
W_t = zeros(sample_size,4);
W_e = zeros(sample_size,4);
for u = 1:sample_size
    k = k + 1;

     if k == floor(2*sample_size/3)
        W_true = W_true_2;
    end

    u_k = randn();
    phi = [u_k; phi(1:end-1)];
    z_k = sigma_z * randn();
    y_k = W_true' * phi + z_k;
    
    P = (1 / lambda) * (P - (P * phi * phi' * P) / (lambda + phi' * P * phi));

    blad_predykcji = y_k - phi' * W_hat;
    W_hat = W_hat + P * phi * blad_predykcji;
    W_t(u, :) = W_true;
    W_e(u, :) =  W_hat;
   if mod(k, 10) == 0
        for i = 1:n
            addpoints(h_lines(i), k, W_hat(i));
        end
        drawnow limitrate;

   end

    pause(0.02);
end
figure
c = ["r", "g", "b", "c"]
hold on
for i=1:4
plot(1:sample_size, (W_e(:,i)-W_t(:,i)).^2, 'k', 'LineWidth', 1.2, Color=c(i));
end
grid on;
xlabel('Krok symulacji (k)');
ylabel('Błąd predykcji');
yscale("log")
title('Błąd estymacji sygnału');
legend(["MSE(W1)", "MSE(W2)", "MSE(W3)", "MSE(W4)"])
