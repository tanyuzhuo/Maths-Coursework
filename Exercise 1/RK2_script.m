function RK2_script()

%performs calls to the RK2 function for the specified cases, as well as
%those added by the group.

%Each call is of the same structure:
%Input signal
%Defining the differential equation
%Calling the RK2 function
%Plotting the output

%--------------------------------------------------------------------------
%Step signal at t=0 and amplitude 2.5V
%--------------------------------------------------------------------------
Vin = @(t)2.5*(t>=0);
eqn = @(t, Vout)10000*(Vin(t)-Vout);
[x,y] = RK2(eqn, 5, [0 1e-3], 0.0000001);
figure
plot(x,y)
title("Step Response")
xlabel("Time (s)")
ylabel("Vout (V)")

%--------------------------------------------------------------------------
%Impulsive signal and delay: Vin=2.5*exp(-t^2/100(us)^2)
%--------------------------------------------------------------------------
Vin = @(t) 2.5*exp((-t.^2)/1e-8);
eqn = @(t, Vout) 10000*(Vin(t)-Vout);
[x,y] = RK2(eqn, 5, [0 1e-3], 0.0000001);
figure
plot(x,y)
title("Impulse (t^2) Response")
xlabel("Time (s)")
ylabel("Vout (V)")

%--------------------------------------------------------------------------
%Impulsive signal and delay: Vin=2.5*exp(-t/100us)
%--------------------------------------------------------------------------
Vin = @(t)(2.5*exp((-t)/1e-4));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 1e-3], 0.0000001);
figure
plot(x,y)
title("Impulse Response")
xlabel("Time (s)")
ylabel("Vout (V)")

%--------------------------------------------------------------------------
%Sine wave of amplitude 5V and periods 100us, 10us, 500us, and 1000us
%--------------------------------------------------------------------------
figure
xlabel("Time (s)")
ylabel("Vout (V)")
title("Sine Responses")
%p=10us -> f=100000
Vin = @(t)(5*sin(2*pi*100000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 0.6e-3], 0.000001);
subplot(2,2,1)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("100kHz Sine Wave")

%p=100us -> f=10000
Vin = @(t)(5*sin(2*pi*10000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 1e-3], 0.000001);
subplot(2,2,2)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("10kHz Sine Wave")

%p=500us -> f=2000
Vin = @(t)(5*sin(2*pi*2000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 3e-3], 0.000001);
subplot(2,2,3)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("2kHz Sine Wave")

%p=1000us -> f=1000
Vin = @(t)(5*sin(2*pi*1000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 5e-3], 0.000001);
subplot(2,2,4)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("1kHz Sine Wave")
%--------------------------------------------------------------------------
%Square wave of amplitude 5V and periods 100us, 10us, 500us, and 1000us
%--------------------------------------------------------------------------
figure
%p=10us -> f=100000
Vin = @(t)(5*square(2*pi*100000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 0.5e-3], 0.0000001);
subplot(2,2,1)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("100kHz squarewave")

%p=100us -> f=10000
Vin = @(t)(5*square(2*pi*10000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 1e-3], 0.0000001);
subplot(2,2,2)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("10kHz squarewave")

%p=500us -> f=2000
Vin = @(t)(5*square(2*pi*2000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 2e-3], 0.0000001);
subplot(2,2,3)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("2kHz squarewave")

%p=1000us -> f=1000
Vin = @(t)(5*square(2*pi*1000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 4e-3], 0.0000001);
subplot(2,2,4)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("1kHz squarewave")
%--------------------------------------------------------------------------
%Sawtooth wave of amplitude 5V and periods 100us, 10us, 500us, and 1000us
%--------------------------------------------------------------------------
figure
%p=10us -> f=100000
Vin = @(t)(5*sawtooth(2*pi*100000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 0.4e-3], 0.00000001);
subplot(2,2,1)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("100kHz sawtooth")

%p=100us -> f=10000
Vin = @(t)(5*sawtooth(2*pi*10000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 0.6e-3], 0.0000001);
subplot(2,2,2)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("10kHz sawtooth")

%p=500us -> f=2000
Vin = @(t)(5*sawtooth(2*pi*2000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 1.5e-3], 0.0000001);
subplot(2,2,3)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("2kHz sawtooth")

%p=1000us -> f=1000
Vin = @(t)(5*sawtooth(2*pi*1000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 5e-3], 0.0000001);
subplot(2,2,4)
plot(x,y)
xlabel("Time (s)")
ylabel("Vout (V)")
title("1kHz sawtooth")
end