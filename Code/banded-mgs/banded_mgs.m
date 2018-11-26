<<<<<<< HEAD
%{
Fall 2018 : Computational Math I
Group Project
Optimized MGS Algorithm for banded matrices
Based on Algorithm 8.1 in NLA - Trefethen/Bau
Overwrites input matrix to produce upper triangular matrix
%}

function R = banded_mgs(A, p)
  echo off;
  [m,n] = size(A); % Get dimensions of input matrix
  R = eye(m);
  R = R(:,1:n);
  for i = 1:n
    R(i,i) = norm(A(:,i), 2);
    q = A(:,i) / R(i,i);
    for j = i + 1:min(i + 2*p,n)
      R(i,j) = q'*A(:,j);
      A(:,j) = A(:,j) - R(i,j)*q;
    end
  end
end
=======
%{
Fall 2018 : Computational Math I
Group Project
Optimized MGS Algorithm for banded matrices
Based on Algorithm 8.1 in NLA - Trefethen/Bau
Overwrites input matrix to produce upper triangular matrix
%}

function R = banded_mgs(A, p)
  [m,n] = size(A); % Get dimensions of input matrix
  R = eye(m,n);
  for i = 1:n
    R(i,i) = norm(A(:,i), 2);
    q = A(:,i) / R(i,i);
    for j = i + 1:min(i + 2*p,n)
      R(i,j) = q'*A(:,j);
      A(:,j) = A(:,j) - R(i,j)*q;
    end
  end
end


>>>>>>> miles
