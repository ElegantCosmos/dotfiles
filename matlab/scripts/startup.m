figure

set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaultTextInterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

set(groot, 'defaultAxesFontName', 'Times'); % kind of fonts of labels % [Times | Courier | ]
set(groot, 'defaultTextFontName', 'Times'); % kind of fonts of labels % [Times | Courier | ]

% we link the dimension of the figure ON THE PAPER in such a way that
% it is equal to the dimension on the screen
%
% ATTENTION: if PaperPositionMode is not 'auto' the saved file
% could have different dimensions from the one shown on the screen!
%set(groot, 'defaultFigurePaperPositionMode', 'manual');
set(groot, 'DefaultFigurePaperPositionMode', 'auto');

% we set the units of the measures used through the file
%
% [ inches | centimeters | normalized | points | {pixels} | characters ]
set(groot, 'defaultFigureUnits', 'inches'); % [ inches | centimeters | normalized | points | {pixels} | characters ]
set(groot, 'defaultAxesUnits', 'inches'); % [ inches | centimeters | normalized | points | {pixels} | characters ]

figwidth_in = 3.5;
goldenratio = 0.5*(1 + sqrt(5));
figheight_in = figwidth_in/goldenratio;
pbaspect([figwidth_in, figheight_in, 1]);

afFigurePosition = 1*[1 1 [figwidth_in figheight_in]]; % [pos_x pos_y width_x width_y]
set(gcf, 'Units', 'inches', 'Position', afFigurePosition); % [left bottom width height]
% set(groot, 'defaultFigureUnits', 'inches', ...
%     'defaultFigurePosition', afFigurePosition); % [left bottom width height]

set(gcf, 'PaperSize', [figwidth_in figheight_in]);
% set(groot, 'defaultFigurePaperUnits', 'inches');
% set(groot, 'defaultFigurePaperUnitsMode', 'manual');
% set(groot, 'defaultFigurePaperSize', [figwidth_in figheight_in]);
% set(groot, 'defaultFigurePaperSizeMode', 'manual');
% set(groot, 'defaultFigurePaperSize', [figwidth_in figheight_in]);
% set(groot, 'defaultFigureUnits', 'inches', ...
%     'defaultFigurePaperSize', [figwidth_in figheight_in]);

set(gcf, 'PaperPosition', [0 0 figwidth_in figheight_in]);
%set(groot, 'defautFigureOuterPosition', [0 0 1 1]);

% % in order to make matlab to do not "cut" latex-interpreted axes labels
% set(gca, 'Units', 'normalized', ... %
% 'Position',[0.15 0.15 0.79 0.79]);
% % in order to make matlab to do not "cut" latex-interpreted axes labels
set(gca, 'Units', 'normalized', ... %
    'Position',[0.15 0.17 0.76 0.76]);
% set(groot, 'defaultAxesUnits', 'normalized', ... %
%      'defaultAxesPosition',[0.15 0.17 0.76 0.76]);

% General properties:
set(groot, 'defaultAxesFontUnits', 'points'); % units of the size of fonts % [{points} | normalized | inches | centimeters | pixels]
set(groot, 'defaultAxesFontSize', 8); % size of fonts of labels
set(groot, 'defaultAxesFontSizeMode', 'manual');
set(groot, 'defaultAxesFontWeight', 'normal'); % weight of fonts of labels % [light | {normal} | demi | bold]
set(groot, 'defaultAxesTitleFontWeight', 'normal'); % weight of font of title % [light | {normal} | demi | bold]
set(groot, 'defaultAxesFontAngle', 'normal'); % inclination of fonts of labels % [{normal} | italic | oblique] ps: only for axes
% ...
set(groot, 'defaultAxesXMinorTick', 'on'); % [on | {off}]
set(groot, 'defaultAxesYMinorTick', 'on');  % [on | {off}]
set(groot, 'defaultAxesTickDir', 'out');    % [{in} | out] inside or outside (for 2D)
set(groot, 'defaultAxesTickDirMode', 'manual');
set(groot, 'defaultAxesTickLength', [.01 .01]); % length of the ticks
% ...
set(groot, 'defaultAxesTitleFontSizeMultiplier', 0.5); % title font size multiplier factor
set(groot, 'defaultAxesLabelFontSizeMultiplier', 1); % label font size multiplier factor
% ...
%set(gca, 'TickLabelInterpreter', 'latex'); % use LaTex interpreter for tick labels

% % Code to turn off ticks on right and upper axes:
% % get handle to current axes
% ax = gca;
% % set box property to off and remove background color
% set(ax, 'box', 'off', 'color', 'none')
% % create new, empty axes with box but without ticks
% ax_b = axes('Position', get(ax ,'Position'), 'box', 'on', 'xtick', [], 'ytick', []);
% % set original axes as active
% axes(ax)
% % link axes in case of zooming
% linkaxes([ax ax_b])

%get(groot, 'default')
%groot

% set(gcf, 'visible', 'off');

clear all;

% Message for user:
disp("Start-up script executed.")