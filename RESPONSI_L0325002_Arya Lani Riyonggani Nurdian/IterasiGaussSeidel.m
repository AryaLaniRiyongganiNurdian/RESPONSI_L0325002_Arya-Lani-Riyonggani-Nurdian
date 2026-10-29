% L0325002_Arya Lani Riyonggani Nurdian
function [x, iter] = IterasiGaussSeidel(A, b, tol, max_iter)
  n = size(A, 1);

  % Tebakan awal
  x = zeros(n, 1);
  x(1) = b(1) / A(1, 1);

  % Matriks iterasi C dan vektor d
  C = -A;
  d = zeros(n, 1);
  for i = 1:n
    C(i, i) = 0;
    C(i, :) = C(i, :) / A(i, i);
    d(i, 1) = b(i) / A(i, i);
  end

  iter = 0;
  while (iter < max_iter)
    iter = iter + 1;
    xlama = x;
    for j = 1:n
      x(j) = C(j, :) * x + d(j);
    end
    if (abs(xlama - x) <= tol)
      disp('Gauss Seidel method konverge');
      return
    end
  end
  disp('Gauss Seidel method not konverge within max_iter');
end
