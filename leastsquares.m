

 %lstsqr method
 % data points 
 %x=[1 2 3 4 5];
 %y=[3 1 4 8 12];
 x = input('enter the x linspace:  ');
 y = input('enter the y linspace:  ');
 c = input('enter a coeffeicient 0,1 linespace for the order, ex:  1cx + 0bx^2 + 0ax^3, [1 0 0]  :');
 disp('returns C in the form of [a b c d ...]');
 % method 2
 n = max(size(c));
 A = ones(max(size(x)),1); 
 for i = 1:n
     if c(1,i) == 1
         M = (x.^(i))';
         A = [M,A];
     end
 end
 disp(A);
 C = inv(A'*A)*(A'*y');
 disp("Coeffiecients are: ");
 disp(C');
 
 p=polyfit(x,y,1);
 disp(p);
 % method 1 
 %p=polyfit(x,y,2)
 
 % method 3
 %B=[sum(x.^4) sum(x.^3) sum(x.^2);sum(x.^3) sum(x.^2) sum(x);sum(x.^2) sum(x) 5];
 %z=[sum(x.^2.*y) sum(x.*y) sum(y)];
 %Coeff2=inv(B)*z'
 
 %xx=[1:.01:5];
 %yy=polyval(p,xx);
 
 %plot(x,y,'o',xx,yy,'r')
 %yy=polyval(p,xx);
 %disp(max(yy));
 %q=polyder(p);
 %r=roots(q);
 %disp(r);
 %xx=-10:.01:30;
 %plot(x,y,'o',xx,yy,'r');
