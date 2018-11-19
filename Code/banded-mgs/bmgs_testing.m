1;

function A = banded(m,n,p,range)
  A = 2*range*rand(m,n) - range;

  for i = 1:m
    for j = 1:n
      if (abs(i - j) > p)
        A(i,j) = 0;
      endif
    endfor
  endfor
endfunction

function R = mgs(A)
  [m,n] = size(A); # Get dimensions of input matrix
  R = eye(m)(:,1:n);
  for i = 1:n
    R(i,i) = norm(A(:,i), 2);
    q = A(:,i) / R(i,i);
    for j = i + 1:n
      R(i,j) = q'*A(:,j);
      A(:,j) = A(:,j) - R(i,j)*q;
    endfor
  endfor
endfunction

%{
Fall 2018 : Computational Math I
Group Project
Optimized MGS Algorithm for banded matrices
Based on Algorithm 8.1 in NLA - Trefethen/Bau
Overwrites input matrix to produce upper triangular matrix
%}

function R = banded_mgs(A, p)
  [m,n] = size(A); # Get dimensions of input matrix
  R = eye(m)(:,1:n);
  for i = 1:n
    R(i,i) = norm(A(:,i), 2);
    q = A(:,i) / R(i,i);
    for j = i + 1:min(i + 2*p,n)
      R(i,j) = q'*A(:,j);
      A(:,j) = A(:,j) - R(i,j)*q;
    endfor
  endfor
endfunction
num_trials = 50;
num_p = 10; # Bandwidths to consider
m = 1000;
n = 1000;
range = 1000; # range for random matrix entries
# Hold times for mgs.m, banded_mgs.m respectively
reg_times = []; 
opt_times = [];

for p = 0:num_p;
  for i = 1:num_trials
    A = banded(m,n,p,range);
    %{ Test regular mgs %}
    tic();
    mgs(A);
    reg_time = toc();
    %{ test banded mgs %}
    tic();
    banded_mgs(A,p);
    opt_time = toc();
    %{ Add times to respective matrices %}
    reg_times(p + 1,i) = reg_time;
    opt_times(p + 1,i) = opt_time;
  endfor
endfor
x = 1:1000;

%{ Compute Average Time(s) elapsed %}
reg_avgs = [];
opt_avgs = [];
for i = 1:num_p
  reg_avgs = [reg_avgs (sum(reg_times(i,:)) / size(reg_avgs, 2))];
  opt_avgs = [opt_avgs (sum(opt_times(i,:)) / size(opt_avgs, 2))];
end

fprintf("%f", reg_avgs);
fprintf("%f", opt_avgs);





