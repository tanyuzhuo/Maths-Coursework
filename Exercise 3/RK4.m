function [xFull, yFull, zFull] = RK4(eqn1, eqn2, init1, init2, time, h)
%This function returns three vectors, one of the time range used for
%calculations, and the other two with the outputs of the coupled differential equation. 

%eqn1: the differential equation to be used, in the form y' = f(x,y,z)
%eqn2: the second differential equation, in the form z' = f(x,y,z)
%init1/2: the initial conditions for both input equations
%time: [t0 tf] defining the time range to be used
%h: the step size to be used

%xFull, yFull, and zFull are created at the beginning for efficiency
%yFull and zFull are created in terms of xFull to ensure that they have the
%same time
xFull = (time(1):h:time(2))';
yFull = 0*xFull;
zFull = yFull;
yFull(1) = init1; %defining the intial conditions
zFull(1) = init2;

for i = 1:(time(2)-time(1))/h
    xTemp = xFull(i); %To minimise the times that the arrays are accessed, temporary values are assigned
    yTemp = yFull(i);
    zTemp = zFull(i);
    
    k11 = h*eqn1(xTemp, yTemp, zTemp); %The 4th order RK methods are used for both equations
    k12 = h*eqn1(xTemp + 0.5*h, yTemp + 0.5*k11, zTemp + 0.5*k11);
    k13 = h*eqn1(xTemp + 0.5*h, yTemp + 0.5*k12, zTemp + 0.5*k12);
    k14 = h*eqn1(xTemp + h, yTemp + k13, zTemp + k13);
    yFull(i+1) = yTemp + k11*(1/6) + k12*(1/3) + k13*(1/3) + k14*(1/6); %the next value in the array is set as the result of the RK4 method

    k21 = h*eqn2(xTemp, yTemp, zTemp);
    k22 = h*eqn2(xTemp + 0.5*h, yTemp + 0.5*k21, zTemp + 0.5*k21);
    k23 = h*eqn2(xTemp + 0.5*h, yTemp + 0.5*k22, zTemp + 0.5*k22);
    k24 = h*eqn2(xTemp + h, yTemp + k23, zTemp + k23);
    zFull(i+1) = zTemp + k21*(1/6) + k22*(1/3) + k23*(1/3) + k24*(1/6);
end

end
