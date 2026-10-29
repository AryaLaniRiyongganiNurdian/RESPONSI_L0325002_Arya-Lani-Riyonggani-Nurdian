% L0325002_Arya Lani Riyonggani Nurdian
function c = Biseksi(f, a, b, n, tol)
  fa = f(a);
  fb = f(b);

  if fa*fb > 0
    error('Warning: sama tanda.');
  end

  fprintf('\nIter\ta\t\tb\t\tfa\t\tfb\t\tc\t\tfc\n');

  for i = 1:n
    c = (a+b)/2;
    fc = f(c);
    fprintf('%d\t%f\t%f\t%f\t%f\t%f\t%f\n', i, a, b, fa, fb, c, fc);

    if abs(c-a) <= tol || abs(c-b) <= tol
      break;
    end

    if fa*fc == 0
      break;
    elseif fa*fc < 0
      b = c;
      fb = f(b);
    else
      a = c;
      fa = f(a);
    end
  end
end
