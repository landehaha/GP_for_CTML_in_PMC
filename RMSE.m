function r = RMSE(eval, true)
if length(eval) ~= length(true)
    error('The length of eval an true must be matched');
end
l = length(eval);
ll = l/5;
r1 = 0;
r2 = zeros(1,5);
r3 = 0;
for i = 1:l
    r1 = r1 + (eval(i) - true(i))^2;
end
r1 = sqrt(r1/l);
for i = 1:5
    for j = 1:ll
        r2(i) = r2(i) + (eval(5*(j-1)+i) - true(5*(j-1)+i))^2;
    end
    r2(i) = sqrt(r2(i)/ll);
end
for i = 1:5
    r3 = r3 + (r2(i) - r1)^2;
end
r3 = r3/5;
r = [r1, r3*1.96];
