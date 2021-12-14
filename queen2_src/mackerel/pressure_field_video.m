%% Create video of pressure field for single swimmer

x_grid = linspace(-0.25,4.5,gridsize);
y_grid = linspace(-0.5,0.5,gridsize);

% Outputs without viscous effects
for time = 1:400
    
    % Open data at each time step
    output_file = ['inviscid/output_',num2str(time,'%05.f'),'.dat'];
    output_data = load(output_file);
    [l,~] = size(output_data);
    p_out = reshape(output_data(:,7),sqrt(l),sqrt(l));
    
    % Define figure
    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
    % Plot pressure field image
    imagesc(x_grid,y_grid,p_out)
    
    % Define axis and background color
    caxis([-8e-14,8e-14]); colorbar;
    axis equal;
    xlim([-0.25,4.5]); ylim([-0.5,0.5]);
    
    % Label plot
    xlabel('Longitudinal (Swimming) Direction',...
        'interpreter','latex','Fontsize',16);
    ylabel('Lateral Direction',...
        'interpreter','latex','Fontsize',16);
    title('Single Swimmer without Viscous Effects',...
        'interpreter','latex','Fontsize',18);
    
    % Reset plot
    hold off;
    
    % Store plot
    video(time) = getframe(gcf);
    drawnow
end

% Create video from plots
writerObj = VideoWriter('inviscid_swimmer.avi');
writerObj.FrameRate = 1/0.02; % 1/delta_t

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);

% Outputs with viscous effects
for time = 1:400
    
    % Open data at each time step
    output_file = ['viscous/output_',num2str(time,'%05.f'),'.dat'];
    output_data = load(output_file);
    [l,~] = size(output_data);
    p_out = reshape(output_data(:,7),sqrt(l),sqrt(l));
    
    % Define figure
    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
    % Plot pressure field image
    imagesc(x_grid,y_grid,p_out)
    
    % Define axis and background color
    caxis([-8e-14,8e-14]); colorbar;
    axis equal;
    xlim([-0.25,4.5]); ylim([-0.5,0.5]);
    
    % Label plot
    xlabel('Longitudinal (Swimming) Direction',...
        'interpreter','latex','Fontsize',16);
    ylabel('Lateral Direction',...
        'interpreter','latex','Fontsize',16);
    title('Single Swimmer with Viscous Effects',...
        'interpreter','latex','Fontsize',18);
    
    % Reset plot
    hold off;
    
    % Store plot
    video(time) = getframe(gcf);
    drawnow
end

% Create video from plots
writerObj = VideoWriter('viscous_swimmer.avi');
writerObj.FrameRate = 1/0.02;

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);

%% Create video of pressure field for rectangular pattern

x_grid = linspace(-2.5,3.5,gridsize);
y_grid = linspace(-1.5,1.5,gridsize);

%% w = 0.3L

clear video;

for time = 1:400
    
    % Open data at each time step
    output_file = ['w_03/output_',num2str(time,'%05.f'),'.dat'];
    output_data = load(output_file);
    p_out = reshape(output_data(:,7),120,240);
    
    % Define figure
    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
    % Plot pressure field image
    imagesc(x_grid,y_grid,p_out)
    
    % Define axis and background color
    caxis([-6e-13,6e-13]); colorbar; % rescale
    axis equal;
    xlim([-2.5,3.5]); %ylim([-1.5,1.5]);
    
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
writerObj = VideoWriter('w_03_pressure.avi');
writerObj.FrameRate = 1/0.02; % 1/delta_t

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);

%% w = 0.4L

clear video;
for time = 1:400
    
    % Open data at each time step
    output_file = ['w_04/output_',num2str(time,'%05.f'),'.dat'];
    output_data = load(output_file);
    p_out = reshape(output_data(:,7),120,240);
    
    % Define figure
    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
    % Plot pressure field image
    imagesc(x_grid,y_grid,p_out)
    
    % Define axis and background color
    caxis([-8e-13,8e-13]); colorbar;
    axis equal;
    xlim([-2.5,3.5]); %ylim([-0.6,0.6]);
    
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
writerObj = VideoWriter('w_04_pressure.avi');
writerObj.FrameRate = 1/0.02; % 1/delta_t

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);

%% w = 0.7L

clear video;
for time = 1:400
    
    % Open data at each time step
    output_file = ['w_07/output_',num2str(time,'%05.f'),'.dat'];
    output_data = load(output_file);
    p_out = reshape(output_data(:,7),120,240);
    
    % Define figure
    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
    % Plot pressure field image
    imagesc(x_grid,y_grid,p_out)
    
    % Define axis and background color
    caxis([-7e-13,7e-13]); colorbar; % rescale
    axis equal;
    xlim([-2.5,3.5]); ylim([-1,1]);
    
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
writerObj = VideoWriter('w_07_pressure.avi');
writerObj.FrameRate = 1/0.02; % 1/delta_t

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);

%% w = 1.0L

clear video;

for time = 1:400
    
    % Open data at each time step
    output_file = ['w_10/output_',num2str(time,'%05.f'),'.dat'];
    output_data = load(output_file);
    p_out = reshape(output_data(:,7),120,240);
    
    % Define figure
    fig1 = figure(1);
    set(fig1,'units','normalized','outerposition',[0.1 0.1 0.8 0.8])
    
    % Plot pressure field image
    imagesc(x_grid,y_grid,p_out)
    
    % Define axis and background color
    caxis([-7e-13,7e-13]); colorbar; % rescale
    axis equal;
    xlim([-2.5,3.5]); ylim([-1.25,1.25]);
    
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
writerObj = VideoWriter('w_10_pressure.avi');
writerObj.FrameRate = 1/0.02; % 1/delta_t

% Convert to frame
open(writerObj)
for index = 1:length(video)
    frame = video(index);
    writeVideo(writerObj,frame);
end

close(writerObj);
