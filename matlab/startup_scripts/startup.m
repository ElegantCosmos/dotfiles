% Start-up script to set plot graphics settings for MatLAB

% % For debugging:
% get(groot, 'factory') % show default factory values of plot properties

% Use LaTeX for type setting:
set(groot, 'defaultAxesTickLabelInterpreter', 'latex'); % use LaTex interpreter for tick labels
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');
set(groot, 'defaultColorbarTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

set(groot, 'defaultAxesFontName', 'Times'); % kind of fonts of labels % [Times | Courier | ]
set(groot, 'defaultTextFontName', 'Times'); % kind of fonts of labels % [Times | Courier | ]

% Set the units of the measures used throughout the file.
% Options: [ inches | centimeters | normalized | points | {pixels} | characters ]
set(groot, 'defaultFigureUnits', 'inches');
set(groot, 'defaultFigurePaperUnits', 'inches');
set(groot, 'defaultAxesUnits', 'inches');

%%% Calculate overall figure paper dimensions based on the width of a single text column of a two-column article.

% Global dimensions for formatting figure size:
global global_figure_scale;
global global_twocolumnarticle_columnwidth_in;
global global_figurepaperwidth_in;
global global_figurepaperheight_in;

global_figure_scale = 2.0; % arbitrary global_figure_scale of plot
goldenratio = 0.5*(1 + sqrt(5)); % golden ratio constant
mm_per_in = 25.4;

% Paper text body dimensions:
textcolumnwidth_mm = 90;

% Common figure dimensions:
margin_left_frac = 0.14;
margin_bottom_frac = 0.20;
figurewidth_frac = 0.72;
figureheight_frac = 0.72;

global_twocolumnarticle_columnwidth_in = textcolumnwidth_mm/mm_per_in;

% % Dimensions for figure with width = 90 mm and equal axes lengths
% global_figurepaperwidth_in = textcolumnwidth_mm/mm_per_in;
% global_figurepaperheight_in = global_figurepaperwidth_in;

% Dimensions for figure with width = 90 mm and golden ratio axes lengths
global_figurepaperwidth_in = global_figure_scale*textcolumnwidth_mm/mm_per_in;
global_figurepaperheight_in = global_figure_scale*textcolumnwidth_mm/mm_per_in/goldenratio; % golden ratio for figure height

% % Dimensions for figure with width = 190 mm and fixed vertical axis length
% textcolumnspacing_mm = 10;
% global_figurepaperwidth_in = (2*textcolumnwidth_mm + textcolumnspacing_mm)/mm_per_in;
% global_figurepaperheight_in = textcolumnwidth_mm/mm_per_in/goldenratio;
% margin_left_frac = margin_left_frac*textcolumnwidth_mm/mm_per_in/global_figurepaperwidth_in;
% figurewidth_frac = 1 - 2*margin_left_frac;

% Other dimensions:
fontsize_pt = global_figure_scale*8;
pt_per_in = 72.0;
ticklength_in = fontsize_pt/3.0/pt_per_in;
ticklength_norm = ticklength_in/max(figurewidth_frac*global_figurepaperwidth_in, figureheight_frac*global_figurepaperheight_in);
ticklength_cb_norm = ticklength_in/(figureheight_frac*global_figurepaperheight_in);

% Figure position and width/height used for *.eps plots
% [left bottom width height]:
set(groot, 'defaultFigurePosition', [1 1 global_figurepaperwidth_in global_figurepaperheight_in]);

% Figure width/height used for *.pdf plots:
set(groot, 'defaultFigurePaperSize', [global_figurepaperwidth_in global_figurepaperheight_in]);
set(groot, 'defaultFigurePaperSizeMode', 'manual');
set(groot, 'defaultFigurePaperType', '<custom>')
set(groot, 'defaultFigurePaperTypeMode', 'manual');

% Figure properties
% Positioning of figure inside overall plot paper:
set(groot, 'defaultFigurePaperPosition', [0 0 global_figurepaperwidth_in global_figurepaperheight_in]);
% we link the dimension of the figure ON THE PAPER in such a way that
% it is equal to the dimension on the screen
%
% ATTENTION: if PaperPositionMode is not 'auto' the saved file
% could have different dimensions from the one shown on the screen!
set(groot, 'DefaultFigurePaperPositionMode', 'auto'); % recommended by documentation
set(groot, 'defaultFigureColormap', jet);

% Axes properties:
set(groot, 'DefaultAxesLineWidth', global_figure_scale*0.5)
set(groot, 'defaultAxesUnits', 'normalized', ... % positions and size of axes
    'defaultAxesPosition',[margin_left_frac margin_bottom_frac figurewidth_frac figureheight_frac]);
set(groot, 'defaultAxesFontUnits', 'points'); % units of the size of fonts % [{points} | normalized | inches | centimeters | pixels]
set(groot, 'defaultAxesFontSize', fontsize_pt); % size of fonts of labels
set(groot, 'defaultAxesFontSizeMode', 'manual');
set(groot, 'defaultAxesFontWeight', 'normal'); % weight of fonts of labels % [light | {normal} | demi | bold]
set(groot, 'defaultAxesTitleFontWeight', 'normal'); % weight of font of title % [light | {normal} | demi | bold]
set(groot, 'defaultAxesFontAngle', 'normal'); % inclination of fonts of labels % [{normal} | italic | oblique] ps: only for axes
% ...
set(groot, 'defaultAxesXMinorTick', 'on'); % [on | {off}]
set(groot, 'defaultAxesYMinorTick', 'on');  % [on | {off}]
set(groot, 'defaultAxesTickDir', 'out');    % [{in} | out] inside or outside (for 2D)
set(groot, 'defaultAxesTickDirMode', 'manual');
set(groot, 'defaultAxesTickLength', [ticklength_norm ticklength_norm]); % length of the ticks
% ...
set(groot, 'defaultAxesTitleFontSizeMultiplier', 1); % title font size multiplier factor
set(groot, 'defaultAxesLabelFontSizeMultiplier', 1); % label font size multiplier factor
% ...

% 2-D histogram color bar properties:
set(groot, 'defaultColorbarLineWidth', global_figure_scale*0.5)
set(groot, 'defaultColorbarPositionMode', 'manual');
set(groot, 'defaultColorbarAxisLocationMode', 'manual');
set(groot, 'defaultColorbarAxisLocation', 'out');
set(groot, 'defaultColorbarTickDirection', 'out');
set(groot, 'defaultColorbarCreateFcn', @colorBarCreateFcn);
set(groot, 'defaultColorbarBox', 'off');
set(groot, 'defaultColorbarTickLength', ticklength_cb_norm);

% Set default color order.
% Classic Tableau 10:
global colors_tableau_classic_10;
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
global colors_tableau_classic_20;
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
clear variables;

% Message for user:
disp("Start-up script executed.");

% Settings for axes when they are created with a plot:
set(groot, 'defaultAxesCreateFcn', @axesCreateFcn);

function axesCreateFcn(~, ~)
    ax = gca;
    ax.XRuler.TickLabelGapOffset = 0;
    ax.YRuler.TickLabelGapOffset = 2;
    % ax.ZRuler.TickLabelGapOffset = 5; % don't know best number yet
end

function colorbarCreateFcn(~, ~)
    % % None of these work; FIXME
    % ax = gca;
    % cb = ax.Colobar;
    
    % cb.Position = [0.925, 0.172, 0.01, 0.75];
    % cb.Ruler.TickLabelGapOffset = 5;
    % cb.Label.Position(1) = -5;
end
