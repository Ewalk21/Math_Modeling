%predator-prey model
%dx/dt = -.4xy + .5x
%dy/dt = .6xy - .3y
% crit pnt = (0,0) , ( .5, 1.25)

function yp = diffyqmodel(t,y)

xx = y(1);
yy = y(2);
yp1 = -.4*xx*yy + .6*xx;
yp2 = -.7*xx*yy + .3*yy;
yp=[yp1; yp2];