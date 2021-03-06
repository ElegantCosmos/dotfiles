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

fig, ax = plt.subplots()
hist, _, _, im = ax.hist2d(x, y, bins=40, vmin=0, vmax=850)
ax.set_xlabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$ $\sqrt{2}$ [cm]")
ax.set_ylabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$ $\sqrt{2}$ [cm]")

cax = fig.add_axes([0.929, 0.13, 0.01, 0.74], label="asdf")
cbar = fig.colorbar(im, cax=cax, orientation='vertical')
#cbar.ax.set_ylabel("y pppp [cm] ", labelpad=0)
cax.set_ylabel(r"$E_{gqyp}$ $\log{10}_{10}$ $10^{10}$ $\sqrt{2}$ [cm]", labelpad=-29)

#plt.show()
plt.savefig("test.pdf")
