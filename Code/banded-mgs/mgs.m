%{
Fall 2018 : Computational Math I
Group Project
Standard MGS Algorithm for banded matrices
Based on Algorithm 8.1 in NLA - Trefethen/Bau
Designed for comparison to various
optimized QR-factorization methods
%}

function R = mgs(A)
  echo off;
  [m,n] = size(A); % Get dimensions of input matrix
  R = eye(m);
  R = R(:,1:n);
  for i = 1:n
    R(i,i) = norm(A(:,i), 2);
    q = A(:,i) / R(i,i);
    for j = i + 1:n
      R(i,j) = q'*A(:,j);
      A(:,j) = A(:,j) - R(i,j)*q;
    end
  end
end
