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
Re0 = 50000; St0 = 0.25; nu = 1e-6;
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
delta_t = 0.01; T = 4; t = 0:delta_t:T;

%% Export single swimmer data

% Define uniform velocity field
gridsize = 128;
x_grid = linspace(-0.25,4.5,gridsize);
y_grid = linspace(-0.5,0.5,gridsize);
[X_grid,Y_grid] = meshgrid(x_grid,y_grid);
U = U0*ones(gridsize,gridsize);
V = zeros(gridsize,gridsize);

% Preallocate space for fish boundary data
BDY = zeros(length(Fish),2);

% Store data at each time step
for time = 1:length(t)
    
    % Define fish boundary
    BDY(:,1) = Fish(:,1);
    BDY(:,2) = Fish(:,2)+y(Fish(:,1),t(time),0);
    
    % Define velocity field
    V_single = [X_grid(:),Y_grid(:),U(:),V(:)];
    
    % Store boundary data (inviscid)
    filename_interface = ['interface_',num2str(time,'%05.f'),'.dat'];
    pathname_interface = ['queen2src/mackerel/inviscid_swimmer/',...
        filename_interface];
    writematrix(BDY,pathname_interface);
    
    % Store velocity field data (inviscid)
    filename_velocity = ['mackerel_',num2str(time,'%05.f'),'.dat'];
    pathname_velocity = ['queen2src/mackerel/inviscid_swimmer/',...
        filename_velocity];
    writematrix(V_single,pathname_velocity);
    
    % Store boundary data (viscous)
    filename_interface = ['interface_',num2str(time,'%05.f'),'.dat'];
    pathname_interface = ['queen2src/mackerel/viscous_swimmer/',...
        filename_interface];
    writematrix(BDY,pathname_interface);
    
    % Store velocity field data (viscous)
    filename_velocity = ['mackerel_',num2str(time,'%05.f'),'.dat'];
    pathname_velocity = ['queen2src/mackerel/viscous_swimmer/',...
        filename_velocity];
    writematrix(V_single,pathname_velocity);
    
end

%% Export rectangular pattern of swimmers data

%% Lateral Separation = 0.3L

% Define uniform velocity field
x_grid = linspace(-2.5,3.5,240);
y_grid = linspace(-0.6,0.6,120);
[X_grid,Y_grid] = meshgrid(x_grid,y_grid);
U = U0*ones(size(X_grid));
V = zeros(size(X_grid));

% Set lateral separation
w = 0.3; X_03 = zeros(9*length(Fish)+8,2);

% Store fish position over time
for time = 1:length(t)
    
    X_03(:,1) = [Fish(:,1)+2;NaN;Fish(:,1)+2;NaN;Fish(:,1)+2;NaN;...
        Fish(:,1);NaN;Fish(:,1);NaN;Fish(:,1);NaN;...
        Fish(:,1)-2;NaN;Fish(:,1)-2;NaN;Fish(:,1)-2];
    
    X_03(:,2) = [Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w];
    
    V_03 = [X_grid(:),Y_grid(:),U(:),V(:)];
    
    filename_interface = ['interface_',num2str(time,'%05.f'),'.dat'];
    pathname_interface = ['queen2src/mackerel/w_03/',filename_interface];
    
    filename_velocity = ['mackerel_',num2str(time,'%05.f'),'.dat'];
    pathname_velocity = ['queen2src/mackerel/w_03/',filename_velocity];
    
    writematrix(X_03,pathname_interface);
    writematrix(V_03,pathname_velocity);
    
end

%% Lateral Separation = 0.4L

% Define uniform velocity field
x_grid = linspace(-2.5,3.5,240);
y_grid = linspace(-0.6,0.6,120);
[X_grid,Y_grid] = meshgrid(x_grid,y_grid);
U = U0*ones(size(X_grid));
V = zeros(size(X_grid));

% Set lateral separation
w = 0.4; X_04 = zeros(9*length(Fish)+8,2);

