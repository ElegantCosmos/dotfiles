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
bin_edges_x = (0, 1000, 2000, 3000)
bin_edges_y = (0, 20000, 40000, 60000)
xs = [500, 1500, 2500]
ys = [11500, 22500, 42500]
ws = [0.1, 1e-8, 100]

fig, ax = plt.subplots()
hist, _, _, image = ax.hist2d(xs, ys, bins=(bin_edges_x, bin_edges_y), weights=ws, norm=LogNorm())
#hist, _, _, image = ax.hist2d(xs, ys, bins=(bin_edges_x, bin_edges_y), weights=ws, vmin=0, cmin=0.01); label_pad_cb = -28.5
plt.title("Sample title")
ax.set_xlabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]", labelpad=None)
ax.set_ylabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]", labelpad=None)

cax = fig.add_axes([0.90, 0.20, 0.01, 0.70]) # 90 mm plot width
##cax = fig.add_axes([(190 - 90*(1 - 0.912))/190, 0.172, 0.010*(90/190), 0.740]) # 190 mm plot width
cbar = fig.colorbar(image, cax=cax, orientation='vertical')
cax.set_ylabel(r"$E_{gqyp}$ $\log{10}_{10}$ $10^{10}$ $\sqrt{2}$ [cm]",
		labelpad=-35)
#cax.tick_params(pad=1)

#plt.show()
plt.savefig("test_2dhist.pdf")
