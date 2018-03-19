function [xFull, yFull] = RK2(eqn, init, time, h)
%Function to take in an equation and use one of the three specified methods
%to give a solution. 
%the desired first order ODE should be submitted through the eqn variable,
%init is the initial condition y(x0), time is a vector where the first 
%value is the start time, and the second value is the finish time, and h is
%the associated step size.
%Highlighted by comments are the lines that can be changed to switch
%between Heun's method, the midpoint method, and Ralston's method. This is
%done by just changing the coefficient values, rather than the full
%equation found in the for loop.

%This function in its current state will print a plot of the ODE.

xFull = (time(1):h:time(2))';
yFull = 0*xFull;
yFull(1)=init;

%-----------------------------------------------------------------------
%UNCOMMENT FOR HEUN:
a=0.5; b=0.5; p=1; q=1;
%UNCOMMENT FOR MIDPOINT:
%a=0; b=1; p=0.5; q=0.5;
%UNCOMMENT FOR RALSTON:
%a=1/4; b=3/4; p=2/3; q=2/3;
%-----------------------------------------------------------------------


for i = 1:(time(2)-time(1))/h
    xTemp = xFull(i);
    yTemp = yFull(i);
    k1 = eqn(xTemp, yTemp);
    k2 = eqn(xTemp+p*h, yTemp+h*q*k1);
    yFull(i+1) = yTemp + h*(a*k1+b*k2);
end  


end

