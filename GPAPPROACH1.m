clear;
clc;
% Initialization Parameters 
meanfunc = {@meanSum, {@meanLinear, @meanConst}}; hyp.mean = [0.5;0.5;0.5;1];
covfunc = {@covMaternard, 5}; ell = 1; sf = 1; hyp.cov = log([ell;ell;ell;sf]);
likfunc = @likGauss; 
sn = 0.1; hyp.lik = log(sn);
% Loading Data
% TrainData = xlsread('Data.xlsx');
TrainData = xlsread('Data30_2.xlsx');
m = 4000;
TrainData1 = USample(TrainData,m);
Train_x = TrainData1(:,1:3);
Train_y = TrainData1(:,6);
Test_x = TrainData(:,1:3);
True_y = TrainData(:,10);
Test200_y = TrainData(:,4);
Test500_y = TrainData(:,5);
Test1000_y = TrainData(:,6);
Test2000_y = TrainData(:,7);
Test5000_y = TrainData(:,8);
Test10000_y = TrainData(:,9);
% Gaussian Regression
tic;
[Test_y, Test_cov] = gp(hyp, @infGaussLik, meanfunc, covfunc, likfunc, Train_x, Train_y, Test_x);
toc;
% RMSE
disp('GP approach');
reGP = RMSE(Test_y,True_y);
disp(reGP);
disp('200 simulations');
re200 = RMSE(Test200_y,True_y);
disp(re200);
disp('500 simulations');
re500 = RMSE(Test500_y,True_y);
disp(re500);
disp('1000 simulations');
re1000 = RMSE(Test1000_y,True_y);
disp(re1000);
disp('2000 simulations');
re2000 = RMSE(Test2000_y,True_y);
disp(re2000);
disp('5000 simulations');
re5000 = RMSE(Test5000_y,True_y);
disp(re5000);
disp('10000 simulations');
re10000 = RMSE(Test10000_y,True_y);
disp(re10000);