% Define lines.
x1 = [1, 3, 4];
y1 = [10, 1, 4];
x2 = [2, 3, 4];
y2 = [5, 6, 7];

% Save plot figures in .fig files.
plot(x1, y1);
savefig("plot1");
plot(x2, y2);
savefig("plot2");

% Retrieve axes from saved figures.
fig1 = openfig("plot1.fig", "invisible");
fig2 = openfig("plot2.fig", "invisible");
ax1 = fig1.Children;
ax2 = fig2.Children;

% Create new figure axis to re-plot and overlay data from two figures.
f = figure();
ax = gca();
copyobj(ax1.Children, ax); % copy data from retrieved axis to new axis
copyobj(ax2.Children, ax); % copy data from retrieved axis to new axis

format_axes(ax); % in case new axis looks strange, format it
xlabel("X Label");
ylabel("Y Label");
