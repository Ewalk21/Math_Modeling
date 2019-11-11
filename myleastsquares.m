

 %lstsqr method
 % data points 
 %x=[1 2 3 4 5];
 %y=[3 1 4 8 12];
 x = input('enter the x linspace:  ');
 y = input('enter the y linspace:  ');
 c = input('enter a coeffeicient 0,1 linespace for the order, ex: 0ax^3 + 1bx^2 + 1cx + 0d, [0 1 1 0]  :');
 
 % method 2
 
 A=[(x.^2)' x' ones(max(size(x)),1)];
 %disp(A);
 C = inv(A'*A)*(A'*y');
 disp(C);
 
 
 % method 1 
 p=polyfit(x,y,4);
 disp(p);
 % method 3
 %B=[sum(x.^4) sum(x.^3) sum(x.^2);sum(x.^3) sum(x.^2) sum(x);sum(x.^2) sum(x) 5];
 %z=[sum(x.^2.*y) sum(x.*y) sum(y)];
 %Coeff2=inv(B)*z'
 
 %xx=[1:.01:5];
 %yy=polyval(p,xx);
 
 %plot(x,y,'o',xx,yy,'r')

