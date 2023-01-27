import math
import matplotlib
import matplotlib.pyplot as plt

from pprint import pprint

def set_rcparams():
	plt.rcParams['axes.formatter.limits'] = [-4, 4]
	plt.rcParams['figure.titlesize'] = 'xx-small'
	print("matplotlib.__version__", matplotlib.__version__)

	#print(obj)
	#dir(obj)
	#print("type(obj)", type(obj))
	#print("type(obj).__name__", type(obj).__name__)

	## Dimensions for formatting:
	figure_scale = 2.0 # arbitrary scale of plot for easier viewing
	golden_ratio = 0.5*(1 + math.sqrt(5)) # golden ratio constant
	cm_per_in = 2.54
	pt_per_in = 72.0 # definition for international Pt (not US Pt)
	fontsize_pt = 8
	linewidth_pt = 0.5
	marker_size = 6


	## Paper text body dimensions:
	textcolumnwidth_cm = 9.00 # width of single column for double column paper


	## Dimensions for figure with width = 9.00 cm and golden ratio axes lengths:
	figure_paper_width_cm = textcolumnwidth_cm
	#figure_paper_height_cm = 5.75 # no color bar below plot
	figure_paper_height_cm = 6.75 # color bar below plot


	## Dimensions for figure with width = 9.00 cm and equal axes lengths:
	#figure_paper_width_cm = textcolumnwidth_cm/cm_per_in
	#figure_paper_height_cm = figure_paper_width_cm

	## Dimensions for figure with width = 19.0 cm and fixed vertical axis length:
	#textcolumnspacing_cm = 1.0
	#figure_paper_width_cm = (2*textcolumnwidth_cm + textcolumnspacing_cm)/cm_per_in
	#figure_paper_height_cm = textcolumnwidth_cm/cm_per_in/golden_ratio
	#left_margin_frac = left_margin_frac*textcolumnwidth_cm/cm_per_in/figure_paper_width_cm
	#plot_area_width_frac = 1 - 2*left_margin_frac


	## Common figure dimensions:
	top_margin_cm = 0.40
	left_margin_cm = 1.30
	plot_area_width_cm = 7.0
	plot_area_height_cm = plot_area_width_cm/golden_ratio
	bottom_margin_cm = figure_paper_height_cm - top_margin_cm - plot_area_height_cm


#	if type(obj).__name__ == "Figure": # matplotlib.figure.Figure
#		## Format figure properties.
#		fig = obj
#		#pprint(dir(fig))
#
#		fig.dpi = 300
#		fig.markersize = 2
#		#fig.font.family = "serif"
#
	plt.rcParams['font.family'] = 'serif'
	plt.rcParams['font.size'] = fontsize_pt
	plt.rcParams['font.serif'] = 'CMU Serif'
	plt.rcParams['font.sans-serif'] = 'CMU Sans Serif'
	plt.rcParams['text.usetex'] = True
	plt.rcParams['text.latex.preamble'] = "\\usepackage{siunitx}"
	plt.rcParams['mathtext.fontset'] = 'cm'
	plt.rcParams['mathtext.rm'] = 'serif'

	plt.rcParams['figure.titlesize'] = 'xx-small'
	plt.rcParams['figure.figsize'] = [figure_paper_width_cm/cm_per_in, figure_paper_height_cm/cm_per_in] # width = 90 mm, height = 57.5 mm # no color bar below plot
	plt.rcParams['figure.dpi'] = 300
	plt.rcParams['figure.subplot.left'] = left_margin_cm/figure_paper_width_cm # = 13 mm / full canvas width 90 mm
	plt.rcParams['figure.subplot.right'] = (left_margin_cm + plot_area_width_cm)/figure_paper_width_cm # = (13 + 70) mm / full canvas width 90 mm
	plt.rcParams['figure.subplot.bottom'] = (figure_paper_height_cm - top_margin_cm - plot_area_height_cm)/figure_paper_height_cm # = (57.5 - 4 - plot_area_height) mm / full canvas height 57.5 mm
	plt.rcParams['figure.subplot.top'] = (figure_paper_height_cm - top_margin_cm)/figure_paper_height_cm # = (57.5 - 4) mm / full canvas height 57.5 mm

	plt.rcParams['savefig.dpi'] = 300

#	elif type(obj).__name__ == "AxesSubplot": # matplotlib.axes._subplots.AxesSubplot
#		ax = obj

	plt.rcParams['axes.linewidth'] = linewidth_pt
	plt.rcParams['axes.titlesize'] = 'xx-small'
	plt.rcParams['axes.labelpad'] = 3.0
	plt.rcParams['axes.formatter.limits'] = [-4, 4]
	plt.rcParams['xtick.major.size'] = fontsize_pt/3.0 # 8 pt font size / 3
	plt.rcParams['xtick.minor.size'] = fontsize_pt/6.0
	plt.rcParams['xtick.major.width'] = linewidth_pt
	plt.rcParams['xtick.minor.width'] = linewidth_pt
	plt.rcParams['xtick.major.pad'] = fontsize_pt/4.0
	plt.rcParams['xtick.minor.visible'] = True
	plt.rcParams['ytick.major.size'] = fontsize_pt/3.0 # 8 pt font size / 3
	plt.rcParams['ytick.minor.size'] = fontsize_pt/6.0
	plt.rcParams['ytick.major.width'] = linewidth_pt
	plt.rcParams['ytick.minor.width'] = linewidth_pt
	plt.rcParams['ytick.major.pad'] = fontsize_pt/4.0
	plt.rcParams['ytick.minor.visible'] = True

	plt.rcParams['grid.linewidth'] = linewidth_pt

	plt.rcParams['legend.fontsize'] = 'small'
