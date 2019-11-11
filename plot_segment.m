function plot_segment(i, x, y, a, b, c, d, step)
    xs = x(i):10/step:x(i+1);
    ys = a(i)*(xs-x(i)).^3 + b(i)*(xs-x(i)).^2 + c(i)*(xs-x(i)) + d(i);
    plot(xs,ys)
end

function [maxx,maxy] = find_max_loc(x,y,a,b,c,d,step)
    xs = x(2):10/step:x(3);
    ys = a(2)*(xs-x(2)).^3 + b(2)*(xs-x(2)).^2 + c(2)*(xs-x(2)) + d(2);
    [maxy, idx] = max(ys);
    maxx = xs(idx);
end

n = 10;
A = zeros(n-2,n);
for i=1:(n-2)
    A(i,i) = 1;
    A(i,i+1) = 4;
    A(i,i+2) = 1;
end
A = A(:,2:n-1)

x = linspace(3.0,3.9,10);
y = [20.08; 22.2; 24.53; 27.12; 29.96; 33.11; 36.6; 40.45; 44.7; 49.4];
h = 0.1;
b = zeros(n-2,1);
for (i = 1:n-2)
    b(i) = (y(i)-2*y(i+1)+y(i+2))*6/(h^2);
end
m = A\b;
m = [0; m; 0];

a = zeros(n-2,1);
b = zeros(n-2,1);
c = zeros(n-2,1);
d = zeros(n-2,1);
for i=1:(n-2)
    a(i) = (m(i+1)-m(i))/(6*h);
    b(i) = m(i)/2;
    c(i) = (y(i+1)-y(i))/h - ((m(i+1)+2*m(i))*h)/6;
    d(i) = y(i);
end
a
b
c
d

step = 100;
hold on
for i = 1:(length(x)-1)
    plot_segment(i, x, y, a, b, c, d, step)
end
hold off