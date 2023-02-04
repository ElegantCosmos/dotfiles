clear;
close all;

%%% 1-D histogram:
fig = figure(3);
format_for_publication(fig);

bin_counts_0 = [0, 1, 3, 4, 3, 4, 7, 3, 4, 10];
bin_counts_1 = [0, 10, 5, 1, 4, 4, 9, 10, 10, 0];
bin_edges = [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8];
bin_edges = 1e-6*bin_edges;
histogram('BinEdges', bin_edges, 'BinCounts', bin_counts_0);
hold on;
h = histogram('BinEdges', bin_edges, 'BinCounts', bin_counts_1);
hold off;
fig = gcf;
legend;
title('Test histogram');
xlabel('X-axis');
ylabel('Counts per bin');

ax = gca;
ax.XScale = 'log';
ax.YScale = 'log';
ax.YLim = [1, 12];
format_for_publication(ax);

%print('test_hist', '-dpdf', '-painters');
save_for_publication(fig, 'test_hist');


%%% 2-D histogram:
fig = figure(4);
format_for_publication(fig);

bin_counts = [0, 0, 0; 0, 0, 0; 1e-3, 0, 1e-6];
x_edges = [1000, 2000, 3000, 4000];
y_edges = [-600, -200, 200, 600];
histogram2('XBinEdges', x_edges, 'YBinEdges', y_edges, 'BinCounts', bin_counts, 'DisplayStyle', 'tile', 'LineStyle', 'none');
title('Test 2-D histogram');
xlabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');
ylabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');

grid('off'); % don't show grid

% Axes (do this before colorbar):
ax = gca; % axis parameters need to be set before format_publish_style_colorbar() for some reason
ax.ColorScale = 'linear';
%ax.XScale = 'log';
%ax.CLim = ([1e-7 10e-5]);
ax.XRuler.Exponent = 3;
cb.Ruler.Exponent = -3;
format_for_publication(ax);

% Colorbar:
cb = colorbar();
format_for_publication(cb);
cb.Label.String = '$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]';


%print('test_hist2d', '-dpdf', '-painters'); % -painters needed for hi-res
save_for_publication(fig, 'test_hist2d');
