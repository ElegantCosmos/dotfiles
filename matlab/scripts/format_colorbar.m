function format_colorbar(colorbar)
    % Format colorbar properties
    
    % colorbar.Label.String = "$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]";
    colorbar.Ruler.FontSize = 8;
    colorbar.Label.Interpreter = "latex";
    colorbar.Label.Position(1) = -4;
    colorbar.Position = [0.925, 0.172, 0.01, 0.75];
    colorbar.Ruler.TickLabelGapOffset = 0;
    
    % Manually move exponent of color bar if it doesn't fit on print page
    exp_cb = colorbar.Ruler.Exponent; % get exponent
    colorbar.Ruler.TickLabelMode = 'manual'; % turn off tick labels
    exp_str = annotation('textbox', [0.9, 0.902, 0, 0], ... % write exponent
        'String', ['$\times 10^{', num2str(exp_cb), '}$'], ...
        'Interpreter', 'latex', ...
        'FontUnits', 'points', ...
        'FontSize', 8, ...
        'EdgeColor', 'none', ...
        'HorizontalAlignment', 'left', ...
        'VerticalAlignment', 'bottom');
    cb_ticks = colorbar.Ruler.TickValues/10^(double(exp_cb)); % manually set color bar axis ticks
    colorbar.Ruler.TickLabel = cb_ticks;
end