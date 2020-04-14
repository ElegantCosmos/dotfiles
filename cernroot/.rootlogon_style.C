//const int blue_tableau = TColor::GetColor("#1f77b4");
//const int orange_tableau = TColor::GetColor("#ff7f0e");
//const int green_tableau = TColor::GetColor("#2ca02c");
//const int red_tableau = TColor::GetColor("#d62728");
//const int purple_tableau = TColor::GetColor("#9467bd");
//const int brown_tableau = TColor::GetColor("#8c564b");
//const int pink_tableau = TColor::GetColor("#e377c2");
//const int gray_tableau = TColor::GetColor("#8f7f7f");
//const int olive_tableau = TColor::GetColor("#bcbd22");
//const int cyan_tableau = TColor::GetColor("#17becf");
//
{
	gROOT->SetStyle("Modern");

	TGaxis::SetMaxDigits(4);

	//// Constants

	// Get window manager decoration height and width
	TCanvas* canvas_tmp = new TCanvas("canvas_tmp", "canvas_tmp", 500, 500);
	unsigned int decorationWidth = 500 - canvas_tmp->GetWw();
	//cout << "decorationWidth" << decorationWidth << endl;
	unsigned int decorationHeight = 500 - canvas_tmp->GetWh();
	//cout << "decorationHeight" << decorationHeight << endl;
	delete canvas_tmp;
	canvas_tmp = NULL;

	int ppi = 227; // pixels per inch
	double goldenRatio = 0.5*(1 + sqrt(5));

	int font = 133; // Time New Roman (size specified in pixels)
	double fontSize_pt = 8; // default font size
	double fontSize_small_pt = 4; // small font size
	double ptToInch = 3.0/8.0/27;
	double fontSize_px = ppi*ptToInch*fontSize_pt;
	double fontSize_small_px = ppi*ptToInch*fontSize_small_pt;

	double canvasWidth_in = 3.404; // inch, typical width of single column for double column paper
	//cout << "canvasWidth_in" << canvasWidth_in << endl;
	double canvasHeight_in = canvasWidth_in/goldenRatio; // inch
	//cout << "canvasHeight_in" << canvasHeight_in << endl;

	//// Apply zoom factor for confortable viewing in high DPI screens.
	int canvasWidth_px = int(ppi*canvasWidth_in + 0.5);
	//cout << "canvasWidth_px" << canvasWidth_px << endl;
	int canvasHeight_px = int(ppi*canvasHeight_in + 0.5);
	//cout << "canvasHeight_px" << canvasHeight_px << endl;

	double margin = 0.13; // common pad margin
	double margin_small = 0.6*margin;

	//// Plotting styles

	//// Style compatible with new ROOT 6
	TStyle* paper_doubleColumn= new TStyle("paper_doubleColumn","Double Column Paper");
	paper_doubleColumn->SetFrameBorderMode(0);
	paper_doubleColumn->SetFrameBorderSize(0);
	paper_doubleColumn->SetFrameFillStyle(0);
	paper_doubleColumn->SetFrameFillColor(kWhite);
	paper_doubleColumn->SetHistFillStyle(0);
	paper_doubleColumn->SetHistFillColor(kWhite);
	paper_doubleColumn->SetFillStyle(0);
	paper_doubleColumn->SetFillColor(kWhite);
	paper_doubleColumn->SetCanvasBorderMode(0);
	paper_doubleColumn->SetCanvasBorderSize(0);
	paper_doubleColumn->SetCanvasColor(kWhite);
	paper_doubleColumn->SetPadBorderMode(0);
	paper_doubleColumn->SetPadBorderSize(0);
	paper_doubleColumn->SetPadColor(kWhite);

	paper_doubleColumn->SetPaperSize(TStyle::kUSLetter);
	//paper_doubleColumn->SetPadTopMargin(margin_small);
	paper_doubleColumn->SetPadTopMargin(margin);
	paper_doubleColumn->SetPadBottomMargin(margin);
	//paper_doubleColumn->SetPadRightMargin(margin_small);
	paper_doubleColumn->SetPadRightMargin(margin);
	paper_doubleColumn->SetPadLeftMargin(margin);
	paper_doubleColumn->SetCanvasDefH(canvasHeight_px + decorationHeight); // (canvas height + 25 px) = window height)
	//paper_doubleColumn->SetCanvasDefH(500); // (canvas height + 25 px) = window height)
	paper_doubleColumn->SetCanvasDefW(canvasWidth_px + decorationWidth); // (canvas width + 2 px) = window width)
	//paper_doubleColumn->SetCanvasDefW(500); // (canvas width + 2 px) = window width)

	//paper_doubleColumn->SetOptTitle(0);
	paper_doubleColumn->SetFrameLineWidth(1);
	paper_doubleColumn->SetLineWidth(1);
	paper_doubleColumn->SetTitleX(0.5);
	paper_doubleColumn->SetTitleAlign(23);
	paper_doubleColumn->SetTitleFillColor(0);
	paper_doubleColumn->SetTitleBorderSize(0);
	paper_doubleColumn->SetTitleFont(font, "t"); // doesn't work in current ROOT 5.34/23
	paper_doubleColumn->SetTitleSize(fontSize_px, "t"); // doesn't work in current ROOT 5.34/23

	paper_doubleColumn->SetTitleFont(font, "xyz");
	paper_doubleColumn->SetTitleSize(fontSize_px, "xyz");
	paper_doubleColumn->SetTitleOffset(1.09, "x");
	paper_doubleColumn->SetTitleOffset(1.25, "y");
	paper_doubleColumn->SetTitleOffset(-0.35, "z"); // doesn't work in current ROOT 5.34/23

	paper_doubleColumn->SetLabelFont(font, "xyz");
	paper_doubleColumn->SetLabelSize(fontSize_px, "xyz");
	paper_doubleColumn->SetLabelOffset(0.0125, "x");
	paper_doubleColumn->SetLabelOffset(0.0125, "y");
	paper_doubleColumn->SetLabelOffset(0.0125, "z");

	paper_doubleColumn->SetOptStat("emrou");
	paper_doubleColumn->SetStatBorderSize(1);
	paper_doubleColumn->SetStatColor(kWhite);
	paper_doubleColumn->SetStatFont(font);
	paper_doubleColumn->SetStatFontSize(fontSize_small_px);
	paper_doubleColumn->SetStatY(1 - margin_small);
	paper_doubleColumn->SetStatX(1 - margin_small);
	paper_doubleColumn->SetStatW(0.2);
	paper_doubleColumn->SetStatH(0.1);

	//paper_doubleColumn->SetNdivisions(10, "xyz");
	paper_doubleColumn->SetNdivisions(510, "xyz"); // show sub-ticks
	paper_doubleColumn->SetTickLength(-8.0/canvasHeight_px, "x");
	paper_doubleColumn->SetTickLength(-8.0/canvasWidth_px, "y");
	paper_doubleColumn->SetTickLength(-8.0/canvasWidth_px, "z");

	// Legend.
	paper_doubleColumn->SetLegendBorderSize(1);
	paper_doubleColumn->SetLegendFillColor(0);
	paper_doubleColumn->SetLegendFont(font);

	//// Style compatible with ROOT 5.34/07 on Nino because it does not have some of the newer(?) features
	TStyle* paper_doubleColumn_nino = new TStyle("paper_doubleColumn_nino", "paper_doubleColumn_nino");
	paper_doubleColumn_nino->SetFrameBorderMode(0);
	paper_doubleColumn_nino->SetFrameBorderSize(0);
	paper_doubleColumn_nino->SetFrameFillStyle(0);
	paper_doubleColumn_nino->SetFrameFillColor(kWhite);
	//paper_doubleColumn_nino->SetHistFillStyle(0);
	//paper_doubleColumn_nino->SetHistFillColor(kWhite);
	paper_doubleColumn_nino->SetFillStyle(0);
	paper_doubleColumn_nino->SetFillColor(kWhite);
	paper_doubleColumn_nino->SetCanvasBorderMode(0);
	paper_doubleColumn_nino->SetCanvasBorderSize(0);
	paper_doubleColumn_nino->SetCanvasColor(kWhite);
	paper_doubleColumn_nino->SetPadBorderMode(0);
	paper_doubleColumn_nino->SetPadBorderSize(0);
	paper_doubleColumn_nino->SetPadColor(kWhite);
	//paper_doubleColumn_nino->SetPadTopMargin(margin_small);
	paper_doubleColumn_nino->SetPadTopMargin(margin);
	paper_doubleColumn_nino->SetPadBottomMargin(margin);
	//paper_doubleColumn_nino->SetPadRightMargin(margin_small);
	paper_doubleColumn_nino->SetPadRightMargin(margin);
	paper_doubleColumn_nino->SetPadLeftMargin(margin);
	paper_doubleColumn_nino->SetCanvasDefH(canvasHeight_px + decorationHeight); // (canvas height + 25 px) = window height)
	//paper_doubleColumn_nino->SetCanvasDefH(500); // (canvas height + 25 px) = window height)
	paper_doubleColumn_nino->SetCanvasDefW(canvasWidth_px + decorationWidth); // (canvas width + 2 px) = window width)
	//paper_doubleColumn_nino->SetCanvasDefW(500); // (canvas width + 2 px) = window width)

	//paper_doubleColumn_nino->SetOptTitle(0);
	paper_doubleColumn_nino->SetTitleFillColor(0);
	paper_doubleColumn_nino->SetTitleBorderSize(0);
	////paper_doubleColumn_nino->SetTitleFont(font, "t"); // doesn't work in current ROOT 5.34/23
	//paper_doubleColumn_nino->SetTitleSize(fontSize_px, "t"); // doesn't work in current ROOT 5.34/23

	//paper_doubleColumn_nino->SetTitleFont(font, "xyz");
	//paper_doubleColumn_nino->SetTitleSize(fontSize_px, "xyz");
	//paper_doubleColumn_nino->SetTitleOffset(1.15, "x");
	//paper_doubleColumn_nino->SetTitleOffset(1.29, "y");
	////paper_doubleColumn_nino->SetTitleOffset(-0.35, "z"); // doesn't work in current ROOT 5.34/23

	//paper_doubleColumn_nino->SetLabelFont(font, "xyz");
	//paper_doubleColumn_nino->SetLabelSize(fontSize_px, "xyz");
	//paper_doubleColumn_nino->SetLabelOffset(0.015, "x");
	//paper_doubleColumn_nino->SetLabelOffset(0.015, "y");
	//paper_doubleColumn_nino->SetLabelOffset(0.015, "z");

	//paper_doubleColumn_nino->SetOptStat("emrou");
	//paper_doubleColumn_nino->SetStatBorderSize(1);
	//paper_doubleColumn_nino->SetStatColor(kWhite);
	//paper_doubleColumn_nino->SetStatFont(font);
	//paper_doubleColumn_nino->SetStatFontSize(fontSize_small_px);
	//paper_doubleColumn_nino->SetStatY(1 - margin_small);
	//paper_doubleColumn_nino->SetStatX(1 - margin_small);
	//paper_doubleColumn_nino->SetStatW(0.2);
	//paper_doubleColumn_nino->SetStatH(0.1);

	////paper_doubleColumn_nino->SetNdivisions(10, "xyz");
	//paper_doubleColumn_nino->SetNdivisions(510, "xyz"); // show sub-ticks
	//paper_doubleColumn_nino->SetTickLength(-10.0/canvasHeight_px, "x");
	//paper_doubleColumn_nino->SetTickLength(-10.0/canvasWidth_px, "y");
	//paper_doubleColumn_nino->SetTickLength(-10.0/canvasWidth_px, "z");

	// Legend.
	paper_doubleColumn_nino->SetLegendBorderSize(1);
	paper_doubleColumn_nino->SetLegendFillColor(0);
	//paper_doubleColumn_nino->SetLegendFont(font);




	//// Example of how to make palette axis neat
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
