#!/usr/bin/env python
import numpy as np
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

mu, sigma = 1000, 150
x = mu + sigma*np.random.randn(10000)

# the histogram of the data
fig, ax = plt.subplots()
n, bins, patches = ax.hist(x, 50, density=True, facecolor='green', alpha=0.75)

plt.title(r'$\mathrm{Histogram\ of\ IQ:}\ \mu=100,\ \sigma=15$')

# add a 'best fit' line
#y = mlab.normpdf( bins, mu, sigma)
#l = plt.plot(bins, bins, 'r--')

ax.set_xlabel(r'Smarts')
ax.set_ylabel(r'Probability')
#ax.set_xlabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10^{3}}$/$\sqrt{2}$ [cm]")
#ax.set_ylabel(r"$\log{10}_{10}$ $E_{gqyp}$ $10^{10^{3}}$/$\sqrt{2}$ [cm]")
#plt.axis([40, 160, 0, 0.03])
#plt.grid(True)

#plt.show()
plt.savefig("test2.pdf")
