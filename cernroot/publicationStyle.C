//**********************************************************
//
// Constants
//
//**********************************************************

// Commonly used constants:
const double goldenRatio = 0.5*(1 + sqrt(5));
const int ppi = 600; // pixels per inch
const double ptPerInch = 72.0; // definition for international Pt (not US Pt)
const double mmPerInch = 25.4;

// Canvas/plot dimensions:
const double textColumnWidth_mm = 90.0; // 90 mm, width of single column for double column paper

//// Dimensions for figure with width = 90 mm and equal axes lengths.
//static const double canvasWidth_mm = textColumnWidth_mm;
//static const double canvasHeight_mm = canvasWidth_mm;

// Dimensions for figure with width = 90 mm and golden ratio axes lengths.
const double canvasWidth_mm = textColumnWidth_mm;
//static const double canvasHeight_mm = 57.5; // no color bar below plot
const double canvasHeight_mm = 67.5; // color bar below plot

const double topMargin_mm = 4;
const double leftMargin_mm = 13;
const double plotAreaWidth_mm = 70;
const double plotAreaHeight_mm = plotAreaWidth_mm/goldenRatio;

// Commonly used constants:
const int font = 133; // Time New Roman (precision 3: font size specified in pixels)
const double fontSize_pt = 8; // default font size
const double fontSize_small_pt = 7; // small font size
const double fontSize_xsmall_pt = 6; // small font size
const double fontSize_xxsmall_pt = 5; // small font size
const double fontSize_px = ppi*fontSize_pt/ptPerInch;
const double fontSize_small_px = ppi*fontSize_small_pt/ptPerInch;
const double fontSize_xsmall_px = ppi*fontSize_xsmall_pt/ptPerInch;
const double fontSize_xxsmall_px = ppi*fontSize_xxsmall_pt/ptPerInch;

// Tick properties:
const double tickLength_mm = fontSize_pt*(mmPerInch/ptPerInch)/3.0; // 1/3 of standard font pt size


