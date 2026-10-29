% L0325002_Arya Lani Riyonggani Nurdian
clc; clear; close all;

% Semua satuan diubah ke kg
% Kolom: beras, telur, tepung, ayam
% Adel  : 2.5 kg, 1500 g = 1.5 kg, 5 kg, 500 g = 0.5 kg
% Briza : 40 hg = 4 kg, 0.75 kg, 1000 g = 1 kg, 2 kg
% Caca  : 2000 g = 2 kg, 15 hg = 1.5 kg, 50 dag = 0.5 kg, 6000 g = 6 kg
% Dinda : 1 kg, 4250 g = 4.25 kg, 20 hg = 2 kg, 9 hg = 0.9 kg
A = [2.5 1.5  5   0.5;
     4   0.75 1   2;
     2   1.5  0.5 6;
     1   4.25 2   0.9];
b = [161000; 149000; 251500; 173000];

fprintf('SPL (x1 beras, x2 telur, x3 tepung, x4 ayam, harga per kg):\n');
fprintf('2.5x1 + 1.5x2 + 5x3 + 0.5x4 = 161000\n');
fprintf('4x1 + 0.75x2 + 1x3 + 2x4 = 149000\n');
fprintf('2x1 + 1.5x2 + 0.5x3 + 6x4 = 251500\n');
fprintf('1x1 + 4.25x2 + 2x3 + 0.9x4 = 173000\n');

% Cek diagonal dominan pada matriks awal
fprintf('\nCek diagonal dominan matriks awal:\n');
dom_awal = CekDominan(A);

% Tukar urutan baris: Briza, Dinda, Adel, Caca
urutan = [2 4 1 3];
A2 = A(urutan, :);
b2 = b(urutan);

fprintf('\nCek diagonal dominan setelah baris ditukar (urutan 2 4 1 3):\n');
dom_baru = CekDominan(A2);

if dom_baru == 1
  fprintf('\nMatriks sudah diagonal dominan, Gauss-Seidel dapat digunakan.\n');
  tol = 0.0001;
  max_iter = 100;
  [x, iter] = IterasiGaussSeidel(A2, b2, tol, max_iter);
  fprintf('Konvergen pada iterasi ke-%d\n', iter);
  fprintf('Harga beras  per kg = Rp %10.2f\n', x(1));
  fprintf('Harga telur  per kg = Rp %10.2f\n', x(2));
  fprintf('Harga tepung per kg = Rp %10.2f\n', x(3));
  fprintf('Harga ayam   per kg = Rp %10.2f\n', x(4));
  fprintf('\nCek A*x - b (harus mendekati 0):\n');
  disp(A*x - b);
else
  fprintf('\nMatriks tidak diagonal dominan, gunakan metode langsung.\n');
end
