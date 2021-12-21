function format_colorbar(cb)
    %%% Format colorbar properties
    
    figwidth_in = 3.5; % inch
    goldenratio = 0.5*(1 + sqrt(5)); % golden ratio constant
    figheight_in = figwidth_in/goldenratio; % inch

    % Label properties:
    cb.Label.Interpreter = 'latex';
    cb.Label.Units = 'normalized';
    cb.Label.Position = [-4, 0.5];
    % cb.Label.String = '$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]';
    
    % Ruler properties:
    cb.Ruler.FontSize = 8;
    cb.Ruler.TickLabelGapOffset = -1.2;

    % Colorbar tick length:
    fontsize_pt = 8;
    points_per_inch = 72.0;
    ticklength_pt = fontsize_pt/3;
    
    % Position and shape of colorbar:
    cb_pos_x = 0.912;
    cb_pos_y = 0.172;
    cb_width = 0.01;
    cb_height = 0.74;
    cb.Position = [cb_pos_x, cb_pos_y, cb_width, cb_height];
    cb.TickLength = (ticklength_pt - 0.5)/(points_per_inch*max(cb_width*figwidth_in, cb_height*figheight_in)); % FIXME "-1" is approximate but wrong
    %cb.Box = 'off'

%     cb_pos_x = 0.125;
%     cb_pos_y = 0.05;
%     cb_width = 0.75;
%     cb_height = 0.1;
%     cb.Position = [cb_pos_x, cb_pos_y, cb_width, cb_height];
%     cb.TickLength = 1 - 0.5*(0.5/points_per_inch/max(cb_width*figwidth_in, cb_height*figheight_in))
%     %cb.Box = 'off'

    % Manually move exponent of color bar if it doesn't fit on print page
    if strcmp(cb.Ruler.Scale, 'log') == logical(false) % ignore if colorbar scale is log
        exp_cb = cb.Ruler.Exponent; % get exponent
        cb.Ruler.TickLabelMode = 'manual'; % turn off tick labels
        if exp_cb ~= 0 % if exponent exists
            exp_str = annotation('textbox', [0.9, 0.902, 0, 0], ... % write exponent
                'String', ['$\times 10^{', num2str(exp_cb), '}$'], ...
                'Interpreter', 'latex', ...
                'FontUnits', 'points', ...
                'FontSize', 8, ...
                'EdgeColor', 'none', ...
                'HorizontalAlignment', 'left', ...
                'VerticalAlignment', 'bottom');
        end
        cb_ticks = cb.Ruler.TickValues/10^(double(exp_cb)); % colorbar axis ticks
        cb.Ruler.TickLabel = cb_ticks; % manually set colorbar tick values
    end
end
