%% Generate videos of inputs for rectangular pattern simulation

clearvars; close all; clc;

%% Lateral separation w = 0.3L

clear video;

x_grid = -3:0.5:4; y_grid = -2:0.5:2;
[X_grid,Y_grid] = meshgrid(x_grid,y_grid);
U_grid = 0.25*ones(size(X_grid)); 
V_grid = zeros(size(X_grid));

% Plot fish position over time
for time = 1:401
    
    data_file = ['w_03/interface_',num2str(time,'%05.f'),'.dat'];
    interface = load(data_file);

    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
     quiver(X_grid,Y_grid,U_grid,V_grid,'b','LineWidth',1,...
        'autoscale','off'); 
    hold on;
    
    plot(interface(:,1),interface(:,2),'k','Linewidth',2); hold on;
    
    % Define axis and background color
    axis equal;
    xlim([-3,4]); ylim([-2,2]);
    set(gca,'color',[0.75 0.9 1])
    
    % Label plot
    xlabel('Longitudinal (Swimming) Direction',...
        'interpreter','latex','Fontsize',16);
    ylabel('Lateral Direction',...
        'interpreter','latex','Fontsize',16);
    title('Rectangular Pattern with Lateral Separation $w = 0.3L$',...
        'interpreter','latex','Fontsize',18);
    
    % Reset plot
    hold off;
    
    % Store plot
    video(time) = getframe(gcf);
    drawnow
end

% Create video from plots
writerObj = VideoWriter('w_03.avi');
writerObj.FrameRate = 1/delta_t;

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);

%% Lateral separation w = 0.4L

clear video;

x_grid = -3:0.5:4; y_grid = -2:0.5:2;
[X_grid,Y_grid] = meshgrid(x_grid,y_grid);
U_grid = 0.25*ones(size(X_grid)); 
V_grid = zeros(size(X_grid));

% Plot fish position over time
for time = 1:401
    
    data_file = ['w_04/interface_',num2str(time,'%05.f'),'.dat'];
    interface = load(data_file);

    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
    quiver(X_grid,Y_grid,U_grid,V_grid,'b','LineWidth',1,...
        'autoscale','off'); 
    hold on;
    
    plot(interface(:,1),interface(:,2),'k','Linewidth',2); hold on;
    
    % Define axis and background color
    axis equal;
    xlim([-3,4]); ylim([-2,2]);
    set(gca,'color',[0.75 0.9 1])
    
    % Label plot
    xlabel('Longitudinal (Swimming) Direction',...
        'interpreter','latex','Fontsize',16);
    ylabel('Lateral Direction',...
        'interpreter','latex','Fontsize',16);
    title('Rectangular Pattern with Lateral Separation $w = 0.4L$',...
        'interpreter','latex','Fontsize',18);
    
    % Reset plot
    hold off;
    
    % Store plot
    video(time) = getframe(gcf);
    drawnow
end

% Create video from plots
writerObj = VideoWriter('w_04.avi');
writerObj.FrameRate = 1/delta_t;

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);

%% Lateral separation w = 0.7L

clear video;

x_grid = -3:0.5:4; y_grid = -2:0.5:2;
[X_grid,Y_grid] = meshgrid(x_grid,y_grid);
U_grid = 0.25*ones(size(X_grid)); 
V_grid = zeros(size(X_grid));

% Plot fish position over time
for time = 1:401
    
    data_file = ['w_07/interface_',num2str(time,'%05.f'),'.dat'];
    interface = load(data_file);

    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
    quiver(X_grid,Y_grid,U_grid,V_grid,'b','LineWidth',1,...
        'autoscale','off'); 
    hold on;
    
    plot(interface(:,1),interface(:,2),'k','Linewidth',2); hold on;
    
    % Define axis and background color
    axis equal;
    xlim([-3,4]); ylim([-2,2]);
    set(gca,'color',[0.75 0.9 1])
    
    % Label plot
    xlabel('Longitudinal (Swimming) Direction',...
        'interpreter','latex','Fontsize',16);
    ylabel('Lateral Direction',...
        'interpreter','latex','Fontsize',16);
    title('Rectangular Pattern with Lateral Separation $w = 0.7L$',...
        'interpreter','latex','Fontsize',18);
    
    % Reset plot
    hold off;
    
    % Store plot
    video(time) = getframe(gcf);
    drawnow
end

% Create video from plots
writerObj = VideoWriter('w_07.avi');
writerObj.FrameRate = 1/delta_t;

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);

%% Lateral separation w = 1.0L

clear video;

x_grid = -3:0.5:4; y_grid = -2:0.5:2;
[X_grid,Y_grid] = meshgrid(x_grid,y_grid);
U_grid = 0.25*ones(size(X_grid)); 
V_grid = zeros(size(X_grid));

% Plot fish position over time
for time = 1:401
    
    data_file = ['w_10/interface_',num2str(time,'%05.f'),'.dat'];
    interface = load(data_file);

    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
    quiver(X_grid,Y_grid,U_grid,V_grid,'b','LineWidth',1,...
        'autoscale','off'); 
    hold on;
    
    plot(interface(:,1),interface(:,2),'k','Linewidth',2); hold on;
    
    % Define axis and background color
    axis equal;
    xlim([-3,4]); ylim([-2,2]);
    set(gca,'color',[0.75 0.9 1])
    
    % Label plot
    xlabel('Longitudinal (Swimming) Direction',...
        'interpreter','latex','Fontsize',16);
    ylabel('Lateral Direction',...
        'interpreter','latex','Fontsize',16);
    title('Rectangular Pattern with Lateral Separation $w = 1.0L$',...
        'interpreter','latex','Fontsize',18);
    
    % Reset plot
    hold off;
    
    % Store plot
    video(time) = getframe(gcf);
    drawnow
end

% Create video from plots
writerObj = VideoWriter('w_10.avi');
writerObj.FrameRate = 1/delta_t;

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);
