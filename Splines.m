disp('Natural,Parabolic,and Cubic Spline calculator. necessary input = (x,y,h,A)');
disp('returns a coeffecient matrix of the form [a b c d] for each row');
x = input('enter the x linspace in the form [x1 ... xn]:  ');
y = input('enter the y linspace in the form [y1 ... yn]:  ');
h = input('enter the change in x from pnt to pnt:   ');
A = input('enter the M coefiecient matrix(n-2 x n-2):   ');
w = input('enter 1,2, or 3 for natural, parabolic, or cubic spline respectively:   ');

n = max(size(x));
Y = zeros(n-2, 1);

%creating y vector (1 x n-2)
for i = 1:(n-2)
    next = (y(i) - 2*y(i+1) + y(i+2));
    Y(i) = (6/(h^2))*next;
end
disp(Y)

%Natural Spline: 
%condition S''(xn) = 0 and S''(x1) = 0
%M1 = 0 and M2 = 0
if w == 1
    disp('Natural Spline:');
    nM = inv(A)*Y;
    n = max(size(nM));
    tempM = zeros(n+2,1);
    for i = 1:(n+2)
        if i == 1 || i == n+2
            tempM(i) = 0;
        else
             tempM(i) = nM(i-1); 
        end
    end
    nM = tempM;
    n = max(size(nM));       
    disp(nM);
    C = zeros(n-1,4);
    for i = 1:(n-1)
        C(i,1) = (nM(i+1)-nM(i))/(6*h) ;
        C(i,2) = nM(i)/2;
        C(i,3) = ((y(i+1) - y(i))/h-h*(nM(i+1)+2*nM(i))/6);
        C(i,4) = y(i);
    end
    disp(C)

%Parabolic Runout spline: 
%condition, S''(x1) = c and S''(x2) = c
%M1 = M2 and Mn = M(n-1)    
elseif w == 2
    disp('Parabolic Runout Spline:');
    pM = inv(A)*Y;
    n = max(size(pM));
    v = pM(n);
    pM = [pM(1);pM];
    pM = [pM;v];
    disp(pM);
    n = max(size(pM));
    C = zeros(n-1,4);
    for i = 1:(n-1)
        C(i,1) = (pM(i+1)-pM(i))/(6*h) ;
        C(i,2) = pM(i)/2;
        C(i,3) = ((y(i+1) - y(i))/h-h*(pM(i+1)+2*pM(i))/6);
        C(i,4) = y(i);
    end
    disp(C)

    
%Cubic Runout Spline:
%condition, S(x1) = S(x2) and S(x(n-1))= S(xn)
%M1 = 2M2 - M3  and Mn = 2M(n-1) - M(n-2)
elseif w == 3
    disp('Cubic Runout Spline:');
    cM = inv(A)*Y;
    n = max(size(cM));
    v = (2*cM(n)-cM(n-1));
    cM = [(2*cM(1)-cM(2));cM];
    cM = [cM;v];
    disp(cM);
    n = max(size(cM));
    C = zeros(n-1,4);
    for i = 1:(n-1)
        C(i,1) = (cM(i+1)-cM(i))/(6*h) ;
        C(i,2) = cM(i)/2;
        C(i,3) = ((y(i+1) - y(i))/h-h*(cM(i+1)+2*cM(i))/6);
        C(i,4) = y(i);
    end
    disp(C)

else 
    disp('must enter a value between 1 and 3');
end
a = C(:,1);
b = C(:,2);
c = C(:,3);
d = C(:,4);
%yy = a(x-xi)^3 + b(x-xi)^2 + c(x-xi) + d;
%xx = min(x):h/100:max(x);
xx=-10:.01:30;
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
if w == 1
    title('Natural Spline');
elseif w == 2
    title('Parabolic Runout Spline');
else
    title('Cubic Runout Spline'); 
end
xlabel('Independent Var')
ylabel('Observational Var')
format long
text(6,1.0002,['Maximum occurs at (',num2str(r(2)),',' ,num2str(max(rs)),')'],...
'FontSize',12)

grid on

%X = [(xx-x.)^3; (xx-x.)^2; (xx-x.); 1];
%P = C*X;