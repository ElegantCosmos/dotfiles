{
  gROOT->SetBatch(kTRUE);

	gROOT->SetStyle("Modern");

	TGaxis::SetMaxDigits(4);


	//*****************************************************************************
	//
	// Constants
	//
	//*****************************************************************************

	// Get window manager decoration height and width
	TCanvas* canvas_tmp = new TCanvas("canvas_tmp", "canvas_tmp", 500, 500);
	unsigned int decorationWidth = canvas_tmp->GetWindowWidth() - canvas_tmp->GetWw();
	//cout << "decorationWidth" << decorationWidth << endl;
	unsigned int decorationHeight = canvas_tmp->GetWindowHeight() - canvas_tmp->GetWh();
	//cout << "decorationHeight" << decorationHeight << endl;
	delete canvas_tmp; // don't need this anymore
	canvas_tmp = NULL;

	//const int ppi = 227; // pixels per inch for Mac Retina display
	const int ppi = 600; // pixels per inch suggested by random websites
	const double goldenRatio = 0.5*(1 + sqrt(5));

	const int font = 133; // Time New Roman (size specified in pixels)
	const double fontSize_pt = 8; // default font size
	const double fontSize_small_pt = 4; // small font size
	const double ptPerInch = 72.0; // as defined by Adobe and in matplotlib
	const double fontSize_px = ppi*fontSize_pt/ptPerInch;
	const double fontSize_small_px = ppi*fontSize_small_pt/ptPerInch;

  const double canvasWidth_mm = 90.0; // mm, typical width of single column for double column paper
  const double mmPerInch = 25.4;
	double canvasWidth_in = canvasWidth_mm/mmPerInch; // inch, typical width of single column for double column paper
	//cout << "canvasWidth_in" << canvasWidth_in << endl;
	double canvasHeight_in = canvasWidth_in/goldenRatio; // inch
	//cout << "canvasHeight_in" << canvasHeight_in << endl;

	//// Apply zoom factor for confortable viewing in high DPI screens.
	int canvasWidth_px = int(ppi*canvasWidth_in + 0.5);
	//cout << "canvasWidth_px" << canvasWidth_px << endl;
	int canvasHeight_px = int(ppi*canvasHeight_in + 0.5);
	//cout << "canvasHeight_px" << canvasHeight_px << endl;
  double canvasWidth_pt = canvasWidth_in*ptPerInch;
  double canvasHeight_pt = canvasHeight_in*ptPerInch;

	const double margin = 0.13; // common pad margin


	//*****************************************************************************
	//
	// Plotting style
	//
	//*****************************************************************************

	//// Style compatible with ROOT 5.34/07 on Nino because it does not have some of the newer(?) features
	TStyle* paper_doubleColumn= new TStyle("paper_doubleColumn_nino","Double Column Paper");
	paper_doubleColumn->SetFrameBorderMode(0);
	paper_doubleColumn->SetFrameBorderSize(0);
	paper_doubleColumn->SetFrameFillStyle(0);
	paper_doubleColumn->SetFrameFillColor(kWhite);
	paper_doubleColumn->SetHistFillStyle(0);
	paper_doubleColumn->SetHistFillColor(kWhite);
	paper_doubleColumn->SetFillStyle(0);
	//paper_doubleColumn->SetFillColor(kWhite); // Makes 2D hist colz fill color white. Do not use.
	paper_doubleColumn->SetCanvasBorderMode(0);
	paper_doubleColumn->SetCanvasBorderSize(0);
	paper_doubleColumn->SetCanvasColor(kWhite);
	paper_doubleColumn->SetPadBorderMode(0);
	paper_doubleColumn->SetPadBorderSize(0);
	paper_doubleColumn->SetPadColor(kWhite);

	paper_doubleColumn->SetPaperSize(TStyle::kUSLetter);
	paper_doubleColumn->SetPadTopMargin(margin);
	paper_doubleColumn->SetPadBottomMargin(margin);
	paper_doubleColumn->SetPadRightMargin(margin);
	paper_doubleColumn->SetPadLeftMargin(margin);
	paper_doubleColumn->SetCanvasDefH(canvasHeight_px + decorationHeight); // (canvas height + 25 px) = window height)
	paper_doubleColumn->SetCanvasDefW(canvasWidth_px + decorationWidth); // (canvas width + 2 px) = window width)

	//paper_doubleColumn->SetOptTitle(0);
	paper_doubleColumn->SetFrameLineWidth(1);
	paper_doubleColumn->SetLineWidth(1);
	paper_doubleColumn->SetTitleX(0.5);
	paper_doubleColumn->SetTitleAlign(23);
	paper_doubleColumn->SetTitleFillColor(0);
	paper_doubleColumn->SetTitleBorderSize(0);
	//paper_doubleColumn->SetTitleFont(font, "t"); // doesn't work in ROOT 5.34/23
	//paper_doubleColumn->SetTitleSize(fontSize_small_px, "t"); // doesn't work in ROOT 5.34/23

	paper_doubleColumn->SetTitleFont(font, "xyz");
	paper_doubleColumn->SetTitleSize(fontSize_px, "xyz");
	paper_doubleColumn->SetTitleOffset(1.15, "x");
	paper_doubleColumn->SetTitleOffset(1.30, "y");
	//paper_doubleColumn->SetTitleOffset(-0.35, "z"); // doesn't work in ROOT 5.34/23

	paper_doubleColumn->SetLabelFont(font, "xyz");
	paper_doubleColumn->SetLabelSize(fontSize_px, "xyz");
	paper_doubleColumn->SetLabelOffset(2.0/canvasHeight_pt, "x");
	paper_doubleColumn->SetLabelOffset(3.0/canvasWidth_pt, "y");
	paper_doubleColumn->SetLabelOffset(3.0/canvasWidth_pt, "z");

	paper_doubleColumn->SetOptStat("emrou");
	paper_doubleColumn->SetStatBorderSize(1);
	paper_doubleColumn->SetStatColor(kWhite);
	paper_doubleColumn->SetStatFont(font);
	paper_doubleColumn->SetStatFontSize(fontSize_small_px);
	paper_doubleColumn->SetStatY(1);
	paper_doubleColumn->SetStatX(1);
	paper_doubleColumn->SetStatW(1.5*margin);
	paper_doubleColumn->SetStatH(0.8*margin);

	//paper_doubleColumn->SetNdivisions(10, "xyz");
	paper_doubleColumn->SetNdivisions(510, "xyz"); // show sub-ticks
	paper_doubleColumn->SetTickLength(-2.5/canvasHeight_pt, "x"); // number in pt
	paper_doubleColumn->SetTickLength(-2.5/canvasWidth_pt, "y"); // number in pt
	paper_doubleColumn->SetTickLength(-2.5/canvasWidth_pt, "z"); // number in pt

	// Legend.
	paper_doubleColumn->SetLegendBorderSize(0);
	paper_doubleColumn->SetLegendFillColor(0);
	paper_doubleColumn->SetLegendFont(font);
	//paper_doubleColumn->SetLegendTextSize(fontSize_small_px);

  // Palette.
  paper_doubleColumn->SetPalette(55, 0); // rainbow palette for drawing with "Colz" option


	//*****************************************************************************
	//
	// Define Tableau colors
	//
	//*****************************************************************************

	const TColor blue_tableau = TColor::GetColor("#1f77b4");
	const TColor orange_tableau = TColor::GetColor("#ff7f0e");
	const TColor green_tableau = TColor::GetColor("#2ca02c");
	const TColor red_tableau = TColor::GetColor("#d62728");
	const TColor purple_tableau = TColor::GetColor("#9467bd");
	const TColor brown_tableau = TColor::GetColor("#8c564b");
	const TColor pink_tableau = TColor::GetColor("#e377c2");
	const TColor gray_tableau = TColor::GetColor("#8f7f7f");
	const TColor olive_tableau = TColor::GetColor("#bcbd22");
	const TColor cyan_tableau = TColor::GetColor("#17becf");


	//*****************************************************************************
	//
	// Example of how to make palette axis neat
	//
	//*****************************************************************************

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

