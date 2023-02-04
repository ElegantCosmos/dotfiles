import numpy as np
import matplotlib.pyplot as plt

import sys
sys.path.append("/Users/sakaim1/.dotfiles/matplotlib/modules")
import publication_format

xs = np.array([0.1, 1, 10, 100, 200])
ys = np.array([-600, 20, 1000, 100, 300])

# the histogram of the data
publication_format.set_rcparams()
fig, ax = plt.subplots()
ax.plot(xs, ys, 'o')
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
#plt.grid(True)

#plt.show()
plt.savefig("test_graph.pdf")
