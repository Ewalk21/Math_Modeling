for i=1:10
    for j=1:10
        [t,y]=ode45(@diffyqmodel,[0:.1:15],[.1*i,.1*j]);
        plot(y(:,1),y(:,2),'b');
        
        hold on
    end
end