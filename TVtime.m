clear;
clc;
% 10 15 20 25 30
tic;
N = 30;
x2 = 0.05:0.025:0.525;
x1 = 0.25;
n = length(x1);
l = length(x2);
SimValue = zeros(1, n*l);
m = zeros(N+1,3);
for i = 3:N+1
    m(i,:) = [0.3, 0.3, 0.3];
end
s = zeros(1,N+3);
for i = 1:N+3
    s(i) = 1;
%     s(i) = f(i) + 1;
end
for j = 1:n
    for jj = 1:l
    m(1,:) = [x1(j), (0.90-x1(j))/2, (0.90-x1(j))/2];
    m(2,:) = [x2(jj), (0.90-x2(jj))/2, (0.90-x2(jj))/2];
    SimValue(jj) = TrueValue(N, m, s);
%     SimValue(n*(j-1)+jj) = TrueValue(N, m, s);
    end
end
toc;
plot(x2,SimValue);