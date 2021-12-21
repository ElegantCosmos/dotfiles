function format_axes(ax)
    %%% Function to remove ticks above and on the right hand side of plot.
    %%% I want to merge this code into defaultAxesCreateFcn in setup.m,
    %%% but I don't know how.

    % Get handle to current axes:
    %ax = gca;
    % set box property to off and remove background color
    set(ax, 'box', 'off', 'color', 'none')
    % create new, empty axes with box but without ticks
    ax_b = axes('Position', get(ax ,'Position'), 'box', 'on', 'xtick', [], 'ytick', []);
    % set original axes as active
    axes(ax)
    % % link axes in case of zooming
    % linkaxes([ax ax_b])
end