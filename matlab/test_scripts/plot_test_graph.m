clear;

figure;

x = [0.1 1.0 2.5 3.4 4.0 5.6 7.8 8.8 9.0 10.0];
y = [20 30 45 40 60 65 80 75 95 90]*100; 
err = [5 8 2 9 3 3 8 3 9 3];
errorbar(x,y,err);

% Plot labels:
title('Test graph');
xlabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');
ylabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');


%% we link the dimension of the figure ON THE PAPER in such a way that
%% it is equal to the dimension on the screen
%%
%% ATTENTION: if PaperPositionMode is not 'auto' the saved file
%% could have different dimensions from the one shown on the screen!
%set(gcf, 'PaperPositionMode', 'auto');
%
%figwidth_in = 3.5;
%goldenratio = 0.5*(1 + sqrt(5));
%figheight_in = figwidth_in/goldenratio;
%pbaspect([figwidth_in, figheight_in, 1]);
%
%afFigurePosition = 1*[1 1 [figwidth_in figheight_in]]; % [pos_x pos_y width_x width_y]
%set(gcf, 'Units', 'inches', ...
%'Position', afFigurePosition); % [left bottom width height]

%% in order to make matlab to do not "cut" latex-interpreted axes labels
%set(gca, 'Units', 'normalized', ... %
%'Position',[0.15 0.149 0.79 0.79]);

% Axes properties:
ax = gca;
ax.YAxis.Exponent = 1;
ax.XAxis.Exponent = 1;
%set(gca, 'XScale', 'log');

%% we set the units of the measures used through the file
%%
%% [ inches | centimeters | normalized | points | {pixels} | characters ]
%set(gcf, 'Units', 'inches');
%set(0,'DefaultAxesFontName', 'Times','DefaultTextFontName', 'Times');

%% general properties
%iFontSize = 8;
%strFontUnit = 'points'; % [{points} | normalized | inches | centimeters | pixels]
%strFontName = 'Times'; % [Times | Courier | ] TODO complete the list
%strFontWeight = 'normal'; % [light | {normal} | demi | bold]
%strFontAngle = 'normal'; % [{normal} | italic | oblique] ps: only for axes
%strInterpreter = 'latex'; % [{tex} | latex]
%fLineWidth = 0.05; % width of the line of the axes
%
%%set(gcf, 'Units', 'points');
%set(gca, ...
%'FontName', strFontName, ... kind of fonts of labels
%'FontSize', iFontSize, ... size of fonts of labels
%'FontUnits', strFontUnit, ... units of the size of fonts
%'FontWeight', strFontWeight, ... weight of fonts of labels
%'TitleFontWeight', strFontWeight, ... weight of font of title
%'FontAngle', strFontAngle, ... inclination of fonts of labels
%...
%'XMinorTick', 'on' , ... [on | {off}]
%'YMinorTick', 'on', ... [on | {off}]
%'TickDir', 'out', ... [{in} | out] inside or outside (for 2D)
%'TickLength', [.01 .01], ... length of the ticks
%...
%'TitleFontSizeMultiplier', 0.5, ... title font size multiplier factor
%'LabelFontSizeMultiplier', 1, ... label font size multiplier factor
%...
%'TickLabelInterpreter', 'latex'); % use LaTex interpreter for tick labels

% Code to turn off ticks on right and upper axes:
% get handle to current axes
ax = gca;
% set box property to off and remove background color
%set(ax, 'box', 'off', 'color', 'none')
% create new, empty axes with box but without ticks
%ax_b = axes('Position', get(ax ,'Position'), 'box', 'on', 'xtick', [], 'ytick', []);
% set original axes as active
%axes(ax)
% link axes in case of zooming
%linkaxes([ax ax_b])
format_axes(ax);

print('test_graph', '-dpdf', '-r600', '-painters', '-loose') % -painters needed for hi-res
