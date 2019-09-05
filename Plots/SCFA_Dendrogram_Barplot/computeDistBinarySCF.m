function [d_x, d_y] = computeDistBinarySCF(A)
[m, n] = size(A);
d_x = zeros(m);
for i = 1:m
    for j = i+1:m
        X1 = {A{i,:}};
        X2 = {A{j,:}};
        u = length(X1);
        d_x(i,j) = 0;
        for k = 1:u
            d_x(i,j) = d_x(i,j) + sum(X1{k}~=X2{k});
        end
    end
end

d_y = zeros(n);
for i = 1:n
    for j = i+1:n
        X1 = {A{:,i}};
        X2 = {A{:,j}};
        u = length(X1);
        d_y(i,j) = 0;
        for k = 1:u
            d_y(i,j) = d_y(i,j) + sum(X1{k}~=X2{k});
        end
    end
end
