% set value
% N = input('Input the number of the levels:');
% m = input('Input the transition probabilities:');
% Formula = input('Input a Formula:','s');
% truevalue = zeros(1, n);
% Since 'M one U* succ' can be caculated by l/times, so
% ('M one U+ succ'/'M one U* succ') = M/times/(l/times) = M/l, where M is
% the Measure of each path and times is the number of the paths.
clear;
clc;
% 10 15 20 25 30
N = 10;
times =[200, 500, 1000, 2000, 5000, 10000];
tt = zeros(1,6);
t = 10000;
x1 = 0.05:0.025:0.525;
x2 = 0.05:0.025:0.525;
x3 = 0;
% Formula1 = 'M f U+ succ';
Formula1 = 'M one U+ succ';
% Formula2 = 'M one U* succ';
s = zeros(1,N+3);
for i = 1:N+3
    s(i) = one(i)+x3;
end
n = length(x1);
nn = length(x2);
SimValue = zeros(9, n*nn);
m = zeros(N+1,3);
for time = 1:6
    tic;
    for i = 3:N+1
        m(i,:) = [0.3, 0.3, 0.3];
    end
    for j = 1:n
        for jj = 1:nn
            m(1,:) = [x1(j), (0.90-x1(j))/2, (0.90-x1(j))/2];
            m(2,:) = [x2(jj), (0.90-x2(jj))/2, (0.90-x2(jj))/2];
            SimValue(1, nn*(j-1)+jj) = x1(j);
            SimValue(2, nn*(j-1)+jj) = x2(jj);
            SimValue(9, nn*(j-1)+jj) = TrueValue(N, m, s);
            l = 0;
            M = 0;
            hvector = zeros(1, times(time));
            [SubFormula1,SubFormula2,OP,TI] = FormulaParse(Formula1);
            for i = 1:times(time)
                k = 0;
                v = 0;
                Path = 0;
                while ((v ~= N + 2)&&(v ~= N + 1)&&(k <= t))
                    m1 = m(v + 1, :);
                    alphabet = [1, 2, 3, 4]; prob = [m1, 1 - sum(m1)];
                    choice = randsrc(1, 1,[alphabet; prob]);
                    if v == N
                        if  choice == 1
                            v = v;
                        elseif ((choice == 2)||(choice == 3))
                            v = N + 1;
                        elseif choice == 4
                            v = N + 2;
                        end
                    elseif choice == 1
                        v = v;
                    elseif choice == 2
                        v = v + 1;
                    elseif choice == 3
                        v = v + 2;
                    else v = N + 2;
                    end
                    k = k + 1;
                    Path = [Path, v];
                end
                if v == N + 1
                    l = l +1;
                end
                % Compute the value for each path
                h = Until(SubFormula1, SubFormula2, OP(2), Path, TI, x3);
                hvector(i) = h;
                M = M + h;
            end
            if OP(2) == '+'
                M = M/l;
                hvector = hvector(hvector ~= 0);
            else
                M = M/times(time);
            end
               SimValue(time + 2, n*(j-1)+jj) = M;
        end
    end
    tt(time) = toc;
    disp(tt(time));
    a = SimValue(9,:);
    string = strcat('Simulation',num2str(times(time)));
    disp(string);
    b = SimValue(2+time,:);
    re = RMSE(a, b);
    disp(re);
end
xlswrite('time10_1.xlsx',tt);
SimValue = SimValue';
xlswrite('Data10_1.xlsx',SimValue);