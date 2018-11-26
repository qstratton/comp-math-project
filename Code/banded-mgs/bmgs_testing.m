1;
num_trials = 1;
%dims = [10 50 100 250 500 750 100];
dims = [50 100 500 1000 1500];
range = 1000000; % range for random matrix entries
% Hold times for mgs.m, banded_mgs.m respectively
reg_data = [];
opt_data = [];
for j = 1:size(dims, 2)
  step_size = dims(1,j) / 5;
  bandwidths = 0:step_size:dims(1,j);
  reg_data = [reg_data; zeros(1,size(bandwidths, 2))];
  opt_data = [opt_data; zeros(1,size(bandwidths, 2))];
  for p = 1:size(bandwidths,2);
      A = banded(dims(j),dims(j),bandwidths(p),range);
      %{ Test regular mgs %}
      tic();
      mgs(A);
      reg_time = toc();
      %{ test banded mgs %}
      tic();
      banded_mgs(A,bandwidths(p));
      opt_time = toc();
      %{ Add times to respective matrices %}
    reg_data(j, p) = reg_time;
    opt_data(j, p) = opt_time;
    end
  end

csvwrite('reg-times.csv', reg_data);
csvwrite('opt-times.csv', opt_data);
