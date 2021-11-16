{
	gROOT->SetBatch(kTRUE);


	//**********************************************************
	//
	// Constants
	//
	//**********************************************************

	gROOT->SetStyle("Modern");

	TGaxis::SetMaxDigits(4);

	// Get window manager decoration height and width
	TCanvas* canvas_tmp = new TCanvas("canvas_tmp", "canvas_tmp", 500, 500);
	unsigned int decorationWidth = canvas_tmp->GetWindowWidth() - canvas_tmp->GetWw();
	//cout << "decorationWidth" << decorationWidth << endl;
	unsigned int decorationHeight = canvas_tmp->GetWindowHeight() - canvas_tmp->GetWh();
	//cout << "decorationHeight" << decorationHeight << endl;
	delete canvas_tmp; // don't need this anymore
	canvas_tmp = NULL;

	//const int ppi = 227; // pixels per inch for Mac Retina display
	const int ppi = 300; // pixels per inch suggested by random websites
	static const double goldenRatio = 0.5*(1 + sqrt(5));

	const int font = 133; // Time New Roman (size specified in pixels)
	const double fontSize_medium_pt = 9; // default font size
	const double fontSize_small_pt = 8; // small font size
	const double fontSize_xsmall_pt = 6; // small font size
	const double fontSize_xxsmall_pt = 5; // small font size
	const double ptPerInch = 72.27; // as defined by Adobe and in matplotlib
	const double fontSize_medium_px = ppi*fontSize_medium_pt/ptPerInch;
	const double fontSize_small_px = ppi*fontSize_small_pt/ptPerInch;
	const double fontSize_xsmall_px = ppi*fontSize_xsmall_pt/ptPerInch;
	const double fontSize_xxsmall_px = ppi*fontSize_xxsmall_pt/ptPerInch;

	//const double canvasWidth_pt = 246.0; // pt, width of single column for double column paper
	const double canvasWidth_pt = 252.945; // 3.5 in, width of single column for double column paper
	const double canvasHeight_pt = canvasWidth_pt/goldenRatio;
	static const double canvasWidth_in = canvasWidth_pt/ptPerInch; // inch, typical width of single column for double column paper
	//cout << "canvasWidth_in" << canvasWidth_in << endl;
	static const double canvasHeight_in = canvasWidth_in/goldenRatio;
	//cout << "canvasHeight_in" << canvasHeight_in << endl;

	//// Apply zoom factor for confortable viewing in high DPI screens.
	static const int canvasWidth_px = int(ppi*canvasWidth_in + 0.5);
	//cout << "canvasWidth_px" << canvasWidth_px << endl;
	static const int canvasHeight_px = int(ppi*canvasHeight_in + 0.5);
	//cout << "canvasHeight_px" << canvasHeight_px << endl;

	static const double margin_small = 0.075;
	static const double margin_medium = 0.15;


	//**********************************************************
	//
	// Plotting style
	//
	//**********************************************************

	//// Style compatible with new ROOT 6
	TStyle* paper_doubleColumn= new TStyle("paper_doubleColumn","Double Column Paper");
	paper_doubleColumn->SetFrameBorderMode(0);
	paper_doubleColumn->SetFrameBorderSize(0);
	paper_doubleColumn->SetFrameFillStyle(0);
	paper_doubleColumn->SetFrameFillColor(kBlack);
	paper_doubleColumn->SetHistFillStyle(0);
	paper_doubleColumn->SetHistFillColor(kBlack);
	paper_doubleColumn->SetFillStyle(0);
	//paper_doubleColumn->SetFillColor(kWhite); // Makes 2D hist colz fill color white. Do not use.
	paper_doubleColumn->SetCanvasBorderMode(0);
	paper_doubleColumn->SetCanvasBorderSize(0);
	paper_doubleColumn->SetCanvasColor(kWhite);
	paper_doubleColumn->SetPadBorderMode(0);
	paper_doubleColumn->SetPadBorderSize(0);
	paper_doubleColumn->SetPadColor(kWhite);

	paper_doubleColumn->SetPaperSize(TStyle::kUSLetter);
	paper_doubleColumn->SetPadTopMargin(margin_small);
	paper_doubleColumn->SetPadBottomMargin(margin_medium);
	paper_doubleColumn->SetPadRightMargin(margin_small);
	paper_doubleColumn->SetPadLeftMargin(margin_medium);
	paper_doubleColumn->SetCanvasDefH(canvasHeight_px + decorationHeight); // (canvas height + 25 px) = window height)
	//paper_doubleColumn->SetCanvasDefH(500); // (canvas height + 25 px) = window height)
	paper_doubleColumn->SetCanvasDefW(canvasWidth_px + decorationWidth); // (canvas width + 2 px) = window width)
	//paper_doubleColumn->SetCanvasDefW(500); // (canvas width + 2 px) = window width)

	//paper_doubleColumn->SetOptTitle(0);
	paper_doubleColumn->SetFrameLineWidth(1);
	paper_doubleColumn->SetFrameLineColor(kBlack);
	paper_doubleColumn->SetAxisColor(kBlack, "x");
	paper_doubleColumn->SetAxisColor(kBlack, "y");
	paper_doubleColumn->SetAxisColor(kBlack, "z");
	paper_doubleColumn->SetLineWidth(1);
	paper_doubleColumn->SetEndErrorSize(0);
	paper_doubleColumn->SetLineColor(kBlack);
	paper_doubleColumn->SetHistLineWidth(1);
	paper_doubleColumn->SetHistLineColor(kBlack);
	paper_doubleColumn->SetMarkerStyle(8);
	paper_doubleColumn->SetMarkerSize(2);
	paper_doubleColumn->SetMarkerColor(kBlack);
	paper_doubleColumn->SetTitleX(0.5);
	paper_doubleColumn->SetTitleY(0.995);
	paper_doubleColumn->SetTitleAlign(23);
	paper_doubleColumn->SetTitleFillColor(0);
	paper_doubleColumn->SetTitleBorderSize(0);
	paper_doubleColumn->SetTitleFont(font, "t"); // doesn't work in ROOT 5.34/23
	paper_doubleColumn->SetTitleSize(fontSize_xxsmall_px, "t"); // doesn't work in ROOT 5.34/23

	paper_doubleColumn->SetTitleFont(font, "xyz");
	paper_doubleColumn->SetTitleSize(fontSize_medium_px, "xyz");
	paper_doubleColumn->SetTitleOffset(1.14, "x"); // lowest part of log_{10} is barely on the pad; I think log_{10} has the lowest reaching text
	paper_doubleColumn->SetTitleOffset(1.29, "y"); // highest part of sqrt(2) is barely on the pad; I think sqrt(2) has the highest reaching text
	paper_doubleColumn->SetTitleOffset(-0.40, "z"); // doesn't work in ROOT 5.34/23

	paper_doubleColumn->SetLabelFont(font, "xyz");
	paper_doubleColumn->SetLabelSize(fontSize_medium_px, "xyz");
	paper_doubleColumn->SetLabelOffset(2.0/canvasHeight_pt, "x");
	paper_doubleColumn->SetLabelOffset(3.0/canvasWidth_pt, "y");
	paper_doubleColumn->SetLabelOffset(3.0/canvasWidth_pt, "z");

	paper_doubleColumn->SetOptStat("emrou");
	paper_doubleColumn->SetStatBorderSize(1);
	paper_doubleColumn->SetStatColor(kWhite);
	paper_doubleColumn->SetStatFont(font);
	paper_doubleColumn->SetStatFontSize(fontSize_xxsmall_px);
	paper_doubleColumn->SetStatY(margin_medium - 0.5*0.005);
	paper_doubleColumn->SetStatX(margin_medium - 0.5*0.005);
	paper_doubleColumn->SetStatW(margin_medium - 0.005);
	paper_doubleColumn->SetStatH(margin_medium - 0.005);

	//paper_doubleColumn->SetNdivisions(10, "xyz");
	paper_doubleColumn->SetNdivisions(510, "xyz"); // show sub-ticks
	paper_doubleColumn->SetTickLength(-2.5/canvasHeight_pt, "x"); // numerator is length in pt
	paper_doubleColumn->SetTickLength(-2.5/canvasWidth_pt, "y"); // numerator is length in pt
	paper_doubleColumn->SetTickLength(-2.5/canvasWidth_pt, "z"); // numerator is length in pt

	// Legend.
	paper_doubleColumn->SetLegendBorderSize(0);
	paper_doubleColumn->SetLegendFillColor(0);
	paper_doubleColumn->SetLegendFont(font);
	paper_doubleColumn->SetLegendTextSize(fontSize_small_px);

	////// Style compatible with ROOT 5.34/07 on Nino because it does not have some of the newer(?) features
	//TStyle* paper_doubleColumn_nino = new TStyle("paper_doubleColumn_nino", "paper_doubleColumn_nino");
	//paper_doubleColumn_nino->SetFrameBorderMode(0);
	//paper_doubleColumn_nino->SetFrameBorderSize(0);
	//paper_doubleColumn_nino->SetFrameFillStyle(0);
	//paper_doubleColumn_nino->SetFrameFillColor(kWhite);
	////paper_doubleColumn_nino->SetHistFillStyle(0);
	////paper_doubleColumn_nino->SetHistFillColor(kWhite);
	//paper_doubleColumn_nino->SetFillStyle(0);
	//paper_doubleColumn_nino->SetFillColor(kWhite);
	//paper_doubleColumn_nino->SetCanvasBorderMode(0);
	//paper_doubleColumn_nino->SetCanvasBorderSize(0);
	//paper_doubleColumn_nino->SetCanvasColor(kWhite);
	//paper_doubleColumn_nino->SetPadBorderMode(0);
	//paper_doubleColumn_nino->SetPadBorderSize(0);
	//paper_doubleColumn_nino->SetPadColor(kWhite);
	//paper_doubleColumn_nino->SetPadTopMargin(margin);
	//paper_doubleColumn_nino->SetPadBottomMargin(margin);
	//paper_doubleColumn_nino->SetPadRightMargin(margin);
	//paper_doubleColumn_nino->SetPadLeftMargin(margin);
	//paper_doubleColumn_nino->SetCanvasDefH(canvasHeight_px + decorationHeight); // (canvas height + 25 px) = window height)
	////paper_doubleColumn_nino->SetCanvasDefH(500); // (canvas height + 25 px) = window height)
	//paper_doubleColumn_nino->SetCanvasDefW(canvasWidth_px + decorationWidth); // (canvas width + 2 px) = window width)
	////paper_doubleColumn_nino->SetCanvasDefW(500); // (canvas width + 2 px) = window width)

	////paper_doubleColumn_nino->SetOptTitle(0);
	//paper_doubleColumn_nino->SetTitleFillColor(0);
	//paper_doubleColumn_nino->SetTitleBorderSize(0);
	//////paper_doubleColumn_nino->SetTitleFont(font, "t"); // doesn't work in ROOT 5.34/23
	////paper_doubleColumn_nino->SetTitleSize(fontSize_medium_px, "t"); // doesn't work in ROOT 5.34/23

	////paper_doubleColumn_nino->SetTitleFont(font, "xyz");
	////paper_doubleColumn_nino->SetTitleSize(fontSize_medium_px, "xyz");
	////paper_doubleColumn_nino->SetTitleOffset(1.15, "x");
	////paper_doubleColumn_nino->SetTitleOffset(1.29, "y");
	//////paper_doubleColumn_nino->SetTitleOffset(-0.35, "z"); // doesn't work in ROOT 5.34/23

	////paper_doubleColumn_nino->SetLabelFont(font, "xyz");
	////paper_doubleColumn_nino->SetLabelSize(fontSize_medium_px, "xyz");
	////paper_doubleColumn_nino->SetLabelOffset(0.015, "x");
	////paper_doubleColumn_nino->SetLabelOffset(0.015, "y");
	////paper_doubleColumn_nino->SetLabelOffset(0.015, "z");

	////paper_doubleColumn_nino->SetOptStat("emrou");
	////paper_doubleColumn_nino->SetStatBorderSize(1);
	////paper_doubleColumn_nino->SetStatColor(kWhite);
	////paper_doubleColumn_nino->SetStatFont(font);
	////paper_doubleColumn_nino->SetStatFontSize(fontSize_small_px);
	////paper_doubleColumn_nino->SetStatW(0.2);
	////paper_doubleColumn_nino->SetStatH(0.1);

	//////paper_doubleColumn_nino->SetNdivisions(10, "xyz");
	////paper_doubleColumn_nino->SetNdivisions(510, "xyz"); // show sub-ticks
	////paper_doubleColumn_nino->SetTickLength(-10.0/canvasHeight_px, "x");
	////paper_doubleColumn_nino->SetTickLength(-10.0/canvasWidth_px, "y");
	////paper_doubleColumn_nino->SetTickLength(-10.0/canvasWidth_px, "z");

	//// Legend.
	//paper_doubleColumn_nino->SetLegendBorderSize(0);
	//paper_doubleColumn_nino->SetLegendFillColor(0);
	////paper_doubleColumn_nino->SetLegendFont(font);


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
