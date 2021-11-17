close all hidden;
clear all;

set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

load("plot_data.mat");

figure;

% x = [0.1 1.0 2.5 3.4 4.0 5.6 7.8 8.8 9.0 10.0];
% y = [20 30 45 40 60 65 80 75 95 90]; 
% err = [5 8 2 9 3 3 8 3 9 3];
xs_tmp = [1 2 3]
ys_gamma
ys_xray




errorbar(xs_tmp, ys_gamma+ys_xray, ((yfracerrs_gamma.*ys_gamma).^2 + (yfracerrs_xray.*ys_xray).^2).^(0.5), '.');
hold on;
errorbar(xs_tmp, ys_xray, yfracerrs_xray.*ys_xray, '.');
hold on;
errorbar(xs_tmp, ys_gamma, yfracerrs_gamma.*ys_gamma, '.');
hold off;

legend({"Total", "X-ray", "Gamma"}, ...
    'Location', 'north', ...
    'FontSize', 7);

% Axis tick labels:
%set(gca, 'xtick', [1:3], 'xticklabel', xs)
xticks(xs_tmp)
xlim([0.9, 3.1])
xticklabels(xs)
xtickangle(20)
%xticklabs = text(xs_tmp, zeros(1,length(xs)), xs);
%set(gca, 'XTickLabel', '') %// Move here
%set(xticklabs, 'HorizontalAlignment', 'right', 'VerticalAlignment', 'top', 'Rotation', 20, 'fontsize', 8, 'Interpreter', 'latex');

% Plot labels:
title('Line Plot of Sine and Cosine Between $-2\pi$ and $2\pi$');
%xlabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');
ylabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');


% we link the dimension of the figure ON THE PAPER in such a way that
% it is equal to the dimension on the screen
%
% ATTENTION: if PaperPositionMode is not 'auto' the saved file
% could have different dimensions from the one shown on the screen!
set(gcf, 'PaperPositionMode', 'auto');

figwidth_in = 3.5;
goldenratio = 0.5*(1 + sqrt(5));
figheight_in = figwidth_in/goldenratio;
pbaspect([figwidth_in, figheight_in, 1]);

afFigurePosition = 1*[1 1 [figwidth_in figheight_in]]; % [pos_x pos_y width_x width_y]
set(gcf, 'Units', 'inches', ...
'Position', afFigurePosition); % [left bottom width height]

% in order to make matlab to do not "cut" latex-interpreted axes labels
set(gca, 'Units', 'normalized', ... %
'Position',[0.15 0.149 0.79 0.79]);

% Axes properties:
ax = gca;
ax.YAxis.Exponent = 5;
%ax.XAxis.Exponent = 1;
set(gca, 'YScale', 'log');

% we set the units of the measures used through the file
%
% [ inches | centimeters | normalized | points | {pixels} | characters ]
set(gcf, 'Units', 'inches');
set(0,'DefaultAxesFontName', 'Times','DefaultTextFontName', 'Times');

% General properties:
set(gca, 'FontName', 'Times'); % kind of fonts of labels % [Times | Courier | ]
set(gca, 'FontSize', 8); % size of fonts of labels
set(gca, 'FontUnits', 'points'); % units of the size of fonts % [{points} | normalized | inches | centimeters | pixels]
% 'FontWeight', 'normal', ... weight of fonts of labels % [light | {normal} | demi | bold]
% 'TitleFontWeight', 'normal', ... weight of font of title % [light | {normal} | demi | bold]
% 'FontAngle', 'normal', ... inclination of fonts of labels % [{normal} | italic | oblique] ps: only for axes
% ...
set(gca, 'XMinorTick', 'off'); % [on | {off}]
set(gca, 'YMinorTick', 'on');  % [on | {off}]
set(gca, 'TickDir', 'out');    % [{in} | out] inside or outside (for 2D)
set(gca, 'TickLength', [.01 .01]); % length of the ticks
% ...
set(gca, 'TitleFontSizeMultiplier', 0.5); % title font size multiplier factor
set(gca, 'LabelFontSizeMultiplier', 1.0); % label font size multiplier factor
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

print -depsc2 -loose test_plot.eps