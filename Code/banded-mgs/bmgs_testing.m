1;
num_trials = 10;
#dims = [10 50 100 250 500 750 1000];
dims = [10 500 750 1000];
range = 1000000; # range for random matrix entries
# Hold times for mgs.m, banded_mgs.m respectively
reg_data = [];
opt_data = [];
for j = 1:size(dims, 2)
  step_size = dims(1,j) / 10;
  bandwidths = 0:step_size:dims(1,j);
  reg_data = [reg_data; zeros(1,size(bandwidths, 2))];
  opt_data = [opt_data; zeros(1,size(bandwidths, 2))];
  for p = 1:size(bandwidths,2);
    reg_times = []; 
    opt_times = [];
    for i = 1:num_trials
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
      reg_times = [reg_times reg_time];
      opt_times = [opt_times opt_time];
    endfor
    reg_avg = sum(reg_times) / size(reg_times, 2);
    opt_avg = sum(opt_times) / size(opt_times, 2);
    reg_data(j, p) = reg_avg;
    opt_data(j, p) = opt_avg;
  endfor
endfor

csvwrite("reg.csv", reg_data);
csvwrite("opt.csv", opt_data);
%{
fid = fopen("test.txt", "w");
fprintf(fid, "%f ", reg_data);
fprintf(fid, "\n\n");
fclose(fid);
%}




