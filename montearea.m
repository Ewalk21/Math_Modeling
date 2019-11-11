clear

x=0:.0001:1;
y=x.^2;
plot(x,y,'g')

hold on
    Nrand =input('How Many Random Numbers ');
    NInside=0;
    for i=1:Nrand
        Xrand(i)=rand;
        Yrand(i)=rand;
        plot(Xrand,Yrand,'.')

        axis tight
        M(i)=getframe;

        if(Yrand(i)<= (Xrand(i))^2)
            NInside = NInside +1;
        end
    end
    disp(['Total Generated: ' num2str(Nrand) ' Inside Pts: ' ...
        num2str(NInside)]);
    Areapprox=NInside/Nrand;
    disp(['Approximated area: ' num2str(Areapprox)]);
    
    