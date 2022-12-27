% Start-up script to set plot graphics settings for MatLAB

% Use short decimal format
format shortG;

% % For debugging:
% get(groot, 'factory') % show default factory values of plot properties

% Use LaTeX for type setting:
set(groot, 'defaultAxesTickLabelInterpreter', 'latex'); % use LaTex interpreter for tick labels
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');
set(groot, 'defaultColorbarTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');
set(groot, 'defaultTextboxshapeInterpreter', 'latex');
set(groot, 'defaultTextarrowshapeInterpreter', 'latex');
set(groot, 'defaultPolaraxesTickLabelInterpreter', 'latex');
set(groot, 'defaultGraphplotInterpreter', 'latex');
set(groot, 'defaultConstantlineInterpreter', 'latex');
set(groot, 'defaultBubblelegendInterpreter', 'latex');

%set(groot, 'defaultAxesFontName', 'CMU Serif Roman'); % kind of fonts of labels % [Times | Courier | ]
%set(groot, 'defaultTextFontName', 'CMU Serif Roman'); % kind of fonts of labels % [Times | Courier | ]

% Set the units of the measures used throughout the file.
% Options: [ inches | centimeters | normalized | points | {pixels} | characters ]
set(groot, 'defaultFigureUnits', 'inches');
set(groot, 'defaultFigurePaperUnits', 'inches');
set(groot, 'defaultAxesUnits', 'inches');

%%% Calculate overall figure paper dimensions based on the width of a single text column of a two-column article.

% Global dimensions for formatting figure size:
global global_figure_scale;
global global_fontsize_pt;
global global_left_margin_frac;
global global_plot_area_width_frac;

global_figure_scale = 1.0; % arbitrary scale of plot for easier viewing
golden_ratio = 0.5*(1 + sqrt(5)); % golden ratio constant
mm_per_in = 25.4;

% Paper text body dimensions:
textcolumnwidth_mm = 90.0; % 90 mm, width of single column for double column paper
textcolumnwidth_in = textcolumnwidth_mm/mm_per_in;

% % Dimensions for figure with width = 90 mm and equal axes lengths
% figure_paper_width_in = textcolumnwidth_mm/mm_per_in;
% figure_paper_height_in = figure_paper_width_in;

% Dimensions for figure with width = 90 mm and golden ratio axes lengths
figure_paper_width_mm = textcolumnwidth_mm;
figure_paper_height_mm = 57.5; % no color bar below plot
%figure_paper_height_mm = 67.5; % color bar below plot

figure_paper_width_in = figure_paper_width_mm/mm_per_in;
figure_paper_height_in = figure_paper_height_mm/mm_per_in;


% % Dimensions for figure with width = 190 mm and fixed vertical axis length
% textcolumnspacing_mm = 10;
% figure_paper_width_in = (2*textcolumnwidth_mm + textcolumnspacing_mm)/mm_per_in;
% figure_paper_height_in = textcolumnwidth_mm/mm_per_in/golden_ratio;
% global_left_margin_frac = global_left_margin_frac*textcolumnwidth_mm/mm_per_in/figure_paper_width_in;
% global_plot_area_width_frac = 1 - 2*global_left_margin_frac;

% Common figure dimensions:
top_margin_mm = 4.0;
left_margin_mm = 13.0;
plot_area_width_mm = 70;
plot_area_height_mm = plot_area_width_mm/golden_ratio;

global_left_margin_frac = left_margin_mm/figure_paper_width_mm;
bottom_margin_frac = (figure_paper_height_mm - top_margin_mm - plot_area_height_mm)/figure_paper_height_mm;
global_plot_area_width_frac = plot_area_width_mm/figure_paper_width_mm;
plot_area_height_frac = plot_area_height_mm/figure_paper_height_mm;

% Other dimensions:
linewidth = 0.5;
marker_size = 6;
global_fontsize_pt = 8;
pt_per_in = 72.0; % definition for international Pt (not US Pt)
ticklength_in = global_fontsize_pt/pt_per_in/3.0; % 1/3 of standard font pt size
ticklength_norm = ticklength_in/max(global_plot_area_width_frac*figure_paper_width_in, plot_area_height_frac*figure_paper_height_in);

% Apply scaling:
linewidth = global_figure_scale*linewidth;
marker_size = global_figure_scale*marker_size;
global_fontsize_pt = global_figure_scale*global_fontsize_pt;
figure_paper_width_in = global_figure_scale*figure_paper_width_in;
figure_paper_height_in = global_figure_scale*figure_paper_height_in;

% Figure position and width/height used for *.eps plots
% [left bottom width height]:
set(groot, 'defaultFigurePosition', [1 1 figure_paper_width_in figure_paper_height_in]);

