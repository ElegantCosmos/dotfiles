#!/usr/bin/env python3

import numpy as np
import matplotlib.pyplot as plt
import sys
sys.path.append("/home/sakaim1/.dotfiles/matplotlib/modules")
import publication_format as pub

xs = np.array([-1000, 1000])
ys = np.array([0, 1000])

# the histogram of the data
pub.set_rcparams()
fig, ax = plt.subplots()
ax.plot(xs, ys, 'o')
ax.set_xlim((-1000, 1000))
#ax.get_yaxis().get_major_formatter().set_scientific(False)
#ax.ticklabel_format(axis='y', style='sci', scilimits=(0,100), useOffset=False)

plt.title(r'$\mathrm{Histogram\ of\ IQ:}\ \mu=100,\ \sigma=15$')

# add a 'best fit' line
#y = mlab.normpdf( bins, mu, sigma)
#l = plt.plot(bins, bins, 'r--')

ax.set_xlabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]")
ax.set_ylabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10}$/$\sqrt{2}$ [cm]")
#ax.set_xscale('log')
#plt.axis([40, 160, 0, 0.03])
plt.grid()
#ax.yaxis.set_major_formatter(pub.OOMFormatter(3, "%1.1f"))
#ax.ticklabel_format(axis='y', style='sci', scilimits=(3,3))
#ax.xaxis.set_major_formatter(pub.OOMFormatter(2, "%1.1f"))

#plt.show()
plt.savefig("matplotlib_graph.pdf")
