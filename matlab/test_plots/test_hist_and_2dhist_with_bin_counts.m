clear all;
close all;

%%% 1-D histogram:
figure(3);

bin_counts = [0, 1, 3, 4, 3, 4, 7, 3, 4, 10];
bin_edges = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
histogram('BinEdges', bin_edges, 'BinCounts', bin_counts, 'DisplayStyle', 'stairs');
title('Test histogram');
xlabel('X-axis');
ylabel('Counts per bin');

ax = gca;
format_axes(ax);
ax.XScale = 'log';
ax.YScale = 'log';
ax.YLim = [1, 12];

print('test_hist', '-dpdf', '-painters')


%%% 2-D histogram:
figure(4);

bin_counts = [0, 0.01, 0.1; 0, 0.00001, 10; 0, 1, 10];
x_edges = [1000, 2000, 3000, 4000];
y_edges = [4000, 5000, 6000, 7000];
histogram2('XBinEdges', x_edges, 'YBinEdges', y_edges, 'BinCounts', bin_counts, 'DisplayStyle', 'tile', 'LineStyle', 'none');
title('Test 2-D histogram');
xlabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');
ylabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');

grid('off'); % don't show grid

% Axes (do this before colorbar):
ax = gca; % axis parameters need to be set before format_colorbar() for some reason
format_axes(ax);
ax.ColorScale = 'log';
ax.CLim = ([1e-7 10e-5]);

% Colorbar:
cb = colorbar();
format_colorbar(cb);
cb.Label.String = '$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]';

print('test_hist2', '-dpdf', '-painters') % -painters needed for hi-res