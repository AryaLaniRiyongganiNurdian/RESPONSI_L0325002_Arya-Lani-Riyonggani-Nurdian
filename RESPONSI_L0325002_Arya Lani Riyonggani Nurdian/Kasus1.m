% L0325002_Arya Lani Riyonggani Nurdian
clc; clear; close all;

% Data soal
lambda = 12; v = 36; x = 10; h0 = 5;
N = [23 24 25];
t = 0:0.05:5;

% Hasil eksak
h_eksak = h0 * (cos(t*v/lambda) + exp(x));

% Hasil pendekatan dengan deret Taylor untuk tiap n
h_n = zeros(3, length(t));
for j = 1:3
  n = N(j);

  % e^x dihitung sekali karena x tetap
  e_x = 0;
  for i = 0:n
    e_x = e_x + x^i / factorial(i);
  end

  % cos(t*v/lambda) dihitung untuk setiap nilai t
  for k = 1:length(t)
    y = t(k)*v/lambda;
    cos_y = 0;
    for i = 0:n
      cos_y = cos_y + (-1)^i * y^(2*i) / factorial(2*i);
    end
    h_n(j, k) = h0 * (cos_y + e_x);
  end
end

% Galat mutlak tiap titik t
galat = zeros(3, length(t));
for j = 1:3
  galat(j, :) = abs(h_eksak - h_n(j, :));
end

% Grafik
figure(1);
subplot(1,2,1);
plot(t, h_eksak, 'k-', t, h_n(1,:), 'r--', t, h_n(2,:), 'g-.', t, h_n(3,:), 'b:');
xlabel('t'); ylabel('h');
title('Perbandingan h eksak dan pendekatan');
legend('Eksak', 'n = 23', 'n = 24', 'n = 25');
grid on;

subplot(1,2,2);
plot(t, galat(1,:), 'r', t, galat(2,:), 'g', t, galat(3,:), 'b');
xlabel('t'); ylabel('Galat mutlak');
title('Galat mutlak terhadap eksak');
legend('n = 23', 'n = 24', 'n = 25');
grid on;

% Rerata galat dan pengecekan toleransi 1%
tol = 1;
fprintf('\nn\tRerata galat mutlak\tRerata persentase galat\tKeterangan\n');
for j = 1:3
  rerata_galat = mean(galat(j, :));
  rerata_persen = mean(galat(j, :) ./ abs(h_eksak)) * 100;
  if rerata_persen <= tol
    ket = 'layak digunakan';
  else
    ket = 'tidak layak digunakan';
  end
  fprintf('%d\t%12.6f\t\t%12.6f %%\t\t%s\n', N(j), rerata_galat, rerata_persen, ket);
end
