%{
Read data, create plots, etc.
%}
1;

RegData = csvread("reg.csv");
OptData = csvread("opt.csv");
disp(RegData);
disp(OptData);
                                #x = 1:size(RegData, 1);
x = [10 500 750 1000];
plot(x, RegData(:,2), "r", x, OptData(:,2), "b");

Ratios = RegData ./ OptData;
#plot(x, Ratios(:,1));
