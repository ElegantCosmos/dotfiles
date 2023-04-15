function format_for_publication(obj)
	%% Constants for formatting:
	figure_scale = 2.0; % arbitrary scale for easier viewing on high PPI screen
	golden_ratio = 0.5*(1 + sqrt(5)); % golden ratio
	cm_per_in = 2.54;
	pt_per_in = 72.0; % definition for international Pt (not US Pt)
	fontsize_pt = 8;
	linewidth_pt = 0.5;
	markersize_pt = 3;
	ticklabel_xoffset = 0;
	ticklabel_yoffset = 0.5;
	%ticklabel_zoffset = ?;
	axislabel_xoffset_cm = -0.5;
	axislabel_yoffset_cm = -0.9;
	%axislabel_zoffset_cm = ?;


	%% Constant figure dimensions:
	textcolumnwidth_cm = 9.00; % width of text column for double-column article
	top_margin_cm = 0.40;
	left_margin_cm = 1.30;
	plot_area_width_cm = 7.0;
	plot_area_height_cm = plot_area_width_cm/golden_ratio;


	%% Dimensions for figure paper with single text column width:
	figure_paper_width_cm = textcolumnwidth_cm; % width for single y-axis on left-hand side
	%figure_paper_width_cm = 2*left_margin_cm + plot_area_width_cm; % width for y-axes on left and right-hand sides
	figure_paper_height_cm = 5.75; % no color bar below plot
	%figure_paper_height_cm = 6.75; % color bar below plot

	%% Dimensions for square figure paper with single text column width:
	%figure_paper_width_cm = textcolumnwidth_cm;
	%figure_paper_height_cm = figure_paper_width_cm;

	%% Dimensions for figure paper with double text column width:
	%textcolumnspacing_cm = 1.0;
	%figure_paper_width_cm = 2*textcolumnwidth_cm + textcolumnspacing_cm;
	%figure_paper_height_cm = 5.75; % no color bar below plot
	%figure_paper_height_cm = 6.75; % color bar below plot
	%plot_area_width_cm = plot_area_width_cm + textcolumnspacing_cm + textcolumnwidth_cm % extend by extra width available spanning two columns


	%% Derived figure dimensions:
	bottom_margin_cm = figure_paper_height_cm - top_margin_cm - plot_area_height_cm;

	left_margin_frac = left_margin_cm/figure_paper_width_cm;
	bottom_margin_frac = bottom_margin_cm/figure_paper_height_cm;
	plot_area_width_frac = plot_area_width_cm/figure_paper_width_cm;
	plot_area_height_frac = plot_area_height_cm/figure_paper_height_cm;


	%% Other dimensions:
	ticklength_cm = fontsize_pt/pt_per_in*cm_per_in/3.0; % 1/3 of standard font pt size
	ticklength_norm = ticklength_cm/max(plot_area_width_frac*figure_paper_width_cm, plot_area_height_frac*figure_paper_height_cm);


	%% Apply scaling:
	fontsize_pt = figure_scale*fontsize_pt;
	linewidth_pt = figure_scale*linewidth_pt;
	markersize_pt = figure_scale*markersize_pt;
	axislabel_xoffset_cm = figure_scale*axislabel_xoffset_cm;
	axislabel_yoffset_cm = figure_scale*axislabel_yoffset_cm;
	ticklabel_xoffset = figure_scale*ticklabel_xoffset;
	ticklabel_yoffset = figure_scale*ticklabel_yoffset;
	figure_paper_width_cm = figure_scale*figure_paper_width_cm;
	figure_paper_height_cm = figure_scale*figure_paper_height_cm;
	top_margin_cm = figure_scale*top_margin_cm;
	bottom_margin_cm = figure_scale*bottom_margin_cm;
	left_margin_cm = figure_scale*left_margin_cm;
	plot_area_width_cm = figure_scale*plot_area_width_cm;
	plot_area_height_cm = figure_scale*plot_area_height_cm;


	%% Below is where the action happens.
	class_name = class(obj);
	disp(class_name);
	if strcmp(class_name, 'matlab.ui.Figure') == true
		%% Format figure properties.
		fig = obj;

		%get(groot, 'factory') % show default factory values for debugging

		%% Figure dimensions:
		fig.Units = 'centimeters';
		%% Paper* arguments below for *.pdf plots?
		fig.PaperUnits = 'centimeters';
		fig.PaperSizeMode = 'manual';
		fig.PaperSize = [figure_paper_width_cm figure_paper_height_cm];
		fig.PaperPosition = [1 1 figure_paper_width_cm figure_paper_height_cm];
		%% ATTENTION: if PaperPositionMode is not 'auto' the saved file
		%% could have different dimensions from the one shown on the screen!
		fig.PaperPositionMode = 'auto';
		fig.PaperTypeMode = 'manual';
		fig.PaperType = '<custom>';
		%% for *.eps plots?
		fig.Position = [1 1 figure_paper_width_cm figure_paper_height_cm];
		fig.Color = [1 1 1]; % background color of figure

		%% Other settings I couldn't find handles for so use global setting.
		%% Not ideal. FIXME
		set(groot, 'defaultLegendInterpreter', 'latex');
		set(groot, 'defaultLineLineWidth', linewidth_pt);
		set(groot, 'defaultStairLineWidth', linewidth_pt);
		set(groot, 'defaultHistogramDisplayStyle', 'stairs');
		set(groot, 'defaultHistogramEdgeColor', [1, 1, 1]);
		set(groot, 'defaultHistogramLineWidth', linewidth_pt);
		set(groot, 'defaultLineMarkerSize', markersize_pt); % doesn't work?

	elseif strcmp(class_name, 'matlab.graphics.axis.Axes') == true
		%% Format axes properties.
		ax = obj;

		% Axes properties:
		%ax.Units = 'normalized';
		%ax.Position = [left_margin_frac bottom_margin_frac plot_area_width_frac plot_area_height_frac];
		ax.Units = 'centimeters';
		ax.Position = [left_margin_cm bottom_margin_cm plot_area_width_cm plot_area_height_cm];
		ax.Title.Interpreter = 'latex';
		ax.XLabel.Interpreter = 'latex';
		ax.YLabel.Interpreter = 'latex';
		ax.ZLabel.Interpreter = 'latex';
		ax.TickLabelInterpreter = 'latex';
		ax.FontUnits = 'points'; % units of the size of fonts % [{points} | normalized | inches | centimeters | pixels]
		ax.FontSizeMode = 'manual';
		ax.FontSize = fontsize_pt; % size of fonts of labels
		ax.LineWidthMode = 'manual';
		ax.LineWidth = linewidth_pt;
		%ax.GridLineWidth = 0.5*linewidth_pt; % usable from R2023a
		%ax.MinorGridLineWidth = 0.5*linewidth_pt; % usable from R2023a
		ax.FontWeight = 'normal'; % weight of fonts of labels % [light | {normal} | demi | bold]
		ax.TitleFontWeight = 'normal'; % weight of font of title % [light | {normal} | demi | bold]
		ax.FontAngle = 'normal'; % inclination of fonts of labels % [{normal} | italic | oblique] ps: only for axes
		ax.XMinorTick = 'on'; % [on | {off}]
		ax.YMinorTick = 'on'; % [on | {off}]
		ax.TickDirMode = 'manual';
		ax.TickDir = 'out'; % [{in} | out] inside or outside (for 2D)
		ax.TickLength = [ticklength_norm ticklength_norm]; % length of the ticks
		ax.TitleFontSizeMultiplier = 1; % title font size multiplier factor
		ax.LabelFontSizeMultiplier = 1; % label font size multiplier factor

		ax.XRuler.Label.Units = 'centimeters';
		ax.YRuler.Label.Units = 'centimeters';
		ax.ZRuler.Label.Units = 'centimeters';
		ax.XRuler.Label.Position(2) = axislabel_xoffset_cm; % vertical position
		ax.YRuler.Label.Position(1) = axislabel_yoffset_cm; % horizontal position
		%ax.ZRuler.Label.Position(1) = axislabel_zoffset_cm; % don't know best number yet
		%ax.XRuler.TickLabelGapOffsetUnits = 'centimeters';
		ax.XRuler.TickLabelGapOffset = ticklabel_xoffset;
		ax.YRuler.TickLabelGapOffset = ticklabel_yoffset;
		%ax.ZRuler.TickLabelGapOffset = ticklabel_zoffset; % don't know best number yet

		ax.XRuler.TickLabelsMode = 'auto';


		%% Edit width of all lines in plot.
		children = ax.Children;
		for i = 1:length(children)
			child = children(i);
			child.LineWidth = linewidth_pt;
		end


		%% Set default color order.
		%% Classic Tableau 10:
		%colors_tableau_classic_10 = [... % MatLab gives error
		%	"#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", ...
		%	"#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"];
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
			023, 190, 207;
		]./255.0;
		%colors_tableau_classic_10 = num2cell(colors_tableau_classic_10, 2); % MatLab gives error
		ax.ColorOrder = colors_tableau_classic_10;

		%% Classic Tableau 20:
		%colors_tableau_classic_20 = [... % MatLab gives error
		%	"#1f77b4", "#aec7e8", "#ff7f0e", "#ffbb78", "#2ca02c", ...
		%	"#98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5", ...
		%	"#8c564b", "#c49c94", "#e377c2", "#f7b6d2", "#7f7f7f", ...
		%	"#c7c7c7", "#bcbd22", "#dbdb8d", "#17becf", "#9edae5"];
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
			158, 218, 229;
		]./255.0;
		%colors_tableau_classic_20 = num2cell(colors_tableau_classic_20, 2); % MatLab gives error
		%ax.ColorOrder = colors_tableau_classic_20;


		%%% Function to remove ticks above and on the right hand side of plot.
		%%% I want to merge this code into defaultAxesCreateFcn in setup.m,
		%%% but I don't know how.
		%% Get handle to current axes:
		%%ax = gca;
		%% set box property to off and remove background color
		%set(ax, 'Box', 'off', 'Color', 'none');
		%% create new, empty axes with box but without ticks
		%ax_b = axes(...
		%	'Parent', ax.Parent, ...
		%	'Units', ax.Units, ...
		%	'Position', ax.Position, ...
		%	'Box', 'on', ...
		%	'XTick', [], ...
		%	'YTick', [], ...
		%	'LineWidth', linewidth_pt, ...
		%	'XLim', ax.XLim, ...
		%	'YLim', ax.YLim, ...
		%	'ZLim', ax.ZLim);
		%% set original axes as active
		%axes(ax);
		%% link axes in case of zooming
		%linkaxes([ax ax_b])

		%%%% Use math format minus sign instead of hyphen in tick labels if axis is linear.
		%if strcmp(ax.XRuler.Scale, 'linear') == true % only linear scale tick labels need to be fixed for some reason
		%	ax.XAxis.TickLabels = strrep(ax.XAxis.TickLabels, '-', '$-$'); % forces axis exponent to not be displayed
		%	ax.XRuler.TickLabels = strrep(ax.XRuler.TickLabels, '-', '$-$'); % forces axis exponent to not be displayed, may be redundant
		%	text(0, 0, ax.XRuler.SecondaryLabel.String, ... % write exponent manually
		%		'Units', ax.XRuler.SecondaryLabel.Units, ...
		%		'Position', ax.XRuler.SecondaryLabel.Position, ...
		%		'HorizontalAlignment', ax.XRuler.SecondaryLabel.HorizontalAlignment, ...
		%		'VerticalAlignment', ax.XRuler.SecondaryLabel.VerticalAlignment, ...
		%		'Interpreter', 'latex', ...
		%		'FontUnits', 'points', ...
		%		'FontSize', fontsize_pt, ...
		%		'EdgeColor', 'none');
		%end
		%if strcmp(ax.YRuler.Scale, 'linear') == true % only linear scale tick labels need to be fixed for some reason
		%	ax.YAxis.TickLabels = strrep(ax.YAxis.TickLabels, '-', '$-$'); % forces axis exponent to not be displayed
		%	ax.YRuler.TickLabels = strrep(ax.YRuler.TickLabels, '-', '$-$'); % forces axis exponent to not be displayed, may be redundant
		%	text(0, 0, ax.YRuler.SecondaryLabel.String, ... % write exponent manually
		%		'Units', ax.YRuler.SecondaryLabel.Units, ...
		%		'Position', ax.YRuler.SecondaryLabel.Position, ...
		%		'HorizontalAlignment', ax.YRuler.SecondaryLabel.HorizontalAlignment, ...
		%		'VerticalAlignment', ax.YRuler.SecondaryLabel.VerticalAlignment, ...
		%		'Interpreter', 'latex', ...
		%		'FontUnits', 'points', ...
		%		'FontSize', fontsize_pt, ...
		%		'EdgeColor', 'none');
		%end
		%if strcmp(ax.ZRuler.Scale, 'linear') == true % only linear scale tick labels need to be fixed for some reason
		%	ax.ZAxis.TickLabels = strrep(ax.ZAxis.TickLabels, '-', '$-$'); % forces axis exponent to not be displayed
		%	ax.ZRuler.TickLabels = strrep(ax.ZRuler.TickLabels, '-', '$-$'); % forces axis exponent to not be displayed, may be redundant
		%	text(0, 0, ax.ZRuler.SecondaryLabel.String, ... % write exponent manually
		%		'Units', ax.ZRuler.SecondaryLabel.Units, ...
		%		'Position', ax.ZRuler.SecondaryLabel.Position, ...
		%		'HorizontalAlignment', ax.ZRuler.SecondaryLabel.HorizontalAlignment, ...
		%		'VerticalAlignment', ax.ZRuler.SecondaryLabel.VerticalAlignment, ...
		%		'Interpreter', 'latex', ...
		%		'FontUnits', 'points', ...
		%		'FontSize', fontsize_pt, ...
		%		'EdgeColor', 'none');
		%end

	elseif strcmp(class_name, 'matlab.graphics.illustration.ColorBar') == true
		%% Format colorbar properties.
		cb = obj;

		% Colorbar properties:
		cb.LineWidth = linewidth_pt;

		% Label properties:
		cb.Label.Interpreter = 'latex';
		cb.TickLabelInterpreter = 'latex';
		cb.Label.Units = 'centimeters';
		%cb.Label.Position(2) = axislabel_xoffset_cm; % vertical position; does not seem to work
		%cb.Label.String = '$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]';

		% Ruler properties:
		cb.Ruler.LineWidthMode = 'manual';
		cb.Ruler.LineWidth = linewidth_pt;
		cb.Ruler.FontSize = fontsize_pt;
		cb.Ruler.Label.Units = 'centimeters';
		%cb.Ruler.Label.Position(2) = axislabel_xoffset_cm; % vertical position; does not seem to work
		cb.Ruler.TickLabelGapOffset = ticklabel_xoffset;

		% Position and shape of colorbar:
		cb.Units = 'centimeters';
		cb.Location = 'southoutside';
		cb_yoffset_cm = -1.1;
		cb_yoffset_cm = figure_scale*cb_yoffset_cm;
		pos_cb_y_cm = (figure_paper_height_cm - top_margin_cm - plot_area_height_cm + cb_yoffset_cm);
		cb_height_cm = fontsize_pt/pt_per_in*cm_per_in/3.0;
		cb.PositionMode = 'manual';
		cb.Position = [left_margin_cm, pos_cb_y_cm, plot_area_width_cm, cb_height_cm];
		cb.AxisLocationMode = 'manual';
		cb.AxisLocation = 'out';
		cb.TickDirection = 'out';
		cb.Box = 'off';
		cb.TickLength = ticklength_norm;
		cb.CreateFcn = @colorBarCreateFcn;

		%%% Use following with caution. Need to find a consistent work around to replace colorbar axis label hyphens with minus sign.
		%cb.TickLabels = strrep(cb.TickLabels, '-', '$-$');
		%cb.Ruler.TickLabels = strrep(cb.Ruler.TickLabels, '-', '$-$');

		%% Manually move exponent of color bar if it doesn't fit on print page
		%if strcmp(cb.Ruler.Scale, 'log') == logical(false) % ignore if colorbar scale is log
		%	cb_exp = cb.Ruler.Exponent; % get exponent
		%	cb.Ruler.TickLabelMode = 'manual'; % turn off tick labels
		%	if cb_exp ~= 0 % if exponent exists
		%		exp_str = annotation('textbox', [0.9, 0.902, 0, 0], ... % write exponent
		%			'String', ['$\times 10^{', num2str(cb_exp), '}$'], ...
		%			'Interpreter', 'latex', ...
		%			'FontUnits', 'points', ...
		%			'FontSize', fontsize_pt, ...
		%			'EdgeColor', 'none', ...
		%			'HorizontalAlignment', 'left', ...
		%			'VerticalAlignment', 'bottom');
		%	end
		%	cb_ticks = cb.Ruler.TickValues/10^(double(cb_exp)); % colorbar axis ticks
		%	cb.Ruler.TickLabels = cb_ticks; % manually set colorbar tick values
		%end

		%%% Format hyphen to be minus sign in colorbar tick labels.
		if strcmp(cb.Ruler.Scale, 'linear') == true % only linear scale tick labels need to be fixed for some reason
			cb.TickLabels = strrep(cb.TickLabels, '-', '$-$');  % forces axis exponent to not be displayed
			cb.Ruler.TickLabels = strrep(cb.Ruler.TickLabels, '-', '$-$'); % forces axis exponent to not be displayed, may be redundant
			cb_exp_str = cb.Ruler.SecondaryLabel.String;
			cb_exp_yoffset_cm = -0.6; % offset wrt y-position of x-axis
			cb_exp_yoffset_cm = figure_scale*cb_exp_yoffset_cm;
			tc = text(0, 0, cb_exp_str, ... % write exponent manually
				'Units', 'centimeters', ...
				'Position', [plot_area_width_cm, cb_yoffset_cm + cb_exp_yoffset_cm, 0], ...
				'HorizontalAlignment', cb.Ruler.SecondaryLabel.HorizontalAlignment, ...
				'VerticalAlignment', cb.Ruler.SecondaryLabel.VerticalAlignment, ...
				'Interpreter', 'latex', ...
				'FontUnits', 'points', ...
				'FontSize', fontsize_pt, ...
				'EdgeColor', 'none');
		end
	end
end
