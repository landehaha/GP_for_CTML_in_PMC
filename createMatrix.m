function P = createMatrix(N, g)
N = N + 3;
P = zeros(N, N);
P(N - 1, N - 1) = 1;
P(N, N) = 1;
for i = 1 : N - 3
    P(i, i) = g(i,1);
    P(i, i+1) = g(i,2);
    P(i, i+2) = g(i,3);
    P(i, N) = 1 - g(i,1) - g(i,2) - g(i,3);
end
P(N - 2, N - 2) = g(N - 2,1);
P(N - 2, N - 1) = g(N - 2,2) + g(N - 2,3);
P(N - 2, N) = 1 - g(N - 2,1) - g(N - 2,2) - g(N - 2,3);