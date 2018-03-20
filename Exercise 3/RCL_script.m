function RCL_script()
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
L=0.6;
C=3.5e-6;
R=250;
init1 = 0; %the initial inductor current
init2 = 500e-9; %the initial capacitor charge


%step
name = '5V step input';
Vin = @(t)  5*(t>=0);
eqn1 = @(x, y, z) z; %dy/dx
eqn2 = @(x, y, z) 1/L*(Vin(x) - 1/C*y - R*z); %dz/dx 
[x,y,z] = RK4(eqn1, eqn2, init1, init2, [0 0.035], 0.000001);
Vout = R*z;
figure('Name',name,'NumberTitle','off');
plot(x, Vout);
title(name)
xlabel('Time (s)')
ylabel('Voltage (V)')
% hold on;

%impulse
name = 'Vin = 5V Impulse';
tau = 3e-6;
Vin = @(t) 5*exp(-t^2/tau);
eqn1 = @(x, y, z) z; %dy/dx
eqn2 = @(x, y, z) 1/L*(Vin(x) - 1/C*y - R*z); %dz/dx 
[x,y,z] = RK4(eqn1, eqn2, init1, init2, [0 0.035], 0.000001);
Vout = R*z;
figure('Name',name,'NumberTitle','off');
plot(x, Vout);
title(name)
xlabel('Time (s)')
ylabel('Voltage (V)')

%square 109
name = 'Vin = Square Wave, A=5, f=109Hz';
figure;
subplot(2,2,1);
Vin = @(t) 5*square(t*2*pi*109);
eqn1 = @(x, y, z) z; %dy/dx
eqn2 = @(x, y, z) 1/L*(Vin(x) - 1/C*y - R*z); %dz/dx 
[x,y,z] = RK4(eqn1, eqn2, init1, init2, [0 0.035], 0.000001);
Vout = R*z;
plot(x, Vout);
title(name)
xlabel('Time (s)')
ylabel('Voltage (V)')

%square 5
name = 'Vin = Square Wave, A=5, f=5Hz';
subplot(2,2,2);
Vin = @(t) 5*square(t*2*pi*5);
eqn1 = @(x, y, z) z; %dy/dx
eqn2 = @(x, y, z) 1/L*(Vin(x) - 1/C*y - R*z); %dz/dx
[x,y,z] = RK4(eqn1, eqn2, init1, init2, [0 0.23], 0.000001);
Vout = R*z;
plot(x, Vout);
title(name)
xlabel('Time (s)')
ylabel('Voltage (V)')

%square 500
name = 'Vin = Square Wave, A=5, f=500Hz';
subplot(2,2,3);
Vin = @(t) 5*square(t*2*pi*500);
eqn1 = @(x, y, z) z; %dy/dx
eqn2 = @(x, y, z) 1/L*(Vin(x) - 1/C*y - R*z); %dz/dx
[x,y,z] = RK4(eqn1, eqn2, init1, init2, [0 0.03], 0.000001);
Vout = R*z;
plot(x, Vout);
title(name)
xlabel('Time (s)')
ylabel('Voltage (V)')

%sine 109
name = 'Vin = Sine Wave, A=5, f=109Hz';
figure;
subplot(2,2,1);
Vin = @(t) 5*sin(t*2*pi*109);
eqn1 = @(x, y, z) z; %dy/dx
eqn2 = @(x, y, z) 1/L*(Vin(x) - 1/C*y - R*z); %dz/dx
[x,y,z] = RK4(eqn1, eqn2, init1, init2, [0 0.035], 0.000001);
Vout = R*z;
plot(x, Vout);
title(name)
xlabel('Time (s)')
ylabel('Voltage (V)')

%sine 5
name = 'Vin = Sine Wave, A=5, f=5Hz';
subplot(2,2,2);
Vin = @(t) 5*sin(t*2*pi*5);
eqn1 = @(x, y, z) z; %dy/dx
eqn2 = @(x, y, z) 1/L*(Vin(x) - 1/C*y - R*z); %dz/dx
[x,y,z] = RK4(eqn1, eqn2, init1, init2, [0 0.25], 0.000001);
Vout = R*z;
plot(x, Vout);
title(name)
xlabel('Time (s)')
ylabel('Voltage (V)')

%sine 500
name = 'Vin = Sine Wave, A=5, f=500Hz';
subplot(2,2,3);
Vin = @(t) 5*sin(t*2*pi*500);
eqn1 = @(x, y, z) z; %dy/dx
eqn2 = @(x, y, z) 1/L*(Vin(x) - 1/C*y - R*z); %dz/dx
[x,y,z] = RK4(eqn1, eqn2, init1, init2, [0 0.02], 0.000001);
Vout = R*z;
plot(x, Vout);
title(name)
xlabel('Time (s)')
ylabel('Voltage (V)')
end