namespace publicationStyle {
void ApplyStyle()
{
	gROOT->SetBatch(kTRUE);


	// Get window manager decoration height and width:
	TCanvas* canvas_tmp = new TCanvas("canvas_tmp", "canvas_tmp", 500, 500); // temporary canvas
	const unsigned int windowBorderWidth_px = canvas_tmp->GetWindowWidth() - canvas_tmp->GetWw(); // get window decoration size
	const unsigned int windowBorderHeight_px = canvas_tmp->GetWindowHeight() - canvas_tmp->GetWh(); // get window decoration size
	delete canvas_tmp; // don't need this anymore
	canvas_tmp = NULL;


	const double topMargin_frac = topMargin_mm/canvasHeight_mm;
	const double bottomMargin_frac = 1 - (topMargin_mm + plotAreaHeight_mm)/canvasHeight_mm;
	const double leftMargin_frac = leftMargin_mm/canvasWidth_mm;
	const double rightMargin_frac = 1 - (leftMargin_mm + plotAreaWidth_mm)/canvasWidth_mm;


	//**********************************************************
	//
	// Plotting style
	//
	//**********************************************************

	//// Style compatible with new ROOT 6.
	TStyle* singleColumnWidthStyle = new TStyle("singleColumnWidthStyle", "LaTeX two-column article");

	// Paper size (do we need this?):
	singleColumnWidthStyle->SetPaperSize(TStyle::kUSLetter);

	// Figure paper dimensions:
	singleColumnWidthStyle->SetPadTopMargin(topMargin_frac);
	singleColumnWidthStyle->SetPadBottomMargin(bottomMargin_frac);
	singleColumnWidthStyle->SetPadRightMargin(rightMargin_frac);
	singleColumnWidthStyle->SetPadLeftMargin(leftMargin_frac);

	// Canvas dimensions:
	const int canvasWidth_px = int(canvasWidth_mm*(ppi/mmPerInch) + 0.5);
	const int canvasHeight_px = int(canvasHeight_mm*(ppi/mmPerInch) + 0.5);
	singleColumnWidthStyle->SetCanvasDefW(canvasWidth_px + windowBorderWidth_px); // canvas_width_px + decoration_width_px = window_width_px
	singleColumnWidthStyle->SetCanvasDefH(canvasHeight_px + windowBorderHeight_px); // canvas_height_px + decoration_height px = window_height_px

	// Canvas and pad:
	//singleColumnWidthStyle->SetFillColor(kWhite); // Makes 2D hist colz fill color white. Do not use.
	singleColumnWidthStyle->SetCanvasBorderMode(0);
	singleColumnWidthStyle->SetPadBorderMode(0);
	singleColumnWidthStyle->SetCanvasColor(0);
	singleColumnWidthStyle->SetPadColor(0);

	// Frame:
	singleColumnWidthStyle->SetFrameBorderMode(0);
	singleColumnWidthStyle->SetFrameLineWidth(1);
	singleColumnWidthStyle->SetFrameLineColor(kBlack);

	// Lines and markers:
	singleColumnWidthStyle->SetLineWidth(1);
	singleColumnWidthStyle->SetHistLineWidth(1);
	singleColumnWidthStyle->SetMarkerStyle(8);
	singleColumnWidthStyle->SetMarkerSize(2);

	// Title text:
	singleColumnWidthStyle->SetTitleX(0.5);
	singleColumnWidthStyle->SetTitleY(1 - 0.5*topMargin_frac);
	singleColumnWidthStyle->SetTitleAlign(22);
	singleColumnWidthStyle->SetTitleFillColor(0);
	singleColumnWidthStyle->SetTitleBorderSize(0);
	singleColumnWidthStyle->SetTitleFont(font, "t");
	singleColumnWidthStyle->SetTitleSize(fontSize_xsmall_px, "t"); // use pixels

	// Axes title text:
	singleColumnWidthStyle->SetTitleFont(font, "xyz");
	singleColumnWidthStyle->SetTitleSize(fontSize_px, "xyz"); // use pixels
	TGaxis::SetMaxDigits(4); // set maximum digits used for axis tick labels

	//// Dimensions for figure with width = 90 mm and equal axes lengths
	//singleColumnWidthStyle->SetTitleOffset(1.65, "x"); // lowest part of log_{10} is barely on the pad; I think log_{10} has the lowest reaching text
	//singleColumnWidthStyle->SetTitleOffset(2.10, "y"); // highest part of sqrt(2) is barely on the pad; I think sqrt(2) has the highest reaching text
	//singleColumnWidthStyle->SetTitleOffset(-0.68, "z"); // doesn't work in ROOT 5.34/23

	// Dimensions for figure with width = 90 mm and golden ratio axes lengths
	singleColumnWidthStyle->SetTitleOffset(1.5, "x"); // lowest part of log_{10} is barely on the pad; I think log_{10} has the lowest reaching text
	singleColumnWidthStyle->SetTitleOffset(2.3, "y"); // highest part of sqrt(2) is barely on the pad; I think sqrt(2) has the highest reaching text
	singleColumnWidthStyle->SetTitleOffset(1.5, "z"); // doesn't work in ROOT 5.34/23
	
	//// Dimensions for figure with width = 190 mm and fixed vertical axis length
	//singleColumnWidthStyle->SetTitleOffset(1.65, "x"); // lowest part of log_{10} is barely on the pad; I think log_{10} has the lowest reaching text
	//singleColumnWidthStyle->SetTitleOffset(0.60, "y"); // highest part of sqrt(2) is barely on the pad; I think sqrt(2) has the highest reaching text
	//singleColumnWidthStyle->SetTitleOffset(-0.20, "z"); // doesn't work in ROOT 5.34/23

	// Axes label text:
	singleColumnWidthStyle->SetLabelFont(font, "xyz");
	singleColumnWidthStyle->SetLabelSize(fontSize_px, "xyz"); // use pixels
	singleColumnWidthStyle->SetLabelOffset((1.3/3.0)*fontSize_pt/ptPerInch*mmPerInch/canvasHeight_mm, "x");
	singleColumnWidthStyle->SetLabelOffset((1.7/3.0)*fontSize_pt/ptPerInch*mmPerInch/canvasWidth_mm, "y");
	singleColumnWidthStyle->SetLabelOffset((0.5/3.0)*fontSize_pt/ptPerInch*mmPerInch/canvasHeight_mm, "z");

	// Axis ticks:
	// Set length of axis ticks. The tick length is given as a fraction of the
	// tick length with respect to the pad dimension parallel to the tick in
	// units of the fraction of the axis length with respect to the pad
	// dimension parallel to the axis.
	// (E.g. fractional tick length of x-axis is in fraction of y-axis length
	// with respect to pad height).
	// The tick length argument to SetTickLength() is internally multiplied by
	// the fraction of the plot area dimension with respect to the pad dimension
	// parallel to the specified axis (perpendicular to the specified tick) by
	// ROOT. Then the resulting product is used as the fraction of the length of
	// the tick with respect to the pad dimension parallel to the tick.
   	const double plotAreaWidth_frac = plotAreaWidth_mm/canvasWidth_mm;
	const double plotAreaHeight_frac = plotAreaHeight_mm/canvasHeight_mm;
	singleColumnWidthStyle->SetTickLength(-tickLength_mm/canvasHeight_mm/plotAreaWidth_frac, "x");
	singleColumnWidthStyle->SetTickLength(-tickLength_mm/canvasWidth_mm/plotAreaHeight_frac, "y");
	singleColumnWidthStyle->SetTickLength(-tickLength_mm/canvasHeight_mm/plotAreaWidth_frac, "z"); // horizontal color bar axis with vertical ticks
	//singleColumnWidthStyle->SetTickLength(-tickLength_mm/canvasWidth_mm/plotAreaHeight_frac, "z"); // vertical color bar axis with horizontal ticks
	singleColumnWidthStyle->SetNdivisions(510, "xyz"); // show sub-ticks

	// Statistics display:
	//singleColumnWidthStyle->SetOptTitle(0);
	singleColumnWidthStyle->SetOptStat("emrou");
	singleColumnWidthStyle->SetStatFont(font);
	singleColumnWidthStyle->SetStatColor(0);
	singleColumnWidthStyle->SetStatBorderSize(1);
	singleColumnWidthStyle->SetStatFontSize(fontSize_xxsmall_px);

	const double statboxWidth_mm = 10;
	const double statboxHeight_mm = 10;
	singleColumnWidthStyle->SetStatY(1 - 1.0/canvasHeight_mm);
	singleColumnWidthStyle->SetStatX(1 - 1.0/canvasWidth_mm);
	singleColumnWidthStyle->SetStatW(statboxWidth_mm/canvasWidth_mm);
	singleColumnWidthStyle->SetStatH(statboxHeight_mm/canvasHeight_mm);

	// Legend.
	singleColumnWidthStyle->SetLegendBorderSize(0);
	singleColumnWidthStyle->SetLegendFillColor(0);
	singleColumnWidthStyle->SetLegendFont(font);
	singleColumnWidthStyle->SetLegendTextSize(fontSize_small_px);

	// Miscellaneous.
	singleColumnWidthStyle->SetLineScalePS(4.5);


	gROOT->SetStyle("singleColumnWidthStyle");
}

// Draw and copy quickly with one function.
void SaveOpen(const std::string file = "plot.pdf", int nFiles = 1)
{
	assert(!file.empty()); // filename must not be empty
	if (gPad == NULL) { // check if pad for plot exists
		std::cerr << "No gPad object found for plot." << std::endl;
		return;
	}

	std::string file_base;
	{
		size_t dotPos = file.find_last_of(".");
		file_base = file.substr(0, dotPos);
		const std::string plotStr = "plot";
		if (file_base.substr(file_base.length() - plotStr.length(), plotStr.length()) != plotStr) {
			file_base += std::string("_") + plotStr;
		}
	}

	const std::string file_pdf = file_base + ".pdf";
	gPad->SaveAs(file_pdf.c_str()); // save plot as PDF

	//const std::string file_C = file_base + ".C";
	//gPad->SaveAs(file_C.c_str()); // save plot as script

	//const std::string file_ROOT = file_base + ".root";
	//gPad->SaveAs(file_ROOT.c_str()); // save plot in ROOT file

	// Open PDF plots locally.
	assert(nFiles > 0);
	if (nFiles == 1) {
		gSystem->Exec("openlatest");
	} else {
		TString cmd;
		cmd.Form("openlatest %i", nFiles);
		gSystem->Exec(cmd.Data());
	}

	return;
}

// Set logarithmic x-axis scale, and other aesthetic settings.
// Seems like a better implementation than to change the entire TStyle.
// FIXME: The below code can surely be made more efficient.
void SetLogX(TObject* obj = nullptr, const bool logScale = true)
{
	// Set offset on appropriate object: TH1, TGraph, etc.
	// Set distance between the axis and the labels.
	// The distance is expressed in per cent of the pad width.
	// A negative value draws the label on the other side of the axis.
	if (obj) {
		TH1* hist = dynamic_cast<TH1*>(obj);
		if (hist) {
			double offset = hist->GetXaxis()->GetLabelOffset();
			hist->GetXaxis()->SetLabelOffset(0.3*offset);
		}

		TGraph* graph = dynamic_cast<TGraph*>(obj);
		if (graph) {
			double offset = graph->GetXaxis()->GetLabelOffset();
			graph->GetXaxis()->SetLabelOffset(0.3*offset);
		}

		TMultiGraph* graphs = dynamic_cast<TMultiGraph*>(obj);
		if (graphs) {
			double offset = graphs->GetXaxis()->GetLabelOffset();
			graphs->GetXaxis()->SetLabelOffset(0.3*offset);
		}

		THStack* hstack = dynamic_cast<THStack*>(obj);
		if (hstack) {
			double offset = hstack->GetXaxis()->GetLabelOffset();
			hstack->GetXaxis()->SetLabelOffset(0.3*offset);
		}
	}

	// Apply log scale if applicable.
	gPad->SetLogx(logScale);
}

// Set logarithmic y-axis scale, and other aesthetic settings.
// Seems like a better implementation than to change the entire TStyle.
void SetLogY(TObject* obj = nullptr, const bool logScale = true)
{
	gPad->SetLogy(logScale);
}

void FormatPaletteAxis(TH1* hist, const TString& title = "A_{g}^{T} Log_{10} #sqrt{2} E_{pqyg} [unit]")
{
	//**********************************************************
	//
	// Example of how to make palette axis neat
	//
	//**********************************************************

	//TH2F hist2("hist2", "hist2", 100, 0, 10000, 100, 0, 10000);
	//hist2.Fill(0.0, 0.0, 10);
	//hist2.Fill(0.0, 100.0, 100);
	//hist2.Fill(100.0, 100.0, 1000000);
	//hist2.Draw("Colz");
	//hist2.GetXaxis()->SetTitle("gpqy-axis [cm]");
	//hist2.GetYaxis()->SetTitle("gpqy-axis [A.U.]");
	////gPad->Modified();
	//gPad->Update();
	//TPaletteAxis* pa = dynamic_cast<TPaletteAxis*>(hist2.GetListOfFunctions()->FindObject("palette"));
	//pa->SetX1NDC(0.90); pa->SetX2NDC(0.91);
	////pa->GetAxis()->SetTitleOffset(0);
	////pa->GetAxis()->SetTitle("Titlegy [unit]");
	//hist2.GetZaxis()->SetTitle("Titlegy [unit]");
	//hist2.GetZaxis()->SetTitleOffset(-0.3);


	gPad->Modified();
	gPad->Update();

	//gStyle->SetPalette(kRainBow, 0);
	TPaletteAxis* ax = dynamic_cast<TPaletteAxis*>(hist->GetListOfFunctions()->FindObject("palette"));
	double x_col_frac = leftMargin_mm/canvasWidth_mm;
	double width_col_frac = plotAreaWidth_mm/canvasWidth_mm;
	double y_col_frac = (canvasHeight_mm - topMargin_mm - plotAreaHeight_mm - 11)/canvasHeight_mm;
	const double height_col_frac = 0.3*fontSize_pt/ptPerInch*mmPerInch/canvasHeight_mm;
	ax->SetX1NDC(x_col_frac); ax->SetX2NDC(x_col_frac + width_col_frac);
	ax->SetY1NDC(y_col_frac); ax->SetY2NDC(y_col_frac + height_col_frac);
	hist->GetZaxis()->SetTitle(title);
	hist->SetContour(255); // resolution of palette
}

class Palette {
public:
	Palette(std::string paletteName = "tableau_10")
	{
		if (paletteName == "tableau_10") { // Classic Tableau 10
			colors["blue"]   = TColor::GetColor("#1f77b4"); // blue
			colors["orange"] = TColor::GetColor("#ff7f0e"); // orange
			colors["green"]  = TColor::GetColor("#2ca02c"); // green
			colors["red"]    = TColor::GetColor("#d62728"); // red
			colors["purple"] = TColor::GetColor("#9467bd"); // purple
			colors["brown"]  = TColor::GetColor("#8c564b"); // brown
			colors["pink"]   = TColor::GetColor("#e377c2"); // pink
			colors["gray"]   = TColor::GetColor("#7f7f7f"); // gray
			colors["olive"]  = TColor::GetColor("#bcbd22"); // olive
			colors["cyan"]   = TColor::GetColor("#17becf"); // cyan
		} else if (paletteName == "tableau_20") { // Classic Tableau 20
			colors["blue"]         = TColor::GetColor("#1f77b4"); // blue
			colors["light_blue"]   = TColor::GetColor("#aec7e8"); // light_blue
			colors["orange"]       = TColor::GetColor("#ff7f0e"); // orange
			colors["light_orange"] = TColor::GetColor("#ffbb78"); // light_orange
			colors["green"]        = TColor::GetColor("#2ca02c"); // green
			colors["light_green"]  = TColor::GetColor("#98df8a"); // light_green
			colors["red"]          = TColor::GetColor("#d62728"); // red
			colors["light_red"]    = TColor::GetColor("#ff9896"); // light_red
			colors["purple"]       = TColor::GetColor("#9467bd"); // purple
			colors["light_purple"] = TColor::GetColor("#c5b0d5"); // light_purple
			colors["brown"]        = TColor::GetColor("#8c564b"); // brown
			colors["light_brown"]  = TColor::GetColor("#c49c94"); // light_brown
			colors["pink"]         = TColor::GetColor("#e377c2"); // pink
			colors["light_pink"]   = TColor::GetColor("#f7b6d2"); // light_pink
			colors["gray"]         = TColor::GetColor("#7f7f7f"); // gray
			colors["light_gray"]   = TColor::GetColor("#c7c7c7"); // light_gray
			colors["olive"]        = TColor::GetColor("#bcbd22"); // olive
			colors["light_olive"]  = TColor::GetColor("#dbdb8d"); // light_olive
			colors["cyan"]         = TColor::GetColor("#17becf"); // cyan
			colors["light_cyan"]   = TColor::GetColor("#9edae5"); // light_cyan
		}
	}

	int GetColor(const std::string& name)
	{
		return colors.at(name);
	}
	int GetColor(int id = 0)
	{
		int color = 0;
		int colorID = 0;
		for (std::map<std::string, int>::const_iterator i_color = colors.begin(); i_color != colors.end(); ++i_color) {
			if ((colorID % colors.size()) == id) {
				color = i_color->second;
				break;
			}
			++colorID;
		}
		return color;
	}

private:
	std::map<std::string, int> colors;
};
}
