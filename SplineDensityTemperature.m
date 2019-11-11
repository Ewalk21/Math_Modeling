% Parabolic runout spline
% By Ryan French
% Additions by Mohamed Allali

x = [-10 0 10 20 30];
y = [.99815 .99987 .99973 .99823 .99567];
xx=-10:.01:30;
h = 10;
A = [[5 1 0];[1 4 1];[0 1 5]];
B = (6/(h^2))*[(y(1)-(2*y(2))+y(3)); (y(2)-(2*y(3))+y(4)); (y(3)-(2*y(4))+y(5))];
Mtemp = inv(A)*B;
M = zeros(5,1);
M(1) = Mtemp(1); M(2) = Mtemp(1); M(3) = Mtemp(2); M(4) = Mtemp(3); M(5) = Mtemp(3);
a = zeros(5,1); b = zeros(5,1); c = zeros(5,1); d=zeros(5,1);

for i = 1:4
    a(i) = (M(i+1) - M(i))/(6*h);
    b(i) = M(i)/2;
    c(i) = ((y(i+1)-y(i))/h - (M(i+1)+2*M(i))*h/6);
    d(i) = y(i);
end
disp(a);
disp(b);
disp(c);
disp(d);

rs = zeros(1,length(xx));

for j = 1:length(xx)
    z = xx(j);
	if (x(1) <= z && z< x(2))
		i = 1;
	elseif(x(2) <= z && z < x(3))
		i = 2;
	elseif(x(3) <= z && z < x(4))
		i=3;
	else
		i=4;
    end
    rs(j) = a(i)*(z - x(i))^3 + b(i)*(z - x(i))^2 + c(i)*(z - x(i)) + d(i);
end

p2=[a(2) b(2) c(2) d(2)];
q=polyder(p2);
r=roots(q);
plot(x,y,'o',xx,rs,'g',r(2),max(rs),'*r');
title('Parabolic Runout Spline')
xlabel('Temperature {\circC}')
ylabel('Density {\it (g/{cm}^3})')
format long
text(6,1.0002,['Maximum density occurs at (',num2str(r(2)),',' ,num2str(max(rs)),')'],...
'FontSize',12)

grid on
