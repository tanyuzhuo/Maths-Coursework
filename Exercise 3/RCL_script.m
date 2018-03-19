function RCL_script()
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
L=0.6;
C=3.5e-6;
R=250;
init1 = 0; %the initial inductor current
init2 = 500e-9; %the initial capacitor charge
 

Vin = @(t)  5*(t>=0);
eqn1 = @(x, y, z) z; %dy/dx
eqn2 = @(x, y, z) 1/L*(Vin(x) - 1/C*y - R*z); %dz/dx 
[x,y,z] = RK4(eqn1, eqn2, init1, init2, [0 0.03], 0.0000001);
Vout = R*z;
plot(x, Vout);
end

