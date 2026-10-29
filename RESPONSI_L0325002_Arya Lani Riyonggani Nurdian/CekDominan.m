% L0325002_Arya Lani Riyonggani Nurdian
function hasil = CekDominan(A)
  n = size(A, 1);
  hasil = 1;
  for i = 1:n
    diagonal = abs(A(i, i));
    lainnya = sum(abs(A(i, :))) - diagonal;
    if diagonal > lainnya
      status = 'memenuhi';
    else
      status = 'tidak memenuhi';
      hasil = 0;
    end
    fprintf('Baris %d : |%g| dan jumlah elemen lain %g (%s)\n', i, diagonal, lainnya, status);
  end
end
