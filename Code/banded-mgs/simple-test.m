1;
num_trials = 1;
%dims = [10 50 100 250 500 750 100];
dim = 1500;
range = 1000000; % range for random matrix entries
% Hold times for mgs.m, banded_mgs.m respectively
reg_data = [];
opt_data = [];
  step_size = dim / 5;
  bandwidths = 0:step_size:dim;
  for p = 1:size(bandwidths,2);
      A = banded(dim,dim,bandwidths(p),range);
      %{ Test regular mgs %}
      tic();
      mgs(A);
      reg_time = toc();
      %{ test banded mgs %}
      tic();
      banded_mgs(A,bandwidths(p));
      opt_time = toc();
      %{ Add times to respective matrices %}
    reg_data(1, p) = reg_time;
    opt_data(1, p) = opt_time;
  end

csvwrite('reg-times.csv', reg_data);
csvwrite('opt-times.csv', opt_data);
