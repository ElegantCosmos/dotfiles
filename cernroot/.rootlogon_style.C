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
	TCanvas* canvas_tmp = new TCanvas("canvas_tmp", "canvas_tmp", 500, 500); // temporary canvas
	const unsigned int windowBorderWidth_px = canvas_tmp->GetWindowWidth() - canvas_tmp->GetWw(); // get window decoration size
	const unsigned int windowBorderHeight_px = canvas_tmp->GetWindowHeight() - canvas_tmp->GetWh(); // get window decoration size
	delete canvas_tmp; // don't need this anymore
	canvas_tmp = NULL;


	// Commonly used constants:
	const int ppi = 300; // pixels per inch
	const double ptPerInch = 72.0; // definition for international Pt (not US Pt)
	const double mmPerInch = 25.4;
	const double goldenRatio = 0.5*(1 + sqrt(5));

	const int font = 133; // Time New Roman (precision 3: font size specified in pixels)
	const double fontSize_medium_pt = 8; // default font size
	const double fontSize_small_pt = 7; // small font size
	const double fontSize_xsmall_pt = 6; // small font size
	const double fontSize_xxsmall_pt = 5; // small font size
	const double fontSize_medium_px = ppi*fontSize_medium_pt/ptPerInch;
	const double fontSize_small_px = ppi*fontSize_small_pt/ptPerInch;
	const double fontSize_xsmall_px = ppi*fontSize_xsmall_pt/ptPerInch;
	const double fontSize_xxsmall_px = ppi*fontSize_xxsmall_pt/ptPerInch;


	// Tick properties:
	static const double tickLength_mm =
		fontSize_medium_pt*(mmPerInch/ptPerInch)/3.0; // 1/3 of standard font pt size


	// Canvas/plot dimensions:
	const double textColumnWidth_mm = 90.0; // 90 mm, width of single column for double column paper

	//// Dimensions for figure with width = 90 mm and equal axes lengths.
	//static const double canvasWidth_mm = textColumnWidth_mm;
	//static const double canvasHeight_mm = canvasWidth_mm;

	// Dimensions for figure with width = 90 mm and golden ratio axes lengths.
	static const double canvasWidth_mm = textColumnWidth_mm;
	//static const double canvasHeight_mm = 57.5; // no color bar below plot
	static const double canvasHeight_mm = 67.5; // color bar below plot
	

	static const double topMargin_mm = 4;
	static const double leftMargin_mm = 13;
	static const double plotAreaWidth_mm = 70;
	static const double plotAreaHeight_mm = plotAreaWidth_mm/goldenRatio;

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
	TStyle* article_twoColumn= new TStyle("article_twoColumn","LaTeX two-column article");

	// Paper size (do we need this?):
	article_twoColumn->SetPaperSize(TStyle::kUSLetter);

	// Figure paper dimensions:
	article_twoColumn->SetPadTopMargin(topMargin_frac);
	article_twoColumn->SetPadBottomMargin(bottomMargin_frac);
	article_twoColumn->SetPadRightMargin(rightMargin_frac);
	article_twoColumn->SetPadLeftMargin(leftMargin_frac);

	// Canvas dimensions:
	const int canvasWidth_px = int(canvasWidth_mm*(ppi/mmPerInch) + 0.5);
	const int canvasHeight_px = int(canvasHeight_mm*(ppi/mmPerInch) + 0.5);
	article_twoColumn->SetCanvasDefW(canvasWidth_px + windowBorderWidth_px); // canvas_width_px + decoration_width_px = window_width_px
	article_twoColumn->SetCanvasDefH(canvasHeight_px + windowBorderHeight_px); // canvas_height_px + decoration_height px = window_height_px
	//article_twoColumn->SetCanvasDefW(500 + windowBorderWidth_px); // canvas_width_px + decoration_width_px = window_width_px // for debug
	//article_twoColumn->SetCanvasDefH(500 + windowBorderHeight_px); // canvas_height_px + decoration_height px = window_height_px // for debug

	// Canvas and pad:
	//article_twoColumn->SetHistFillStyle(0);
	//article_twoColumn->SetHistFillColor(kBlack);
	//article_twoColumn->SetFillStyle(0);
	//article_twoColumn->SetFillColor(kWhite); // Makes 2D hist colz fill color white. Do not use.
	article_twoColumn->SetCanvasBorderMode(0);
	article_twoColumn->SetPadBorderMode(0);
	article_twoColumn->SetCanvasColor(0);
	article_twoColumn->SetPadColor(0);

	// Frame:
	article_twoColumn->SetFrameBorderMode(0);
	article_twoColumn->SetFrameLineWidth(1);
	article_twoColumn->SetFrameLineColor(kBlack);

	// Lines and markers:
	article_twoColumn->SetLineWidth(1);
	article_twoColumn->SetLineColor(kBlack);
	article_twoColumn->SetEndErrorSize(0);

	article_twoColumn->SetHistLineWidth(1);
	article_twoColumn->SetHistLineColor(kBlack);

	article_twoColumn->SetMarkerStyle(8);
	article_twoColumn->SetMarkerSize(2);
	article_twoColumn->SetMarkerColor(kBlack);

	// Title text:
	article_twoColumn->SetTitleColor(kBlack);
	article_twoColumn->SetTitleX(0.5);
	article_twoColumn->SetTitleY(1 - 0.5*topMargin_frac);
	article_twoColumn->SetTitleAlign(22);
	article_twoColumn->SetTitleFillColor(0);
	article_twoColumn->SetTitleBorderSize(0);
	article_twoColumn->SetTitleFont(font, "t"); // doesn't work in ROOT 5.34/23
	article_twoColumn->SetTitleSize(fontSize_xxsmall_px, "t"); // use pixels

	// Axes title text:
	article_twoColumn->SetTitleFont(font, "xyz");
	article_twoColumn->SetTitleSize(fontSize_medium_px, "xyz"); // use pixels

	//// Dimensions for figure with width = 90 mm and equal axes lengths
	//article_twoColumn->SetTitleOffset(1.65, "x"); // lowest part of log_{10} is barely on the pad; I think log_{10} has the lowest reaching text
	//article_twoColumn->SetTitleOffset(2.10, "y"); // highest part of sqrt(2) is barely on the pad; I think sqrt(2) has the highest reaching text
	//article_twoColumn->SetTitleOffset(-0.68, "z"); // doesn't work in ROOT 5.34/23

	// Dimensions for figure with width = 90 mm and golden ratio axes lengths
	article_twoColumn->SetTitleOffset(1.5, "x"); // lowest part of log_{10} is barely on the pad; I think log_{10} has the lowest reaching text
	article_twoColumn->SetTitleOffset(2.3, "y"); // highest part of sqrt(2) is barely on the pad; I think sqrt(2) has the highest reaching text
	article_twoColumn->SetTitleOffset(1.5, "z"); // doesn't work in ROOT 5.34/23
	
	//// Dimensions for figure with width = 190 mm and fixed vertical axis length
	//article_twoColumn->SetTitleOffset(1.65, "x"); // lowest part of log_{10} is barely on the pad; I think log_{10} has the lowest reaching text
	//article_twoColumn->SetTitleOffset(0.60, "y"); // highest part of sqrt(2) is barely on the pad; I think sqrt(2) has the highest reaching text
	//article_twoColumn->SetTitleOffset(-0.20, "z"); // doesn't work in ROOT 5.34/23
	// Axes label text:
	article_twoColumn->SetLabelFont(font, "xyz");
	article_twoColumn->SetLabelSize(fontSize_medium_px, "xyz"); // use pixels
	article_twoColumn->SetLabelOffset((1.3/3.0)*fontSize_medium_pt/ptPerInch*mmPerInch/canvasHeight_mm, "x");
	article_twoColumn->SetLabelOffset((1.7/3.0)*fontSize_medium_pt/ptPerInch*mmPerInch/canvasWidth_mm, "y");
	article_twoColumn->SetLabelOffset((0.5/3.0)*fontSize_medium_pt/ptPerInch*mmPerInch/canvasHeight_mm, "z");

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
	article_twoColumn->SetTickLength(-tickLength_mm/canvasHeight_mm/plotAreaWidth_frac, "x");
	article_twoColumn->SetTickLength(-tickLength_mm/canvasWidth_mm/plotAreaHeight_frac, "y");
	article_twoColumn->SetTickLength(-tickLength_mm/canvasHeight_mm/plotAreaWidth_frac, "z"); // horizontal color bar axis with vertical ticks
	//article_twoColumn->SetTickLength(-tickLength_mm/canvasWidth_mm/plotAreaHeight_frac, "z"); // vertical color bar axis with horizontal ticks
	article_twoColumn->SetNdivisions(510, "xyz"); // show sub-ticks

	// Statistics display:
	//article_twoColumn->SetOptTitle(0);
	article_twoColumn->SetOptStat("emrou");
	article_twoColumn->SetStatFont(font);
	article_twoColumn->SetStatColor(0);
	article_twoColumn->SetStatBorderSize(1);
	article_twoColumn->SetStatFontSize(fontSize_xxsmall_px);

	const double statbox_height = 0.13;
	const double statbox_width = 0.2;
	article_twoColumn->SetStatY(1 - 1.0/canvasHeight_mm);
	article_twoColumn->SetStatX(1 - 1.0/canvasWidth_mm);
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
}
