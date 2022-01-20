{
	gROOT->SetBatch(kTRUE);


	//**********************************************************
	//
	// Constants
	//
	//**********************************************************

	gROOT->SetStyle("Modern");

	TGaxis::SetMaxDigits(4); // set maximum digits used for axis tick labels


	// Get window manager decoration height and width:
	TCanvas* canvas_tmp = new TCanvas("canvas_tmp", "canvas_tmp", 500, 500);
	const unsigned int decorationWidth = canvas_tmp->GetWindowWidth() - canvas_tmp->GetWw();
	const unsigned int decorationHeight = canvas_tmp->GetWindowHeight() - canvas_tmp->GetWh();
	delete canvas_tmp; // don't need this anymore
	canvas_tmp = NULL;


	// Commonly used constants:
	const int ppi = 227; // pixels per inch for Mac Retina display
	//const int ppi = 600; // pixels per inch suggested by random websites
	const double ptPerInch = 72.0;
	const double mmPerInch = 25.4;
	const double goldenRatio = 0.5*(1 + sqrt(5));

	const int font = 133; // Time New Roman (size specified in pixels)
	const double fontSize_medium_pt = 8; // default font size
	const double fontSize_small_pt = 7; // small font size
	const double fontSize_xsmall_pt = 6; // small font size
	const double fontSize_xxsmall_pt = 5; // small font size
	const double fontSize_medium_px = ppi*fontSize_medium_pt/ptPerInch;
	const double fontSize_small_px = ppi*fontSize_small_pt/ptPerInch;
	const double fontSize_xsmall_px = ppi*fontSize_xsmall_pt/ptPerInch;
	const double fontSize_xxsmall_px = ppi*fontSize_xxsmall_pt/ptPerInch;


	// Tick properties:
	static const double tickLength_pt = fontSize_medium_pt/3.0;

	// Canvas properties:
	const double text_column_width_mm = 90; // 90 mm, width of single column for double column paper

	//// Dimensions for figure with width = 90 mm and equal axes lengths
	//const double canvasWidth_mm = text_column_width_mm;
	//const double canvasHeight_mm = canvasWidth_mm;

	// Dimensions for figure with width = 90 mm and golden ratio axes lengths
	const double canvasWidth_mm = text_column_width_mm;
	const double canvasHeight_mm = canvasWidth_mm/goldenRatio;
	
	//// Dimensions for figure with width = 190 mm and fixed vertical axis length
	//const double text_column_spacing_mm = 10;
	//const double canvasWidth_mm = 2*text_column_width_mm + text_column_spacing_mm;
	//const double canvasHeight_mm = text_column_width_mm/goldenRatio;

	const double canvasWidth_in = canvasWidth_mm/mmPerInch;
	const double canvasHeight_in = canvasHeight_mm/mmPerInch;
	const double canvasWidth_pt = canvasWidth_in*ptPerInch;
	const double canvasHeight_pt = canvasHeight_in*ptPerInch;

	//// Apply zoom factor for confortable viewing in high DPI screens.
	static const int canvasWidth_px = int(ppi*canvasWidth_in + 0.5);
	//cout << "canvasWidth_px" << canvasWidth_px << endl;
	static const int canvasHeight_px = int(ppi*canvasHeight_in + 0.5);
	//cout << "canvasHeight_px" << canvasHeight_px << endl;


	//**********************************************************
	//
	// Plotting style
	//
	//**********************************************************

	//// Style compatible with new ROOT 6.
	TStyle* article_twoColumn= new TStyle("article_twoColumn","LaTeX two-column article");

	// Paper size (do we need this?):
	article_twoColumn->SetPaperSize(TStyle::kUSLetter);

	// Figure paper dimensions:
	const double figure_size_frac = 0.74;
	const double bottom_margin_frac = 0.172;
	article_twoColumn->SetPadTopMargin(1 - (bottom_margin_frac + figure_size_frac));
	article_twoColumn->SetPadBottomMargin(bottom_margin_frac);
	article_twoColumn->SetPadRightMargin(0.5*(1 - figure_size_frac));
	article_twoColumn->SetPadLeftMargin(0.5*(1 - figure_size_frac));
	article_twoColumn->SetCanvasDefH(canvasHeight_px + decorationHeight); // (canvas height + 25 px) = window height)
	//article_twoColumn->SetCanvasDefH(500); // (canvas height + 25 px) = window height)
	article_twoColumn->SetCanvasDefW(canvasWidth_px + decorationWidth); // (canvas width + 2 px) = window width)
	//article_twoColumn->SetCanvasDefW(500); // (canvas width + 2 px) = window width)
	// Canvas and pad:
	//article_twoColumn->SetHistFillStyle(0);
	//article_twoColumn->SetHistFillColor(kBlack);
	//article_twoColumn->SetFillStyle(0);
	//article_twoColumn->SetFillColor(kWhite); // Makes 2D hist colz fill color white. Do not use.
	article_twoColumn->SetCanvasBorderMode(0);
	article_twoColumn->SetCanvasColor(kWhite);
	article_twoColumn->SetPadBorderMode(0);
	article_twoColumn->SetPadColor(kWhite);

	// Frame:
	article_twoColumn->SetFrameBorderMode(0);

	// Lines and markers:
	article_twoColumn->SetEndErrorSize(0);
	article_twoColumn->SetLineColor(kBlack);

	article_twoColumn->SetHistLineWidth(1);
	article_twoColumn->SetHistLineColor(kBlack);

	article_twoColumn->SetMarkerStyle(8);
	article_twoColumn->SetMarkerSize(2);
	article_twoColumn->SetMarkerColor(kBlack);

	// Title text:
	article_twoColumn->SetTitleX(0.5);
	article_twoColumn->SetTitleY(0.995);
	article_twoColumn->SetTitleAlign(23);
	article_twoColumn->SetTitleFillColor(0);
	article_twoColumn->SetTitleBorderSize(0);
	article_twoColumn->SetTitleFont(font, "t"); // doesn't work in ROOT 5.34/23
	article_twoColumn->SetTitleSize(fontSize_xxsmall_px, "t"); // doesn't work in ROOT 5.34/23

	// Axes title text:
	article_twoColumn->SetTitleFont(font, "xyz");
	article_twoColumn->SetTitleSize(fontSize_medium_px, "xyz");
	article_twoColumn->SetTitleOffset(1.65, "x"); // lowest part of log_{10} is barely on the pad; I think log_{10} has the lowest reaching text
	article_twoColumn->SetTitleOffset(1.30, "y"); // highest part of sqrt(2) is barely on the pad; I think sqrt(2) has the highest reaching text
	article_twoColumn->SetTitleOffset(-0.41, "z"); // doesn't work in ROOT 5.34/23
	// Axes label text:
	article_twoColumn->SetLabelFont(font, "xyz");
	article_twoColumn->SetLabelSize(fontSize_medium_px, "xyz");
	article_twoColumn->SetLabelOffset(4.0/canvasHeight_pt, "x");
	article_twoColumn->SetLabelOffset(4.0/canvasWidth_pt, "y");
	article_twoColumn->SetLabelOffset(1.0/canvasWidth_pt, "z");

	// Axis ticks:
	// Set length of axis ticks. The tick length is in fraction of
	// perpendicular axis length (e.g. tick length of x-axis is in fraction of
	// y-axis length).
	const double plotArea_width_pt = figure_size_frac*canvasWidth_pt;
	const double plotArea_height_pt = figure_size_frac*canvasHeight_pt;
	article_twoColumn->SetTickLength(-tickLength_pt/plotArea_height_pt, "x");
	article_twoColumn->SetTickLength(-tickLength_pt/plotArea_width_pt, "y");
	article_twoColumn->SetTickLength(-tickLength_pt/plotArea_width_pt, "z");
	//article_twoColumn->SetNdivisions(10, "xyz");
	article_twoColumn->SetNdivisions(510, "xyz"); // show sub-ticks

	// Statistics display:
	//article_twoColumn->SetOptTitle(0);
	article_twoColumn->SetLineWidth(1);
	article_twoColumn->SetOptStat("emrou");
	article_twoColumn->SetStatFont(font);
	article_twoColumn->SetStatColor(kWhite);
	article_twoColumn->SetStatBorderSize(1);
	article_twoColumn->SetStatFontSize(fontSize_xxsmall_px);

	const double statbox_height = 0.13;
	const double statbox_width = 0.2;
	article_twoColumn->SetStatY(1 - 1.0/canvasHeight_pt);
	article_twoColumn->SetStatX(1 - 1.0/canvasWidth_pt);
	article_twoColumn->SetStatW(statbox_width);
	article_twoColumn->SetStatH(statbox_height);

	// Legend.
	article_twoColumn->SetLegendBorderSize(0);
	article_twoColumn->SetLegendFillColor(0);
	article_twoColumn->SetLegendFont(font);
	article_twoColumn->SetLegendTextSize(fontSize_small_px);


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


	//**********************************************************
	//
	// Define Tableau palette
	//
	//**********************************************************

	// Define Tableau colors
	static const int blue_tableau = TColor::GetColor("#1f77b4");
	static const int orange_tableau = TColor::GetColor("#ff7f0e");
	static const int green_tableau = TColor::GetColor("#2ca02c");
	static const int red_tableau = TColor::GetColor("#d62728");
	static const int purple_tableau = TColor::GetColor("#9467bd");
	static const int brown_tableau = TColor::GetColor("#8c564b");
	static const int pink_tableau = TColor::GetColor("#e377c2");
	static const int gray_tableau = TColor::GetColor("#8f7f7f");
	static const int olive_tableau = TColor::GetColor("#bcbd22");
	static const int cyan_tableau = TColor::GetColor("#17becf");
}
