function format_colorbar(cb)
    %%% Format colorbar properties

    % Get global variables for figure dimensions:
	global global_figure_scale;
	global global_fontsize_pt;
	global global_left_margin_frac;
	global global_plot_area_width_frac;

    % Label properties:
    cb.Label.Interpreter = 'latex';
    %cb.Label.Units = 'normalized';
    %cb.Label.String = '$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]';
    
    % Ruler properties:
    cb.Ruler.FontSize = global_fontsize_pt;
    cb.Ruler.TickLabelGapOffset = int8(global_figure_scale*0);
    
    % Position and shape of colorbar:
	cb.Location = 'southoutside';
    cb_pos_y = 0.15;
    cb_height = 0.01;
    cb.Position = [global_left_margin_frac, cb_pos_y, global_plot_area_width_frac, cb_height];

    % % For debugging:
    % cb_pos_x = 0.13;
    % cb_pos_y = 0.05;
    % cb_width = 0.74;
    % cb_height = 0.1;
    % cb.Position = [cb_pos_x, cb_pos_y, cb_width, cb_height];

    % Manually move exponent of color bar if it doesn't fit on print page
    if strcmp(cb.Ruler.Scale, 'log') == logical(false) % ignore if colorbar scale is log
        exp_cb = cb.Ruler.Exponent; % get exponent
        cb.Ruler.TickLabelMode = 'manual'; % turn off tick labels
        if exp_cb ~= 0 % if exponent exists
            exp_str = annotation('textbox', [0.9, 0.902, 0, 0], ... % write exponent
                'String', ['$\times 10^{', num2str(exp_cb), '}$'], ...
                'Interpreter', 'latex', ...
                'FontUnits', 'points', ...
                'FontSize', global_fontsize_pt, ...
                'EdgeColor', 'none', ...
                'HorizontalAlignment', 'left', ...
                'VerticalAlignment', 'bottom');
        end
        cb_ticks = cb.Ruler.TickValues/10^(double(exp_cb)); % colorbar axis ticks
        cb.Ruler.TickLabel = cb_ticks; % manually set colorbar tick values
    end
end
