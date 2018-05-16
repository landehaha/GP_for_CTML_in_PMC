function X = USample(TrainData,m)
[n,l] = size(TrainData);
if mod(n,m) ~= 0
    error('False input');
end
k = n/m;
X = zeros(m,l);
for i = 1:m
    X(i,:) = TrainData(k*(i-1)+1,:);
end
