clear all;
close all;

%%% 1-D histogram:
figure(3);

bin_counts = [0, 1, 3, 4, 3, 4, 7, 3, 4, 10];
bin_edges = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
histogram('BinEdges', bin_edges, 'BinCounts', bin_counts, 'DisplayStyle', 'stairs');
ax = gca;
ax.XScale = 'log';
ax.YScale = 'log';
ax.YLim = [1, 12]
title('Test histogram');
xlabel('X-axis');
ylabel('Counts per bin');

print('test_hist', '-dpdf', '-painters')


%%% 2-D histogram:
figure(4);

bin_counts = [0, 0.01, 0.1; 0, 1, 10; 0, 1, 10];
x_edges = [1, 2, 3, 4];
y_edges = [4, 5, 6, 7];
histogram2('XBinEdges', x_edges, 'YBinEdges', y_edges, 'BinCounts', bin_counts, 'DisplayStyle', 'tile', 'LineStyle', 'none');
grid('off'); % don't show grid
title('Test 2-D histogram');
xlabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');
ylabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');

% Color bar
cb = colorbar();
cb.Label.Interpreter = 'latex';
cb.Label.String = '$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]';
ax = gca; % axis parameters need to be set before format_colorbar() for some reason
%ax.YAxis.Exponent = 1;
ax.ColorScale = 'log';
ax = gca;
ax.CLim = ([1e-2 20]);
format_colorbar(cb);

print('test_hist2', '-dpdf', '-painters') % -painters needed for hi-res