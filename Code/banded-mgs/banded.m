<<<<<<< HEAD
function A = banded(m,n,p,range)

  A = 2*range*rand(m,n) - range;

  for i = 1:m
    for j = 1:n
      if (abs(i - j) > p)
        A(i,j) = 0;
      end
    end
  end
end
=======
function A = banded(m,n,p,range)
  A = 2*range*rand(m,n) - range;

  for i = 1:m
    for j = 1:n
      if (abs(i - j) > p)
        A(i,j) = 0;
      end
    end
  end
end
>>>>>>> miles
