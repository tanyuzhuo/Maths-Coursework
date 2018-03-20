function RK2_script()

%performs calls to the RK2 function for the specified cases, as well as
%those added by the group.

%All time intervals for non periodic functions are chosen to best represent
%the transient behaviour. The steady state behaviour for these functions
%a constant at the same value as the input, therefore no effort is made to
%show the steady state. 

%The periodic functions have two plots made, one with the transient behaviour
%(the initial response to the initial condition) as well as the steady
%state response. This is due to the changing nature of the input signal,
%meaning the output voltage is no longer trivial. 

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
plot(x,y)

%--------------------------------------------------------------------------
%Impulsive signal and delay: Vin=2.5*exp(-t^2/100(us)^2)
%--------------------------------------------------------------------------
Vin = @(t) 2.5*exp((-t.^2)/1e-8);
eqn = @(t, Vout) 10000*(Vin(t)-Vout);
[x,y] = RK2(eqn, 5, [0 1e-3], 0.0000001);
plot(x,y)

%--------------------------------------------------------------------------
%Impulsive signal and delay: Vin=2.5*exp(-t/100us)
%--------------------------------------------------------------------------
Vin = @(t)(2.5*exp((-t)/1e-4));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 1e-3], 0.0000001);
plot(x,y)

%--------------------------------------------------------------------------
%Sine wave of amplitude 5V and periods 100us, 10us, 500us, and 1000us
%--------------------------------------------------------------------------
%Initial Transient
%--------------------------------------------------------------------------
%p=10us -> f=100000
Vin = @(t)(5*sin(2*pi*100000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 0.6e-3], 0.0000001);
plot(x,y)

%p=100us -> f=10000
Vin = @(t)(5*sin(2*pi*10000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 10e-3], 0.0000001);
plot(x,y)

%p=500us -> f=2000
Vin = @(t)(5*sin(2*pi*2000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 10e-3], 0.0000001);
plot(x,y)

%p=1000us -> f=1000
Vin = @(t)(5*sin(2*pi*1000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 10e-3], 0.0000001);
plot(x,y)
%--------------------------------------------------------------------------
%Steady State
%--------------------------------------------------------------------------
%p=10us -> f=100000
Vin = @(t)(5*sin(2*pi*100000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 0, [0 10e-3], 0.0000001);
L = length(y);
q = 79*round(L/80);
plot(x(q:end),y(q:end))

%p=100us -> f=10000
Vin = @(t)(5*sin(2*pi*10000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 10e-3], 0.0000001);
L = length(y);
q = 7*round(L/8);
plot(x(q:end),y(q:end))

%p=500us -> f=2000
Vin = @(t)(5*sin(2*pi*2000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 10e-3], 0.0000001);
L = length(y);
q = round(L/2);
plot(x(q:end),y(q:end))

%p=1000us -> f=1000
Vin = @(t)(5*sin(2*pi*1000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 10e-3], 0.0000001);
L = length(y);
q = round(L/4);
plot(x(q:end),y(q:end))
%--------------------------------------------------------------------------
%Square wave of amplitude 5V and periods 100us, 10us, 500us, and 1000us
%--------------------------------------------------------------------------
%Initial Transient
%--------------------------------------------------------------------------
%p=10us -> f=100000
Vin = @(t)(5*square(2*pi*100000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 1e-3], 0.00000001);
plot(x,y)

%p=100us -> f=10000
Vin = @(t)(5*square(2*pi*10000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 0.5e-3], 0.00000001);
plot(x,y)

%p=500us -> f=2000
Vin = @(t)(5*square(2*pi*2000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 2e-3], 0.0000001);
plot(x,y)

%p=1000us -> f=1000
Vin = @(t)(5*square(2*pi*1000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 4e-3], 0.0000001);
plot(x,y)
%--------------------------------------------------------------------------
%Steady State
%--------------------------------------------------------------------------
%p=10us -> f=100000
Vin = @(t)(5*square(2*pi*100000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 2e-3], 0.00000001);
L = length(y);
q = round((9*L)/10);
plot(x(q:end),y(q:end))

%p=100us -> f=10000
Vin = @(t)(5*square(2*pi*10000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 2e-3], 0.00000001);
L = length(y);
q = round(L/2);
plot(x(q:end),y(q:end))

%p=500us -> f=2000
Vin = @(t)(5*square(2*pi*2000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 2e-3], 0.0000001);
L = length(y);
q = round(L/4);
plot(x(q:end),y(q:end))

%p=1000us -> f=1000
Vin = @(t)(5*square(2*pi*1000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 5e-3], 0.0000001);
L = length(y);
q = round(L/5);
plot(x(q:end),y(q:end))

%--------------------------------------------------------------------------
%Sawtooth wave of amplitude 5V and periods 100us, 10us, 500us, and 1000us
%--------------------------------------------------------------------------
%Initial Transient
%--------------------------------------------------------------------------
%p=10us -> f=100000
Vin = @(t)(5*sawtooth(2*pi*100000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 0.5e-3], 0.00000001);
plot(x,y)

%p=100us -> f=10000
Vin = @(t)(5*sawtooth(2*pi*10000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 1e-3], 0.0000001);
plot(x,y)

%p=500us -> f=2000
Vin = @(t)(5*sawtooth(2*pi*2000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 1.5e-3], 0.0000001);
plot(x,y)

%p=1000us -> f=1000
Vin = @(t)(5*sawtooth(2*pi*1000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 2e-3], 0.0000001);
plot(x,y)

%--------------------------------------------------------------------------
%Steady State
%--------------------------------------------------------------------------
%p=10us -> f=100000
Vin = @(t)(5*sawtooth(2*pi*100000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 1e-3], 0.00000001);
L = length(y);
q = round((7*L)/8);
plot(x(q:end),y(q:end))

%p=100us -> f=10000
Vin = @(t)(5*sawtooth(2*pi*10000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 4e-3], 0.0000001);
L = length(y);
q = round((3*L)/4);
plot(x(q:end),y(q:end))

%p=500us -> f=2000
Vin = @(t)(5*sawtooth(2*pi*2000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 4e-3], 0.0000001);
L = length(y);
q = round(L/2);
plot(x(q:end),y(q:end))

%p=1000us -> f=1000
Vin = @(t)(5*sawtooth(2*pi*1000*t));
eqn = @(t, Vout)(10000*(Vin(t)-Vout));
[x,y] = RK2(eqn, 5, [0 5e-3], 0.0000001);
L = length(y);
q = round(L/2);
plot(x(q:end),y(q:end))
plot(x,y)
end

