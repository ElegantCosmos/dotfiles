
clear all;

figure(1);

x = [0.1 1.0 2.5 3.4 4.0 5.6 7.8 8.8 99.0 10000000.0];
y = [20 30 45 40 60 65 80 75 95 90]; 
err = [5 8 2 9 3 3 8 3 9 3];
errorbar(x,y,err);

% Plot labels:
title('Line Plot of Sine and Cosine Between $-2\pi$ and $2\pi$', 'Interpreter', 'LaTex');
xlabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]', 'Interpreter', 'LaTex');
ylabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]', 'Interpreter', 'LaTex');


% we link the dimension of the figure ON THE PAPER in such a way that
% it is equal to the dimension on the screen
%
% ATTENTION: if PaperPositionMode is not 'auto' the saved file
% could have different dimensions from the one shown on the screen!
set(gcf, 'PaperPositionMode', 'auto');

% in order to make matlab to do not "cut" latex-interpreted axes labels
set(gca, 'Units', 'normalized', ... %
'Position',[0.15 0.19 0.775 0.775]);

figwidth_in = 3.5;
goldenratio = 0.5*(1 + sqrt(5));
figheight_in = figwidth_in/goldenratio;
pbaspect([figwidth_in, figheight_in, 1]);

%set(gca, 'PlotBoxAspectRatio', [figwidth_in, figheight_in, 1]);

% we set the position and dimension of the figure ON THE SCREEN
%
% NOTE: measurement units refer to the previous settings!
afFigurePosition = 1*[1 1 [figwidth_in figheight_in]]; % [pos_x pos_y width_x width_y]
set(gcf, 'Position', afFigurePosition); % [left bottom width height]


% Axes properties:
% ax = gca;
% ax.YAxis.Exponent = 1;
set(gca, 'XScale', 'log');

% we set the units of the measures used through the file
%
% [ inches | centimeters | normalized | points | {pixels} | characters ]
set(gcf, 'Units', 'inches');
set(0,'DefaultAxesFontName', 'Times','DefaultTextFontName', 'Times');



% general properties
iFontSize = 9;
strFontUnit = 'points'; % [{points} | normalized | inches | centimeters | pixels]
strFontName = 'Times'; % [Times | Courier | ] TODO complete the list
strFontWeight = 'normal'; % [light | {normal} | demi | bold]
strFontAngle = 'normal'; % [{normal} | italic | oblique] ps: only for axes
strInterpreter = 'latex'; % [{tex} | latex]
fLineWidth = 0.05; % width of the line of the axes

% note: it is quite difficult to use the "latex" interpreter for the ticks;
% if absolutely needed google for "format_ticks.m" by Alexander Hayes
set(gca, ...
... 'Position', [1 1 20 10], ... TODO
... 'OuterPosition', [1 1 20 10], ... TODO
...
'XGrid', 'off', ... [on | {off}]
'YGrid', 'off', ... [on | {off}]
'GridLineStyle', 'none', ... [- | -- | {:} | -. | none]
'XMinorGrid', 'off' , ... [on | {off}]
'YMinorGrid', 'off', ... [on | {off}]
'MinorGridLineStyle', ':', ... [- | -- | {:} | -. | none]
...
... 'XTick', 0:10:100, ... ticks of x axis
... 'YTick', 0:1:10, ... ticks of y axis
... 'XTickLabel', {'-1','0','1'}, ...
... 'YTickLabel', {'-1','0','1'}, ...
'XMinorTick', 'on' , ... [on | {off}]
'YMinorTick', 'on', ... [on | {off}]
'TickDir', 'out', ... [{in} | out] inside or outside (for 2D)
'TickLength', [.015 .015], ... length of the ticks
...
'XColor', [.1 .1 .1], ... color of x axis
'YColor', [.1 .1 .1], ... color of y axis
'XAxisLocation', 'bottom', ... where labels have to be printed [top | {bottom}]
'YAxisLocation', 'left', ... where labels have to be printed [left | {right}]
'XDir', 'normal', ... axis increasement direction [{normal} | reverse]
'YDir', 'normal', ... axis increasement direction [{normal} | reverse]
... 'XLim', [0 100], ... limits for the x-axis
... 'YLim', [-10 10], ... limits for the y-axis
...
'FontName', strFontName, ... kind of fonts of labels
'FontSize', iFontSize, ... size of fonts of labels
'FontUnits', strFontUnit, ... units of the size of fonts
'FontWeight', strFontWeight, ... weight of fonts of labels
'TitleFontWeight', strFontWeight, ... weight of font of title
'FontAngle', strFontAngle, ... inclination of fonts of labels
...
... 'LineWidth', fLineWidth, ... width of the line of the axes
...
'TitleFontSizeMultiplier', 0.5, ... title font size multiplier factor
'LabelFontSizeMultiplier', 1, ... label font size multiplier factor
...
'TickLabelInterpreter', strInterpreter); % use LaTex interpreter for tick labels

% Code to turn off ticks on right and upper axes:
% get handle to current axes
a = gca;
% set box property to off and remove background color
set(a,'box','off','color','none')
% create new, empty axes with box but without ticks
b = axes('Position',get(a,'Position'),'box','on','xtick',[],'ytick',[]);
% set original axes as active
axes(a)
% link axes in case of zooming
linkaxes([a b])

% % fonts properties
% iFontSize = 20;
% strFontUnit = 'points'; % [{points} | normalized | inches | centimeters | pixels]
% strFontName = 'Times'; % [Times | Courier | ] TODO complete the list
% strFontWeight = 'normal'; % [light | {normal} | demi | bold]
% strFontAngle = 'normal'; % [{normal} | italic | oblique] ps: only for axes
% strInterpreter = 'latex'; % [{tex} | latex]
% %
% strXLabel = 'label of x axis';
% strYLabel = 'label of y axis';
% %
% fXLabelRotation = 0.0;
% fYLabelRotation = 90.0;
% xlabel( strXLabel, ...
% 'FontName', strFontName, ...
% 'FontUnit', strFontUnit, ...
% 'FontSize', iFontSize, ...
% 'FontWeight', strFontWeight, ...
% 'Interpreter', strInterpreter);
% %
% ylabel( strYLabel, ...
% 'FontName', strFontName, ...
% 'FontUnit', strFontUnit, ...
% 'FontSize', iFontSize, ...
% 'FontWeight', strFontWeight, ...
% 'Interpreter', strInterpreter);
% %
% set(get(gca, 'XLabel'), 'Rotation', fXLabelRotation);
% set(get(gca, 'YLabel'), 'Rotation', fYLabelRotation);
% % in order to make matlab to do not "cut" latex-interpreted axes labels
% set(gca, 'Units', 'normalized', ...
% 'Position', [0.15 0.2 0.75 0.7]);

ca = gca;
ca;

fig = gcf;
fig;

% saveas(gcf,'test_plot','epsc')
print -depsc2 -loose test_plot2.eps