function [xFull, yFull, zFull] = RK4(eqn1, eqn2, init1, init2, time, h)

xFull = (time(1):h:time(2))';
yFull = 0*xFull;
zFull = yFull;
yFull(1) = init1;
zFull(1) = init2;

for i = 1:(time(2)-time(1))/h
    xTemp = xFull(i);
    yTemp = yFull(i);
    zTemp = zFull(i);
    
    k11 = h*eqn1(xTemp, yTemp, zTemp);
    k12 = h*eqn1(xTemp + 0.5*h, yTemp + 0.5*k11, zTemp + 0.5*k11);
    k13 = h*eqn1(xTemp + 0.5*h, yTemp + 0.5*k12, zTemp + 0.5*k12);
    k14 = h*eqn1(xTemp + h, yTemp + k13, zTemp + k13);
    yFull(i+1) = yTemp + k11*(1/6) + k12*(1/3) + k13*(1/3) + k14*(1/6);

    k21 = h*eqn2(xTemp, yTemp, zTemp);
    k22 = h*eqn2(xTemp + 0.5*h, yTemp + 0.5*k21, zTemp + 0.5*k21);
    k23 = h*eqn2(xTemp + 0.5*h, yTemp + 0.5*k22, zTemp + 0.5*k22);
    k24 = h*eqn2(xTemp + h, yTemp + k23, zTemp + k23);
    zFull(i+1) = zTemp + k21*(1/6) + k22*(1/3) + k23*(1/3) + k24*(1/6);
end

end
