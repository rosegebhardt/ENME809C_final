%% Compute power and efficiency based on Lighthill model

clearvars; close all; clc;

%% Data definition

% Define airfoil shape
radius = 1.2; x_disp = -0.1; y_disp = 0.0;
k = x_disp + sqrt(radius^2-y_disp^2);
angle = linspace(0,2*pi,200);
circle = radius*exp(1i.*angle) + (x_disp + 1i*y_disp);
fish = circle + ((k^2)./circle);

% Center and nondimensionalize length
Fish = [real(fish).', imag(fish).'];
Fish(:,1) = Fish(:,1) - min(Fish(:,1));
L = max(Fish(:,1));
Fish = Fish/L;

% Swimming parameters from literature
Re0 = 50000; St0 = 0.25; nu = 1e-6; rho = 1e3;
lamb = 0.95; tail_amp = 0.1; % nondimensionalized

% Derived swimming parameters
k = 2*pi/lamb;
U0 = Re0*nu;
freq = 2*St0*tail_amp/U0;
omega = 2*pi*freq;

% Define undulatory amplitude of fish
a0 = 0.02; a1 = -0.08; a2 = 0.16;
a = @(x) a0 + a1*x + a2*x.^2;

% Define wave propagation of fish
y = @(x,t,phi) a(x).*sin(k*x - omega*t - phi);

% Time step and interval
delta_t = 0.01; T = 2*pi/omega; t_cycle = 0:delta_t:T;

%% Lighthill model

% Swimming and lateral velocity
U = U0; V = omega/k;

% Lateral velocity at tip of tail
a_L = a(1); dy_dt = -a_L*omega*cos(k - omega*t_cycle);

% Cycle-averaged lateral velocity at tail tip
W = sum(abs(dy_dt))/length(t_cycle);

% Velocity of water moved by tail segment
w = W*(V-U)/V;

% Diameter of the fish near the tail
d = 2*Fish(172,2);

% Added mass
m_a = pi*rho*d^2/4;

% Power calculations
P_total = m_a*w*U*W;
P_wake = U*m_a*w^2/2;
P_thrust = m_a*(w*W*U - w^2*U/2);

% Efficiency calculation
eta = P_thrust/P_total;
