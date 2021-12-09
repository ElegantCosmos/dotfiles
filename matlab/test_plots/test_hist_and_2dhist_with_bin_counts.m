clear all;
close all;

% 1-D histogram:
figure(3);

bin_counts = [0, 1, 3];
bin_edges = [5, 7, 9, 15];
histogram('BinEdges', bin_edges, 'BinCounts', bin_counts, 'DisplayStyle', 'stairs');
ylim([0, 3.5]);
title("Test histogram");
xlabel("X-axis");
ylabel("Counts per bin");

print -painters -dpdf -loose test_hist.pdf

% 2-D histogram:
figure(4);

bin_counts = [0, 100, 200; 400, 30, 600; 300, 10, 8e90];
x_edges = [1, 2, 3, 4];
y_edges = [4, 5, 6, 7];
histogram2('XBinEdges', x_edges, 'YBinEdges', y_edges, 'BinCounts', bin_counts, 'DisplayStyle', 'tile', 'LineStyle', 'none');
grid('off'); % don't show grid
title("Test 2-D histogram");
xlabel("$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]");
ylabel("$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]");

% Axis
ax = gca;
ax.YAxis.Exponent = 1;

% Color bar
cb = colorbar();
cb.Label.String = "$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]";
format_colorbar(cb);

print -painters -dpdf -loose test_hist2d.pdf % -painters needed for hi-res