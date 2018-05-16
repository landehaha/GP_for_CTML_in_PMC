function h = TrueValue(N, m, s)
P = createMatrix(N, m);
PP = P(1:N+1, 1:N+1);
Pg = P(1:N+1,N+2);
I = eye(N+1);
R = ones(1,N+1);
R = diag(R);
S = diag(s);
S = S(1:N+1,1:N+1);
NN = I - PP;
NNN = I - R*PP;
h1 = NN\S/NN*Pg;
h2 = NNN\R*Pg;
h = h1(1)/h2(1);
end