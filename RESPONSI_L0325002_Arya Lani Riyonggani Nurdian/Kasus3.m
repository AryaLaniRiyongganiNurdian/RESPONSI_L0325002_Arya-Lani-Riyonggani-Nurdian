% L0325002_Arya Lani Riyonggani Nurdian
clc; clear; close all;

% Bola di dalam tabung: jari-jari tabung = r, tinggi tabung t = 2r
% V bola = (4/3)*pi*r^3 = 300
% V tabung = pi*r^2*(2r) = 2*pi*r^3
% V bola : V tabung = (4/3) : 2 = 2 : 3, maka V tabung = 3/2 * 300 = 450
% V tabung di luar bola = 450 - 300 = 150 = (2/3)*pi*r^3
% Persamaan nonlinear: f(r) = (2/3)*pi*r^3 - 150 = 0
f = @(r) (2/3)*pi*r.^3 - 150;

% Metode grafik untuk mencari nilai awal
r = linspace(0, 6, 200);
figure(1);
subplot(1,2,1);
plot(r, f(r), 'b');
hold on;
plot(r, zeros(size(r)), 'k');
xlabel('r (cm)'); ylabel('f(r)');
title('Grafik tunggal');
grid on;

subplot(1,2,2);
y1 = (2/3)*pi*r.^3;
y2 = 150*ones(size(r));
plot(r, y1, 'b', r, y2, 'r');
xlabel('r (cm)'); ylabel('y');
title('Grafik ganda');
legend('y1 = (2/3)*pi*r^3', 'y2 = 150');
grid on;

% Dari grafik, akar berada di antara r = 4 dan r = 5
a = 4; b = 5;
fprintf('f(%g) = %f dan f(%g) = %f\n', a, f(a), b, f(b));

% Metode biseksi
n = 20;
tol = 0.0001;
c = Biseksi(f, a, b, n, tol);
fprintf('Akar (Biseksi) r = %.6f cm\n', c);

% Volume bagian tabung di luar bola
t = 2*c;
V_bola = (4/3)*pi*c^3;
V_tabung = pi*c^2*t;
V_luar = V_tabung - V_bola;
fprintf('\nJari-jari bola dan tabung = %.6f cm\n', c);
fprintf('Tinggi tabung = %.6f cm\n', t);
fprintf('Volume bola = %.6f cm^3\n', V_bola);
fprintf('Volume tabung = %.6f cm^3\n', V_tabung);
fprintf('Volume tabung di luar bola = %.6f cm^3\n', V_luar);
