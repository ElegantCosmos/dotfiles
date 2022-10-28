%%% Save two plot figures in *.fig file.

clear;
close all;

% Define lines.
x1 = [1, 3, 4];
y1 = [10, 1, 4];
x2 = [2, 3, 4];
y2 = [5, 6, 7];

% % Save plot figures in .fig files.
file1 = 'plot1.fig';
file2 = 'plot2.fig';
if exist(file1, "file") == 2
    display(file1 + " exists.");
    delete(file1);
end
if exist(file2, "file") == 2
    display(file2 + " exists.");
    delete(file2);
end
plot(x1, y1);
savefig(file1);
plot(x2, y2);
savefig(file2);

clear;
close all;


%%% Retrieve figures in *.fig files and overlay them on a single figure.

fig = figure(1); % create new figure axis to re-plot and overlay data from two figures.
ax = gca();

ax.Children

file1 = 'plot1.fig';
file2 = 'plot2.fig';
fig1 = openfig(file1, "invisible"); % open figure, but do not show; opened figure will be active as if opened
fig2 = openfig(file2, "invisible");

ax.Children

ax1 = fig1.Children(1); % if each figure has more than on axis, you may need to increment the argument
ax2 = fig2.Children(1);
line1 = ax1.Children(1); % if each axis has more than one line, you may need to increment the argument
line2 = ax2.Children(1);
global colors_tableau_classic_10; % get global color definitions already defined in startup.m
line1.Color = colors_tableau_classic_10(1, :); % change color of retrieved line
line2.Color = colors_tableau_classic_10(2, :);
copyobj(line1, ax); % copy data from retrieved axis to new axis (appending to back array)
copyobj(line2, ax);

ax.Children

format_axes(ax); % in case new axis looks strange, format it
xlabel("X Label");
ylabel("Y Label");

legend([ax.Children(1), ax.Children(2)], {"Line 1", "Line 2"}); % order of items saved in ax.Children follows order of copyobj

saveas(fig, "overlay_data_from_figures_in_fig_files");
print(fig, "overlay_data_from_figures_in_fig_files", "-dpdf");