% Figure width/height used for *.pdf plots:
set(groot, 'defaultFigurePaperSize', [figure_paper_width_in figure_paper_height_in]);
set(groot, 'defaultFigurePaperSizeMode', 'manual');
set(groot, 'defaultFigurePaperType', '<custom>')
set(groot, 'defaultFigurePaperTypeMode', 'manual');

% Figure properties
% Positioning of figure inside overall plot paper:
set(groot, 'defaultFigurePaperPosition', [0 0 figure_paper_width_in figure_paper_height_in]);
% we link the dimension of the figure ON THE PAPER in such a way that
% it is equal to the dimension on the screen
%
% ATTENTION: if PaperPositionMode is not 'auto' the saved file
% could have different dimensions from the one shown on the screen!
set(groot, 'defaultFigurePaperPositionMode', 'auto'); % recommended by documentation
set(groot, 'defaultFigureColor', [1 1 1]);
%set(groot, 'defaultFigureColormap', jet);

% Axes properties:
set(groot, 'defaultAxesLineWidthMode', 'manual')
set(groot, 'defaultAxesLineWidth', linewidth)
set(groot, 'defaultAxesUnits', 'normalized', ... % positions and size of axes
    'defaultAxesPosition',[global_left_margin_frac bottom_margin_frac global_plot_area_width_frac plot_area_height_frac]);
set(groot, 'defaultAxesFontUnits', 'points'); % units of the size of fonts % [{points} | normalized | inches | centimeters | pixels]
set(groot, 'defaultAxesFontSize', global_fontsize_pt); % size of fonts of labels
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

% Plot properties:
set(groot, 'defaultLineLineWidth', linewidth);
set(groot, 'defaultLineMarkerSize', marker_size);

% 2-D histogram color bar properties:
set(groot, 'defaultColorbarLineWidth', linewidth)
set(groot, 'defaultColorbarPositionMode', 'manual');
set(groot, 'defaultColorbarAxisLocationMode', 'manual');
set(groot, 'defaultColorbarAxisLocation', 'out');
set(groot, 'defaultColorbarTickDirection', 'out');
set(groot, 'defaultColorbarCreateFcn', @colorBarCreateFcn);
set(groot, 'defaultColorbarBox', 'off');
set(groot, 'defaultColorbarTickLength', ticklength_norm);

% Set default color order.
% Classic Tableau 10:
global colors_tableau_classic_10;
%colors_tableau_classic_10 = [... % MatLab gives error
%	"#4E79A7", "#F28E2B", "#E15759", "#76B7B2", "#59A14F", ...
%	"#EDC948", "#B07AA1", "#FF9DA7", "#9C755F", "#BABOAC"];
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
%colors_tableau_classic_10 = num2cell(colors_tableau_classic_10, 2); % MatLab gives error
set(groot, 'defaultAxesColorOrder', colors_tableau_classic_10);

% Classic Tableau 20:
global colors_tableau_classic_20;
%colors_tableau_classic_20 = [... % MatLab gives error
%	"#4E79A7", "#AOCBE8", "#F28E2B", "#FFBE7D", "#59A14F", ...
%	"#8CD17D", "#B6992D", "#F1CE63", "#499894", "#86BCB6", ...
%	"#E15759", "#FF9D9A", "#79706E", "#BABOAC", "#D37295", ...
%	"#FABFD2", "#B07AA1", "#D4A6C8", "#9D7660", "#D7B5A6"];
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
%colors_tableau_classic_20 = num2cell(colors_tableau_classic_20, 2); % MatLab gives error
% set(groot, 'defaultAxesColorOrder', colors_tableau_classic_20);

% Clear any residual variables:
clear variables;

% Message for user:
disp("Start-up script executed.");

% Settings for axes when they are created with a plot:
set(groot, 'defaultAxesCreateFcn', @axesCreateFcn);

function axesCreateFcn(~, ~)
	global global_figure_scale;

    ax = gca;
	ax.XRuler.Label.Units = 'normalized'; % use fraction of plot area dimension?
	ax.YRuler.Label.Units = 'normalized'; % use fraction of plot area dimension?
    ax.XRuler.Label.Position(2) = -0.12; % vertical position
    ax.YRuler.Label.Position(1) = -0.13; % horizontal position
    ax.XRuler.TickLabelGapOffset = int8(global_figure_scale*0);
    ax.YRuler.TickLabelGapOffset = int8(global_figure_scale*1);
    %ax.ZRuler.TickLabelGapOffset = int8(global_figure_scale*5); % don't know best number yet
end

function colorbarCreateFcn(~, ~)
    % % None of these work; FIXME
    % ax = gca;
    % cb = ax.Colobar;
    
    % cb.Position = [0.925, 0.172, 0.01, 0.75];
    % cb.Ruler.TickLabelGapOffset = 5;
    % cb.Label.Position(1) = -5;
end
