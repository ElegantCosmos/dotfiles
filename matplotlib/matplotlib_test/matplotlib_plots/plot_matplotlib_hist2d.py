#!/usr/bin/env python3

from matplotlib.colors import LogNorm
import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.axes_grid1 import make_axes_locatable

import sys
sys.path.append("/home/sakaim1/.dotfiles/matplotlib/modules")
import publication_format


# normal distribution center at x=0 and y=0
bin_edges_x = (0, 250, 500, 750, 1000)
bin_edges_y = (0, 250, 500, 750, 1000)
xs = [100, 300, 800]
ys = [100, 300, 800]
ws = [1e-1, 1e-8, 1e10]

publication_format.set_rcparams()
fig, ax = plt.subplots()
hist, _, _, image = ax.hist2d(xs, ys, bins=(bin_edges_x, bin_edges_y), weights=ws, norm=LogNorm())
#hist, _, _, image = ax.hist2d(xs, ys, bins=(bin_edges_x, bin_edges_y), weights=ws, vmin=0, cmin=0.01); label_pad_cb = -28.5
plt.title("Sample title")
ax.set_xlabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]")
ax.set_ylabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]")
#publication_format.format(ax)

cax = fig.add_axes((0, 0, 0, 0))
publication_format.format_colorbar_axes(cax)
cbar = fig.colorbar(image, cax=cax, orientation='horizontal')
cax.set_xlabel(r"$E_{gqyp}$ $\log{10}_{10}$ $10^{10}$ $\sqrt{2}$ [cm]")

#plt.show()
plt.savefig("matplotlib_hist2d.pdf")