% Store fish position over time
for time = 1:length(t)
    
    X_04(:,1) = [Fish(:,1)+2;NaN;Fish(:,1)+2;NaN;Fish(:,1)+2;NaN;...
        Fish(:,1);NaN;Fish(:,1);NaN;Fish(:,1);NaN;...
        Fish(:,1)-2;NaN;Fish(:,1)-2;NaN;Fish(:,1)-2];
    
    X_04(:,2) = [Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w];
    
    V_04 = [X_grid(:),Y_grid(:),U(:),V(:)];
    
    filename_interface = ['interface_',num2str(time,'%05.f'),'.dat'];
    pathname_interface = ['queen2src/mackerel/w_04/',filename_interface];
    
    filename_velocity = ['mackerel_',num2str(time,'%05.f'),'.dat'];
    pathname_velocity = ['queen2src/mackerel/w_04/',filename_velocity];
    
    writematrix(X_04,pathname_interface);
    writematrix(V_04,pathname_velocity);
    
end

%% Lateral Separation = 0.7L

% Define uniform velocity field
x_grid = linspace(-2.5,3.5,240);
y_grid = linspace(-1.0,1.0,120);
[X_grid,Y_grid] = meshgrid(x_grid,y_grid);
U = U0*ones(size(X_grid));
V = zeros(size(X_grid));

% Set lateral separation
w = 0.7; X_07 = zeros(9*length(Fish)+8,2);

% Store fish position over time
for time = 1:length(t)
    
    X_07(:,1) = [Fish(:,1)+2;NaN;Fish(:,1)+2;NaN;Fish(:,1)+2;NaN;...
        Fish(:,1);NaN;Fish(:,1);NaN;Fish(:,1);NaN;...
        Fish(:,1)-2;NaN;Fish(:,1)-2;NaN;Fish(:,1)-2];
    
    X_07(:,2) = [Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w];
    
    V_07 = [X_grid(:),Y_grid(:),U(:),V(:)];
    
    filename_interface = ['interface_',num2str(time,'%05.f'),'.dat'];
    pathname_interface = ['queen2src/mackerel/w_07/',filename_interface];
    
    filename_velocity = ['mackerel_',num2str(time,'%05.f'),'.dat'];
    pathname_velocity = ['queen2src/mackerel/w_07/',filename_velocity];
    
    writematrix(X_07,pathname_interface);
    writematrix(V_07,pathname_velocity);
    
end

%% Lateral Separation = L

% Define uniform velocity field
x_grid = linspace(-2.5,3.5,240);
y_grid = linspace(-1.2,1.2,120);
[X_grid,Y_grid] = meshgrid(x_grid,y_grid);
U = U0*ones(size(X_grid));
V = zeros(size(X_grid));

% Set lateral separation
w = 1.0; X_10 = zeros(9*length(Fish)+8,2);

% Store fish position over time
for time = 1:length(t)
    
    X_10(:,1) = [Fish(:,1)+2;NaN;Fish(:,1)+2;NaN;Fish(:,1)+2;NaN;...
        Fish(:,1);NaN;Fish(:,1);NaN;Fish(:,1);NaN;...
        Fish(:,1)-2;NaN;Fish(:,1)-2;NaN;Fish(:,1)-2];
    
    X_10(:,2) = [Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)+w;NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0);NaN;...
        Fish(:,2)+y(Fish(:,1),t(time),0)-w];
    
    V_10 = [X_grid(:),Y_grid(:),U(:),V(:)];
    
    filename_interface = ['interface_',num2str(time,'%05.f'),'.dat'];
    pathname_interface = ['queen2src/mackerel/w_10/',filename_interface];
    
    filename_velocity = ['mackerel_',num2str(time,'%05.f'),'.dat'];
    pathname_velocity = ['queen2src/mackerel/w_10/',filename_velocity];
    
    writematrix(X_10,pathname_interface);
    writematrix(V_10,pathname_velocity);
    
end
