clear
N = 1000000;
x = zeros(1,N);
y = zeros(1,N);
c = 0;

for j = 1:N
    x(j) = 2*rand(1);
    y(j) = rand(1);
    if y(j) < exp(-(x(j)^2))
        c = c + 1;
    end
end

disp(2*(c/N));

xx = zeros(1,N);
yy = zeros(1,N);
c = 0;

for j = 1:N
    xx(j) = rand(1);
    yy(j) = rand(1);
    if yy(j)^2 + xx(j)^2 <= 1
        c = c + 1;
    end
end
A = (c/N)*4;
%disp(A);

xx = zeros(1,N);
yy = zeros(1,N);
zz = zeros(1,N);
c = 0;

for j = 1:N
    xx(j) = rand(1);
    yy(j) = rand(1);
    zz(j) = rand(1);
    if yy(j)^2 + xx(j)^2 + zz(j)^2 <= 1
        c = c + 1;
    end
end
%V = (c/N)*(3/4)*8;
%disp(V);

