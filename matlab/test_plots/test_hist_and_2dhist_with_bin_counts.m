clear all;
close all;

%%% 1-D histogram:
figure(3);

bin_counts = [0, 1, 3, 4, 3, 4, 7, 3, 4, 10];
bin_edges = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
histogram('BinEdges', bin_edges, 'BinCounts', bin_counts, 'DisplayStyle', 'stairs');
%xlim([0, 10]);
%ylim([0.5, 3.5]);
%set(gca, 'XScale', 'log');
title('Test histogram');
xlabel('X-axis');
ylabel('Counts per bin');

print('test_hist', '-dpdf', '-painters')


%%% 2-D histogram:
figure(4);

bin_counts = [1e-5, 1e-6, 1e-7; 1e-8, 1e-9, 1e-9; 1e-9, 1e-9, 1e-9];
x_edges = [1, 2, 3, 4];
y_edges = [4, 5, 6, 7];
histogram2('XBinEdges', x_edges, 'YBinEdges', y_edges, 'BinCounts', bin_counts, 'DisplayStyle', 'tile', 'LineStyle', 'none');
%xlim([0, 4]);
grid('off'); % don't show grid
title('Test 2-D histogram');
xlabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');
ylabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');

% Axis
%ax = gca;
%ax.YAxis.Exponent = 1;

% Color bar
cb = colorbar();
%cb.Ruler.Limits = [0.5, 1e7];
cb.Label.String = '$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]';
cb.Ruler.Scale = 'log';
% cb.Ruler.Limits = [0.5, 1000]
format_colorbar(cb);
%cb.Ruler

print('test_hist2', '-dpdf', '-painters') % -painters needed for hi-res