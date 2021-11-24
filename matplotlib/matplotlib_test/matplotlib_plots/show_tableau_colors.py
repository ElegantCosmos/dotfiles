import matplotlib.colors as mcolors

print(mcolors)
mcolors.TABLEAU_COLORS
mcolors.XKCD_COLORS
mcolors.CSS4_COLORS
#Base colors are in RGB so they need to be converted to HEX
BASE_COLORS_hex = {name:mcolors.rgb2hex(color) for name,color in mcolors.BASE_COLORS.items()}


all_named_colors = {}
all_named_colors.update(mcolors.TABLEAU_COLORS)
all_named_colors.update(BASE_COLORS_hex)
all_named_colors.update(mcolors.CSS4_COLORS)
all_named_colors.update(mcolors.XKCD_COLORS)


#print(all_named_colors)
print(all_named_colors["tab:blue"])
