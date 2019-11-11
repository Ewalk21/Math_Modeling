x=[-10 0 10 20 30];
y=[.99815 .99987 .99973 .99823 .99567];
p=polyfit(x,y,2);
q=polyfit(x,y,3);
x1=-10:.1:30;
z=polyval(p,x1);
w=polyval(q,x1);
subplot(1,2,1),plot(x,y,'o',x1,z)
title('Least Squares Quadratic Fitting Curve')
xlabel('Temperature')
ylabel('density')
grid on
subplot(1,2,2),plot(x,y,'o',x1,w)
title('Least Squares Cubic Fitting Curve')
xlabel('Temperature')
ylabel('density')
grid on
P=polyder(p);
roots(P)
Q=polyder(q);
roots(Q)

