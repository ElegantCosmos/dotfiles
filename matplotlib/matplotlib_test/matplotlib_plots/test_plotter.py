#!/usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt

xs = np.array([0.1, 10, 1000, 100000, 100000000])
ys = np.array([6, 20, 800, 10000, 30000])

# the histogram of the data
fig, ax = plt.subplots()
ax.plot(xs, ys)

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
plt.savefig("test2.pdf")
