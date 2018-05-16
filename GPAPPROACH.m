clear;
clc;
% Initialization Parameters 
meanfunc = {@meanSum, {@meanLinear, @meanConst}}; hyp.mean = [0.5;0.5;1];
covfunc = {@covMaternard, 5}; ell = 1; sf = 1; hyp.cov = log([ell;ell;sf]);
likfunc = @likGauss; 
sn = 0.1; hyp.lik = log(sn);
% Loading Data
TrainData = xlsread('Data30_1.xlsx');
% Set the number of the points
m = 200;
TrainData1 = USample(TrainData,m);
Train_x = TrainData1(:,1:2);
Train_y = log(TrainData1(:,3));
Test_x = TrainData(:,1:2);
True_y = TrainData(:,9);
Test200_y = TrainData(:,3);
Test500_y = TrainData(:,4);
Test5000_y = TrainData(:,7);
Test1000_y = TrainData(:,5);
Test2000_y = TrainData(:,6);
Test10000_y = TrainData(:,8);
re = zeros(3,7);
% Gaussian Regression
tic;
[Test_y, Test_cov] = gp(hyp, @infGaussLik, meanfunc, covfunc, likfunc, Train_x, Train_y, Test_x);
toc;
% x1 = zeros(20,1);
% True_y1 = zeros(20,1);
% GP_y1 = zeros(20,3);
% Sim5000_y1 = zeros(20,1);
% for i = 1:20
%     x1(i) = Train_x(20*(i-1)+11,1);
%     True_y1(i) = True_y(20*(i-1)+11);
%     Sim5000_y1(i) = Test5000_y(20*(i-1)+11);
%     GP_y1(i,1) = exp(Test_y(20*(i-1)+11)-1.96*Test_cov(20*(i-1)+11));
%     GP_y1(i,2) = exp(Test_y(20*(i-1)+11));
%     GP_y1(i,3) = exp(Test_y(20*(i-1)+11)+1.96*Test_cov(20*(i-1)+11));
% end
% figure(3)
% hold on;
% plot(x1,True_y1,'LineWidth',1.2);
% plot(x1,Sim5000_y1,'*')
% plot(x1,GP_y1,'LineWidth',1.2);
% box off;
% axis([0.02 0.54 28 31]);
% RMSE
disp('GP approach');
re(1,1) = 0;
re(2:3,1) = RMSE(exp(Test_y),True_y);
disp(re(2:3,1))
disp('200 simulations');
re(1,2) = 200;
re(2:3,2) = RMSE(Test200_y,True_y);
disp(re(2:3,2));
disp('500 simulations');
re(1,3) = 500;
re(2:3,3) = RMSE(Test500_y,True_y);
disp(re(2:3,3));
disp('1000 simulations');
re(1,4) = 1000;
re(2:3,4) = RMSE(Test1000_y,True_y);
disp(re(2:3,4));
disp('2000 simulations');
re(1,5) = 2000;
re(2:3,5) = RMSE(Test2000_y,True_y);
disp(re(2:3,5));
disp('5000 simulations');
re(1,6) = 5000;
re(2:3,6) = RMSE(Test5000_y,True_y);
disp(re(2:3,6));
disp('10000 simulations');
re(1,7) = 10000;
re(2:3,7) = RMSE(Test10000_y,True_y);
disp(re(2:3,7));
re = re';