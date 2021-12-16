from matplotlib.colors import LogNorm
import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.axes_grid1 import make_axes_locatable

def colorbar(mappable):
    ax = mappable.axes
    fig = ax.figure
    divider = make_axes_locatable(ax)
    cax = divider.append_axes("right", size="5%", pad=0.05)
    return fig.colorbar(mappable, cax=cax)

# normal distribution center at x=0 and y=0
bin_edges_x = (0, 1, 2, 3)
bin_edges_y = (10, 11, 12, 13)
xs = [0.5, 1.5, 2.5]
ys = [11.5, 12.5, 12.5]
ws = [0.1, 1e-7, 100]

fig, ax = plt.subplots()
hist, xedges, yedges, image = ax.hist2d(xs, ys, bins=(bin_edges_x, bin_edges_y), weights=ws, norm=LogNorm()); label_pad_cb = -31.5
#hist, _, _, image = ax.hist2d(xs, ys, bins=(bin_edges_x, bin_edges_y), weights=ws, vmin=0, cmin=0.01); label_pad_cb = -28.5
plt.title("Sample title")
ax.set_xlabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]", labelpad=None)
ax.set_ylabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]", labelpad=None)

cax = fig.add_axes([0.912, 0.172, 0.01, 0.74])
cbar = fig.colorbar(image, cax=cax, orientation='vertical')
cax.set_ylabel(r"$E_{gqyp}$ $\log{10}_{10}$ $10^{10}$ $\sqrt{2}$ [cm]",
		labelpad=label_pad_cb)
cax.tick_params(pad=-0.5)

#plt.show()
plt.savefig("test_2dhist.pdf")
