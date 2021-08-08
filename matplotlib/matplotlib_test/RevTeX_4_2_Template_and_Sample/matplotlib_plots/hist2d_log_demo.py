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
x = 200*np.random.randn(100000)
y = 200*np.random.randn(100000)
w = np.array([-1]*100000)

fig, ax = plt.subplots()
hist, _, _, im = ax.hist2d(x, y, bins=40, vmin=0, vmax=850, weights=w)
plt.title("Sample title")
ax.set_xlabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]")
ax.set_ylabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]")

cax = fig.add_axes([0.92, 0.15, 0.01, 0.70], label="asdf")
cbar = fig.colorbar(im, cax=cax, orientation='vertical')
#cbar.ax.set_ylabel("y pppp [cm] ", labelpad=0)
cax.set_ylabel(r"$E_{gqyp}$ $\log{10}_{10}$ $10^{10}$ $\sqrt{2}$ [cm]",
		labelpad=-30)
#fig.subplot.right(0.85)
plt.subplots_adjust(left=0.15, right=0.85, top=0.85, bottom=0.15)

#plt.show()
plt.savefig("test.pdf")
