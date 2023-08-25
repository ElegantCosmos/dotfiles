clear;

fig = figure(1);
format_for_publication(fig);

x = [0 250 500 750 1000];
y = [-1000 -500 0 500 1000];
err_frac = [0.5 0.1 0.2 0.1 0.3];
err = y.*err_frac;
errorbar(x, y, err, 'o', 'MarkerSize', 4, 'Color', 'black');

% Plot labels:
title('Test graph');
xlabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');
ylabel('$\log_{10}{10} E_{gqyp} 10^{10}/\sqrt{2}$ [cm]');

% Axes properties:
ax = gca;
%ax.YAxis.Exponent = 1;
%ax.XAxis.Exponent = 1;
%set(gca, 'XScale', 'log');
grid();
format_for_publication(ax);

save_for_publication(gcf, 'matlab_graph');
