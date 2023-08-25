import math
import matplotlib
import matplotlib.pyplot as plt

from pprint import pprint


## Axis formatter for setting fixed exponent and significant digits:
class OOMFormatter(matplotlib.ticker.ScalarFormatter):
    def __init__(self, order=0, fformat="%1.1f", offset=False, mathText=True):
        self.oom = order
        self.fformat = fformat
        matplotlib.ticker.ScalarFormatter.__init__(self,useOffset=offset,useMathText=mathText)
    def _set_order_of_magnitude(self):
        self.orderOfMagnitude = self.oom
    def _set_format(self, vmin=None, vmax=None):
        self.format = self.fformat
        if self._useMathText:
            self.format = r'$\mathdefault{%s}$' % self.format


## Dimensions for formatting:
figure_scale = 1.0 # arbitrary scale for easier viewing on high PPI screen
golden_ratio = 0.5*(1 + math.sqrt(5)) # golden ratio
cm_per_in = 2.54
pt_per_in = 72.0 # definition for international Pt (not US Pt)
fontsize_pt = 8
linewidth_pt = 0.5
markersize_pt = 3
labelpad_pt = 4


## Constant figure dimensions:
textcolumnwidth_cm = 9.00 # width of single column for double column paper
top_margin_cm = 0.40
left_margin_cm = 1.35
plot_area_width_cm = 7.30
plot_area_height_cm = plot_area_width_cm/golden_ratio


## Dimensions for figure paper with single text column width:
figure_paper_width_cm = textcolumnwidth_cm # width for single y-axis on left-hand side
#figure_paper_width_cm = 2*left_margin_cm + plot_area_width_cm; # width for y-axes on left and right-hand sides
figure_paper_height_cm = 5.85 # no color bar below plot
#figure_paper_height_cm = 7.05 # color bar below plot

## Dimensions for square figure paper with single text column width:
#figure_paper_width_cm = textcolumnwidth_cm
#figure_paper_height_cm = figure_paper_width_cm

## Dimensions for figure paper with double text column width:
#textcolumnspacing_cm = 1.0
#figure_paper_width_cm = 2*textcolumnwidth_cm + textcolumnspacing_cm
#figure_paper_height_cm = 5.75 # no color bar below plot
#figure_paper_height_cm = 6.75 # color bar below plot
#plot_area_width_cm = plot_area_width_cm + textcolumnspacing_cm + textcolumnwidth_cm # extend by extra width available spanning two columns


## Derived figure dimensions:
left_margin_frac = left_margin_cm/figure_paper_width_cm # = 13 mm / full canvas width 90 mm
right_margin_frac = (left_margin_cm + plot_area_width_cm)/figure_paper_width_cm # = (13 + 70) mm / full canvas width 90 mm
bottom_margin_frac = (figure_paper_height_cm - top_margin_cm - plot_area_height_cm)/figure_paper_height_cm # = (57.5 - 4 - plot_area_height) mm / full canvas height 57.5 mm
top_margin_frac = (figure_paper_height_cm - top_margin_cm)/figure_paper_height_cm # = (57.5 - 4) mm / full canvas height 57.5 mm
plot_area_width_frac = plot_area_width_cm/figure_paper_width_cm


## Apply scaling:
fontsize_pt *= figure_scale
linewidth_pt *= figure_scale
markersize_pt *= figure_scale
figure_paper_width_cm *= figure_scale
figure_paper_height_cm *= figure_scale
plot_area_width_cm *= figure_scale
plot_area_height_cm *= figure_scale
top_margin_cm *= figure_scale
left_margin_cm *= figure_scale
labelpad_pt *= figure_scale


def set_rcparams():
	plt.rcParams['axes.formatter.limits'] = [-4, 4]
	plt.rcParams['figure.titlesize'] = 'xx-small'
	print("matplotlib.__version__", matplotlib.__version__)

	#print(obj)
	#dir(obj)
	#print("type(obj)", type(obj))
	#print("type(obj).__name__", type(obj).__name__)

	## Below is where the action happens.
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
	plt.rcParams['figure.subplot.left'] = left_margin_frac
	plt.rcParams['figure.subplot.right'] = right_margin_frac
	plt.rcParams['figure.subplot.bottom'] = bottom_margin_frac
	plt.rcParams['figure.subplot.top'] = top_margin_frac

	plt.rcParams['savefig.dpi'] = 300

#	elif type(obj).__name__ == "AxesSubplot": # matplotlib.axes._subplots.AxesSubplot
#		ax = obj

	plt.rcParams['axes.linewidth'] = linewidth_pt
	plt.rcParams['axes.titlesize'] = 'xx-small'
	plt.rcParams['axes.labelpad'] = labelpad_pt
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

	plt.rcParams['grid.linewidth'] = 0.5*linewidth_pt

	plt.rcParams['legend.fontsize'] = 'small'
	plt.rcParams['legend.frameon'] = False

	plt.rcParams['lines.linewidth'] = linewidth_pt
	plt.rcParams['lines.markersize'] = markersize_pt

	plt.rcParams['patch.linewidth'] = linewidth_pt

	plt.rcParams['hatch.linewidth'] = linewidth_pt

def format_colorbar_axes(cax):
	# Settings for 90 mm figure width:
	cax_yoffset_cm = -1.2
	cax_yoffset_cm *= figure_scale
	cax_y_frac = (figure_paper_height_cm - top_margin_cm - plot_area_height_cm + cax_yoffset_cm)/figure_paper_height_cm
	cax_height_frac = (fontsize_pt/pt_per_in*cm_per_in/3.0)/figure_paper_height_cm

	# Apply settings:
	cax.set_position((
		left_margin_frac,
		cax_y_frac,
		plot_area_width_frac,
		cax_height_frac))
