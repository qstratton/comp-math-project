%{
Read data, create plots, etc.
%}
1;

RegData = csvread("reg-times.csv");
OptData = csvread("opt-times.csv");
#disp(RegData);
#disp(OptData);
step = 1500 / 5;
x = 0:step:1500;
#plot(x, RegData(:,2), "r", x, OptData(:,2), "b");

Ratios = RegData ./ OptData;
disp(RegData);
disp(OptData);
disp(Ratios);
plot(x, RegData(1,:), "r", x, OptData(1,:), "b");
#plot(x, Ratios(:,1));
