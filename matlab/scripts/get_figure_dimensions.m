function [textcolumnwidth_in, ...
    figwidth_in, figheight_in, ...
    margin_left_frac, margin_bottom_frac, ...
    plot_width_frac, plot_height_frac] = ...
    get_figure_dimensions()
%GET_FIGURE_DIMENSIONS Get width and height and other dimensions of figure.
%   Calculate overall figure size based on double text column paper.
%   Use golden ratio to get figure height.

    goldenratio = 0.5*(1 + sqrt(5)); % golden ratio constant
    mm_per_in = 25.4;

    % Paper text body dimensions:
    textcolumnwidth_mm = 90;
    textcolumnspacing_mm = 10;
    
    % Common figure dimensions:
    margin_left_frac = 0.13;
    margin_bottom_frac = 0.172;
    plot_width_frac = 0.74;
    plot_height_frac = 0.74;
    
    textcolumnwidth_in = textcolumnwidth_mm/mm_per_in;

    % % Dimensions for figure with width = 90 mm and equal axes lengths
    % figwidth_in = textcolumnwidth_mm/mm_per_in;
    % figheight_in = figwidth_in;

    % Dimensions for figure with width = 90 mm and golden ratio axes lengths
    figwidth_in = textcolumnwidth_mm/mm_per_in;
    figheight_in = figwidth_in/goldenratio;

    % % Dimensions for figure with width = 190 mm and fixed vertical axis length
    % figwidth_in = (2*textcolumnwidth_mm + textcolumnspacing_mm)/mm_per_in;
    % figheight_in = textcolumnwidth_mm/mm_per_in/goldenratio;
    % margin_left_frac = margin_left_frac*textcolumnwidth_mm/mm_per_in/figwidth_in;
    % plot_width_frac = 1 - 2*margin_left_frac;
end

