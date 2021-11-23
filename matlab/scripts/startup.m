% Start-up script to set plot graphics settings for MatLAB

% Use LaTeX for type setting:
set(groot,'defaultAxesTickLabelInterpreter', 'latex');
set(groot,'defaultTextInterpreter', 'latex');
set(groot,'defaultLegendInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex'); % use LaTex interpreter for tick labels

set(groot, 'defaultAxesFontName', 'Times'); % kind of fonts of labels % [Times | Courier | ]
set(groot, 'defaultTextFontName', 'Times'); % kind of fonts of labels % [Times | Courier | ]

% Set the units of the measures used throughout the file.
% Options: [ inches | centimeters | normalized | points | {pixels} | characters ]
set(groot, 'defaultFigureUnits', 'inches');
set(groot, 'defaultFigurePaperUnits', 'inches');
set(groot, 'defaultAxesUnits', 'inches');

% Calculate overall figure size based on double column paper with 3.5 in
% column width. Use golden ratio to get figure height.
figwidth_in = 3.5; % inch
goldenratio = 0.5*(1 + sqrt(5)); % golden ratio constant
figheight_in = figwidth_in/goldenratio; % inch

% Figure position and width/height used for *.eps plots
% [left bottom width height]:
set(groot, 'defaultFigurePosition', [0 0 figwidth_in figheight_in]);

% Figure width/height used for *.pdf plots:
set(groot, 'defaultFigurePaperSize', [figwidth_in figheight_in]);
set(groot, 'defaultFigurePaperSizeMode', 'manual');
set(groot, 'defaultFigurePaperType', '<custom>')
set(groot, 'defaultFigurePaperTypeMode', 'manual');

% Positioning of figure inside overall plot paper:
set(groot, 'defaultFigurePaperPosition', [0 0 figwidth_in figheight_in]);
% we link the dimension of the figure ON THE PAPER in such a way that
% it is equal to the dimension on the screen
%
% ATTENTION: if PaperPositionMode is not 'auto' the saved file
% could have different dimensions from the one shown on the screen!
set(groot, 'DefaultFigurePaperPositionMode', 'auto'); % recommended by documentation

% Control positions and size of axes in order to prevent MatLAB from
% cutting LaTeX-interpreted axes labels:
set(groot, 'defaultAxesUnits', 'normalized', ... %
    'defaultAxesPosition',[0.125 0.172 0.75 0.75]);

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
set(groot, 'defaultAxesTickLength', [.014 .014]); % length of the ticks
% ...
set(groot, 'defaultAxesTitleFontSizeMultiplier', 0.5); % title font size multiplier factor
set(groot, 'defaultAxesLabelFontSizeMultiplier', 1); % label font size multiplier factor
% ...

% % Code to turn off ticks on right and upper axes (not currently cleanly
% % possible in MatLAB)
%
% % Get handle to current axes:
% ax = gca;
% % set box property to off and remove background color
% set(ax, 'box', 'off', 'color', 'none')
% % create new, empty axes with box but without ticks
% ax_b = axes('Position', get(ax ,'Position'), 'box', 'on', 'xtick', [], 'ytick', []);
% % set original axes as active
% axes(ax)
% % link axes in case of zooming
% linkaxes([ax ax_b])

% Set default color order.
% Classic Tableau 10:
colors_tableau_classic_10 = [...
    031, 119, 180;
    255, 127, 014;
    044, 160, 044;
    214, 039, 040;
    148, 103, 189;
    140, 086, 075;
    227, 119, 194;
    127, 127, 127;
    188, 189, 034;
    023, 190, 207;]./255.0;
set(groot, 'defaultAxesColorOrder', colors_tableau_classic_10);

% Classic Tableau 20:
colors_tableau_classic_20 = [...
    031, 119, 180;
    174, 199, 232;
    255, 127, 014;
    255, 187, 120;
    044, 160, 044;
    152, 223, 138;
    214, 039, 040;
    255, 152, 150;
    148, 103, 189;
    197, 176, 213;
    140, 086, 075;
    196, 156, 148;
    227, 119, 194;
    247, 182, 210;
    127, 127, 127;
    199, 199, 199;
    188, 189, 034;
    219, 219, 141;
    023, 190, 207;
    158, 218, 229;]./255.0;
% set(groot, 'defaultAxesColorOrder', colors_tableau_classic_20);

% Clear any residual variables:
clear all;

% Message for user:
disp("Start-up script executed.")

% % For debugging:
% get(groot, 'factory')

% Settings for axes when they are created with a plot:
set(groot, 'defaultAxesCreateFcn', @axisDefaultCreateFcn);
function axisDefaultCreateFcn(~, ~)
    ax = gca;
    ax.XRuler.TickLabelGapOffset = -1;
    ax.YRuler.TickLabelGapOffset = 0;
end
